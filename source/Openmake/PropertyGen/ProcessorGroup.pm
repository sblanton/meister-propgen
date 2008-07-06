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

sub get_file_type {
	my $self = shift;
	
	my $udl = shift or confess("UDL not defined!");
	
	$udl = m|(\w+)://|;
	my $protocol = $1;

    my $file_types;
    
    $file_types->{xpath} = 'xml';
    $file_types->{property} = 'property';
    $file_types->{token} = 'text';
    
    return $file_types->{$protocol};

}

sub generate_new_document {
	
}

sub generate_target_config_documents{
	
}

sub generate_all_documents {
	
}

=back

=cut

1;
