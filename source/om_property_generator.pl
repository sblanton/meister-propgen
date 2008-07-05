#!/usr/bin/perl

=head1 Name

om_property_generator.pl

=head1 Synopsis

OpenMake Software Property File Generator

=head1 Description

Generates property files based on a source model
or template file and a list of target configurations
and parameter changes

=cut

use XML::Twig;
use File::Basename;
use File::Path;
use Config::Properties;
use Getopt::Long;

use Openmake::PropertyGen::ParameterDoc;
use Openmake::PropertyGen::Processor;

use strict;

my ( $workspace, $output_loc, $parm_input_file, $parm_input_type );

my $result = GetOptions(
	"workspace=s"       => \$workspace,
	"output_loc=s"      => \$workspace,
	"parm_input_file=s" => \$parm_input_file,
	"parm_input_type=s" => \$parm_input_type,
);

$workspace =~ s|\\|/|g;
chdir $workspace or die;

my $file = $parm_input_file;
$file =~ s|\\|/|g;

$output_loc =~ s|\\|/|g;

$file = "$workspace/$file";
die unless -f $file;

$output_loc = "$workspace/$output_loc";
die unless -d $output_loc;

my $parm_input_file_obj = Openmake::PropertyGen::ParameterDoc->new( parm_input_file => $parm_input_file);

my $processor = $parm_input_file_obj->parse();
$processor->generate_files();

