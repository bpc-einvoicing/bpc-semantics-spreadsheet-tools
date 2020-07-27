<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:c="urn:X-Crane"
                exclude-result-prefixes="xs xsd c"
                version="2.0">

<xs:doc filename="bpcprcess2sch.xsl" vocabulary="DocBook">
  <xs:title>
    Convert a BPC skeleton Schematron script into one tailored for a process.
  </xs:title>
  <para>
    The tailoring is simple in the attributes, text, and comments.
  </para>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>Invocation parameters and input file</xs:title>
  <para>
    The input file is the image of the output file with placeholders
    of the format "{bpc:process}" that get replaced in-situ in order
    to create the output file.
  </para>
  <para>
    Comments and text get both the process identifier and the version.
  </para>
  <para>
    Attributes and filenames are replaced with only the process identifier.
  </para>
</xs:doc>

<xs:param ignore-ns='yes'>
  <para>
    The process number in the format "P##".
  </para>
</xs:param>
<xsl:param name="process" required="yes" as="xsd:string"/>

<xs:param ignore-ns='yes'>
  <para>
    The version number not including a preceding "v".
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
 <xsl:result-document href="{$process}/BPC-{$process}-Business-Rules.sch">
  <xsl:apply-templates/>
 </xsl:result-document>
</xsl:template>

<xs:template>
  <para>
    Replace the {bpc:process} string with the process number.
  </para>
</xs:template>
<xsl:template match="text()" priority="1">
  <xsl:value-of select=
                "replace(.,'\{bpc:process\}',concat($process,' v',$version))"/>
</xsl:template>

<xs:template>
  <para>
    Replace the {bpc:process} string with the process number.
  </para>
</xs:template>
<xsl:template match="comment()" priority="1">
  <xsl:comment select=
                "replace(.,'\{bpc:process\}',concat($process,' v',$version))"/>
</xsl:template>

<xs:template>
  <para>
    Replace the {bpc:process} string with the process number.
  </para>
</xs:template>
<xsl:template match="@*" priority="1">
  <xsl:attribute name="{name(.)}" namespace="{namespace-uri(.)}"
                 select="replace(.,'\{bpc:process\}',$process)"/>
</xsl:template>

<xs:template>
  <para>
    The identity template is used to copy all nodes not already being handled
    by other template rules.
  </para>
</xs:template>
<xsl:template match="@*|node()" mode="#all">
  <xsl:copy>
    <xsl:apply-templates mode="#current" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>