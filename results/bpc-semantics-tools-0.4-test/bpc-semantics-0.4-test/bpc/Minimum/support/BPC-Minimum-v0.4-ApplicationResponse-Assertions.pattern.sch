<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">
  <title>BPC Schematron Expressions for process Minimum v0.4 - test from worksheet Application Response</title>


   <!--Generated assertions from spreadsheet worksheet Application Response for customization Minimum-->
   <!--Cited code lists in the assertions:

-->
   <rule context="/ApplicationResponse:ApplicationResponse (:NABT-1002 NABT-1003 NABT-1004 NABT-1014 Row 3 4 5 15 Tab 'Application Response':)">
      <assert test="count(cbc:UBLVersionID) = 1 (:NABT-1002 Row 3 Tab 'Application Response':)">Missing declaration of the version of UBL (:NABT-1002 Row 3 Tab 'Application Response':)</assert>
      <assert test="normalize-space(cbc:CustomizationID) = 'urn:oasis:names:specification:ubl:schema:xsd:ApplicationResponse-2::ApplicationResponse##bpc-0.4-message-level-response' (:NABT-1003 Row 4 Tab 'Application Response':)">Missing or invalid customization identifier (:NABT-1003 Row 4 Tab 'Application Response':)</assert>
      <assert test="normalize-space(cbc:ProfileID) = 'bpc-0.4-response-message#MessageLevelResponse' (:NABT-1004 Row 5 Tab 'Application Response':)">Missing or invalid profile identifier. (:NABT-1004 Row 5 Tab 'Application Response':)</assert>
      <assert test="count( cac:DocumentResponse ) = 1 (:NABT-1014 Row 15 Tab 'Application Response':)">The document to which this information applies is not specified. (:NABT-1014 Row 15 Tab 'Application Response':)</assert>
   </rule>
   <rule context="/ApplicationResponse:ApplicationResponse/cac:SenderParty (:NABT-1008 Row 9 Tab 'Application Response':)">
      <assert test="count(cac:PartyIdentification/cbc:ID) = 1 and count(cac:PartyName/cbc:Name) = 1 (:NABT-1008 Row 9 Tab 'Application Response':)">Missing sender party identification or name (:NABT-1008 Row 9 Tab 'Application Response':)</assert>
   </rule>
   <rule context="/ApplicationResponse:ApplicationResponse/cac:ReceiverParty (:NABT-1011 Row 12 Tab 'Application Response':)">
      <assert test="count(cac:PartyIdentification/cbc:ID) = 1 and count(cac:PartyName/cbc:Name) = 1 (:NABT-1011 Row 12 Tab 'Application Response':)">Missing receiver party identification or name (:NABT-1011 Row 12 Tab 'Application Response':)</assert>
   </rule>
   <rule context="cac:DocumentResponse/cac:Response (:NABT-1015 Row 16 Tab 'Application Response':)">
      <assert test="count(cac:Status) = 1 (:NABT-1015 Row 16 Tab 'Application Response':)">There is not exactly one status. (:NABT-1015 Row 16 Tab 'Application Response':)</assert>
   </rule>
   <rule context="cac:Response/cbc:ResponseCode (:NABT-1016 Row 17 Tab 'Application Response':)">
      <assert test="normalize-space(.) = 'RE' (:NABT-1016 Row 17 Tab 'Application Response':)">The response code value used is not allowed. (:NABT-1016 Row 17 Tab 'Application Response':)</assert>
   </rule>
   <rule context="/ApplicationResponse:ApplicationResponse/cac:DocumentResponse/cac:Response/cac:Status (:NABT-1019 Row 20 Tab 'Application Response':)">
      <assert test="count(cbc:StatusReasonCode) = 1 (:NABT-1019 Row 20 Tab 'Application Response':)">The status reason code is missing. (:NABT-1019 Row 20 Tab 'Application Response':)</assert>
   </rule>
   <rule context="cac:Status/cbc:StatusReasonCode (:NABT-1020 Row 21 Tab 'Application Response':)">
      <assert test="normalize-space(.) = ( 'NV', 'SV', 'BV' ) (:NABT-1020 Row 21 Tab 'Application Response':)">The status reason code value used is not allowed. (:NABT-1020 Row 21 Tab 'Application Response':)</assert>
   </rule>
</pattern>
