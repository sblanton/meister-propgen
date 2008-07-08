
use Openmake::Test;
use FindBin;
use Test::More qw(no_plan);

om_prep_test("$FindBin::Bin/$0");

BEGIN {
	use_ok('Openmake::PropertyGen::ParameterDoc');
}

my $pdoc;
ok($pdoc = Openmake::PropertyGen::ParameterDoc->new('mpscmhar_cirwss.xml'), "pdoc obj created");

$pdoc->{config_file} = 'mpscmhar_cirwss.properties';

ok($pdoc->read_document_config, "read_document_config");
ok(exists $pdoc->{config_properties}, "config_properties exists");
ok(ref($pdoc->{config_properties}) eq 'HASH', "config_properties is a hash ref: ref=" . ref($pdoc->{config_properties}));
ok(exists $pdoc->{config_properties}->{config_column}, "config_column property exists");

ok($pdoc->parse(), "parse ok");
ok(exists $pdoc->{url}, "url exists");
ok(ref($pdoc->{url}) eq 'HASH', "url is a hash ref: ref=" . ref($pdoc->{url}));

#map { print $_ . "\n" } keys %{$pdoc->{url}};

my @urls = keys %{$pdoc->{url}};
my $first_url = shift @urls;
my @target_configs = keys %{$pdoc->{url}->{$first_url}};
ok( scalar @target_configs > 0, "first url has target configs" );

my $first_config = shift @target_configs;
my @ops = @{$pdoc->{url}->{$first_url}->{$first_config}};

ok(scalar @ops > 0, "first config has ops");

my $first_op = shift @ops;

ok(ref( $first_op) eq 'HASH', "first op is a hash ref: ref=" . ref($first_op));
ok(exists $first_op->{udl}, "udl exists for first op");

