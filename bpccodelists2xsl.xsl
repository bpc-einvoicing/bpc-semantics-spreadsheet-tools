<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:bpc="urn:X-BPC"
                exclude-result-prefixes="xs xsd bpc"
                version="2.0">

<xs:doc filename="bpccodelists2xsl.xsl" vocabulary="DocBook"
        info="$Id$">
  <xs:title>
    Convert a BPC skeleton XSLT stylesheet into one supporting code list data.
  </xs:title>
  <para>
    This adds global definitions only.
  </para>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>Invocation parameters and input file</xs:title>
  <para>
    The input file is the image of the output file with a placeholder
    for the data for the code list code to act on.
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
    The version number not including a preceding "v".
  </para>
</xs:param>
<xsl:param name="BPCversion" required="yes" as="xsd:string"/>

<xs:param ignore-ns='yes'>
  <para>
    The date and time stamp to distinguish releases of a particular version.
  </para>
</xs:param>
<xsl:param name="dateTime" required="yes" as="xsd:string"/>

<xs:output>
  <para>For the convenience of human readers, the outputs are indented</para>
</xs:output>
<xsl:output indent="yes"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Main logic</xs:title>
</xs:doc>

<xs:template>
  <para>Getting started</para>
</xs:template>
<xsl:template match="/*">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates
                   select="node() except xsl:variable[@name='bpc:generated']"/>
    
    <xsl:text>&#xa;</xsl:text>
    <xsl:comment>This is some generated content</xsl:comment>
    <xsl:text>&#xa;</xsl:text>
    <xsl:text>&#xa;</xsl:text>

  </xsl:copy>
</xsl:template>

<xs:template>
  <para>
    Replace in text the {bpc:*} strings with the process information.
  </para>
</xs:template>
<xsl:template match="text()" priority="1">
  <xsl:call-template name="bpc:formatProcessInfo"/>
</xsl:template>

<xs:template>
  <para>
    Replace in comments the {bpc:*} strings with the process information.
  </para>
</xs:template>
<xsl:template match="comment()" priority="1">
  <xsl:comment>
    <xsl:call-template name="bpc:formatProcessInfo"/>
  </xsl:comment>
</xsl:template>

<xs:template>
  <para>
    Replace in attributes the {bpc:*} strings with the process information.
  </para>
</xs:template>
<xsl:template match="@*" priority="1">
  <xsl:attribute name="{name(.)}" namespace="{namespace-uri(.)}">
    <xsl:call-template name="bpc:formatProcessInfo"/>
  </xsl:attribute>
</xsl:template>

<xs:template>
  <para>
    Replace the {bpc:process} strings with the process information.
  </para>
  <itemizedlist>
    <listitem>bpc:title - formatted string of version and dateTime</listitem>
  </itemizedlist>
</xs:template>
<xsl:template name="bpc:formatProcessInfo">
  <xsl:value-of select="bpc:formatProcessInfo(.)"/>
</xsl:template>

<xs:function>
  <para>
    Return the {bpc:process} strings replaced with the process information.
  </para>
  <itemizedlist>
    <listitem>bpc:version - #.#</listitem>
    <listitem>bpc:title - formatted string of version and dateTime</listitem>
  </itemizedlist>
  <xs:param name="template">
    <para>The string input to the translation</para>
  </xs:param>
</xs:function>
<xsl:function name="bpc:formatProcessInfo" as="xsd:string">
  <xsl:param name="template" as="xsd:string"/>
  <xsl:value-of select="replace(replace($template,
                       '\{bpc:title\}',concat('v',$BPCversion,
                                              ' - ',$dateTime)),
                       '\{bpc:version\}',$BPCversion)"/>
</xsl:function>

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