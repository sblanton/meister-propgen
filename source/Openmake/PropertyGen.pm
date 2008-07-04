package Openmake::PropertyGen;

BEGIN {
	@ISA = qw(Exporter);
	@EXPORT = qw(
	 &generate_new_doc
	 &parse_xpath
	 &parse_property
	 &parse_token
	 )
}

sub generate_new_doc {
   my $tier      = shift or return;
   my $url       = shift or return;
   my $udl       = shift or return;
   my $new_datum = shift or return;

   my $src_file = $url;
   $src_file =~ s|^file://||;

print "<HR>\n";

   print "SOURCE FILE: $src_file\n";

   my $tgt_file = "$output_loc/$tier/$src_file";

   my $path = dirname $tgt_file;
   mkpath($path);
   die unless -d $path;

   print "TGT FILE: $tgt_file\n";

   $udl =~ s|^(\S+)\://||;
   my $udl_protocol = $1;
   print "Processing for protocol: $udl_protocol\n";
   my $udl_locator = $udl;


$src_file = "$workspace/$src_file";

   die "Source file ($src_file) not found!" unless -f $src_file;

   &{"parse_${udl_protocol}"}($src_file, $tgt_file, $udl_locator, $new_datum);

}


sub parse_xpath {
   my $src_file = shift;
   my $tgt_file = shift;
   my $xpath = shift;
   my $new_datum = shift;

   print "XPATH: $xpath\n";
 
   my $twig = XML::Twig->new(
      pretty_print  => 'indented',
      twig_handlers => {
      
         "$xpath" => sub {
            $_->set_text($new_datum);
           }
           
      }
   );


   $twig->safe_parsefile($src_file) or die "Couldn't parse source XML file";


   open TGT, ">$tgt_file" or die "Couldn't open target XML file";
   print TGT $twig->sprint();
   close TGT;


}

sub parse_property {

   my $src_file = shift;
   my $tgt_file = shift;
   my $name =  shift;
   my $new_value = shift;
   
   open SRC, "<$src_file" or die "Couldn't open source properties file";
   my $properties = new Config::Properties;
   $properties->load(*SRC);
   close SRC;
   
   open TGT, ">$tgt_file" or die "Couldn't open target properties file";

   print "Setting property '$name' to '$new_value'\n";
   
   $properties->setProperty($name,$new_value);
   $properties->store(*TGT);
   close TGT;
   
}

sub parse_token {
}


1;