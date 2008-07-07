package Openmake::PropertyGen::Processor::Property;

=head1 Name

=head1 Synopsis

=cut


BEGIN {
	@ISA = qw(Openmake::PropertyGen::Processor)
}
use Carp;
use Config::Properties;

use strict;

sub parse_all {
	my $self = shift;
	$self->{text} = $self->read_source_file()
	  or confess();

	foreach my $op ( $self->{operations} ) {
		$self->parse_property($op);
	}

	delete $self->{text};

}

sub parse_property {
	my $self = shift;

	my $op_ref = shift;
	my ( $udl, $new_value ) = @$op_ref;

	$udl =~ s|property://||;

	my $name = $udl;

	print "Setting property '$name' to '$new_value'\n";

	$self->{properties}->{$name} = $new_value;

	return 1;
}

sub parse_token {
}

sub read_source_file {
	my $self = shift;

	my $src_file = $self->{source_file_name};
	open SRC, "<$src_file" or die "Couldn't open source properties file";
	my $properties = new Config::Properties;
	$properties->load(*SRC);
	close SRC;

	$self->{properties} = \{ $properties->properties };

}

sub save_target_file {
	my $self = shift;

	my $properties = new Config::Properties;
	$properties->setFromTree( $self->{properties} );

	my $tgt_file = $self->{target_file_name};

	open TGT, ">$tgt_file" or die "Couldn't open target properties file";
	$properties->store(*TGT);
	close TGT;

}

1;
