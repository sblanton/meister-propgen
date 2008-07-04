#!/usr/bin/perl

use XML::Twig;
use File::Basename;
use File::Path;
use Config::Properties;

use Openmake::PropertyGen;

#use strict;

my $workspace = shift or die;
$workspace =~ s|\\|/|g;

chdir $workspace or die;

my $file = shift or die; #-- XML spreadsheet file
$file =~ s|\\|/|g;

my $output_loc = shift or die;
$output_loc =~ s|\\|/|g;

$file = "$workspace/$file";
die unless -f $file;

$output_loc = "$workspace/$output_loc";
die unless -d $output_loc;


my $iTier     = 3;
my $iURL      = 4;
my $iUDL      = 5;
my $iNewDatum = 6;

my $iRow = 0;
my $iStartingColumn = 0;

my $iStartingRow = 6;

my $url       = '';
my $udl       = '';
my $new_datum = '';

#-- get all of the XML files for parsing
my $spreadsheet_handler = XML::Twig->new(

   twig_handlers => {
      'Row' => sub {
         if ( exists $_->{'att'}->{'ss:Index'} ) {
            $iRow = $_->{'att'}->{'ss:Index'}

         } else {
            $iRow++

         }

         return unless $iRow >= $iStartingRow;

         my @cells = $_->children();

         if ( exists $cells[0]->{'att'}->{'ss:Index'} ) {
            $iStartingColumn =  $cells[0]->{'att'}->{'ss:Index'}

         } else {
            $iStartingColumn = 1;

         }
         
         return unless ($iTier - $iStartingColumn) < scalar @cells;
         my $found_tier = $cells[ $iTier - $iStartingColumn ]->text();


         if ( ($iURL  - $iStartingColumn) < scalar @cells ) {
            my $new_url = $cells[ $iURL - $iStartingColumn ]->text();
            #print "NEW_URL: $new_url\n";
            $url = $new_url if $new_url;
         }

         if ( ($iUDL  - $iStartingColumn) < scalar @cells ) {
            my $new_udl = $cells[ $iUDL - $iStartingColumn ]->text();
            #print "NEW_UDL: $new_udl\n";
            $udl = $new_udl if $new_udl;
         }

         if ( ($iNewDatum - $iStartingColumn) < scalar @cells ) {
            my $new_new_datum = $cells[ $iNewDatum - $iStartingColumn ]->text();
            #print "NEW_NEW_DATUM: $new_new_datum\n";
            $new_datum = $new_new_datum if $new_new_datum;
         }

         #print "$iRow: $found_tier\n$url\n$udl\n$new_datum\n";

         gen_doc( $found_tier, $url, $udl, $new_datum );
        }
   }
);

$spreadsheet_handler->parsefile($file);

#####################################################################

