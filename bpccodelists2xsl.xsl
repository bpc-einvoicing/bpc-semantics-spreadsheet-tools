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
    This presumes that the skeleton has references to ISO-3166 (Country Codes)
    and for each place found, replaces the given instruction with multiple
    copies of the instruction, one for each of the code lists found in the
    "raw/codelists" directory.
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

<xs:variable>
  <para>
    Collect the list of code lists by reviewing the directory.
  </para>
</xs:variable>
<xsl:variable name="bpc:lists" as="document-node()*"
              select="collection('raw/codelists/?select=*.gc')"/>
  
<!--========================================================================-->
<xs:doc>
  <xs:title>Main logic</xs:title>
  <para>
    Note that the match strings are based on the expected values found in
    the skeleton file. Wherever there is a reference to ISO-3166, the
    element is repeated for all code lists.
  </para>
</xs:doc>

<xs:template>
  <para>Looking up the list</para>
</xs:template>
<xsl:template match="xsl:when[contains(@test,'ISO-3166')]">
  <xsl:variable name="this" select="."/>
  <xsl:for-each select="$bpc:lists">
    <xsl:sort select="document-uri(.)"/>
    <xsl:variable name="listId" select="bpc:listId(.)"/>
    <xsl:for-each select="$this">
      <!--copy the given xsl:when-->
      <xsl:copy>
        <xsl:for-each select="@*">
          <xsl:attribute name="{name(.)}" 
                         select="replace(.,'ISO-3166',$listId)"/>
        </xsl:for-each>
        <!--copy each of the children and their descendants, checking only
            the attributes of the children-->
        <xsl:for-each select="node()">
          <xsl:copy>
            <xsl:for-each select="@*">
              <xsl:attribute name="{name(.)}" 
                             select="replace(.,'ISO-3166',$listId)"/>
            </xsl:for-each>
            <xsl:apply-templates/>
          </xsl:copy>
        </xsl:for-each>    
      </xsl:copy>
    </xsl:for-each>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>Declaring the list metadata</para>
</xs:template>
<xsl:template match="codeList">
  <xsl:variable name="this" select="."/>
  <xsl:for-each select="$bpc:lists">
    <xsl:sort select="document-uri(.)"/>
    <xsl:variable name="gc" select="."/>
    <xsl:for-each select="$this">
      <xsl:copy>
        <xsl:for-each select="@*">
          <xsl:attribute name="{name(.)}" 
                         select="replace(.,'ISO-3166',bpc:listId($gc))"/>
        </xsl:for-each>
        <xsl:attribute name="file"
                       select="substring-after(document-uri($gc),'raw/')"/>
        <xsl:copy-of select="$gc/*/Identification"/> 
      </xsl:copy>
    </xsl:for-each>
  </xsl:for-each>
</xsl:template>

<xs:template>
  <para>Declaring the list codes</para>
</xs:template>
<xsl:template match="xsl:variable[contains(@name,'ISO-3166')]">
  <xsl:variable name="this" select="."/>
  <xsl:for-each select="$bpc:lists">
    <xsl:sort select="document-uri(.)"/>
    <xsl:variable name="gc" select="."/>
    <xsl:for-each select="$this">
      <xsl:copy>
        <xsl:for-each select="@*">
          <xsl:attribute name="{name(.)}" 
                         select="replace(.,'ISO-3166',bpc:listId($gc))"/>
        </xsl:for-each>
        <xsl:attribute name="select">
          <xsl:for-each select="$gc/*/SimpleCodeList/
                                Row/Value[@ColumnRef='code']/SimpleValue">
            <xsl:if test="position()>1">, </xsl:if>
            <xsl:value-of select="concat('''',replace(.,'''',''''''),'''')"/>
          </xsl:for-each>
        </xsl:attribute>
      </xsl:copy>
    </xsl:for-each>
  </xsl:for-each>
</xsl:template>

<xs:function>
  <para>
    Distill the list name from the filename being all text before the first
    dot in the filename.
  </para>
  <xs:param name="doc">
    <para>
      The document node returned from the collection function searching
      all of the genericode files.
    </para>
  </xs:param>
</xs:function>
<xsl:function name="bpc:listId" as="xsd:string">
  <xsl:param name="doc" as="document-node()"/>
  <xsl:sequence select="replace(document-uri($doc),
                                '^.+/(.+?)(\.[^\.]*)?$','$1')"/>
</xsl:function>
<!--========================================================================-->
<xs:doc>
  <xs:title>Generic matching</xs:title>
</xs:doc>
  
<xs:template>
  <para>
    Replace in text the {bpc:*} strings with the process information.
  </para>
</xs:template>
<xsl:template match="text()" priority="1">
  <xsl:call-template name="bpc:formatCustomizationInfo"/>
</xsl:template>

<xs:template>
  <para>
    Replace in comments the {bpc:*} strings with the process information.
  </para>
</xs:template>
<xsl:template match="comment()" priority="1">
  <xsl:comment>
    <xsl:call-template name="bpc:formatCustomizationInfo"/>
  </xsl:comment>
</xsl:template>

<xs:template>
  <para>
    Replace in attributes the {bpc:*} strings with the process information.
  </para>
</xs:template>
<xsl:template match="@*" priority="1">
  <xsl:attribute name="{name(.)}" namespace="{namespace-uri(.)}">
    <xsl:call-template name="bpc:formatCustomizationInfo"/>
  </xsl:attribute>
</xsl:template>

<xs:template>
  <para>
    Replace the {bpc:customization} strings with the process information.
  </para>
  <itemizedlist>
    <listitem>bpc:title - formatted string of version and dateTime</listitem>
  </itemizedlist>
</xs:template>
<xsl:template name="bpc:formatCustomizationInfo">
  <xsl:value-of select="bpc:formatCustomizationInfo(.)"/>
</xsl:template>

<xs:function>
  <para>
    Return the {bpc:customization} strings replaced with the process information.
  </para>
  <itemizedlist>
    <listitem>bpc:version - #.#</listitem>
    <listitem>bpc:title - formatted string of version and dateTime</listitem>
  </itemizedlist>
  <xs:param name="template">
    <para>The string input to the translation</para>
  </xs:param>
</xs:function>
<xsl:function name="bpc:formatCustomizationInfo" as="xsd:string">
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