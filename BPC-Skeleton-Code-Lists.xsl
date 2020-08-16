<?xml version="1.0" encoding="US-ASCII"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:bpc="urn:X-BPC"
                exclude-result-prefixes="xsd bpc"
                version="2.0">
<!--
    This stylesheet implements the BPC code list rules for version:

    {bpc:title}
    
    Business Payments Coalition Semantics Group - (skeleton:20200816-1410z)
-->

<xsl:variable name="bpc:globals">
  <!--all global declarations are replaced through a transformation that
      interprets all of the lists and creates the necessary information-->
</xsl:variable>

<!--
  Return true or false 
-->
<xsl:function name="bpc:codelist" as="xsd:boolean">
  <!--the first argument is the optional singleton value to test-->
  <xsl:param name="value" as="xsd:string?"/>
  <!--the second argument is the identifier of the code list-->
  <xsl:param name="listID" as="xsd:string"/>
  <!--the return indicates the value is found in the list; false when the
      value is absent or the listID is not recognized-->
  <xsl:sequence select="false()"/>
</xsl:function>

</xsl:stylesheet>
