package Openmake::PropertyGen::Processor;

=head1 Name

=head1 Synopsis

=cut

sub new {
   my $this = shift;
   my $class = ref($this) || $this;
   my $self = {};
   bless $self, $class;
   $self->initialize();
   return $self;
}

sub initialize {
}


1;