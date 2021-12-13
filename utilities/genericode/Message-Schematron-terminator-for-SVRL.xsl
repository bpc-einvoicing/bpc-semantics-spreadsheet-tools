<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                xpath-default-namespace="http://purl.oclc.org/dsdl/svrl"
                version="2.0">
<!--
     This analyzes a Schematron SVRL report and abends on the presence
     of a successful report or failed assertion.
-->

<xsl:output method="text"/>

<xsl:template match="/">
  <xsl:if test="not(schematron-output)">
    <xsl:message terminate="yes" 
      select="'Expecting {{http://purl.oclc.org/dsdl/svrl}}schematron-output',
              'but encountered',concat('{{',namespace-uri(*),'}}',
              local-name(*))"/>
  </xsl:if>
  <xsl:variable name="errors" 
                select="//successful-report | //failed-assert"/>
  <xsl:for-each select="$errors">
    <xsl:message select="concat(svrl:text,': ',@location)"/>
  </xsl:for-each>
  <xsl:if test="exists($errors)">
    <xsl:message terminate="yes" select="'Exit with error'"/>
  </xsl:if>
</xsl:template>

</xsl:stylesheet>