
	use Openmake::PropertyGen::ParameterDoc;
	use Openmake::PropertyGen::ProcessorGroup;

	my $pdoc;
	$pdoc = Openmake::PropertyGen::ParameterDoc->new('mpscmhar_cirwss.xml');

	$pdoc->{config_file} = 'mpscmhar_cirwss.properties';

	$pdoc->read_document_config();

	my $pg;

	$pg = $pdoc->parse();

	my @urls      = keys %{ $pg->{url} };
	my $first_url = shift @urls;

	$pg->{output_location}    = '.';
	$pg->{workspace_location} = '.';

	my $rProcessors;

	$rProcessors = $pg->generate_all_target_config_processors('dev');

	foreach my $proc (@$rProcessors) {
		ok( $proc->parse_all(), "parse_all successful" );
	}

