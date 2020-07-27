<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:c="urn:X-Crane"
                exclude-result-prefixes="xs xsd c"
                version="2.0">

<xs:doc filename="ublgc2bpcgc.xsl" vocabulary="DocBook">
  <xs:title>
    Convert a UBL genericode model into a BPC subset genericode model
  </xs:title>
  <para>
    The BPC Semantics group has imposed changes in cardinality and has
    
  </para>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>Invocation parameters and input file</xs:title>
  <para>
    The input file is the BPC Semantics Spreadsheet with all of the
    business rule information that contains cardinality requirements for
    the BPC subset schemas for each process.
  </para>
</xs:doc>

<xs:param ignore-ns='yes'>
  <para>
    This is the UBL document model genericode file passed as a document node
    which when using Saxon uses the command-line argument +ublgc={uri}
  </para>
</xs:param>
<xsl:param name="ublgc" required="yes" as="document-node()"/>

<!--========================================================================-->
<xs:doc>
  <xs:title></xs:title>
</xs:doc>

<xs:template>
  <para>Getting started</para>
</xs:template>
<xsl:template match="/">
  <xsl:copy-of select="$ublgc"/>
</xsl:template>

</xsl:stylesheet>