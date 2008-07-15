package Openmake::PropertyGen::ParameterDoc;

=head1 Name

=head1 Synopsis

=cut

use Carp qw(cluck confess);
use Config::Properties;
use XML::Twig;
use File::Basename;

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
		return 1;
	}
	return undef;
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
	exists $self->{config_properties}->{parameter_input_file}
	  or confess("Source input file not specified");

	my $file = $self->{config_properties}->{parameter_input_file};

	-f $file or confess("$file not found");

	my $processor_group = shift;

	unless ($processor_group) {
		$processor_group = Openmake::PropertyGen::ProcessorGroup->new();
	}
	my $pg = $processor_group;

	#-- define columns with defaults values
	#     can override with properties file

	my $iStartingColumn = 0;
	my $iStartingRow    = 6;

	my $iTier     = 3;
	my $iURL      = 4;
	my $iUDL      = 5;
	my $iNewDatum = 6;

	my $p;

	if ( exists $self->{config_properties} ) {
		$p = $self->{config_properties};

		if ( exists $p->{config_column} ) {
			$iTier = $p->{config_column};
		}
		if ( exists $p->{url_column} ) {
			$iURL = $p->{url_column};
		}
		if ( exists $p->{udl_column} ) {
			$iUDL = $p->{udl_column};
		}
		if ( exists $p->{new_value_column} ) {
			$iNewDatum = $p->{new_value_column};
		}
		if ( exists $p->{starting_row} ) {
			$iStartingRow = $p->{starting_row};
		}
	}

	my $url       = '';
	my $udl       = '';
	my $new_datum = '';
	my $iRow      = 0;

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

				#print "Reading row: $iRow\n";

				return unless $iRow >= $iStartingRow;

#-- Now we can start processing. Get all the columns in this row. Beware skipped entries
#     the 8th cell could actually be the 5th cell if the first three columns of this row have
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

				return
				  unless $found_tier;  #-- ignore blank lines...no tier, no line

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

				confess("Target config is null") unless $found_tier;

				my @target_config = ();

				if ( exists $pg->{url}->{$url}->{$found_tier} ) {

					@target_config = @{ $pg->{url}->{$url}->{$found_tier} };
				}
				
				print "Pushing $udl => $new_datum onto $found_tier\n";
				
				push @target_config, { udl => $udl, new_value => $new_datum };

				@{ $pg->{url}->{$url}->{$found_tier} } = @target_config;
				
				print "Target config now has " . scalar @target_config . " ops\n";
				
				unless ( exists $pg->{url}->{$url}->{file_type} ) {
					$pg->{url}->{$url}->{file_type} =
					  $self->get_file_type_from_url($url);
				}
			  }
		}
	);

	$spreadsheet_handler->parsefile($file);

	return $pg;

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

	$self->{config_properties} = $properties->getProperties;

	return 1;

}

sub get_file_type_from_udl {
	my $self = shift;

	my $udl = shift or confess("UDL not defined!");

	$udl = m|(\w+)://|;
	my $protocol = $1;

	my $file_types;

	$file_types->{xpath}    = 'xml';
	$file_types->{property} = 'property';
	$file_types->{token}    = 'text';

	return $file_types->{$protocol};

}

sub get_file_type_from_url {
	my $self = shift;

	my $url = shift or confess("URL not defined!");

	my ( $name, $path, $ext ) = fileparse( $url, qw( .xml .properties) );

	$ext =~ s/^\.//;

	print "FOUND FILE TYPE: $ext\n";

	return $ext;

}

=back

=cut

1;
