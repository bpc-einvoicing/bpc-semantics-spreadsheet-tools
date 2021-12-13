<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="../xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:c="urn:X-Crane"
xmlns:ccts="urn:un:unece:uncefact:documentation:standard:CoreComponentsTechnicalSpecification:2"
                exclude-result-prefixes="xs xsd c ccts"
                version="2.0">

<xsl:import href="Crane-common4codelists.xsl"/>

<xs:doc info="$Id: Crane-cefactxsd2gc.xsl,v 1.3 2017/09/23 14:05:07 admin Exp $"
        filename="Crane-cefactxsd2gc.xsl" vocabulary="DocBook">
  <xs:title>Convert a UN/CEFACT XSD file to genericode</xs:title>
  <para>
    Convert an instance of a UN/CEFACT XSD file and its metadata
    to OASIS genericode using metadata supplied by the list of lists.
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
  <xs:title>Main logic for columns and rows</xs:title>
  <para>
    The input is raw XSD of codes
  </para>
</xs:doc>

<xs:template>
  <para>
    Create the columns and rows as needed.
  </para>
  <xs:param name="filtered">
    <para>
      Indication that the columns and rows are to be filtered.  For this
      code list filtering is done based on the presence of the word
      "DEPRECATED" in the name value
    </para>
  </xs:param>
</xs:template>
<xsl:template name="c:columnsAndRows">
  <xsl:param name="filtered" as="xsd:boolean" select="false()"/>
  <xsl:variable name="tableOfCodes"
               select="/xsd:schema/xsd:simpleType/xsd:restriction"/>
  <xsl:if test="empty($tableOfCodes)">
    <xsl:message terminate="yes"
                 select="'Expected table not found in input',
                         document-uri(/)"/>
  </xsl:if>
   <ColumnSet>
      <Column Id="code" Use="required">
         <ShortName>Code</ShortName>
         <Data Type="normalizedString" Lang="en"/>
      </Column>
      <Column Id="name" Use="optional">
         <ShortName>Name</ShortName>
         <Data Type="string" Lang="en"/>
      </Column>
      <Column Id="description" Use="optional">
         <ShortName>Description</ShortName>
         <Data Type="string" Lang="en"/>
      </Column>
      <Key Id="codeKey">
         <ShortName>CodeKey</ShortName>
         <ColumnRef Ref="code"/>
      </Key>
   </ColumnSet>
  <SimpleCodeList>
    <xsl:for-each select="$tableOfCodes/xsd:enumeration">
      <Row>
        <Value ColumnRef="code">
           <SimpleValue>
             <xsl:value-of select="@value"/>
           </SimpleValue>
        </Value>
        <xsl:for-each select="xsd:annotation/xsd:documentation/ccts:Name">
          <Value ColumnRef="name">
             <SimpleValue>
               <xsl:value-of select="."/>
             </SimpleValue>
          </Value>
        </xsl:for-each>
      <xsl:for-each select="xsd:annotation/xsd:documentation/ccts:Description">
          <Value ColumnRef="description">
             <SimpleValue>
               <xsl:value-of select="."/>
             </SimpleValue>
          </Value>
        </xsl:for-each>
      </Row>
   </xsl:for-each>
  </SimpleCodeList>
</xsl:template>

</xsl:stylesheet>
