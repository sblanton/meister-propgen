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


1;