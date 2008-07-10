package Openmake::PropertyGen::ProcessorGroup;

=head1 Name

Openmake::PropertyGen::ProcessorGroup

=head1 Synopsis

Holds a list of documents and operations to apply to them for a set of target
configurations

=head1 Description

Contains information regarding the source document location (URL) and a list of operations
to apply for a given target configuration. The operations involve a "Universal Datum Locator"
(UDL) that specifies whether to operate on a property value, XPath or token.

=over4

=cut

use Carp qw(cluck);

#use strict;

sub new {

=item new()

Generic constructor

=cut

	my $this  = shift;
	my $class = ref($this) || $this;
	my $self  = {};
	bless $self, $class;

	#	$self->initialize();
	return $self;
}

sub initialize {
	my $self = shift;

	return;
}

sub add_operation {

=item 

Adds a new operation to for a document in the processor group for a given
target configuration

=cut

	my $self          = shift;
	my $source_url    = shift or confess("Source URL not specified!");
	my $target_config = shift or confess("Target configuration not specified!");
	my $udl           = shift or confess("Operation (UDL) not specified!");
	my $new_value     = shift or confess("New value not specified!");

	$self->{"$source_url"}->{"$target_config"}->{ "$udl" => "$new_value" };

}

sub generate_processor {

}

sub generate_all_target_config_processors {
	my $self = shift;
	my $target_config = shift or confess("No target configuration specified");

	unless ( exists $self->{output_location} ) {
		confess("Output location not defined!");
	}

	unless ( exists $self->{workspace_location} ) {
		confess("Workspace location not defined!");
	}

	my @urls = keys %{ $self->{url} };

	unless (@urls) {
		cluck("No URL's to process");
		return 0;
	}

	my @processors;

	foreach my $url (@urls) {
		if ( exists $self->{url}->{$url}->{$target_config} ) {

			my $source_file = $url;
			my @ops         = @{ $self->{url}->{$url}->{$target_config} };
			my $file_type   = $self->{url}->{$url}->{file_type};

			print "Creating processor for $source_file and $target_config...\n";

			my %processor_class = (
				properties => 'Property',
				xml        => 'XML'
			);

			my $class =
			  "Openmake::PropertyGen::Processor::$processor_class{$file_type}";
			
			eval "require $class";
			
			my $processor = $class->new(
				source_file_name => $source_file,
				target_config    => $target_config,
				output_location  => $self->{output_location},
				workspace_location  => $self->{workspace_location},
				operations       => @ops
			);

			confess(
				"Failed to create processor for $source_file and $target_config"
			  )  unless $processor;

			push @processors, $processor;
			
		}
	}
	
	push @{$self->{processors}},@processors;
	
	return $self->{processors};
}

sub generate_all_processors {

}

=back

=cut

1;
