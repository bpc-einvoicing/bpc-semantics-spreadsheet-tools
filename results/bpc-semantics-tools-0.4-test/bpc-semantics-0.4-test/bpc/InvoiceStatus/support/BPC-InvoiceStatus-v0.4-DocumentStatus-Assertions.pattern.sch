<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">
  <title>BPC Schematron Expressions for process InvoiceStatus v0.4 - test from worksheet Document Status</title>


   <!--Generated assertions from spreadsheet worksheet Document Status for customization InvoiceStatus-->
   <!--Cited code lists in the assertions:

-->
   <rule context="/DocumentStatus:DocumentStatus (:NABT-2002 NABT-2003 NABT-2004 NABT-2008 NABT-2011 Row 3 4 6 11 14 Tab 'Document Status':)">
      <assert test="count(cbc:UBLVersionID) = 1 (:NABT-2002 Row 3 Tab 'Document Status':)">Missing declaration of the version of UBL (:NABT-2002 Row 3 Tab 'Document Status':)</assert>
      <assert test="normalize-space(cbc:CustomizationID) = 'urn:oasis:names:specification:ubl:schema:xsd:DocumentStatus-2::DocumentStatus##bpc-0.4-data-InvoiceStatus' (:NABT-2003 Row 4 Tab 'Document Status':)">Missing or invalid customization identifier (:NABT-2003 Row 4 Tab 'Document Status':)</assert>
      <assert test="normalize-space(cbc:ProfileID) = 'bpc-0.4-process#InvoiceStatus' (:NABT-2004 Row 6 Tab 'Document Status':)">Missing or invalid profile identifier (:NABT-2004 Row 6 Tab 'Document Status':)</assert>
      <assert test="count(cac:SenderParty/cac:PartyIdentification/cbc:ID) = 1 and count(cac:SenderParty/cac:PartyName/cbc:Name) = 1 (:NABT-2008 Row 11 Tab 'Document Status':)">Missing sender party identification or name (:NABT-2008 Row 11 Tab 'Document Status':)</assert>
      <assert test="count(cac:ReceiverParty/cac:PartyIdentification/cbc:ID) = 1 and count(cac:ReceiverParty/cac:PartyName/cbc:Name) = 1 (:NABT-2011 Row 14 Tab 'Document Status':)">Missing receiver party identification or name (:NABT-2011 Row 14 Tab 'Document Status':)</assert>
   </rule>
   <rule context="cac:DocumentResponse/cac:Response (:NABT-2015 Row 18 Tab 'Document Status':)">
      <assert test="count(cbc:ResponseCode) = 1 (:NABT-2015 Row 18 Tab 'Document Status':)">The response code is missing. (:NABT-2015 Row 18 Tab 'Document Status':)</assert>
   </rule>
   <rule context="cac:Response/cbc:ResponseCode (:NABT-2016 Row 19 Tab 'Document Status':)">
      <assert test=". = ( 'AB','IP','UQ','CA','RE','AP','PD' ) (:NABT-2016 Row 19 Tab 'Document Status':)">The response code is invalid. (:NABT-2016 Row 19 Tab 'Document Status':)</assert>
   </rule>
   <rule context="cac:Response/cac:Status (:NABT-2019 Row 23 Tab 'Document Status':)">
      <assert test="count(cbc:StatusReasonCode) = 1 or count(cbc:StatusReason) &gt; 0 (:NABT-2019 Row 23 Tab 'Document Status':)">The status reason is missing in either coded or text format. (:NABT-2019 Row 23 Tab 'Document Status':)</assert>
   </rule>
</pattern>
