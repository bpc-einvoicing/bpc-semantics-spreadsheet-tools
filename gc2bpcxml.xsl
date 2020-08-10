<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:bpc="urn:X-BPC"
                exclude-result-prefixes="xs xsd bpc"
                version="2.0">

<xs:doc filename="ublgc2bpcgc.xsl" vocabulary="DocBook">
  <xs:title>
    Convert a UBL genericode model into a BPC subset genericode model
  </xs:title>
  <para>
    The BPC Semantics group has imposed changes in cardinality and has
    specified these values in a spreadsheet. The spreadsheet is translated
    to genericode for XML processing.
  </para>
  <para>
    This stylesheet reads the genericode to augment a copy of the
    supplied UBL spreadsheet with columns used by a schema subset tool.
  </para>
</xs:doc>

<xs:output>
  <para>Indent the results</para>
</xs:output>
<xsl:output indent="yes"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Invocation parameters and input file</xs:title>
  <para>
    The input file is the BPC Semantics Spreadsheet with all of the
    business rule information that contains cardinality requirements for
    the BPC subset schemas for each process.
  </para>
</xs:doc>

<xs:param ignore-ns='yes'>
  <para>
    This is the UBL document model genericode file passed as a document node
    which when using Saxon uses the command-line argument +ublgc={uri}
  </para>
</xs:param>
<xsl:param name="ublgc" required="yes" as="document-node()"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Main processing</xs:title>
</xs:doc>

<xs:template>
  <para>Getting started</para>
</xs:template>
<xsl:template match="/">
  <xsl:if test="not(gc:CodeList)"
             xmlns:gc="http://docs.oasis-open.org/codelist/ns/genericode/1.0/">
    <xsl:message terminate="yes"
                 select="'Main input is not a genericode file'"/>
  </xsl:if>
  <xsl:if test="not($ublgc/gc:CodeList)"
             xmlns:gc="http://docs.oasis-open.org/codelist/ns/genericode/1.0/">
    <xsl:message terminate="yes"
                 select="'UBL model input is not a genericode file'"/>
  </xsl:if>

  <xsl:variable name="worksheet" as="element(worksheet)+">
  <!--handle each worksheet tab separately-->
    <xsl:for-each-group select="/*/SimpleCodeList/Row"
                        group-by="bpc:col(.,'WorksheetTab')">
      <worksheet>
      <xsl:variable name="tab" select="current-grouping-key()"/>
      <xsl:message select="'Harvesting spreadsheet tab:',$tab"/>
      <xsl:variable name="tabNumber" select="replace($tab,'.*?(\d+).*','$1')"/>
      <xsl:attribute name="tab" select="$tab"/>
      <xsl:attribute name="tabNumber" select="$tabNumber"/>
        <doctypes>
          <xsl:analyze-string select="$tab" regex="(\d+\s*)|(\s*,\s*)">
            <xsl:non-matching-substring>
              <doctype><xsl:value-of select="."/></doctype>
            </xsl:non-matching-substring>
          </xsl:analyze-string>
        </doctypes>
        <semantics>
        <xsl:for-each-group select="current-group()"
                            group-by="bpc:col(.,'BPCID')">
          <semantic bpcID="{current-grouping-key()}"
                    worksheetRows="{current-group()/
         (2 + count(preceding-sibling::Row[bpc:col(.,'WorksheetTab')=$tab]))}">
            <processes>
              <xsl:for-each select="current-group()">
                <process>
                  <xsl:for-each select="bpc:col(.,'Process')">
                    <xsl:attribute name="processId" select="."/>
                  </xsl:for-each>
                  <xsl:analyze-string select="bpc:col(.,'ModelCardinality')"
                                      regex="\s*,\s*">
                    <xsl:non-matching-substring>
                      <model>
                        <xsl:value-of select="normalize-space(.)"/>
                      </model>
                    </xsl:non-matching-substring>
                  </xsl:analyze-string>
                  <data>
                    <context>
                      <xsl:value-of select="
                                    normalize-space(bpc:col(.,'UBLContext'))"/>
                    </context>
                    <xsl:for-each select="bpc:col(.,'SchematronAssertion')">
                      <assert>
                        <xsl:value-of select="normalize-space(.)"/>
                      </assert>
                    </xsl:for-each>
                    <xsl:for-each select="bpc:col(.,'ErrorMessage')">
                      <message>
                        <xsl:value-of select="normalize-space(.)"/>
                      </message>
                    </xsl:for-each>
                  </data>
                </process>
              </xsl:for-each>
            </processes>
            <xsl:for-each-group select="current-group()" 
                                group-by="bpc:col(.,'UBLCardinality')">
              <ublcardinalities>
                  <xsl:analyze-string select="current-grouping-key()"
                                      regex="\s*,\s*">
                    <xsl:non-matching-substring>
                      <ublcardinality>
                        <xsl:value-of select="normalize-space(.)"/>
                      </ublcardinality>
                    </xsl:non-matching-substring>
                  </xsl:analyze-string>
              </ublcardinalities>
            </xsl:for-each-group>
            <xsl:for-each-group select="current-group()" 
                                group-by="bpc:col(.,'UBLDictionaryEntryName')">
              <ubldens>
                  <xsl:analyze-string select="current-grouping-key()"
                                      regex="\s*,\s*">
                    <xsl:non-matching-substring>
                      <ublden>
                        <xsl:value-of select="normalize-space(.)"/>
                      </ublden>
                    </xsl:non-matching-substring>
                  </xsl:analyze-string>
              </ubldens>
            </xsl:for-each-group>
            <xsl:for-each-group select="current-group()" 
                                group-by="bpc:col(.,'BPCTerm')">
              <bpcTerm>
               <xsl:value-of select="normalize-space(current-grouping-key())"/>
              </bpcTerm>
            </xsl:for-each-group>
            <xsl:for-each-group select="current-group()" 
                                group-by="bpc:col(.,'Description')">
              <description>
               <xsl:value-of select="normalize-space(current-grouping-key())"/>
              </description>
            </xsl:for-each-group>
            <xsl:for-each-group select="current-group()" 
                                group-by="bpc:col(.,'DataType')">
              <dataType>
               <xsl:value-of select="normalize-space(current-grouping-key())"/>
              </dataType>
            </xsl:for-each-group>
          </semantic>
        </xsl:for-each-group>
        </semantics>
      </worksheet>
    </xsl:for-each-group>
  </xsl:variable>
  <!--put out the results first-->
  <worksheets>
    <xsl:copy-of select="$worksheet"/>
  </worksheets>
  <!--determine if there were any problems with the inputs based on outputs-->
  <xsl:variable name="analysis" as="element(analysis)+">
    <xsl:for-each select="$worksheet">
      <xsl:variable name="doctypes" as="xsd:string*"
                    select="doctypes/doctype"/>
      <analysis banner="{@tab}">
        <xsl:for-each select="semantics/semantic">
          <xsl:variable name="worksheetRows" select="@worksheetRows"/>
          <xsl:variable name="thisSemantic">
            <!--check that the UBL Dictionary Entry Names exist-->
            <xsl:for-each select="ubldens/ublden">
              <xsl:variable name="checks" as="xsd:string*">
                <xsl:choose>
                  <xsl:when test="contains(.,'#')">
                    <xsl:variable name="proto" select="."/>
                    <xsl:for-each select="$doctypes">
                      <xsl:sequence select="replace($proto,'#',.)"/>
                    </xsl:for-each>
                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:sequence select="."/>
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:variable>
              <xsl:for-each select="$checks">
                <xsl:choose>
                  <xsl:when test="starts-with(.,'@')">
                    <xsl:if test="not(substring(.,2) = $bpc:supplemental)">
                      <xsl:value-of
         select="concat('CCTS Supplemental Component not found: ',.,'&#xa;')"/>
                    </xsl:if>
                  </xsl:when>
                  <xsl:when test="not(key('bpc:den',.,$ublgc))">
                    <xsl:value-of 
           select="concat('UBL Dictionary Entry Name not found: ',.,'&#xa;')"/>
                  </xsl:when>
                </xsl:choose>
              </xsl:for-each>
            </xsl:for-each>
            
            <!--check that the model cardinalities and UBL cardinalities
                match the UBL Dictionary Entry Names that are in play-->
            <xsl:if test="count(ublcardinalities/ublcardinality) !=
                          count(ubldens/ublden)">
<xsl:text>Mismatched number of UBL cardinalities to dictionary entry names.&#xa;</xsl:text>
            </xsl:if>
          </xsl:variable>
          <xsl:if test="normalize-space($thisSemantic)">
            <xsl:value-of select="concat(@bpcID,' worksheet row',
                                  if( contains($worksheetRows,' ') )
                                  then 's ' else ' ', $worksheetRows,'&#xa;',
                                  $thisSemantic )"/>
          </xsl:if>
        </xsl:for-each>
      </analysis>
    </xsl:for-each>
  </xsl:variable>
  <xsl:if test="some $a in $analysis satisfies normalize-space($a)">
    <xsl:result-document href="{document-uri(.)}.errors.txt" method="text">
      <xsl:for-each select="$analysis[normalize-space(.)]">
        <xsl:value-of select="@banner"/>
        <xsl:text>&#xa;</xsl:text>
        <xsl:value-of select="."/>
      </xsl:for-each>
    </xsl:result-document>
  </xsl:if>
</xsl:template>

<!--========================================================================-->
<xs:doc>
  <xs:title>Genericode access functions</xs:title>
  <para>
    Various convenience functions to access information from an
    instance of genericode
  </para>
</xs:doc>

<xs:key>
  <para>Tracking the rows by the unique dictionary entry name</para>
</xs:key>
<xsl:key name="bpc:den" match="Row" use="bpc:col(.,'DictionaryEntryName')"/>

<xs:function>
  <para>Returning a row's column value by its column name</para>
  <xs:param name="row"><para>The genericode row</para></xs:param>
  <xs:param name="column"><para>The genericode column</para></xs:param>
</xs:function>
<xsl:function name="bpc:col" as="element(SimpleValue)*">
  <xsl:param name="row" as="element(Row)"/>
  <xsl:param name="column" as="xsd:string"/>
  <xsl:sequence select="$row/Value[@ColumnRef=$column]/SimpleValue"/>
</xsl:function>

<xs:variable>
  <para>List of all of the supplemental components</para>
</xs:variable>
<xsl:variable name="bpc:supplemental" as="xsd:string*"
              select="
'AmountCurrencyIdentifier',
'AmountCurrencyCodeListVersionIdentifier',
'BinaryObjectMimeCode',
'BinaryObjectCharacterSetCode',
'BinaryObjectEncodingCode',
'BinaryObjectFilenameText',
'BinaryObjectFormatText',
'BinaryObjectUniformResourceIdentifier',
'LanguageIdentifier',
'CodeListAgencyIdentifier',
'CodeListAgencyNameText',
'CodeListIdentifier',
'CodeListNameText',
'CodeListSchemeUniformResourceIdentifier',
'CodeListUniformResourceIdentifier',
'CodeListVersionIdentifier',
'CodeNameText',
'IdentificationSchemeAgencyIdentifier',
'IdentificationSchemeAgencyNameText',
'IdentificationSchemeDataUniformResourceIdentifier',
'IdentificationSchemeIdentifier',
'IdentificationSchemeNameText',
'IdentificationSchemeUniformResourceIdentifier',
'IdentificationSchemeVersionIdentifier',
'MeasureUnitCode',
'MeasureUnitCodeListVersionIdentifier',
'NumericFormatText',
'QuantityUnitCode',
'QuantityUnitCodeListAgencyIdentifier',
'QuantityUnitCodeListAgencyNameText',
'QuantityUnitCodeListIdentifier',
'LanguageLocaleIdentifier'
"/>
  
</xsl:stylesheet>