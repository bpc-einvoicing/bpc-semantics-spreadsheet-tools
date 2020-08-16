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

<!--
  Return true or false that the given value is found in the given list.
  
  If the value is an element, then the CCTS metadata is inspected for
  nuanced identification of the list.
  
  If the value is not an element, the value is cast as a string.
-->
<xsl:function name="bpc:codelist" as="xsd:boolean">
  <!--the first argument is the optional singleton value to test-->
  <xsl:param name="item" as="item()?"/>
  <!--the second argument is the identifier of the code list-->
  <xsl:param name="listID" as="xsd:string"/>
  <!--the return indicates the value is found in the list; false when the
      value is absent or the listID is not recognized-->
  <xsl:variable name="element" as="element()?"
                select="if( $item instance of element() )
                        then $item else ()"/>
  <xsl:variable name="value" select="normalize-space($item)"/>
  <xsl:sequence select="false()"/>
</xsl:function>

<!--========================================================================-->
<!--the following code is generated from genericode files-->

<xsl:variable name="bpc:generated">
  <!--all global declarations are replaced through a transformation that
      interprets all of the lists and creates the necessary information-->
</xsl:variable>

</xsl:stylesheet>
