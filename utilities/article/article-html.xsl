<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version="1.0">

<xsl:import href="../xslstyle/docbook/xsl/html/docbook.xsl"/>

<xsl:param name="section.autolabel" select="'1'"/>
<xsl:param name="section.label.includes.component.label" select="1"/>
<xsl:param name="toc.section.depth">3</xsl:param>

<xsl:param name="generate.component.toc" select="'1'"/>

<xsl:output indent="no" encoding="UTF-8"/>

<xsl:template match="imagedata[@role='html-embed'][contains(@fileref,'.svg')]">
  <xsl:copy-of select="document(@fileref)"/>
</xsl:template>

</xsl:stylesheet>