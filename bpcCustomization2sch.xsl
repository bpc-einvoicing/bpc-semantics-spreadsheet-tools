<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:bpc="urn:X-BPC"
                xmlns:sch="http://purl.oclc.org/dsdl/schematron"
                xmlns:xslo="dummy"
                exclude-result-prefixes="xs xsd bpc xslo xsl"
                version="2.0">

<xs:doc filename="bpcCustomization2sch.xsl" vocabulary="DocBook"
        info="$Id$">
  <xs:title>
    Convert a BPC skeleton Schematron script into one tailored for a 
    customization.
  </xs:title>
  <para>
    The tailoring is simple in the attributes, text, and comments.
  </para>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>Invocation parameters and input file</xs:title>
  <para>
    The input file is the image of the output file with placeholders
    of the format "{bpc:cust}" that get replaced in-situ in order
    to create the output file.
  </para>
  <para>
    Comments and text get both the customization identifier and the version.
  </para>
  <para>
    Attributes and filenames are replaced with only the customization
    identifier.
  </para>
</xs:doc>

<xs:param ignore-ns='yes'>
  <para>
    Schema skeleton to be fleshed out.
  </para>
</xs:param>
<xsl:param name="schemaSkeleton" required="yes"
           as="document-node(element(sch:schema))"/>

<xs:param ignore-ns='yes'>
  <para>
    Schema skeleton to be fleshed out.
  </para>
</xs:param>
<xsl:param name="patternSkeleton" required="yes"
           as="document-node(element(sch:pattern))"/>

<xs:param ignore-ns='yes'>
  <para>
    Main input semantics file.
  </para>
</xs:param>
<xsl:param name="semanticsSummary" required="yes" as="document-node()"/>

<xs:param ignore-ns='yes'>
  <para>
    The location in which to create the dynamic Ant script.
  </para>
</xs:param>
<xsl:param name="antDynamicScriptURI" required="yes" as="xsd:string"/>

<xs:param ignore-ns='yes'>
  <para>
    The version number not including a preceding "v".
  </para>
</xs:param>
<xsl:param name="BPCversion" required="yes" as="xsd:string"/>

<xs:param ignore-ns='yes'>
  <para>
    The date and time stamp to distinguish releases of a particular version.
  </para>
</xs:param>
<xsl:param name="dateTime" required="yes" as="xsd:string"/>

<xs:output>
  <para>For the convenience of human readers, the outputs are indented</para>
</xs:output>
<xsl:output indent="yes"/>

<xs:namespace-alias>
  <para>
    Portions of the output are in the XSLT vocabulary, thus this is needed.
  </para>
</xs:namespace-alias>
<xsl:namespace-alias stylesheet-prefix="xslo" result-prefix="xsl"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Main logic</xs:title>
</xs:doc>

<xs:template>
  <para>Getting started</para>
</xs:template>
<xsl:template match="/" name="start">
  <!--first create the Schematron schema and pattern files for each
      customization-->
  <xsl:for-each select="$semanticsSummary/worksheets/worksheet">
    <xsl:variable name="worksheet" select="."/>
    <xsl:for-each select="distinct-values(
                 semantics/semantic/customization/tokenize( @custID, '\s+') )">
      <xsl:variable name="custID" select="."/>
      <xsl:for-each select="$worksheet/doctypes/doctype">
        <xsl:variable name="thisDoctype" select="."/>
        <xsl:variable name="thisDoctypeName" select="translate(.,' ','')"/>

        <!--this is the wrapper schematron-->
        <xsl:variable name="schematronOutURI"
                      select="concat($custID,'/BPC-',$custID,'-v',
                              $BPCversion,'-',$thisDoctypeName,
                              '-Data-Integrity-Constraints.sch')"/>
        <xsl:message select="'Writing:',$schematronOutURI"/>
        <xsl:result-document href="{$schematronOutURI}">
          <xsl:apply-templates select="$schemaSkeleton/*">
            <xsl:with-param name="custID" select="$custID" tunnel="yes"/>
            <xsl:with-param name="worksheet" select="$worksheet" tunnel="yes"/>
            <xsl:with-param name="doctype" select="$thisDoctype" tunnel="yes"/>
          </xsl:apply-templates>
        </xsl:result-document>
        <!--this is the embedded pattern schematron-->
        <xsl:variable name="patternOutURI"
                      select="concat($custID,'/support/BPC-',$custID,'-v',
                              $BPCversion,'-',$thisDoctypeName,
                              '-Assertions.pattern.sch')"/>
        <xsl:result-document href="{$patternOutURI}">
          <xsl:apply-templates select="$patternSkeleton/*">
            <xsl:with-param name="custID" select="$custID" tunnel="yes"/>
            <xsl:with-param name="worksheet" select="$worksheet" tunnel="yes"/>
            <xsl:with-param name="doctype" select="$thisDoctype" tunnel="yes"/>
          </xsl:apply-templates>
        </xsl:result-document>
        <xsl:result-document exclude-result-prefixes="sch" href=
  "{$custID}/BPC-{$custID}-{$thisDoctypeName}-Data-Integrity-Constraints.xsl">
          <xslo:stylesheet version="2.0">
            <xsl:text>&#xa;</xsl:text>
<xsl:comment>
  Wrapper invocation stylesheet for BPC Semantics customization:
  <xsl:value-of select="
      bpc:formatCustomizationInfo('{bpc:title} from worksheet {bpc:worksheet}',
                                  .,$thisDoctype)"/>
  incorporating the code list functions for XPath use.
</xsl:comment>
            <xsl:text>&#xa;</xsl:text>
            <xslo:import href=
"support/BPC-{$custID}-v{$BPCversion}-{$thisDoctypeName}-Data-Integrity-Constraints.xsl"/>
            <xslo:import href="support/BPC-v{$BPCversion}-Code-Lists.xsl"/>
            <xslo:import href="support/BPC-Schematron-Support.xsl"/>
          </xslo:stylesheet>
        </xsl:result-document>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:for-each>

  <!--next create the Ant script that will act on each of the Schematron
      schemas to create XSLT stylesheets-->
  <xsl:result-document href="{$antDynamicScriptURI}" xmlns="">
    <project default="make" xmlns:if="ant:if" xmlns:unless="ant:unless">
    
    <taskdef name="grep" classname="ise.antelope.tasks.Find"/>
    
    <taskdef resource="net/sf/antcontrib/antcontrib.properties"/>
    
    <target name="make">
      <echo message="Invoking ${{antStaticScriptURI}} for each customization"/>
      <xsl:for-each select="$semanticsSummary/worksheets/worksheet">
       <xsl:variable name="thisWorksheet" select="."/>
       <xsl:for-each select="distinct-values(
                 semantics/semantic/customization/tokenize( @custID, '\s+') )">
        <xsl:variable name="custID" select="."/>
         <xsl:for-each select="$thisWorksheet/doctypes/doctype">
           <xsl:variable name="thisDoctype" select="translate(.,' ','')"/>
           <xsl:for-each select="$thisWorksheet">
            <ant antfile="${{antStaticScriptURI}}" target="-sch4bpc">
              <property name="customization" value="{$custID}"/>
              <property name="version" value="{$BPCversion}"/>
              <property name="basedir" value="${{basedir}}"/>
              <property name="doctype" 
                        value="{translate($thisDoctype,' ','')}"/>
              <property name="saxon9heJar" value="{
               replace(resolve-uri('utilities/saxon9he/saxon9he.jar',
                                   base-uri(document(''))),
                       '^file:','')}"/>
            </ant>
           </xsl:for-each>
         </xsl:for-each>
        </xsl:for-each>
      </xsl:for-each>
    </target>
      
    </project>
  </xsl:result-document>

  <!--next, create the summary list of customization identifiers-->
  <xsl:result-document href="summary-customization-identifiers.txt"
                       method="text">
    <xsl:for-each select="$semanticsSummary/worksheets/worksheet">
      <xsl:variable name="worksheet" select="."/>
      <xsl:for-each select="distinct-values(
                 semantics/semantic/customization/tokenize( @custID, '\s+') )">
        <xsl:variable name="custID" select="."/>
        <xsl:for-each select="$worksheet/doctypes/doctype">
          <xsl:variable name="thisDoctype" select="."/>
          <xsl:variable name="thisDoctypeName" select="translate(.,' ','')"/>
          <xsl:value-of select="concat(
                              'urn:oasis:names:specification:ubl:schema:xsd:',
                              $thisDoctypeName,'-2::',$thisDoctypeName,
                              '##bpc-',$BPCversion,'-data-',$custID,'&#xa;')"/>
        </xsl:for-each>
      </xsl:for-each>
    </xsl:for-each>
  </xsl:result-document>
</xsl:template>
  
<xs:template>
  <para>
    Replace in text the {bpc:*} strings with the customization information.
  </para>
  <xs:param name="doctype">
    <para>The document type being acted on</para>
  </xs:param>
</xs:template>
<xsl:template match="sch:ns[@prefix='{bpc:doctype}']" priority="1"
              xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <xsl:param name="doctype" as="element(doctype)" tunnel="yes"/>
  <xsl:call-template name="bpc:applyThis">
    <xsl:with-param name="doctype" select="$doctype" tunnel="yes"/>
  </xsl:call-template>
  <xsl:call-template name="bpc:formatCustomizationInfo"/>
</xsl:template>

<xs:template>
  <para>
    Replace in text the {bpc:*} strings with the customization information.
  </para>
</xs:template>
<xsl:template match="text()" priority="1">
  <xsl:call-template name="bpc:formatCustomizationInfo"/>
</xsl:template>

<xs:template>
  <para>
    Replace in comments the {bpc:*} strings with the customization information.
  </para>
</xs:template>
<xsl:template match="comment()" priority="1">
  <xsl:comment>
    <xsl:call-template name="bpc:formatCustomizationInfo"/>
  </xsl:comment>
  <xsl:text>&#xa;</xsl:text>
</xsl:template>

<xs:template>
  <para>
    Replace in attributes the {bpc:*} strings with the customization information.
  </para>
</xs:template>
<xsl:template match="@*" priority="1">
  <xsl:attribute name="{name(.)}" namespace="{namespace-uri(.)}">
    <xsl:call-template name="bpc:formatCustomizationInfo"/>
  </xsl:attribute>
</xsl:template>

<xs:template>
  <para>
    Replace the {bpc:customization} strings with the customization information.
  </para>
  <xs:param name="custID">
    <para>The customization being acted on</para>
  </xs:param>
  <xs:param name="doctype">
    <para>One of the document types for the given customization</para>
  </xs:param>
</xs:template>
<xsl:template name="bpc:formatCustomizationInfo">
  <xsl:param name="custID" as="xsd:string" tunnel="yes"/>
  <xsl:param name="doctype" as="element(doctype)" tunnel="yes"/>
  <xsl:value-of select="bpc:formatCustomizationInfo(.,$custID,$doctype)"/>
</xsl:template>

<xs:function>
  <para>
    Return the {bpc:customization} strings replaced with the customization information.
  </para>
  <itemizedlist>
    <listitem>bpc:customization - customization identifier</listitem>
    <listitem>bpc:worksheet - #</listitem>
    <listitem>bpc:version - #.#</listitem>
    <listitem>bpc:doctype - CamelCaseDocumentType</listitem>
    <listitem>bpc:title - formatted string of version and dateTime</listitem>
  </itemizedlist>
  <xs:param name="template">
    <para>The string input to the translation</para>
  </xs:param>
  <xs:param name="custID">
    <para>The information for the customization being acted on</para>
  </xs:param>
  <xs:param name="doctype">
    <para>One of the document types for the given customization</para>
  </xs:param>
</xs:function>
<xsl:function name="bpc:formatCustomizationInfo" as="xsd:string">
  <xsl:param name="template" as="xsd:string"/>
  <xsl:param name="custID" as="xsd:string"/>
  <xsl:param name="doctype" as="element(doctype)"/>
  <xsl:value-of select="replace(replace(replace(replace(replace($template,
                       '\{bpc:title\}',concat($custID,
                                              ' v',$BPCversion,
                                              ' - ',$dateTime)),
                       '\{bpc:worksheet\}',$doctype/ancestor::worksheet/@tab),
                       '\{bpc:doctype\}',translate($doctype,' ','')),
                       '\{bpc:customization\}',$custID),
                       '\{bpc:version\}',$BPCversion)"/>
</xsl:function>

<xs:template>
  <para>
    The identity template is used to copy all nodes not already being handled
    by other template rules.
  </para>
</xs:template>
<xsl:template match="@*|node()" mode="#all" name="bpc:applyThis">
  <xsl:copy>
    <xsl:apply-templates mode="#current" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<!--========================================================================-->

<xs:template>
  <para>
    Create a Schematron pattern with all of the 
  </para>
  <xs:param name="custID">
    <para>The information for the customization being acted on</para>
  </xs:param>
  <xs:param name="worksheet">
    <para>The semantic information for all customization being acted on</para>
  </xs:param>
  <xs:param name="doctype">
    <para>One of the document types for the given customization</para>
  </xs:param>
</xs:template>
<xsl:template match="sch:pattern" xmlns="http://purl.oclc.org/dsdl/schematron"
              exclude-result-prefixes="xsl xslo sch">
  <xsl:param name="custID" as="xsd:string" tunnel="yes"/>
  <xsl:param name="worksheet" as="element(worksheet)" tunnel="yes"/>
  <xsl:param name="doctype" as="element(doctype)" tunnel="yes"/>
  <!--first, preserve the pattern itself and its existing content-->
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates/>
    <xsl:text>&#xa;</xsl:text>
    <xsl:comment>
      <xsl:text>Generated assertions from spreadsheet worksheet </xsl:text>
      <xsl:value-of select=
                         "concat($worksheet/@tab,' for customization ',$custID)"/>
    </xsl:comment>
    <xsl:text>&#xa;</xsl:text>
    
    <xsl:comment>
      <xsl:text>Cited code lists in the assertions:&#xa;&#xa;</xsl:text>
      <xsl:variable name="codeListReferences" as="xsd:string*">
        <!--first find them-->
        <xsl:for-each select="$worksheet//assertionPrototype">
          <xsl:analyze-string select="."
                   regex="bpc:codelist\(.+?\s*,\s*['&#x22;](.+)['&#x22;]\s*\)">
            <xsl:matching-substring>
              <xsl:sequence select="regex-group(1)"/>
            </xsl:matching-substring>
          </xsl:analyze-string>
        </xsl:for-each>
      </xsl:variable>
      <!--report a summary of them-->
      <xsl:for-each select="distinct-values($codeListReferences)">
        <xsl:sort/>
        <xsl:value-of select="."/><xsl:text>&#xa;</xsl:text>
      </xsl:for-each>
    </xsl:comment>
    <xsl:text>&#xa;</xsl:text>

    <xsl:for-each-group group-by="." select="
         $worksheet/semantics/semantic/
         customization[ $custID = tokenize( @custID, '\s+' ) ]/
         data/contextPrototype
         (:a customization that has an assertion for the semantic:)
         [ exists( ../assertionPrototype ) ]
         [ (:is a relative context:)
           not( starts-with(.,'/') )
        or (:is an absolute context of an expected doctype:)
           starts-with(.,concat('/',$doctype) )
        or (:is a prototype context and one of the document
             types for the customization matches one of the document
             types for the worksheet:)
           starts-with(., '/#')
         ]">
      <!--massage the context prototype to accommodate a namespace prefix
          that matches the document element name when the context expression
          is absolute and does not already contain a colon (presuming the
          author already is using a namespace-qualified name-->
      <xsl:variable name="contextPrototype"
                    select="if( matches(.,'^/[^:/]:') ) then .
                            else replace(.,'^/([^/]+)','/$1:$1')"/>
      <xsl:for-each select="$doctype">
        <xsl:variable name="doctypeName" 
                      select="translate(.,' ','')"/>
        <!--only execute once unless there is a prototype replacement-->
        <xsl:if test="position()=1 or contains($contextPrototype,'#')">
          <xsl:element name="rule"
                   namespace="http://purl.oclc.org/dsdl/schematron">
            <xsl:attribute name="context"
                           select="concat(
   replace(normalize-space($contextPrototype),'#',$doctypeName),' ',
   concat('(',':',string-join(distinct-values(
                              current-group()/ancestor::semantic/@bpcID),' ' ),
    ' Row ',string-join(current-group()/ancestor::customization/@worksheetRow,' '),
    ' Tab ''',$worksheet/@tab,
    ''':',')') )"/>
            <xsl:for-each select="current-group()">
              <xsl:element name="assert"
                       namespace="http://purl.oclc.org/dsdl/schematron">
                <xsl:attribute name="test"
                               select="concat(
                      replace(
                        replace(
                          replace(
                            replace(
                              replace(../assertionPrototype,'\\\\','&#xfffc;'),
                                    '\\#','&#xfffd;'),
                                  '#',$doctypeName),
                                '&#xfffd;','#'),
                              '&#xfffc;','\\'),
                                               ' ','(',':',
              ancestor::semantic/@bpcID,
              ' Row ',ancestor::customization/@worksheetRow,
              ' Tab ''',$worksheet/@tab,''':',')')"/>
                <xsl:value-of select="replace(../message, '#',$doctypeName)"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="concat
                         ('(',':',ancestor::semantic/@bpcID,
                          ' Row ',ancestor::customization/@worksheetRow, 
                          ' Tab ''',$worksheet/@tab,''':',')')"/>
              </xsl:element>
            </xsl:for-each>
          </xsl:element>
        </xsl:if>
      </xsl:for-each>
    </xsl:for-each-group>

    <xsl:text>&#xa;</xsl:text>
  </xsl:copy>
</xsl:template>

</xsl:stylesheet>