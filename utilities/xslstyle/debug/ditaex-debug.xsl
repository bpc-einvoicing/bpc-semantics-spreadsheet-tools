<?xml version="1.0" encoding="iso-8859-1"?>
<?xml-stylesheet type="text/xsl" href="xslstyle-dita-debug.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                exclude-result-prefixes="xs"
                version="1.0">

<xsl:import href="../ditaex.xsl"/>

<xs:doc info="$Id: e102ce95c5e9c870dc52e38d3a31a25c7bd0a990 $"
        external-css="debug-xslstyle.css"
        filename="ditaex-debug.xsl" global-ns="xs" vocabulary="DITA">
  <xs:title>Test shell to demonstrate "debug" style formatting</xs:title>
  <p>
    This stylesheet adds nothing to the logic of the 
    <literal>ditaex.xsl</literal> stylesheet but does invoke a different
    XSLStyle rendering stylesheet due to being at the top level.
  </p>
</xs:doc>

</xsl:stylesheet>
