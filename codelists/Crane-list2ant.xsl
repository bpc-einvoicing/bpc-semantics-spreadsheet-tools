<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="../xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:c="urn:X-Crane"
                exclude-result-prefixes="xs xsd c"
                version="2.0">

<xs:doc info="$Id: Crane-list2ant.xsl,v 1.17 2020/04/17 18:54:02 admin Exp $"
        filename="Crane-list2ant.xsl" vocabulary="DocBook">
  <xs:title>Convert code list master list to Ant</xs:title>
  <para>
    To automate the process, an Ant script is created from the list of code
    lists and their sources
  </para>
  <programlisting>
Copyright (C) - Crane Softwrights Ltd.
              - http://www.CraneSoftwrights.com/links/res-dev.htm

Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice,
 this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice,
this list of conditions and the following disclaimer in the documentation 
and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors 
may be used to endorse or promote products derived from this software without 
specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE 
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
POSSIBILITY OF SUCH DAMAGE.


Note: for your reference, the above is the "BSD-3-Clause license"; this text
      was obtained 2017-07-24 at https://opensource.org/licenses/BSD-3-Clause

THE COPYRIGHT HOLDERS MAKE NO REPRESENTATION ABOUT THE SUITABILITY OF THIS
CODE FOR ANY PURPOSE.
</programlisting>
</xs:doc>

<!--========================================================================-->
<xs:doc>
  <xs:title>Invocation parameters and input file</xs:title>
  <para>
    The input file is a list of lists of genericode identification elements
    with indications of how the information is processed.
  </para>
  <programlisting><![CDATA[<lists>
  <list outuri="OutputName.gc" method="XSD"
        reviewuri="http://www.unece.org/cefact/xml_schemas/index">
   <Identification>
   </Identification>
  </list>
</lists>]]>
</programlisting>
  <para>
    The output file is an Ant script to be invoked to create the code list
    outputs.
  </para>
</xs:doc>

<xs:param ignore-ns='yes'>
  <para>
    Prefix (such as a directory name, including the trailing slash) for
    raw input file for hand-written.
  </para>
</xs:param>
<xsl:param name="raw-uri-prefix" required="yes" as="xsd:string"/>

<xs:param ignore-ns='yes'>
  <para>
    Prefix (such as a directory name, including the trailing slash) for
    intermediate file generation.
  </para>
</xs:param>
<xsl:param name="intermediate-uri-prefix" required="yes" as="xsd:string"/>

<xs:param ignore-ns='yes'>
  <para>
    Prefix (such as a directory name, including the trailing slash) for
    output file generation.
  </para>
</xs:param>
<xsl:param name="output-uri-prefix" required="yes" as="xsd:string"/>

<xs:variable>
  <para>
    The base URI of the input file
  </para>
</xs:variable>
<xsl:variable name="c:baseURI" as="xsd:string" 
              select="replace(document-uri(/),'((^file:)|([^/]+$))','')"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Create the output</xs:title>
</xs:doc>

<xs:template>
  <para>
    The identity template is used to copy all nodes not already being handled
    by other template rules.
  </para>
</xs:template>
<xsl:template match="/">
  <xsl:result-document indent="yes">
    <project default="make" xmlns:if="ant:if" xmlns:unless="ant:unless">
    
      <target name="make">
        <delete dir="{$intermediate-uri-prefix}"/>
        <mkdir dir="{$intermediate-uri-prefix}"/>
        <xsl:apply-templates select="/lists/list"/>
      </target>
    </project>
  </xsl:result-document>
</xsl:template>

<xs:template>
  <para></para>
</xs:template>
<xsl:template match="list" priority="2">
  <echo/>
  <echo message="{'Preparing:',Identification/ShortName}"/>
  <xsl:next-match/>
  <echo message="{'Validating with Schema:',@outuri}"/>
  <java failonerror="true" classname="com.nwalsh.parsers.XJParse">
     <arg value="-S"/>
     <arg value="../utilities/genericode/xsd/genericode.xsd"/>
     <arg value="{$output-uri-prefix}{@outuri}"/>
  </java>
  <echo message="{'Validating with Schematron:',@outuri}"/>
  <java failonerror="true" classname="net.sf.saxon.Transform">
     <arg value="-xsl:../utilities/genericode/oasis-genericode.sch.xsl"/>
     <arg value="-o:{$intermediate-uri-prefix}{@inuri}.svrl.xml"/>
     <arg value="-s:{$output-uri-prefix}{@outuri}"/>
     <arg value="--suppressXsltNamespaceCheck:on"/>
  </java>
  <java failonerror="true" classname="net.sf.saxon.Transform">
     <arg value="-xsl:../utilities/genericode/Message-Schematron-terminator-for-SVRL.xsl"/>
     <arg value="-s:{$intermediate-uri-prefix}{@inuri}.svrl.xml"/>
     <arg value="--suppressXsltNamespaceCheck:on"/>
  </java>
  <xsl:if test="@filteruri">
    <echo message="{'Validating with Schema:',@filteruri}"/>
    <java failonerror="true" classname="com.nwalsh.parsers.XJParse">
       <arg value="-S"/>
       <arg value="../utilities/genericode/xsd/genericode.xsd"/>
       <arg value="{$output-uri-prefix}{@filteruri}"/>
    </java>
    <echo message="{'Validating with Schematron:',@filteruri}"/>
    <java failonerror="true" classname="net.sf.saxon.Transform">
       <arg value="-xsl:../utilities/genericode/oasis-genericode.sch.xsl"/>
       <arg value="-o:{$intermediate-uri-prefix}{@inuri}.svrl.xml"/>
       <arg value="-s:{$output-uri-prefix}{@filteruri}"/>
       <arg value="--suppressXsltNamespaceCheck:on"/>
    </java>
    <java failonerror="true" classname="net.sf.saxon.Transform">
       <arg
           value="-xsl:../utilities/genericode/Message-Schematron-terminator-for-SVRL.xsl"/>
       <arg value="-s:{$intermediate-uri-prefix}{@inuri}.svrl.xml"/>
       <arg value="--suppressXsltNamespaceCheck:on"/>
    </java>
  </xsl:if>
</xsl:template>

<xs:template>
  <para>Copy the genericode file from the raw directory to the output.</para>
</xs:template>
<xsl:template match="list[@method='Copy']">
  <copy todir="{$c:baseURI}{$output-uri-prefix}"
        file="{$c:baseURI}{$raw-uri-prefix}{@inuri}"/>
  <available file="{$c:baseURI}{$raw-uri-prefix}{@inuri}"
             property="{Identification/ShortName}.exists"/>
  <fail unless="{Identification/ShortName}.exists"
        message="Cannot create intermediate file"/>
</xsl:template>

<xs:template>
  <para>Convert a country code text file to genericode</para>
</xs:template>
<!--<xsl:template match="list[@method='Country']" priority="10"/>-->
<xsl:template match="list[@method='Country']">
  <copy file="{$c:baseURI}{$raw-uri-prefix}{@inuri}"
        todir="{$intermediate-uri-prefix}"/>
  <echo message="Converting raw text file into intermediate HTML soup..."/>
  <java failonerror="true" classname="net.sf.saxon.Transform">
     <arg value="-xsl:{$c:baseURI}Crane-country2htmlxml.xsl"/>
     <arg value="-o:{$intermediate-uri-prefix}{@inuri}.xml"/>
     <arg value="-it:start"/>
     <arg value="text-uri={$intermediate-uri-prefix}{@inuri}"/>
     <arg value="--suppressXsltNamespaceCheck:on"/>
  </java>
  <available file="{$intermediate-uri-prefix}{@inuri}.xml"
             property="{Identification/ShortName}.exists"/>
  <fail unless="{Identification/ShortName}.exists"
        message="Cannot create intermediate file"/>
  <echo message="Converting intermediate file into result genericode..."/>
  <java failonerror="true" classname="net.sf.saxon.Transform">
     <arg value="-xsl:{$c:baseURI}Crane-country2gc.xsl"/>
     <arg value="-o:{$c:baseURI}{$output-uri-prefix}{@outuri}"/>
     <arg value="-s:{$intermediate-uri-prefix}{@inuri}.xml"/>
     <arg value="list-uri={document-uri(/)}"/>
     <arg value="out-uri={@outuri}"/>
     <arg value="--suppressXsltNamespaceCheck:on"/>
  </java>
</xsl:template>

<xs:template>
  <para>Convert a currency XML file into genericode</para>
</xs:template>
<!--<xsl:template match="list[@method='Currency']" priority="10"/>-->
<xsl:template match="list[@method='Currency']">
  <get src="{Identification/AlternateFormatLocationUri[last()]}"
       dest="{$intermediate-uri-prefix}{@inuri}"/>
  <available file="{$intermediate-uri-prefix}{@inuri}"
             property="{Identification/ShortName}.exists"/>
  <fail unless="{Identification/ShortName}.exists"
        message="Cannot create intermediate file"/>
  <echo message="Converting intermediate file into result genericode..."/>
  <java failonerror="true" classname="net.sf.saxon.Transform">
     <arg value="-xsl:{$c:baseURI}Crane-currency2gc.xsl"/>
     <arg value="-o:{$c:baseURI}{$output-uri-prefix}{@outuri}"/>
     <arg value="-s:{$intermediate-uri-prefix}{@inuri}"/>
     <arg value="list-uri={document-uri(/)}"/>
     <arg value="out-uri={@outuri}"/>
     <arg value="--suppressXsltNamespaceCheck:on"/>
  </java>
</xsl:template>

<xs:template>
  <para>Convert a language HTML file into genericode</para>
</xs:template>
<!--<xsl:template match="list[@method='Language']" priority="10"/>-->
<xsl:template match="list[@method='Language']">
  <get src="{Identification/AlternateFormatLocationUri[last()]}"
       dest="{$intermediate-uri-prefix}{@inuri}.html"/>
  <exec executable="tidy" output="{$intermediate-uri-prefix}{@inuri}"
        error="{$intermediate-uri-prefix}{@inuri}.err.txt">
    <arg value="-asxml"/>
    <arg value="--numeric-entities"/>
    <arg value="yes"/>
    <arg value="--doctype"/>
    <arg value="omit"/>
    <arg value="--input-encoding"/>
    <arg value="latin1"/>
    <arg value="--output-encoding"/>
    <arg value="utf8"/>
    <arg value="{$intermediate-uri-prefix}{@inuri}.html"/>
  </exec>
  <available file="{$intermediate-uri-prefix}{@inuri}"
             property="{Identification/ShortName}.exists"/>
  <fail unless="{Identification/ShortName}.exists"
        message="Cannot create intermediate file"/>
  <echo message="Converting intermediate file into result genericode..."/>
  <java failonerror="true" classname="net.sf.saxon.Transform">
     <arg value="-xsl:{$c:baseURI}Crane-language2gc.xsl"/>
     <arg value="-o:{$c:baseURI}{$output-uri-prefix}{@outuri}"/>
     <arg value="-s:{$intermediate-uri-prefix}{@inuri}"/>
     <arg value="list-uri={document-uri(/)}"/>
     <arg value="out-uri={@outuri}"/>
     <arg value="--suppressXsltNamespaceCheck:on"/>
  </java>
</xsl:template>

<xs:template>
  <para>Convert a unit XML file into genericode</para>
</xs:template>
<!--<xsl:template match="list[@method='Mime']" priority="10"/>-->
<xsl:template match="list[@method='Mime']">
  <get src="{Identification/AlternateFormatLocationUri[last()]}"
       dest="{$intermediate-uri-prefix}{@inuri}"/>
  <available file="{$intermediate-uri-prefix}{@inuri}"
             property="{Identification/ShortName}.exists"/>
  <fail unless="{Identification/ShortName}.exists"
        message="Cannot create intermediate file"/>
  <echo message="Converting intermediate file into result genericode..."/>
  <java failonerror="true" classname="net.sf.saxon.Transform">
     <arg value="-xsl:{$c:baseURI}Crane-mimetype2gc.xsl"/>
     <arg value="-o:{$c:baseURI}{$output-uri-prefix}{@outuri}"/>
     <arg value="-s:{$intermediate-uri-prefix}{@inuri}"/>
     <arg value="list-uri={document-uri(/)}"/>
     <arg value="out-uri={@outuri}"/>
     <arg value="--suppressXsltNamespaceCheck:on"/>
  </java>
</xsl:template>

<xs:template>
  <para>Convert a packaging XLS file into genericode</para>
</xs:template>
<!--<xsl:template match="list[@method='Packaging']" priority="10"/>-->
<xsl:template match="list[@method='Packaging']">
  
  <get src="{Identification/AlternateFormatLocationUri[last()]}"
       dest="{$intermediate-uri-prefix}{@inuri}.xls"/>
  <exec executable="soffice">
    <arg value="--headless"/>
    <arg value="--convert-to"/>
    <arg value="ods"/>
    <arg value="--outdir"/>
    <arg value="{$intermediate-uri-prefix}"/>
    <arg value="-env:UserInstallation=file://{$c:baseURI}{$intermediate-uri-prefix}codelistlibreoffice"/>
    <arg value="{$intermediate-uri-prefix}{@inuri}.xls"/>
  </exec>
  
  <unzip src="{$intermediate-uri-prefix}{@inuri}.ods"
         dest="{$intermediate-uri-prefix}">
    <patternset>
      <include name="content.xml"/>
    </patternset>
    <mapper type="glob" from="content.xml" to="{@inuri}"/>
  </unzip>
  <available file="{$intermediate-uri-prefix}{@inuri}"
             property="{Identification/ShortName}.exists"/>
  <fail unless="{Identification/ShortName}.exists"
        message="Cannot create intermediate file"/>
  <echo message="Converting intermediate file into result genericode..."/>
  <java failonerror="true" classname="net.sf.saxon.Transform">
     <arg value="-xsl:{$c:baseURI}Crane-packagingtype2gc.xsl"/>
     <arg value="-o:{$c:baseURI}{$output-uri-prefix}{@outuri}"/>
     <arg value="-s:{$intermediate-uri-prefix}{@inuri}"/>
     <arg value="list-uri={document-uri(/)}"/>
     <arg value="out-uri={@outuri}"/>
     <arg value="--suppressXsltNamespaceCheck:on"/>
  </java>
</xsl:template>

<xs:template>
  <para>Convert a unit of measurement XLS file into genericode</para>
</xs:template>
<!--<xsl:template match="list[@method='Unit20']" priority="10"/>-->
<xsl:template match="list[@method='Unit20']">
  
  <get src="{Identification/AlternateFormatLocationUri[last()]}"
       dest="{$intermediate-uri-prefix}{@inuri}.xls"/>
  <exec executable="soffice">
    <arg value="--headless"/>
    <arg value="--convert-to"/>
    <arg value="ods"/>
    <arg value="--outdir"/>
    <arg value="{$intermediate-uri-prefix}"/>
    <arg value="-env:UserInstallation=file://{$c:baseURI}{$intermediate-uri-prefix}codelistlibreoffice"/>
    <arg value="{$intermediate-uri-prefix}{@inuri}.xls"/>
  </exec>
  
  <unzip src="{$intermediate-uri-prefix}{@inuri}.ods"
         dest="{$intermediate-uri-prefix}">
    <patternset>
      <include name="content.xml"/>
    </patternset>
    <mapper type="glob" from="content.xml" to="{@inuri}"/>
  </unzip>
  <available file="{$intermediate-uri-prefix}{@inuri}"
             property="{Identification/ShortName}.exists"/>
  <fail unless="{Identification/ShortName}.exists"
        message="Cannot create intermediate file"/>
  <echo message="Converting intermediate file into result genericode..."/>
  <java failonerror="true" classname="net.sf.saxon.Transform">
     <arg value="-xsl:{$c:baseURI}Crane-20unit2gc.xsl"/>
     <arg value="-o:{$c:baseURI}{$output-uri-prefix}{@outuri}"/>
     <arg value="-s:{$intermediate-uri-prefix}{@inuri}"/>
     <arg value="list-uri={document-uri(/)}"/>
     <arg value="out-uri={@outuri}"/>
     <arg value="--suppressXsltNamespaceCheck:on"/>
  </java>
</xsl:template>

<xs:template>
  <para>Convert a packaging codes XLS file into genericode</para>
</xs:template>
<!--<xsl:template match="list[@method='Unit21']" priority="10"/>-->
<xsl:template match="list[@method='Unit21']">
  
  <get src="{Identification/AlternateFormatLocationUri[last()]}"
       dest="{$intermediate-uri-prefix}{@inuri}.xls"/>
  <exec executable="soffice">
    <arg value="--headless"/>
    <arg value="--convert-to"/>
    <arg value="ods"/>
    <arg value="--outdir"/>
    <arg value="{$intermediate-uri-prefix}"/>
    <arg value="-env:UserInstallation=file://{$c:baseURI}{$intermediate-uri-prefix}codelistlibreoffice"/>
    <arg value="{$intermediate-uri-prefix}{@inuri}.xls"/>
  </exec>
  
  <unzip src="{$intermediate-uri-prefix}{@inuri}.ods"
         dest="{$intermediate-uri-prefix}">
    <patternset>
      <include name="content.xml"/>
    </patternset>
    <mapper type="glob" from="content.xml" to="{@inuri}"/>
  </unzip>
  <available file="{$intermediate-uri-prefix}{@inuri}"
             property="{Identification/ShortName}.exists"/>
  <fail unless="{Identification/ShortName}.exists"
        message="Cannot create intermediate file"/>
  <echo message="Converting intermediate file into result genericode..."/>
  <java failonerror="true" classname="net.sf.saxon.Transform">
     <arg value="-xsl:{$c:baseURI}Crane-21unit2gc.xsl"/>
     <arg value="-o:{$c:baseURI}{$output-uri-prefix}{@outuri}"/>
     <arg value="-s:{$intermediate-uri-prefix}{@inuri}"/>
     <arg value="list-uri={document-uri(/)}"/>
     <arg value="out-uri={@outuri}"/>
     <arg value="--suppressXsltNamespaceCheck:on"/>
  </java>
</xsl:template>

<xs:template>
  <para>Combine two genericode files into one genericode file</para>
</xs:template>
<!--<xsl:template match="list[@method='Combine2021']" priority="10"/>-->
<xsl:template match="list[@method='Combine2021']">
  
  <available file="{$c:baseURI}{$output-uri-prefix}{@file20}"
             property="base.exists"/>
  <fail unless="base.exists" message=
"Cannot find generated File20 GC file {$c:baseURI}{$output-uri-prefix}{@file20}"/>
  <available file="{$c:baseURI}{$output-uri-prefix}{@file21}"
             property="extra.exists"/>
  <fail unless="extra.exists" message=
"Cannot find generated File21 GC file {$c:baseURI}{$output-uri-prefix}{@file21}"/>
  <echo message="Combining into result genericode..."/>
  <java failonerror="true" classname="net.sf.saxon.Transform">
     <arg value="-xsl:{$c:baseURI}Crane-combine2021.xsl"/>
     <arg value="-o:{$c:baseURI}{$output-uri-prefix}{@outuri}"/>
     <arg value="-it:start"/>
     <arg value="list-uri={document-uri(/)}"/>
     <arg value="out-uri={@outuri}"/>
     <arg value="output-uri-prefix={$output-uri-prefix}"/>
     <arg value="--suppressXsltNamespaceCheck:on"/>
  </java>
</xsl:template>

<xs:template>
  <para>Convert a UN/CEFACT XSD file into genericode</para>
</xs:template>
<!--<xsl:template match="list[@method='XSD']" priority="10"/>-->
<xsl:template match="list[@method='XSD']">
  
  <get src="{Identification/AlternateFormatLocationUri[last()]}"
       dest="{$intermediate-uri-prefix}{@inuri}"/>
  
  <available file="{$intermediate-uri-prefix}{@inuri}"
             property="{Identification/ShortName}.exists"/>
  <fail unless="{Identification/ShortName}.exists"
        message="Cannot create intermediate file"/>
  <echo message="Converting intermediate file into result genericode..."/>
  <java failonerror="true" classname="net.sf.saxon.Transform">
     <arg value="-xsl:{$c:baseURI}Crane-cefactxsd2gc.xsl"/>
     <arg value="-o:{$c:baseURI}{$output-uri-prefix}{@outuri}"/>
     <arg value="-s:{$intermediate-uri-prefix}{@inuri}"/>
     <arg value="list-uri={document-uri(/)}"/>
     <arg value="out-uri={@outuri}"/>
     <arg value="--suppressXsltNamespaceCheck:on"/>
  </java>
</xsl:template>

<xs:template>
  <para>Catch-all for unfinished (or invalid) business</para>
</xs:template>
<xsl:template match="list">
  <xsl:message terminate="yes">
    <xsl:value-of select="'Unaccommodated list method: ',@method"/>
  </xsl:message>
</xsl:template>

</xsl:stylesheet>
