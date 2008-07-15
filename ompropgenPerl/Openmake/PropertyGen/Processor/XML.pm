package Openmake::PropertyGen::Processor::XML;

=head1 Name

=head1 Synopsis

=cut

BEGIN {
	use Openmake::PropertyGen::Processor;
	@ISA = qw(Openmake::PropertyGen::Processor);
}

use Carp;
use XML::Twig;

use strict;

sub new {
	my $self = shift;
	return $self->SUPER::new(@_);
}

sub apply_all_operations {
	my $self = shift;

	$self->{text} = $self->read_source_file()
	  or confess();

my @ops = @{$self->{operations}};
print "Processing " . scalar @ops . " operations\n";

	foreach my $op ( @ops ) {
	print "OP: $op\n";
		$self->parse_xpath($op);
	}

	delete $self->{text};

}

sub parse_xpath {
	my $self = shift;

	my $op_ref = shift;

	my $udl       = $op_ref->{udl};
	my $new_value = $op_ref->{new_value};

	my $xpath = $udl;
	$xpath =~ s|^xpath://||;

	print "XPATH: $xpath\n";

	my $twig = XML::Twig->new(
		pretty_print  => 'indented',
		twig_handlers => {

			$xpath => sub {
				$_->set_text($new_value);
			  }

		}
	);

	$twig->safe_parse( $self->{text} ) or die "Couldn't parse source as XML: $@";

}

sub parse_token {
	return undef;
}

sub read_source_file {
	my $self = shift;

	my $src_file = $self->{source_file_name};

	open SRC, "<$src_file"
	  or confess("Couldn't open target XML file ($src_file) for reading");
	my @lines = <SRC>;
	close SRC;

    return join '', @lines;
}

sub save_target_file {
	my $self = shift;

	my $xml_text = $self->{text};
	my $tgt_file = $self->{target_file_name};

	open TGT, ">$tgt_file"
	  or confess("Couldn't open target XML file for reading");
	print TGT $xml_text;
	close TGT;

}

1;
