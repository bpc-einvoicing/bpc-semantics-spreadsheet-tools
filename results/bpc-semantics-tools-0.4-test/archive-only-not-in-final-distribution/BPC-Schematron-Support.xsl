<?xml version="1.0" encoding="US-ASCII"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:bpc="urn:X-BPC"
                exclude-result-prefixes="xsd bpc"
                version="2.0">
<!--
    This stylesheet implements support functions not related to code lists
    that are used for the Schematron assertions.
-->

<xsl:function name="bpc:compareAmountsEqual" as="xsd:boolean">
  <!--the amount to be compared-->
  <xsl:param name="compare" as="xsd:double"/>
  <!--the amount to be rounded-->
  <xsl:param name="amount" as="xsd:double"/>
  <xsl:sequence select="xsd:decimal(format-number($compare,'0.00')) =
                        xsd:decimal(format-number($amount, '0.00'))"/>
</xsl:function>

</xsl:stylesheet>
