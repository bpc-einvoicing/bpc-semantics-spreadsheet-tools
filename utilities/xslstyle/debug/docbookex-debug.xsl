<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="xslstyle-docbook-debug.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                exclude-result-prefixes="xs"
                version="1.0">

<xsl:import href="../docbookex.xsl"/>

<xs:doc info="$Id: da0e049feab45a1d6b332f12627b9e4ab55b7972 $"
        external-css="debug-xslstyle.css"
        filename="docbookex-debug.xsl" vocabulary="DocBook">
  <xs:title>Test shell to demonstrate "debug" style formatting</xs:title>
  <para>
    This stylesheet adds nothing to the logic of the 
    <literal>docbookex.xsl</literal> stylesheet but does invoke a different
    XSLStyle rendering stylesheet due to being at the top level.
  </para>
</xs:doc>

</xsl:stylesheet>
