package Openmake::PropertyGen::Processor;

=head1 Name

=head1 Synopsis

=cut

use Carp qw(confess cluck);

use strict;

sub new {
   my $this = shift;
   my $class = ref($this) || $this;
   my $self = {};
   bless $self, $class;
   $self->initialize(@_);
   return $self;
}

sub initialize {
	my $self = shift;
	
	my %parms = @_;
	
	%$self = map { $_ => $parms{$_}} %parms;

     confess("ERROR: Source file not defined") unless defined $self->{source_file_name};
     cluck("WARN: Source file not found") unless -f $self->{source_file_name};
     confess("ERROR: Target configuration not defined") unless defined $self->{target_config};
     confess("ERROR: Output location not defined") unless defined $self->{output_location};
     cluck("WARN: No operations defined") unless defined $self->{operations};

    my $target_file_name = $self->{output_location} . "/" . $self->{target_config} . "/" . $self->{source_file_name};
}

sub parse_all {
 confess("SKELETON NOT OVERRIDDEN")

}


sub parse_token {
 confess("SKELETON NOT OVERRIDDEN")
}

sub read_source_file {
 confess("SKELETON NOT OVERRIDDEN")
}


sub save_target_file {
 confess("SKELETON NOT OVERRIDDEN")
	
}

1;