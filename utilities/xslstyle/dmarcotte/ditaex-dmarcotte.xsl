<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="xslstyle-dita-dmarcotte.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                exclude-result-prefixes="xs"
                version="1.0">

<xsl:import href="../ditaex.xsl"/>

<xs:doc info="$Id: f1b4bd37ff0f04fd9c08e8f0a40afda2c572b3a5 $"
        external-css="dmarcotte-xslstyle.css"
        filename="ditaex-dmarcotte.xsl" vocabulary="DITA">
  <xs:title>Test shell to demonstrate "dmarcotte" style formatting</xs:title>
  <para>
    This stylesheet adds nothing to the logic of the 
    <literal>ditaex.xsl</literal> stylesheet but does invoke a different
    XSLStyle rendering stylesheet due to being at the top level.
  </para>
</xs:doc>

</xsl:stylesheet>
