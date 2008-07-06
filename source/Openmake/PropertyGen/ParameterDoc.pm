package Openmake::PropertyGen::ParameterDoc;

=head1 Name

=head1 Synopsis

=cut

use Carp;
use Config::Properties;

use strict;

#-- Generic constructor

=over 4

=cut

sub new {
	my $this  = shift;
	my $class = ref($this) || $this;
	my $self  = {};
	bless $self, $class;
	$self->initialize(@_);
	return $self;
}

sub initialize {
	my $self  = shift;
	my %input = @_;

	$self->{parm_input_type} = 'excel_2003_xml';

	if ( exists $input{file_name} ) {
		$self->{file_name} = $input{file_name};
	}
	return 1;
}

sub parse {
	my $self            = shift;
	my $parm_input_type = $self->{parm_input_type};

	my $config_method = "read_document_config";
	my $parse_method  = "parse_${parm_input_type}";

	$self->$config_method;

	return $self->$parse_method;
}

sub parse_excel_2003_xml {

=item parse_excel_2003_xml

Reads an Excel 2003 XML format file for source, target configuration
and operation information

=cut

	my $self = shift;
	my $file = shift or confess("Source input file not specified");

	my $processor = shift; #-- future support

	unless ($processor) {
		$processor = Openmake::PropertyGen::Processor->new();
	}

   #-- define columns with defaults values
   #     can override with properties file

	my $iStartingColumn = 0;
	my $iStartingRow = 6;

	my $iTier     = 3;
	my $iURL      = 4;
	my $iUDL      = 5;
	my $iNewDatum = 6;

	my $p;

	if ( exists $self->{config_properties} ) {
		$p = $self->{config_properties};

		if ( exists $p->{url_column} ) {
			$iURL = $p->{url_column};
		}
		if ( exists $p->{udl_column} ) {
			$iUDL = $p->{udl_column};
		}
		if ( exists $p->{new_value_column} ) {
			$iNewDatum = $p->{new_value_column};
		}
		if ( exists $p->{starting_column} ) {
			$iStartingColumn = $p->{starting_column};
		}
		if ( exists $p->{starting_row} ) {
			$iStartingRow = $p->{starting_row};
		}
	}

	my $url       = '';
	my $udl       = '';
	my $new_datum = '';
	my $iRow            = 0;

	#-- get all of the XML files for parsing
	my $spreadsheet_handler = XML::Twig->new(

		twig_handlers => {

#-- Run handler on each Row tag, first figure out if we've reached the starting row for processing yet
			'Row' => sub {
				if ( exists $_->{'att'}->{'ss:Index'} ) {
					$iRow = $_->{'att'}->{'ss:Index'}

				} else {
					$iRow++

				}

				return unless $iRow >= $iStartingRow;

#-- Now we can start processing. Get all the columns in this row. Beware skipped entries
#     the fifth cell could actually be the 8th cell if the first three columns of this row have
#     never been formatted

				my @cells = $_->children();

				if ( exists $cells[0]->{'att'}->{'ss:Index'} ) {
					$iStartingColumn = $cells[0]->{'att'}->{'ss:Index'}

				} else {
					$iStartingColumn = 1;

				}

#-- Ignore columns up to the starting column
				return unless ( $iTier - $iStartingColumn ) < scalar @cells;
				
				#-- now get to the meat of things
				my $found_tier = $cells[ $iTier - $iStartingColumn ]->text();

				if ( ( $iURL - $iStartingColumn ) < scalar @cells ) {
					my $new_url = $cells[ $iURL - $iStartingColumn ]->text();

					$url = $new_url if $new_url;
				}

				if ( ( $iUDL - $iStartingColumn ) < scalar @cells ) {
					my $new_udl = $cells[ $iUDL - $iStartingColumn ]->text();

					$udl = $new_udl if $new_udl;
				}

				if ( ( $iNewDatum - $iStartingColumn ) < scalar @cells ) {
					my $new_new_datum =
					  $cells[ $iNewDatum - $iStartingColumn ]->text();

					$new_datum = $new_new_datum if $new_new_datum;
				}

				push @{ $processor->{$url}->{$found_tier} },
				  { UDL => $udl, new_value => $new_datum};

				#				gen_doc( $found_tier, $url, $udl, $new_datum );
			  }
		}
	);

	$spreadsheet_handler->parsefile($file);

	return $processor;
}

sub read_document_config {

=item read_document_config

Generic routine to read a configuration file. Useful for
defining columns in an excel spreadsheet

=cut

	my $self = shift;

	unless ( exists $self->{config_file} ) {
		return undef;
	}

	my $config_file = $self->{config_file};

	open SRC, "<$config_file" or die "Couldn't open source properties file";
	my $properties = new Config::Properties;
	$properties->load(*SRC);
	close SRC;

	$self->{config_properties} = \{ $properties->properties };

	return 1;

}

=back

=cut

1;
