=heasd1 Name

ompropgen.pl

=head1 Synopsis

Generates sets of property files with altered values based on source property files and a table of parameters.

=head1 Description

Designed with Java deployment in mind where a web application may need to be deployed to different server
environments, needing different property files for each environment. For example, the database name may
be different for the development and qa environments, therefore the property file with the name of the database
will need to be different for the Java archive deployed to development and the archive deployed to qa.

The operation flow is:

=over4

=item Read Parameter Input File

This is done with Openmake::PropertyGen::ParameterDoc->parse_excel_2003_xml() which returns an
Openmake::PropertyGen::ProcessorGroup object. This contains all the operations to be applied for
each property file according to the target environment.

=item Create Processors According to Target Environment

The Openmake::PropertyGen::ProcessorGroup->generate_all_target_config_processors() method will
generate a list of Openmake::PropertyGen::Processor objects for a given target configuration.
Each processor object will operate on a single source file and apply all the operations needed
to create the target file for the single target environment.

To generate a single property file with the correct values for each of four target configurations
(environemnts) you will need to execute 'generate_all_target_config_processors()' once for each
target configuration and each call will return a reference to an array containing one processor.

Note there are different processor objects according to what type of processing is going on - XML, 
or property files, for example.

=item Apply Operations to Each Source File

To go from source file to target file, applying all operations, execute the Openmake::PropertyGen::Processor->apply_all_operations()
method.

To generate all target files for a given target environment, loop through all the processors returned
by a single call to Openmake::PropertyGen::ProcessorGroup->generate_all_target_config_processors().

=back

=head2 Input Parameter File

Currently only the Microsoft Excel 2003 XML Spreadsheet format is supported.

The required inputs are:

=over4

=item Target Configuration

The name of a set of property files to be generating corresponding to a single runtime environment.

=item Source File URL

The file::// URL of a source file to use as a basis for alteration.

=item Universal Datum Locator (UDL)

A way of identifying which location to alter inside the source document. For a property file, this can be the
name of the property. For an XML document it can be the XPath. A protocol format similar to a URL is used to
designate the method to locate the datum to alter, e.g. property://<name>, xpath://<xpath>

=item New Value

The new value of the datum located by the UDL.

=back

=head1 Known Issues

Although previously working with full, complex XPath values, the current version only supports the simple XPaths
of the XML::Twig module. It may be that a later version of XML::Twig is needed, as the code has not changed - more investigation required.

=cut

