<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:bpc="urn:X-BPC"
                exclude-result-prefixes="xs xsd bpc"
                version="2.0">

<xs:doc filename="ublgc2bpcgc.xsl" vocabulary="DocBook">
  <xs:title>
    Convert a UBL genericode model into a BPC subset genericode model
  </xs:title>
  <para>
    The BPC Semantics group has imposed changes in cardinality and has
    specified these values in a spreadsheet. The spreadsheet is translated
    to genericode for XML processing.
  </para>
  <para>
    This stylesheet reads the genericode to augment a copy of the
    supplied UBL spreadsheet with columns used by a schema subset tool.
  </para>
</xs:doc>

<xs:output>
  <para>Indent the results</para>
</xs:output>
<xsl:output indent="yes"/>

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

<xs:param ignore-ns="yes">
  <para>Number of processes to accommodate</para>
</xs:param>
<xsl:param name="number-of-processes" required="yes" as="xsd:string"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Main processing</xs:title>
</xs:doc>

<xs:variable>
  <para>The set of available process indications</para>
</xs:variable>
<xsl:variable name="bpc:processIDs" as="xsd:string*">
  <xsl:choose>
    <xsl:when test="not( $number-of-processes castable as xsd:integer )
                    or not( $number-of-processes cast as xsd:integer > 0 )">
      <xsl:message terminate="yes"
                select="'Supplied number of processes not a positive integer:',
                        $number-of-processes"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:for-each select="1 to ( $number-of-processes cast as xsd:integer )">
        <xsl:sequence select="concat('P',format-number(.,'00'))"/>
      </xsl:for-each>
    </xsl:otherwise>
  </xsl:choose>
</xsl:variable>

<xs:variable>
  <para>Harvest the dictionary entry names and cardinalities</para>
</xs:variable>
<xsl:variable name="bpc:info">
  <xsl:for-each-group select="/*" group-starting-with="abc">
    
  </xsl:for-each-group>
</xsl:variable>

<xs:template>
  <para>Getting started</para>
</xs:template>
<xsl:template match="/">
  <xsl:if test="not(gc:CodeList)"
             xmlns:gc="http://docs.oasis-open.org/codelist/ns/genericode/1.0/">
    <xsl:message terminate="yes"
                 select="'Main input is not a genericode file'"/>
  </xsl:if>
  <xsl:if test="not($ublgc/gc:CodeList)"
             xmlns:gc="http://docs.oasis-open.org/codelist/ns/genericode/1.0/">
    <xsl:message terminate="yes"
                 select="'UBL model input is not a genericode file'"/>
  </xsl:if>
  <xsl:apply-templates select="$ublgc/*"/>
</xsl:template>

<xs:template>
  <para>Inject new subset column definitions</para>
</xs:template>
<xsl:template match="ColumnSet">
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:for-each select="$bpc:processIDs">
      <Column Id="{.}" Use="optional">
        <ShortName><xsl:value-of select="."/></ShortName>
        <LongName><xsl:value-of select="."/></LongName>
        <Data Type="string"/>
      </Column>
    </xsl:for-each>
    <xsl:apply-templates/>
  </xsl:copy>
</xsl:template>

<xs:template>
  <para>Inject new subset column definitions</para>
</xs:template>
<xsl:template match="Value[@ColumnRef='DictionaryEntryName']">
  <xsl:next-match/>
  <xsl:for-each select="../Value[@ColumnRef='Cardinality']">
    <xsl:variable name="bpc:thisValue" select="SimpleValue"/>
      <xsl:for-each select="$bpc:processIDs">
        <Value ColumnRef="{.}">
          <SimpleValue><xsl:value-of select="$bpc:thisValue"/></SimpleValue>
        </Value>
      </xsl:for-each>
  </xsl:for-each>
</xsl:template>

<xsl:template match="@*|node()"><!--identity for all other nodes-->
  <xsl:copy>
    <xsl:apply-templates select="@*|node()"/>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>