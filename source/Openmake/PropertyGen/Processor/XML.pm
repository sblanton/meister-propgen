package Openmake::PropertyGen::Processor::XML;

=head1 Name

=head1 Synopsis

=cut

use Carp;
use Config::Properties;

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

     confess("Source file not defined") unless defined $self->{source_file_name};
     confess("Source file not found") unless -f $self->{source_file_name};
     confess("Target configuration not defined") unless defined $self->{target_config};
     confess("Output location not defined") unless defined $self->{output_location};
     cluck("No operations defined") unless defined $self->{operations};

    my $target_file_name = $self->{output_location} . "/" . $self->{target_config} . "/" . $self->{source_file_name};
}

sub parse_all {
	my $self = shift;
	
	$self->{text} = $self->read_source_file()
	 or confess();
	
	foreach my $op ( $self->{operations}) {
		$self->parse_xpath($op);
	}
	
	delete $self->{text};

}

sub parse_xpath {
	my $self = shift;

   my $op_ref = shift;
   my ($xpath, $new_datum) = @$op_ref;

   print "XPATH: $xpath\n";
 
   my $twig = XML::Twig->new(
      pretty_print  => 'indented',
      twig_handlers => {
      
         "$xpath" => sub {
            $_->set_text($new_datum);
           }
           
      }
   );


   $twig->safe_parse($self->{text}) or die "Couldn't parse source as XML";

}


sub parse_token {
	return undef;
}

sub read_source_file {
	my $self = shift;
	
   my $src_file = $self->{source_file_name};
   
   open SRC, ">$src_file" or confess("Couldn't open target XML file for reading");
   $self->{text} = <SRC>;
   close SRC;
	
	return $self->{text}
}


sub save_target_file {
	my $self = shift;

   my $xml_text = $self->{text};
   my $tgt_file = $self->{target_file_name};
   
   open TGT, ">$tgt_file" or confess("Couldn't open target XML file for reading");
   print TGT $xml_text;
   close TGT;
	
}

1;