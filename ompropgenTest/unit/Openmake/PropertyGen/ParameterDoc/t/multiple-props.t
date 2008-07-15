
use Openmake::Test;
use FindBin;
use Test::More qw(no_plan);

om_prep_test("$FindBin::Bin/$0");

BEGIN {
	use_ok('Openmake::PropertyGen::ParameterDoc');
	use_ok('Openmake::PropertyGen::ProcessorGroup');
}

my $pdoc;
ok($pdoc = Openmake::PropertyGen::ParameterDoc->new('mpscmhar_cirwss.xml'), "pdoc obj created");

$pdoc->{config_file} = 'mpscmhar_cirwss.properties';

my $pg;

ok($pg = $pdoc->parse(), "parse ok");

$pg->{output_location} = '.';
$pg->{workspace_location} = '.';

my $rProcessors;

ok($rProcessors = $pg->generate_all_target_config_processors('dev'),"Generate processors");

foreach my $proc ( @$rProcessors ) {
	ok( $proc->apply_all_operations(), "parse_all successful" )
}

