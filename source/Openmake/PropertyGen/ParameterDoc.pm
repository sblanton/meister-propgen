package Openmake::PropertyGen::ParameterDoc;

=head1 Name

=head1 Synopsis

=cut

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

	my $method = "parse_${parm_input_type}";

	my $processor = Openmake::PropertyGen::Processor->new();

	return $self->$method;
}

sub parse_excel_2003_xml {

=item parse_excel_2003_xml

Reads an Excel 2003 XML format file for source, target configuration
and operation information

=cut

	my $file = shift or die;

	my $processor = Openmake::PropertyGen::Processor->new( file => $file);

	my $iTier     = 3;
	my $iURL      = 4;
	my $iUDL      = 5;
	my $iNewDatum = 6;

	my $iRow            = 0;
	my $iStartingColumn = 0;

	my $iStartingRow = 6;

	my $url       = '';
	my $udl       = '';
	my $new_datum = '';

	#-- get all of the XML files for parsing
	my $spreadsheet_handler = XML::Twig->new(

		twig_handlers => {
			'Row' => sub {
				if ( exists $_->{'att'}->{'ss:Index'} ) {
					$iRow = $_->{'att'}->{'ss:Index'}

				} else {
					$iRow++

				}

				return unless $iRow >= $iStartingRow;

				my @cells = $_->children();

				if ( exists $cells[0]->{'att'}->{'ss:Index'} ) {
					$iStartingColumn = $cells[0]->{'att'}->{'ss:Index'}

				} else {
					$iStartingColumn = 1;

				}

				return unless ( $iTier - $iStartingColumn ) < scalar @cells;
				my $found_tier = $cells[ $iTier - $iStartingColumn ]->text();

				if ( ( $iURL - $iStartingColumn ) < scalar @cells ) {
					my $new_url = $cells[ $iURL - $iStartingColumn ]->text();

					#print "NEW_URL: $new_url\n";
					$url = $new_url if $new_url;
				}

				if ( ( $iUDL - $iStartingColumn ) < scalar @cells ) {
					my $new_udl = $cells[ $iUDL - $iStartingColumn ]->text();

					#print "NEW_UDL: $new_udl\n";
					$udl = $new_udl if $new_udl;
				}

				if ( ( $iNewDatum - $iStartingColumn ) < scalar @cells ) {
					my $new_new_datum =
					  $cells[ $iNewDatum - $iStartingColumn ]->text();

					#print "NEW_NEW_DATUM: $new_new_datum\n";
					$new_datum = $new_new_datum if $new_new_datum;
				}

				#print "$iRow: $found_tier\n$url\n$udl\n$new_datum\n";

				push @{ $processor->{operators}->{$found_tier}->{$url} },
				  [ $udl, $new_datum ];

				#				gen_doc( $found_tier, $url, $udl, $new_datum );
			  }
		}
	);
	
	$spreadsheet_handler->parsefile($file);

	return $processor;
}

sub read_config_excel_2003_xml {

}

=back

=cut

1;
