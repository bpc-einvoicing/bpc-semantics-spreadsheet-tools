<?xml version="1.0" encoding="US-ASCII"?>
<?xml-stylesheet type="text/xsl" href="utilities/xslstyle/xslstyle-docbook.xsl"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xs="http://www.CraneSoftwrights.com/ns/xslstyle"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:bpc="urn:X-BPC"
                exclude-result-prefixes="xs xsd bpc"
                version="2.0">

<xs:doc filename="ublgc2bpcgc.xsl" vocabulary="DocBook" info="$Id$">
  <xs:title>
    Convert a UBL genericode model into a BPC semantic model XML instance
  </xs:title>
  <para>
    The BPC Semantics group has imposed changes in cardinality and has
    specified these values in a spreadsheet. The spreadsheet is translated
    to a colloquial XML for downstream processing.
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

<xs:strip-space>
  <para>It helps not to have white-space characters for comparisons</para>
</xs:strip-space>
<xsl:strip-space elements="ublcardinalities"/>

<!--========================================================================-->
<xs:doc>
  <xs:title>Invocation parameters and input file</xs:title>
  <para>
    The input file is the BPC Semantics Spreadsheet with all of the
    business rule information that contains cardinality requirements for
    the BPC subset schemas for each customization.
  </para>
</xs:doc>

<xs:param ignore-ns='yes'>
  <para>
    This is the UBL document model genericode file passed as a document node
    which when using Saxon uses the command-line argument +ublgc={uri}
  </para>
</xs:param>
<xsl:param name="ublgc" required="yes" as="document-node()"/>

<xs:param ignore-ns='yes'>
  <para>
    The comment to embed at the beginning of the output XML
  </para>
</xs:param>
<xsl:param name="embedded-comment" required="yes" as="xsd:string"/>

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

  <xsl:variable name="problemRows" as="xsd:string*">
    <xsl:for-each select="/*/SimpleCodeList/Row
                          [exists(bpc:col(.,'SchematronAssertion')) or
                           exists(bpc:col(.,'ErrorMessage')) or
                           exists(bpc:col(.,'DataIntegrityRules'))]">
      <xsl:variable name="tab" select="bpc:col(.,'WorksheetTab')"/>
      <xsl:if test="not(exists(bpc:col(.,'BPCID')) and
                        exists(bpc:col(.,'SchematronContext')) and
                        exists(bpc:col(.,'SchematronAssertion')) and
                        exists(bpc:col(.,'ErrorMessage')) and
                        exists(bpc:col(.,'DataIntegrityRules')))">
        <xsl:value-of>
          <xsl:text>Incomplete Schematron information for tab '</xsl:text>
          <xsl:value-of select="$tab"/>
          <xsl:text>' row </xsl:text>
          <xsl:value-of select="2 +
               count(preceding-sibling::Row[bpc:col(.,'WorksheetTab')=$tab])"/>
          <xsl:text> BPC ID </xsl:text>
          <xsl:value-of select="bpc:col(.,'BPCID')"/>
        </xsl:value-of>
      </xsl:if>
      <xsl:if test="contains(bpc:col(.,'SchematronAssertion'),'/#')">
        <xsl:value-of>
          <xsl:text>Assertion text must use "/*" instead of "/#": '</xsl:text>
          <xsl:value-of select="$tab"/>
          <xsl:text>' row </xsl:text>
          <xsl:value-of select="2 +
               count(preceding-sibling::Row[bpc:col(.,'WorksheetTab')=$tab])"/>
          <xsl:text> BPC ID </xsl:text>
          <xsl:value-of select="bpc:col(.,'BPCID')"/>
        </xsl:value-of>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>
  <xsl:if test="exists($problemRows)">
    <xsl:result-document href="../SPREADSHEET-CONTAINS-ERRORS.txt" method="text">
      <xsl:value-of select="$problemRows" separator="&#xa;"/>
      <xsl:text>&#xa;</xsl:text>
    </xsl:result-document>
    <xsl:message>
      <xsl:value-of select="$problemRows" separator="&#xa;"/>
      <xsl:text>&#xa;</xsl:text>
    </xsl:message>
  </xsl:if>

  <xsl:variable name="worksheet" as="element(worksheet)*">
  <!--handle each worksheet tab separately-->
    <xsl:for-each-group select="/*/SimpleCodeList/Row
                            (:group only the rows that create rules:)
                            [exists(bpc:col(.,'BPCID')) and
                             exists(bpc:col(.,'SchematronContext')) and
                             exists(bpc:col(.,'SchematronAssertion')) and
                             exists(bpc:col(.,'ErrorMessage')) and
                             exists(bpc:col(.,'DataIntegrityRules'))]"
                        group-by="bpc:col(.,'WorksheetTab')">
     <worksheet>
      <xsl:variable name="tab" select="current-grouping-key()"/>
      <xsl:message select="'Harvesting spreadsheet tab:',$tab"/>
      <xsl:attribute name="tab" select="$tab"/>
        <doctypes>
          <xsl:analyze-string select="$tab" regex="(\d+\s*)|(\s*,\s*)">
            <xsl:non-matching-substring>
              <doctype><xsl:value-of select="."/></doctype>
            </xsl:non-matching-substring>
          </xsl:analyze-string>
        </doctypes>
        <semantics>
        <xsl:for-each-group group-by="bpc:col(.,'BPCID')"
                 select="current-group()[bpc:col(.,'UBLDictionaryEntryName')]">
          <semantic bpcID="{current-grouping-key()}"
                    worksheetRows="{current-group()/
         (2 + count(preceding-sibling::Row[bpc:col(.,'WorksheetTab')=$tab]))}">
            <xsl:for-each select="current-group()">
              <customization worksheetRow="{
         (2 + count(preceding-sibling::Row[bpc:col(.,'WorksheetTab')=$tab]))}">
                <xsl:for-each select="bpc:col(.,'Customization')">
                  <xsl:attribute name="custID" select="normalize-space(.)"/>
                </xsl:for-each>
                <modelcardinalities>
                  <xsl:analyze-string select="bpc:col(.,'ModelCardinality')"
                                      regex="\s*,\s*">
                    <xsl:non-matching-substring>
                      <modelcardinality>
                        <xsl:value-of select="normalize-space(.)"/>
                      </modelcardinality>
                    </xsl:non-matching-substring>
                  </xsl:analyze-string>
                </modelcardinalities>
                <data>
                  <contextPrototype>
                    <xsl:value-of select="
                             normalize-space(bpc:col(.,'SchematronContext'))"/>
                  </contextPrototype>
                  <xsl:for-each select="bpc:col(.,'SchematronAssertion')">
                    <assertionPrototype>
                      <xsl:value-of select="normalize-space(.)"/>
                    </assertionPrototype>
                  </xsl:for-each>
                  <xsl:for-each select="bpc:col(.,'ErrorMessage')">
                    <message>
                      <xsl:value-of select="normalize-space(.)"/>
                    </message>
                  </xsl:for-each>
                </data>
                <ublcardinalities>
                    <xsl:analyze-string select="bpc:col(.,'UBLCardinality')"
                                        regex="\s*,\s*">
                      <xsl:non-matching-substring>
                        <ublcardinality>
                          <xsl:value-of select="normalize-space(.)"/>
                        </ublcardinality>
                      </xsl:non-matching-substring>
                    </xsl:analyze-string>
                </ublcardinalities>
                <ubldens>
                  <xsl:analyze-string regex="\s*,\s*"
                                  select="bpc:col(.,'UBLDictionaryEntryName')">
                    <xsl:non-matching-substring>
                      <ublden>
                        <xsl:value-of select="normalize-space(.)"/>
                      </ublden>
                    </xsl:non-matching-substring>
                  </xsl:analyze-string>
                </ubldens>
                <bpcTerm>
                 <xsl:value-of select="bpc:col(.,'BPCTerm')"/>
                </bpcTerm>
                <description>
             <xsl:value-of select="normalize-space(bpc:col(.,'Description'))"/>
                </description>
                <dataType>
                <xsl:value-of select="normalize-space(bpc:col(.,'DataType'))"/>
                </dataType>
              </customization>
            </xsl:for-each>
          </semantic>
        </xsl:for-each-group>
        </semantics>
      </worksheet>
    </xsl:for-each-group>
  </xsl:variable>

  <!--put out the results first-->
  <xsl:comment select="$embedded-comment"/>
  <worksheets>
    <xsl:copy-of select="$worksheet"/>
  </worksheets>
  <!--determine if there were any problems with the inputs based on outputs-->
  <xsl:variable name="worksheetError" as="xsd:string*">
    <xsl:if test="empty($worksheet)">
      <xsl:text>There appear not to be any worksheets in the input spreadsheet that describe any BPC data integrity constraints. At least one row in the worksheet must have a value in all of the following columns (by compacted name): "BPCID", "UBLDictionaryEntryName", "UBLCardinality", "SchematronAssertion", "ErrorMessage", "DataIntegrityRules"'</xsl:text>
    </xsl:if>  
    <xsl:for-each select="$worksheet//customization">
      <xsl:if test="normalize-space(@custID) = ''">
        <xsl:value-of>
          <xsl:text>Missing customization information: row=</xsl:text>
          <xsl:value-of select="@worksheetRow"/>
          <xsl:text>, tab=</xsl:text>
          <xsl:value-of select="ancestor::worksheet[1]/@tab"/>
        </xsl:value-of>
      </xsl:if>
    </xsl:for-each>
  </xsl:variable>
  <xsl:variable name="analysis" as="element(analysis)*">
    <xsl:for-each select="$worksheet">
      <xsl:variable name="theseDoctypes" as="xsd:string*"
                    select="doctypes/doctype"/>
      <analysis banner="{@tab}">
        <xsl:for-each select="semantics/semantic/customization">
          <xsl:variable name="bpcID" select="../@bpcID"/>
          <xsl:variable name="worksheetRows" 
                        select="if( ends-with($bpcID,'TBD' ) )
                                then @worksheetRow else ../@worksheetRows"/>
          <xsl:variable name="thisCustomization" select="."/>
          <xsl:variable name="semanticErrors">
            <!--check that the stated Dictionary Entry Names exist in UBL-->
            <xsl:variable name="denErrorMessage">
              <xsl:for-each select="ubldens/ublden">
                <xsl:variable name="checks" as="xsd:string*">
                  <xsl:choose>
                    <xsl:when test="contains(.,'#')">
                      <xsl:variable name="proto" select="."/>
                      <xsl:for-each select="$theseDoctypes">
                        <xsl:sequence select="
                                     replace(
                                       replace(
                                         replace(
                                           replace(
                                             replace($proto,'\\\\','&#xfffc;'),
                                                   '\\#','&#xfffd;'),
                                                 '#',.),
                                               '&#xfffd;','#'),
                                             '&#xfffc;','\\')"/>
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
            </xsl:variable>
            <!--report the error and have the error ready for later tests-->
            <xsl:value-of select="$denErrorMessage"/>
            
            <!--check that the model cardinalities and UBL cardinalities
                match the UBL Dictionary Entry Names that are in play-->
            <xsl:if test="not(normalize-space($denErrorMessage))">
             <xsl:for-each select="if( some $den in ubldens/ublden
                                       satisfies contains( $den, '#' ) )
                                   then $theseDoctypes else 'xxxxx'">
              <xsl:variable name="thisDoctype" select="."/>
              <xsl:for-each select="$thisCustomization">
                <!--build the expected cardinalities from the UBL model-->
                <xsl:variable name="ublDefinedCardinalities" as="element()">
                  <ublcardinalities>
                    <xsl:for-each select="ubldens/ublden">
                      <xsl:for-each select="
                       key('bpc:den',replace(.,'#',$thisDoctype),$ublgc)/
                       bpc:col(.,'Cardinality')/replace(.,'^1$','1..1')">
                        <ublcardinality>
                          <xsl:value-of select="."/>
                        </ublcardinality>
                      </xsl:for-each>
                      <xsl:if test="starts-with(.,'@')">
                        <ublcardinality>
                          <xsl:value-of select="
                           $bpc:supplemental[.=substring(current(),2)]/@card"/>
                        </ublcardinality>
                      </xsl:if>
                    </xsl:for-each>
                  </ublcardinalities>
                </xsl:variable>
                <!--compare the stated cardinalities to actual cardinalities-->
                <xsl:variable name="cardinalityTests">
                  <xsl:choose>
                    <xsl:when test="
                          not( count($ublDefinedCardinalities/ublcardinality) =
                               count(ublcardinalities/ublcardinality) )">
                      <xsl:text>Mismatched count of cardinalities: </xsl:text>
                      <xsl:value-of select="$thisDoctype"/>
                      <xsl:text>&#xa;</xsl:text>
                    </xsl:when>
                   <xsl:when test="not( deep-equal( $ublDefinedCardinalities,
                                                    ublcardinalities ) )">
                  <xsl:text>Mismatched record of UBL cardinalities: </xsl:text>
                     <xsl:value-of select="$thisDoctype"/>
                     <xsl:text>&#xa;</xsl:text>
                   </xsl:when>
                    <xsl:when test="count(ublcardinalities/ublcardinality) !=
                                   count(modelcardinalities/modelcardinality)">
<xsl:text>Mismatched number of UBL cardinalities to BPC model cardinalities.&#xa;</xsl:text>
                   </xsl:when>
                   <xsl:otherwise>
                     <xsl:for-each select="1 to
                                       count(ublcardinalities/ublcardinality)">
                       <xsl:if test="not(bpc:checkConstraints(
    $thisCustomization/ublcardinalities/ublcardinality[position()=current()],
    $thisCustomization/modelcardinalities/modelcardinality[position()=current()]))">
                         <xsl:value-of select="concat(
        'The model cannot constrain UBL''s cardinality of ',
        $thisCustomization/ublcardinalities/ublcardinality[position()=current()],
        ' using ',
        $thisCustomization/modelcardinalities/modelcardinality[position()=current()],
        '.&#xa;')"/>
                       </xsl:if>
                     </xsl:for-each>
                   </xsl:otherwise>
                 </xsl:choose>
               </xsl:variable>
               <xsl:if test="normalize-space($cardinalityTests)">
                 <xsl:copy-of select="$cardinalityTests"/>
   <xsl:text>Expected cardinalities: </xsl:text>
   <xsl:value-of select="$ublDefinedCardinalities/ublcardinality"
                 separator=", "/>
   <xsl:text>&#xa;</xsl:text>
               </xsl:if>
              </xsl:for-each>
             </xsl:for-each>
            </xsl:if>
          </xsl:variable>
          <xsl:if test="normalize-space($semanticErrors)">
            <xsl:value-of select="concat($bpcID,' worksheet row',
                                  if( contains($worksheetRows,' ') )
                                  then 's ' else ' ', $worksheetRows,'&#xa;',
                                  $semanticErrors )"/>
          </xsl:if>
        </xsl:for-each>
      </analysis>
    </xsl:for-each>
  </xsl:variable>
  <xsl:if test="( some $a in $analysis satisfies normalize-space($a) ) or
                exists($worksheetError)">
    <xsl:result-document href="{document-uri(.)}.errors.txt" method="text">
      <xsl:value-of select="for $each in $worksheetError
                            return concat($each,'&#xa;')" separator=""/>
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

<xs:function>
  <para>Returning the allowed constraint of a constraint</para>
  <xs:param name="old"><para>The old constraint</para></xs:param>
  <xs:param name="new"><para>The new constraint</para></xs:param>
</xs:function>
<xsl:function name="bpc:checkConstraints" as="xsd:boolean">
  <xsl:param name="old" as="xsd:string"/>
  <xsl:param name="new" as="xsd:string"/>
  <xsl:for-each select="$old">
    <xsl:choose>
      <xsl:when test=". = $new">
        <xsl:sequence select="true()"/>
      </xsl:when>
      <xsl:when test=". = '1..1'">
        <xsl:sequence select="false()"/>
      </xsl:when>
      <xsl:when test=". = '0..1'">
        <xsl:sequence select="$new = ('1..1')"/>
      </xsl:when>
      <xsl:when test=". = '1..n'">
        <xsl:analyze-string select="$new" regex="1..(\d+)">
          <xsl:matching-substring>
            <xsl:sequence select="number(regex-group(1))>0"/>
          </xsl:matching-substring>
          <xsl:non-matching-substring>
            <xsl:sequence select="false()"/>
          </xsl:non-matching-substring>
        </xsl:analyze-string>
      </xsl:when>
      <xsl:when test=". = '0..n'">
        <xsl:analyze-string select="$new" regex="(\d+)..((\d+)|n)">
          <xsl:matching-substring>
            <xsl:sequence select="( regex-group(2)='n' or
                                    number(regex-group(2)) >=
                                    number(regex-group(1)) )"/>
          </xsl:matching-substring>
          <xsl:non-matching-substring>
            <xsl:sequence select="false()"/>
          </xsl:non-matching-substring>
        </xsl:analyze-string>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message terminate="yes" 
                     select="'Internal error constraint checking:',$old,$new"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:function>

<xs:variable>
  <para>List of all of the supplemental components</para>
</xs:variable>
<xsl:variable name="bpc:supplemental" as="element(supp)+">
<supp card="1..1">AmountCurrencyIdentifier</supp>
<supp card="0..1">AmountCurrencyCodeListVersionIdentifier</supp>
<supp card="1..1">BinaryObjectMimeCode</supp>
<supp card="0..1">BinaryObjectCharacterSetCode</supp>
<supp card="0..1">BinaryObjectEncodingCode</supp>
<supp card="0..1">BinaryObjectFilenameText</supp>
<supp card="0..1">BinaryObjectFormatText</supp>
<supp card="0..1">BinaryObjectUniformResourceIdentifier</supp>
<supp card="0..1">LanguageIdentifier</supp>
<supp card="0..1">CodeListAgencyIdentifier</supp>
<supp card="0..1">CodeListAgencyNameText</supp>
<supp card="0..1">CodeListIdentifier</supp>
<supp card="0..1">CodeListNameText</supp>
<supp card="0..1">CodeListSchemeUniformResourceIdentifier</supp>
<supp card="0..1">CodeListUniformResourceIdentifier</supp>
<supp card="0..1">CodeListVersionIdentifier</supp>
<supp card="0..1">CodeNameText</supp>
<supp card="0..1">IdentificationSchemeAgencyIdentifier</supp>
<supp card="0..1">IdentificationSchemeAgencyNameText</supp>
<supp card="0..1">IdentificationSchemeDataUniformResourceIdentifier</supp>
<supp card="0..1">IdentificationSchemeIdentifier</supp>
<supp card="0..1">IdentificationSchemeNameText</supp>
<supp card="0..1">IdentificationSchemeUniformResourceIdentifier</supp>
<supp card="0..1">IdentificationSchemeVersionIdentifier</supp>
<supp card="1..1">MeasureUnitCode</supp>
<supp card="0..1">MeasureUnitCodeListVersionIdentifier</supp>
<supp card="0..1">NumericFormatText</supp>
<supp card="0..1">QuantityUnitCode</supp>
<supp card="0..1">QuantityUnitCodeListAgencyIdentifier</supp>
<supp card="0..1">QuantityUnitCodeListAgencyNameText</supp>
<supp card="0..1">QuantityUnitCodeListIdentifier</supp>
<supp card="0..1">LanguageLocaleIdentifier</supp>
</xsl:variable>
  
</xsl:stylesheet>