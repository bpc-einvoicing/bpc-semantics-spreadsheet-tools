<?xml version="1.0" encoding="US-ASCII"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema"
                xmlns:bpc="urn:X-BPC"
                exclude-result-prefixes="xsd bpc"
                version="2.0">
<!--
    This stylesheet implements the BPC code list rules for version:

    {bpc:title}
    
    Business Payments Coalition Semantics Group - (skeleton:20200922-1340z)
-->

<!--
  Return true or false that the given value is found in the given list.
  
  If the value is an element, then the CCTS metadata is inspected for
  nuanced identification of the list.
  
  If the value is not an element, the value is cast as a string.
-->
<xsl:function name="bpc:codelist" as="xsd:boolean">
  <!--the first argument is the optional singleton value to test-->
  <xsl:param name="item" as="item()?"/>
  <!--the second argument is the identifier of the code list-->
  <xsl:param name="lookupID" as="xsd:string"/>
  <!--the return indicates the value is found in the list; false when the
      value is absent or the listID is not recognized-->
  <xsl:variable name="element" as="element()?">
    <xsl:choose>
      <xsl:when test="$item instance of element()">
        <xsl:sequence select="$item"/>
      </xsl:when>
      <xsl:otherwise>
        <placebo><xsl:value-of select="$item"/></placebo>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:variable>
  <xsl:for-each select="$element">  
    <!--check that the list is recognized-->
    <xsl:choose>
      <xsl:when test="$lookupID='ISO-3166'">
        <xsl:sequence select="bpc:checkCode(.,$lookupID,$bpc:codes-ISO-3166)"/>
      </xsl:when>
      <xsl:otherwise>
        <xsl:message select="'Error: Missing a code list implementation for: ',
                             $lookupID"/>
        <xsl:sequence select="false()"/>
      </xsl:otherwise>
    </xsl:choose>
  </xsl:for-each>
</xsl:function>

<!--========================================================================-->
<!--the following code is generated from genericode files-->

<xsl:function name="bpc:checkCode" as="xsd:boolean">
  <xsl:param name="element" as="element()"/>
  <xsl:param name="lookupID" as="xsd:string"/>
  <xsl:param name="values" as="xsd:string*"/>
  <xsl:variable name="metadata"
                select="$bpc:metdata/codeList[@lookupID=$lookupID]"/>
  <xsl:for-each select="$element">
    <!--this diagnostic code can be engaged changing false() to true()-->
    <xsl:if test="$lookupID='ISO-3166' and false()">
      <xsl:message select="count(@*)"/>
      <xsl:message select="$metadata"/>
      <xsl:message select="(@listID,@schemeID,@unitCodeListID)[1]"/>
      <xsl:message select="$metadata/Identification/LongName[@Identifier='listID']"/>
      <xsl:message select="."/>
      <xsl:message terminate="yes" select="(:1:) exists($metadata) , 
         (:2:) not((@listName,@schemeName)[1]!=$metadata/Identification/LongName[not(@Identifier='listID')]) ,
         (:3:) not((@listID,@schemeID,@unitCodeListID)[1]!=$metadata/Identification/LongName[@Identifier='listID']) ,
         (:4:) not((@listVersionID,@schemeVersionID)[1]!=$metadata/Identification/Version) ,
         (:5:) not((@listSchemeURI,@schemeURI)[1]!=$metadata/Identification/CanonicalUri) ,
         (:6:) not((@listAgencyName,@schemeAgencyName,@unitCodeListAgencyName)[1]!=$metadata/Identification/Agency/LongName) ,
         (:7:) not((@listAgencyID,@schemeAgencyID,@unitCodeListAgencyName)[1]!=$metadata/Identification/Agency/Identifier) , 
         (:8:) ( some $code in $values satisfies normalize-space((@unitCode,.)[1])=$code )                         "/>
    </xsl:if>
    <xsl:sequence select="exists($metadata)
and not((@listName,@schemeName)[1]!=$metadata/Identification/LongName[not(@Identifier='listID')])
and not((@listID,@schemeID,@unitCodeListID)[1]!=$metadata/Identification/LongName[@Identifier='listID'])
and not((@listVersionID,@schemeVersionID)[1]!=$metadata/Identification/Version)
and not((@listSchemeURI,@schemeURI)[1]!=$metadata/Identification/CanonicalUri)
and not((@listAgencyName,@schemeAgencyName,@unitCodeListAgencyName)[1]!=$metadata/Identification/Agency/LongName)
and not((@listAgencyID,@schemeAgencyID,@unitCodeListAgencyName)[1]!=$metadata/Identification/Agency/Identifier)
and ( some $code in $values satisfies normalize-space((@unitCode,.)[1])=$code )
                        "/>
  </xsl:for-each>
</xsl:function>

<xsl:variable name="bpc:metdata" as="element(codeLists)">
  <codeLists>
    <codeList lookupID="ISO-3166" file="raw/codelists/ISO-3166.gc">
     <Identification>
        <ShortName>CountryIdentificationCode</ShortName>
        <LongName xml:lang="en">Country Identification Code</LongName>
        <LongName Identifier="listID">ISO 3166</LongName>
        <Version>2020-04-17</Version>
        <CanonicalUri>urn:iso:std:iso:3166</CanonicalUri>
        <CanonicalVersionUri>urn:iso:std:iso:3166:2020-04-17</CanonicalVersionUri>
        <LocationUri>http://docs.oasis-open.org/ubl/os-UBL-2.3/cl/gc/default/CountryIdentificationCode-2.3.gc</LocationUri>
        <AlternateFormatLocationUri MimeType="text/html">https://www.iso.org/obp/ui/#search/code/</AlternateFormatLocationUri>
        <Agency>
           <LongName xml:lang="en">International Organization for Standardization</LongName>
           <Identifier Identifier="http://www.unece.org/trade/untdid/d18a/tred/tred3055.htm">5</Identifier>
        </Agency>
     </Identification>
    </codeList>
  </codeLists>
</xsl:variable>

<xsl:variable name="bpc:codes-ISO-3166" as="xsd:string*"
              select="'CA','US'"/>

</xsl:stylesheet>
