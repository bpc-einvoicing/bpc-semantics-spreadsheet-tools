<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="xslstyle-docbook-fgeorges.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                exclude-result-prefixes="xs"
                version="1.0">

<xsl:import href="../docbookex.xsl"/>

<xs:doc info="$Id: 7b33b698712afc6132ed37e15cc68fd810476799 $"
        external-css="fgeorges-xslstyle.css"
        filename="docbookex-fgeorges.xsl" vocabulary="DocBook">
  <xs:title>Test shell to demonstrate "fgeorges" style formatting</xs:title>
  <para>
    This stylesheet adds nothing to the logic of the 
    <literal>docbookex.xsl</literal> stylesheet but does invoke a different
    XSLStyle rendering stylesheet due to being at the top level.
  </para>
</xs:doc>

</xsl:stylesheet>
