<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:c="urn:X-Crane"
                exclude-result-prefixes="xs xsd c"
                version="2.0">

<xs:doc filename="ssgc2sch.xsl" vocabulary="DocBook">
  <xs:title>
    Convert a BPC spreadsheet genericode file into Schematron scripts
  </xs:title>
  <para>
    
  </para>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>Invocation parameters and input file</xs:title>
  <para>
    Input file....
  </para>
</xs:doc>

<xs:param ignore-ns='yes'>
  <para>
  </para>
</xs:param>
<xsl:param name="process" required="yes" as="xsd:string"/>

<xs:param ignore-ns='yes'>
  <para>
  </para>
</xs:param>
<xsl:param name="version" required="yes" as="xsd:string"/>

<!--========================================================================-->
<xs:doc>
  <xs:title></xs:title>
</xs:doc>

<xs:template>
  <para>Getting started</para>
</xs:template>
<xsl:template match="/">
 <xsl:result-document href="{$process}/BPC-{$process}-Constraints.pattern.sch">
  <pattern xmlns="http://purl.oclc.org/dsdl/schematron"
           id="BPC-{$process}-Constraints-{$version}">
  </pattern>
 </xsl:result-document>
</xsl:template>

</xsl:stylesheet>