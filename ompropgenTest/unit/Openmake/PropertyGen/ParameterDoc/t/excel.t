
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

ok($pdoc->read_document_config, "read_document_config");
ok(exists $pdoc->{config_properties}, "config_properties exists");
ok(ref($pdoc->{config_properties}) eq 'HASH', "config_properties is a hash ref: ref=" . ref($pdoc->{config_properties}));
ok(exists $pdoc->{config_properties}->{config_column}, "config_column property exists");

my $pg;

ok($pg = $pdoc->parse(), "parse ok");
ok(exists $pg->{url}, "url exists");
ok(ref($pg->{url}) eq 'HASH', "url is a hash ref: ref=" . ref($pg->{url}));

#map { print $_ . "\n" } keys %{$pg->{url}};

my @urls = keys %{$pg->{url}};
my $first_url = shift @urls;

ok(exists $pg->{url}->{$first_url}->{file_type}, "file type exists for first url");
#my $file_type = $pg->{url}->{$first_url}->{file_type};

my @target_configs = keys %{$pg->{url}->{$first_url}};
ok( scalar @target_configs > 0, "first url has target configs" );

my $first_config = shift @target_configs;
my @ops = @{$pg->{url}->{$first_url}->{$first_config}};

ok(scalar @ops > 0, "first config has ops");

my $first_op = shift @ops;

ok(ref( $first_op) eq 'HASH', "first op is a hash ref: ref=" . ref($first_op));
ok(exists $first_op->{udl}, "udl exists for first op");

$pg->{output_location} = '.';
$pg->{workspace_location} = '.';

my @processors;
my $rProcessors;

ok($rProcessors = $pg->generate_all_target_config_processors('dev'),"Generate processors");

ok( (scalar @$rProcessors > 0), "\@processors is not null: " . scalar @$rProcessors);

foreach my $proc ( @$rProcessors ) {
	ok( $proc->parse_all(), "parse_all successful" )
}

