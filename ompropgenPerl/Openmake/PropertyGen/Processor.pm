package Openmake::PropertyGen::Processor;

=head1 Name

=head1 Synopsis

=cut

use Carp qw(confess cluck);
use File::Basename;
use File::Path;

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
     
     #-- only 'file://' url's supported. Hack until something better is called for:
     
     $self->{source_file_name} =~ s|^file://||;
     
    my $target_file_name = $self->{output_location} . "/" . $self->{target_config} . "/" . $self->{source_file_name};
     $self->{target_file_name} = $target_file_name;
     
     my ($name,$target_path) = fileparse($target_file_name);
     mkpath($target_path);
     
     my $source_file = $self->{workspace_location} . "/" . $self->{source_file_name};
     $self->{source_file_name} = $source_file;
     
     print "Creating path: $target_path\n";
     mkpath($target_path);
     
     warn("WARN: Source file not found ($source_file)") unless -f $source_file;
     confess("ERROR: Target file name not defined") unless defined $self->{target_file_name};
     confess("ERROR: Target configuration not defined") unless defined $self->{target_config};
     confess("ERROR: Workspace location not defined") unless defined $self->{workspace_location};
     confess("ERROR: Output location not defined") unless defined $self->{output_location};
     cluck("WARN: No operations defined") unless defined $self->{operations};

}

sub apply_all_operations {
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