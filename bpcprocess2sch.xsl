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

<xs:doc filename="bpcprocess2sch.xsl" vocabulary="DocBook"
        info="$Id$">
  <xs:title>
    Convert a BPC skeleton Schematron script into one tailored for a process.
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
    of the format "{bpc:process}" that get replaced in-situ in order
    to create the output file.
  </para>
  <para>
    Comments and text get both the process identifier and the version.
  </para>
  <para>
    Attributes and filenames are replaced with only the process identifier.
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
<xsl:template match="/">
  <xsl:variable name="activeProcesses"
                select="/*/bpcProcess
                        [some $w in $semanticsSummary/worksheets/worksheet
                         satisfies $w/@worksheetNumber = @worksheetNumber ]"/>
  <!--first create the Schematron schema and pattern files for each process-->
  <xsl:for-each select="$activeProcesses">
   <xsl:variable name="thisProcess" select="."/>
   <xsl:for-each select="doctypes/doctype">
     <xsl:variable name="thisDoctype" select="translate(.,' ','')"/>
     <xsl:for-each select="$thisProcess">
      <xsl:variable name="worksheet" 
                    select="$semanticsSummary/worksheets/worksheet
                            [@worksheetNumber = current()/@worksheetNumber]"/>
      <xsl:variable name="procID" select="@bpcID"/>
      <!--this is the wrapper schematron-->
      <xsl:variable name="schematronOutURI"
                    select="concat($procID,'/BPC-',$procID,'-v',
                            $BPCversion,'-',$thisDoctype,
                            '-Data-Integrity-Constraints.sch')"/>
      <xsl:message select="'Writing:',$schematronOutURI"/>
      <xsl:result-document href="{$schematronOutURI}">
        <xsl:apply-templates select="$schemaSkeleton/*">
          <xsl:with-param name="process" select="." tunnel="yes"/>
          <xsl:with-param name="worksheet" select="$worksheet" tunnel="yes"/>
          <xsl:with-param name="doctype" select="$thisDoctype" tunnel="yes"/>
        </xsl:apply-templates>
      </xsl:result-document>
      <!--this is the embedded pattern schematron-->
      <xsl:variable name="patternOutURI"
                    select="concat($procID,'/BPC-',$procID,'-v',
                            $BPCversion,'-',$thisDoctype,
                            '-Assertions.pattern.sch')"/>
      <xsl:result-document href="{$patternOutURI}">
        <xsl:apply-templates select="$patternSkeleton/*">
          <xsl:with-param name="process" select="." tunnel="yes"/>
          <xsl:with-param name="worksheet" select="$worksheet" tunnel="yes"/>
          <xsl:with-param name="doctype" select="$thisDoctype" tunnel="yes"/>
        </xsl:apply-templates>
      </xsl:result-document>
      <xsl:result-document exclude-result-prefixes="sch"
  href="{$procID}/BPC-{$procID}-{$thisDoctype}-Data-Integrity-Constraints.xsl">
        <xslo:stylesheet version="2.0">
          <xsl:text>&#xa;</xsl:text>
<xsl:comment>
  Wrapper invocation stylesheet for BPC Semantics process:
  <xsl:value-of select="
            bpc:formatProcessInfo('{bpc:title} from worksheet {bpc:worksheet}',
                                  .,$thisDoctype)"/>
  incorporating the code list functions for XPath use.
</xsl:comment>
            <xsl:text>&#xa;</xsl:text>
            <xslo:import href=
 "BPC-{$procID}-v{$BPCversion}-{$thisDoctype}-Data-Integrity-Constraints.xsl"/>
            <xslo:import href="BPC-v{$BPCversion}-Code-Lists.xsl"/>
            <xslo:import href="BPC-Schematron-Support.xsl"/>
          </xslo:stylesheet>
        </xsl:result-document>
      </xsl:for-each>
   </xsl:for-each>
  </xsl:for-each>
      
  <!--next create the Ant script that will process each of the Schematron
      schemas to create XSLT stylesheets-->
  <xsl:result-document href="{$antDynamicScriptURI}" xmlns="">
    <project default="make" xmlns:if="ant:if" xmlns:unless="ant:unless">
    
    <taskdef name="grep" classname="ise.antelope.tasks.Find"/>
    
    <taskdef resource="net/sf/antcontrib/antcontrib.properties"/>
    
    <target name="make">
      <echo message="Invoking ${{antStaticScriptURI}} for each process"/>
      <xsl:for-each select="$activeProcesses">
       <xsl:variable name="thisProcess" select="."/>
       <xsl:for-each select="doctypes/doctype">
         <xsl:variable name="thisDoctype" select="translate(.,' ','')"/>
         <xsl:for-each select="$thisProcess">
          <ant antfile="${{antStaticScriptURI}}" target="-sch4bpc">
            <property name="process" value="{@bpcID}"/>
            <property name="version" value="{$BPCversion}"/>
            <property name="basedir" value="${{basedir}}"/>
            <property name="doctype" value="{$thisDoctype}"/>
            <property name="saxon9heJar" value="{
             replace(resolve-uri('utilities/saxon9he/saxon9he.jar',
                                 base-uri(document(''))),
                     '^file:','')}"/>
          </ant>
         </xsl:for-each>
       </xsl:for-each>
      </xsl:for-each>
    </target>
      
    </project>
  </xsl:result-document>
</xsl:template>
  
<xs:template>
  <para>
    Replace in text the {bpc:*} strings with the process information.
  </para>
  <xs:param name="process">
    <para>The information for the process being acted on</para>
  </xs:param>
</xs:template>
<xsl:template match="sch:ns[@prefix='{bpc:doctype}']" priority="1"
              xmlns:sch="http://purl.oclc.org/dsdl/schematron">
  <xsl:param name="process" as="element(bpcProcess)" tunnel="yes"/>
  <xsl:variable name="this" select="."/>
  <!--repeat this element once for each document type-->
  <xsl:for-each select="$process/doctypes/doctype">
    <xsl:variable name="doctype" select="."/>
    <!--set context back to the element for it to be processed-->
    <xsl:for-each select="$this">
      <xsl:call-template name="bpc:processThis">
        <xsl:with-param name="doctype" select="$doctype" tunnel="yes"/>
      </xsl:call-template>
    </xsl:for-each>
  </xsl:for-each>
  <xsl:call-template name="bpc:formatProcessInfo"/>
</xsl:template>

<xs:template>
  <para>
    Replace in text the {bpc:*} strings with the process information.
  </para>
  <xs:param name="process">
    <para>The information for the process being acted on</para>
  </xs:param>
</xs:template>
<xsl:template match="text()" priority="1">
  <xsl:param name="process" as="element(bpcProcess)" tunnel="yes"/>
  <xsl:call-template name="bpc:formatProcessInfo"/>
</xsl:template>

<xs:template>
  <para>
    Replace in comments the {bpc:*} strings with the process information.
  </para>
  <xs:param name="process">
    <para>The information for the process being acted on</para>
  </xs:param>
</xs:template>
<xsl:template match="comment()" priority="1">
  <xsl:param name="process" as="element(bpcProcess)" tunnel="yes"/>
  <xsl:comment>
    <xsl:call-template name="bpc:formatProcessInfo"/>
  </xsl:comment>
  <xsl:text>&#xa;</xsl:text>
</xsl:template>

<xs:template>
  <para>
    Replace in attributes the {bpc:*} strings with the process information.
  </para>
  <xs:param name="process">
    <para>The information for the process being acted on</para>
  </xs:param>
</xs:template>
<xsl:template match="@*" priority="1">
  <xsl:param name="process" as="element(bpcProcess)" tunnel="yes"/>
  <xsl:attribute name="{name(.)}" namespace="{namespace-uri(.)}">
    <xsl:call-template name="bpc:formatProcessInfo"/>
  </xsl:attribute>
</xsl:template>

<xs:template>
  <para>
    Replace the {bpc:process} strings with the process information.
  </para>
  <xs:param name="process">
    <para>The information for the process being acted on</para>
  </xs:param>
  <xs:param name="doctype">
    <para>One of the document types for the given process</para>
  </xs:param>
</xs:template>
<xsl:template name="bpc:formatProcessInfo">
  <xsl:param name="process" as="element(bpcProcess)"
             tunnel="yes" required="yes"/>
  <xsl:param name="doctype" as="xsd:string?"
             tunnel="yes"/>
  <xsl:value-of select="bpc:formatProcessInfo(.,$process,$doctype)"/>
</xsl:template>

<xs:function>
  <para>
    This is a 2-argument version of the complete 3-argument function, filling
    in a default empty string for the document type.
  </para>
  <xs:param name="template">
    <para>The string input to the translation</para>
  </xs:param>
  <xs:param name="process">
    <para>The information for the process being acted on</para>
  </xs:param>
</xs:function>
<xsl:function name="bpc:formatProcessInfo" as="xsd:string">
  <xsl:param name="template" as="xsd:string"/>
  <xsl:param name="process" as="element(bpcProcess)"/>
  <xsl:sequence select="bpc:formatProcessInfo($template,$process,'')"/>
</xsl:function>

<xs:function>
  <para>
    Return the {bpc:process} strings replaced with the process information.
  </para>
  <itemizedlist>
    <listitem>bpc:process - P##</listitem>
    <listitem>bpc:worksheet - #</listitem>
    <listitem>bpc:version - #.#</listitem>
    <listitem>bpc:doctype - CamelCaseDocumentType</listitem>
    <listitem>bpc:title - formatted string of version and dateTime</listitem>
  </itemizedlist>
  <xs:param name="template">
    <para>The string input to the translation</para>
  </xs:param>
  <xs:param name="process">
    <para>The information for the process being acted on</para>
  </xs:param>
  <xs:param name="doctype">
    <para>One of the document types for the given process</para>
  </xs:param>
</xs:function>
<xsl:function name="bpc:formatProcessInfo" as="xsd:string">
  <xsl:param name="template" as="xsd:string"/>
  <xsl:param name="process" as="element(bpcProcess)"/>
  <xsl:param name="doctype" as="xsd:string?"/>
  <xsl:value-of select="replace(replace(replace(replace(replace($template,
                       '\{bpc:title\}',concat($process/@bpcID,' v',$BPCversion,
                                              ' - ',$dateTime,
                                              ' - ',$process/title)),
                       '\{bpc:worksheet\}',$process/@worksheetNumber),
                       '\{bpc:doctype\}',translate($doctype,' ','')),
                       '\{bpc:process\}',$process/@bpcID),
                       '\{bpc:version\}',$BPCversion)"/>
</xsl:function>

<xs:template>
  <para>
    The identity template is used to copy all nodes not already being handled
    by other template rules.
  </para>
</xs:template>
<xsl:template match="@*|node()" mode="#all" name="bpc:processThis">
  <xsl:copy>
    <xsl:apply-templates mode="#current" select="@*|node()"/>
  </xsl:copy>
</xsl:template>

<!--========================================================================-->

<xs:template>
  <para>
    Create a Schematron pattern with all of the 
  </para>
  <xs:param name="process">
    <para>The information for the process being acted on</para>
  </xs:param>
  <xs:param name="worksheet">
    <para>The semantic information for all process being acted on</para>
  </xs:param>
</xs:template>
<xsl:template match="sch:pattern" xmlns="http://purl.oclc.org/dsdl/schematron"
              exclude-result-prefixes="xsl xslo sch">
  <xsl:param name="process" as="element(bpcProcess)" tunnel="yes"/>
  <xsl:param name="worksheet" as="element(worksheet)" tunnel="yes"/>
  <xsl:variable name="bpcId" select="$process/@bpcId"/>
  <xsl:variable name="bpcDocTypes" as="xsd:string*"
                select="$process/doctypes/doctype/translate(.,' ','')"/>
  <xsl:variable name="worksheetDocTypes" as="xsd:string*"
                select="$worksheet/doctypes/doctype/translate(.,' ','')"/>
  <!--first, preserve the pattern itself and its existing content-->
  <xsl:copy>
    <xsl:copy-of select="@*"/>
    <xsl:apply-templates/>
    <xsl:text>&#xa;</xsl:text>
    <xsl:comment>
      <xsl:text>Generated assertions from spreadsheet worksheet </xsl:text>
      <xsl:value-of select="concat($worksheet/@tab,' for process ',$bpcId,
                                 ' for doctype',
                                 if(count($process/doctypes/doctype)>1)
                                 then 's:' else ':'),
                                 string-join($process/doctypes/doctype,', ')"/>
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
                   $worksheet/semantics/semantic/process/data/contextPrototype
                   (:a process that has an assertion for the semantic:)
                   [ exists( ../assertionPrototype ) ]
                   (:and:)
                   [(:that is specific to the current process or:)
                    ( @processId = $process/@bpcId ) or
                    (:not specific to any process and 
                      no sibling process specific to current:) 
                    ( not( @processId ) and
                      not( some $p in ancestor::process/@processId
                           satisfies $p=$bpcId ) ) ]
                   (:and whose context is for the process's document type:)
                   [ (:is a relative context:)
                     not( starts-with(.,'/') )
                  or (:is an absolute context of an expected doctype:)
                     ( some $d in $bpcDocTypes satisfies
                       starts-with(.,concat('/',$d)) )
                  or (:is a prototype context and one of the document
                       types for the process matches one of the document
                       types for the worksheet:)
                     ( starts-with(., '/#')
                   and ( some $pd in $bpcDocTypes,
                              $wd in $worksheetDocTypes
                         satisfies $pd = $wd ) 
                     ) 
                   ]">
      <!--massage the context prototype to accommodate a namespace prefix
          that matches the document element name when the context expression
          is absolute and does not already contain a colon (presuming the
          author already is using a namespace-qualified name-->
      <xsl:variable name="contextPrototype"
                    select="if( matches(.,'^/[^:/]:') ) then .
                            else replace(.,'^/([^/]+)','/$1:$1')"/>
      <xsl:for-each select="$process/doctypes/doctype
                                       [ some $d in $worksheet/doctypes/doctype
                                         satisfies $d = . ]">
        <xsl:variable name="doctype" 
                      select="translate(.,' ','')"/>
        <!--only execute once unless there is a prototype replacement-->
        <xsl:if test="position()=1 or contains($contextPrototype,'#')">
          <xsl:element name="rule"
                   namespace="http://purl.oclc.org/dsdl/schematron">
            <xsl:attribute name="context"
                           select="concat(
   replace(normalize-space($contextPrototype),'#',$doctype),' ',
   concat('(',':',string-join(distinct-values(
                              current-group()/ancestor::semantic/@bpcID),' ' ),
    ' Tab ',$worksheet/@worksheetNumber,
    ' Row ',string-join(current-group()/ancestor::process/@worksheetRow,' '),
    ':',')') )"/>
            <xsl:for-each select="current-group()">
              <xsl:element name="assert"
                       namespace="http://purl.oclc.org/dsdl/schematron">
                <xsl:attribute name="test"
                               select="concat(
    replace(normalize-space(../assertionPrototype),'#',$doctype), ' ','(',':',
                 ancestor::semantic/@bpcID,' Tab ',$worksheet/@worksheetNumber,
                 ' Row ',ancestor::process/@worksheetRow,':',')')"/>
                <xsl:value-of select="replace(../message, '#',$doctype)"/>
                <xsl:text> </xsl:text>
                <xsl:value-of select="concat
                         ('(',':',ancestor::semantic/@bpcID, 
                          ' Tab ',$worksheet/@worksheetNumber,
                          ' Row ',ancestor::process/@worksheetRow,':',')')"/>
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