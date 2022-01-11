<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="../xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:c="urn:X-Crane"
                xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
                xmlns:table="urn:oasis:names:tc:opendocument:xmlns:table:1.0"
                xmlns:text="urn:oasis:names:tc:opendocument:xmlns:text:1.0"  
                xmlns:config="urn:oasis:names:tc:opendocument:xmlns:config:1.0"
                exclude-result-prefixes="xs xsd c office table text config"
                version="2.0">

<xs:doc info="$Id: Crane-common4codelists.xsl,v 1.5 2019/03/24 01:19:21 admin Exp $"
        filename="Crane-common4codelists.xsl" vocabulary="DocBook">
  <xs:title>Common functionality for code list conversion</xs:title>
  <para>
    Support the suite of stylesheets converting code lists to genericode.
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
  <xs:title>Invocation parameters</xs:title>
</xs:doc>

<xs:param ignore-ns='yes'>
  <para>
    Where to open the list of lists?
  </para>
</xs:param>
<xsl:param name="list-uri" required="yes" as="xsd:string"/>

<xs:param ignore-ns='yes'>
  <para>
    Which of the lists in the lists of lists is being created?
  </para>
</xs:param>
<xsl:param name="out-uri" required="yes" as="xsd:string"/>

<xs:output>
  <para>Indent the results</para>
</xs:output>
<xsl:output indent="yes"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Main logic</xs:title>
</xs:doc>

<xs:template>
  <para>
    Check nothing is wrong with the inputs and then invoke the generation
    process once or twice (twice if there is also filtered output).
  </para>
</xs:template>
<xsl:template match="/" name="start">
  <xsl:variable name="identification"
               select="doc($list-uri)//list[@outuri=$out-uri]
               /Identification"/>
  <xsl:if test="count($identification)&lt;1">
    <xsl:message terminate="yes"
                select="'Expected identification not found in list of lists'"/>
  </xsl:if>
  <xsl:if test="count($identification)>1">
    <xsl:message terminate="yes"
           select="'Multiple identification elements found in list of lists'"/>
  </xsl:if>
  <gc:CodeList
             xmlns:gc="http://docs.oasis-open.org/codelist/ns/genericode/1.0/">
    <xsl:apply-templates select="$identification" mode="c:identification"/>
    <xsl:call-template name="c:columnsAndRows">
      <xsl:with-param name="file20uri" tunnel="yes"
                      select="$identification/../@file20deleted"/>
      <xsl:with-param name="file21uri" tunnel="yes"
                      select="$identification/../@file21deleted"/>
    </xsl:call-template>
  </gc:CodeList>
  <xsl:if test="exists($identification/../@filteruri)">
    <!--need to work with the same inputs again to produce a filtered output-->
    <xsl:result-document href="{$identification/../@filteruri}">
      <gc:CodeList
             xmlns:gc="http://docs.oasis-open.org/codelist/ns/genericode/1.0/">
        <xsl:apply-templates select="$identification" mode="c:identification"/>
        <xsl:call-template name="c:columnsAndRows">
          <xsl:with-param name="filtered" select="true()"/>
          <xsl:with-param name="file20uri" tunnel="yes"
                          select="$identification/../@file20"/>
          <xsl:with-param name="file21uri" tunnel="yes"
                          select="$identification/../@file21"/>
        </xsl:call-template>
      </gc:CodeList>
    </xsl:result-document>
  </xsl:if>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Identification manipulation logic</xs:title>
</xs:doc>

<xs:function>
  <para>Return a version value placebo to be overridden by invoking ss</para>
</xs:function>
<xsl:function name="c:version" as="xsd:string">
  <xsl:sequence select="'*****VERSION STRING NOT SUPPLIED*****'"/>
</xsl:function>

<xs:template>
  <para>Replace all occurrences of $VERSION in a text string</para>
</xs:template>
<xsl:template match="text()" mode="c:identification" priority="1">
  <xsl:value-of select="replace(.,'\$VERSION',c:version())"/>
</xsl:template>

<xs:template>
  <para>Preserve all other nodes</para>
</xs:template>
<xsl:template match="@*|node()" mode="c:identification">
  <xsl:copy>
    <xsl:apply-templates select="@*,node()" mode="c:identification"/>
  </xsl:copy>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>ODS table, row and cell access</xs:title>
</xs:doc>

<xs:function>
  <para>Return a cell's column numbers as a sequence</para>
  <xs:param name="cell">
    <para>The cell to calculate the number of</para>
  </xs:param>
</xs:function>
<xsl:function name="c:columnNumbers" as="xsd:integer+">
  <xsl:param name="cell" as="element(table:table-cell)"/>
  <xsl:variable name="first" 
select="xsd:integer($cell/ (count( preceding-sibling::table:table-cell ) -
count( preceding-sibling::table:table-cell/@table:number-columns-repeated ) +
sum(preceding-sibling::table:table-cell/@table:number-columns-repeated)+1) )"/>
  <xsl:sequence select="$first to 
      $first + ( xsd:integer( $cell/@table:number-columns-repeated ),0 )[1]"/>
</xsl:function>
  
<xs:function>
  <para>Return a cell's text value</para>
  <xs:param name="cell">
    <para>The cell to calculate the value of</para>
  </xs:param>
</xs:function>
<xsl:function name="c:cellValue" as="xsd:string">
  <xsl:param name="cell" as="element(table:table-cell)?"/>
  <xsl:sequence select="normalize-space(string-join($cell/text:p,' '))"/>
</xsl:function>

</xsl:stylesheet>
