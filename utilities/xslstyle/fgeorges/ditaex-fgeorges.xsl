<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="xslstyle-dita-fgeorges.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                exclude-result-prefixes="xs"
                version="1.0">

<xsl:import href="../ditaex.xsl"/>

<xs:doc info="$Id: 8a12d69672925cd1c8f009c1aed675bcfa6ade53 $"
        external-css="fgeorges-xslstyle.css"
        filename="ditaex-fgeorges.xsl" vocabulary="DITA">
  <xs:title>Test shell to demonstrate "fgeorges" style formatting</xs:title>
  <para>
    This stylesheet adds nothing to the logic of the 
    <literal>ditaex.xsl</literal> stylesheet but does invoke a different
    XSLStyle rendering stylesheet due to being at the top level.
  </para>
</xs:doc>

</xsl:stylesheet>
