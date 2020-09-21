<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                exclude-result-prefixes="xs svrl"
                version="2.0">

<xs:doc filename="massageXSLT4Schematron.xsl" vocabulary="DocBook"
        info="$Id$">
  <xs:title>
    Test the output of Schematron transformation for any errors
  </xs:title>
  <para>
    This returns a non-zero exit code when the input SVRL xml file contains
    a signalled error for an assertion or a report.
    (ref: Part 3: Rule-based validation - Schematron (ISO/IEC 19757-3:2006)
          <ulink url="http://standards.iso.org/ittf/PubliclyAvailableStandards">http://standards.iso.org/ittf/PubliclyAvailableStandards</ulink> 19757-3)
  </para>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>Invocation parameters and input file</xs:title>
  <para>
    The input file is the output SVRL from Schematron checking.
  </para>
</xs:doc>

<xs:output>
  <para>The output is a text file</para>
</xs:output>
<xsl:output method="text"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Main logic</xs:title>
</xs:doc>

<xs:template>
  <para>
    Return an error and report all failed assertions or successful reports.
  </para>
</xs:template>
<xsl:template match="/">
  <xsl:variable name="failures"
                select="//svrl:failed-assert | //svrl:successful-report"/>
  <xsl:if test="$failures">
    <xsl:for-each select="$failures">
      <xsl:value-of select="svrl:text"/>
      <xsl:text>: </xsl:text>
      <xsl:value-of select="@location"/>
      <xsl:text>&#xa;</xsl:text>
      <xsl:message>
        <xsl:value-of select="string(svrl:test)"/>
        <xsl:text>: </xsl:text>
        <xsl:value-of select="@location"/>
      </xsl:message>
    </xsl:for-each>
    <xsl:message terminate="yes">
      <xsl:text>Error count: </xsl:text>
      <xsl:value-of select="count($failures)"/>
    </xsl:message>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>