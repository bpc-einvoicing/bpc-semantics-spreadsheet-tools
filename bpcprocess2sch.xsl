<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:bpc="urn:X-BPC"
                xmlns:sch="http://purl.oclc.org/dsdl/schematron"
                xmlns:xslo="dummy"
                exclude-result-prefixes="xs xsd bpc xslo"
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
    Schema skeleton to be fleshed out.
  </para>
</xs:param>
<xsl:param name="schemaSkeleton" required="yes"
           as="document-node(element(sch:schema))"/>

<xs:param ignore-ns='yes'>
  <para>
    Schema skeleton to be fleshed out.
  </para>
</xs:param>
<xsl:param name="patternSkeleton" required="yes"
           as="document-node(element(sch:pattern))"/>

<xs:param ignore-ns='yes'>
  <para>
    Schema skeleton to be fleshed out.
  </para>
</xs:param>
<xsl:param name="semanticsSummary" required="yes"
           as="document-node(element(worksheets))"/>

<xs:param ignore-ns='yes'>
  <para>
    The location in which to create the dynamic Ant script.
  </para>
</xs:param>
<xsl:param name="antDynamicScriptURI" required="yes" as="xsd:string"/>

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

<xsl:namespace-alias stylesheet-prefix="xslo" result-prefix="xsl"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Main logic</xs:title>
</xs:doc>

<xs:template>
  <para>Getting started</para>
</xs:template>
<xsl:template match="/">
  <!--first create the Schematron schema and pattern files for each process-->
  <xsl:for-each select="/*/bpcProcess">
    <xsl:variable name="procID" select="@bpcID"/>
    <xsl:result-document
  href="{$procID}/BPC-{$procID}-v{$BPCversion}-Data-Integrity-Constraints.sch">
      <xsl:apply-templates select="$schemaSkeleton/*">
        <xsl:with-param name="process" select="." tunnel="yes"/>
      </xsl:apply-templates>
    </xsl:result-document>
    <xsl:result-document
          href="{$procID}/BPC-{$procID}-v{$BPCversion}-Assertions.pattern.sch">
      <xsl:apply-templates select="$patternSkeleton/*">
        <xsl:with-param name="process" select="." tunnel="yes"/>
      </xsl:apply-templates>
    </xsl:result-document>
    <xsl:result-document exclude-result-prefixes="sch"
                      href="{$procID}/BPC-{$procID}-Data-Integrity-Constraints.xsl">
      <xslo:stylesheet version="2.0">
        <xsl:text>&#xa;</xsl:text>
<xsl:comment>
  Wrapper invocation stylesheet for BPC Semantics process:
  <xsl:value-of select="
       bpc:formatProcessInfo('{bpc:title} from worksheet {bpc:worksheet}',.)"/>
  incorporating the code list functions for XPath use.
</xsl:comment>
        <xsl:text>&#xa;</xsl:text>
        <xslo:import
           href="BPC-{$procID}-v{$BPCversion}-Data-Integrity-Constraints.xsl"/>
        <xslo:import href="../BPC-v{$BPCversion}-Code-Lists.xsl"/>
      </xslo:stylesheet>
    </xsl:result-document>
  </xsl:for-each>
  
  <!--next create the Ant script that will process each of the Schematron
      schemas to create XSLT stylesheets-->
  <xsl:result-document href="{$antDynamicScriptURI}" xmlns="">
    <project default="make" xmlns:if="ant:if" xmlns:unless="ant:unless">
    
    <taskdef name="grep" classname="ise.antelope.tasks.Find"/>
    
    <taskdef resource="net/sf/antcontrib/antcontrib.properties"/>
    
    <target name="make">
      <echo message="Invoking ${{antStaticScriptURI}} for each process"/>
      <xsl:for-each select="/*/bpcProcess">
        <ant antfile="${{antStaticScriptURI}}" target="-sch4bpc">
          <property name="process" value="{@bpcID}"/>
          <property name="version" value="{$BPCversion}"/>
        </ant>
      </xsl:for-each>
    </target>
      
    </project>
  </xsl:result-document>
</xsl:template>
  
<xs:template>
  <para>
    Replace in text the {bpc:*} strings with the process information.
  </para>
  <xs:param name="process">
    <para>The information for the process being acted on</para>
  </xs:param>
</xs:template>
<xsl:template match="text()" priority="1">
  <xsl:param name="process" as="element(bpcProcess)" tunnel="yes"/>
  <xsl:call-template name="bpc:formatProcessInfo"/>
</xsl:template>

<xs:template>
  <para>
    Replace in comments the {bpc:*} strings with the process information.
  </para>
  <xs:param name="process">
    <para>The information for the process being acted on</para>
  </xs:param>
</xs:template>
<xsl:template match="comment()" priority="1">
  <xsl:param name="process" as="element(bpcProcess)" tunnel="yes"/>
  <xsl:call-template name="bpc:formatProcessInfo"/>
</xsl:template>

<xs:template>
  <para>
    Replace in attributes the {bpc:*} strings with the process information.
  </para>
  <xs:param name="process">
    <para>The information for the process being acted on</para>
  </xs:param>
</xs:template>
<xsl:template match="@*" priority="1">
  <xsl:param name="process" as="element(bpcProcess)" tunnel="yes"/>
  <xsl:attribute name="{name(.)}" namespace="{namespace-uri(.)}">
    <xsl:call-template name="bpc:formatProcessInfo"/>
  </xsl:attribute>
</xsl:template>

<xs:template>
  <para>
    Replace the {bpc:process} strings with the process information.
  </para>
  <itemizedlist>
    <listitem>bpc:process - P##</listitem>
    <listitem>bpc:worksheet - #</listitem>
    <listitem>bpc:title - formatted string of version and dateTime</listitem>
  </itemizedlist>
  <xs:param name="process">
    <para>The information for the process being acted on</para>
  </xs:param>
</xs:template>
<xsl:template name="bpc:formatProcessInfo">
  <xsl:param name="process" as="element(bpcProcess)"
             tunnel="yes" required="yes"/>
  <xsl:value-of select="bpc:formatProcessInfo(.,$process)"/>
</xsl:template>

<xs:function>
  <para>
    Return the {bpc:process} strings replaced with the process information.
  </para>
  <itemizedlist>
    <listitem>bpc:process - P##</listitem>
    <listitem>bpc:worksheet - #</listitem>
    <listitem>bpc:title - formatted string of version and dateTime</listitem>
  </itemizedlist>
  <xs:param name="process">
    <para>The information for the process being acted on</para>
  </xs:param>
</xs:function>
<xsl:function name="bpc:formatProcessInfo">
  <xsl:param name="template" as="xsd:string"/>
  <xsl:param name="process" as="element(bpcProcess)"/>
  <xsl:value-of select="replace(replace(replace(replace($template,
                       '\{bpc:title\}',concat($process/@bpcID,' v',$BPCversion,
                                              ' - ',$dateTime,
                                              ' - ',$process/title)),
                       '\{bpc:worksheet\}',$process/@worksheetNumber),
                       '\{bpc:process\}',$process/@bpcID),
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

<!--========================================================================-->

<xs:template>
  <para>
    Create a Schematron pattern with all of the 
  </para>
  <xs:param name="process">
    <para>The information for the process being acted on</para>
  </xs:param>
</xs:template>
<xsl:template match="sch:pattern">
  <xsl:param name="process" as="element(bpcProcess)" tunnel="yes"/>
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates/>
    <!--generate assertions at this point--> 



    <xsl:text>&#xa;</xsl:text>
  </xsl:copy>
</xsl:template>

<xs:function>
  <para>Returning a row's column value by its column name</para>
  <xs:param name="row"><para>The genericode row</para></xs:param>
  <xs:param name="column"><para>The genericode column</para></xs:param>
</xs:function>
<xsl:function name="bpc:col" as="element(SimpleValue)*">
  <xsl:param name="row" as="element(Row)"/>
  <xsl:param name="column" as="xsd:string"/>
  <xsl:sequence select="$row/Value[@ColumnRef=$column]/SimpleValue"/>
</xsl:function>

</xsl:stylesheet>