<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">
  <title>BPC Schematron Expressions for process Minimum v0.4 - test from worksheet Invoice, Credit Note</title>


   <!--Generated assertions from spreadsheet worksheet Invoice, Credit Note for customization Minimum-->
   <!--Cited code lists in the assertions:

IANA-Media-Types
ISO-3166
ISO-4217
UNECE-1373
UNECE-4461
UNECE-5153
UNECE-5189
UNECE-5305
UNECE-Rec-20-21
-->
   <rule context="/Invoice:Invoice (:NABT-999 NABT-005 NABT-013 NABT-022 NABT-023 NABT-024 NABG-005 NABG-007 NABG-023 Row 2 9 14 30 38 40 58 106 194 Tab 'Invoice, Credit Note':)">
      <assert test="count(cbc:UBLVersionID) = 1 (:NABT-999 Row 2 Tab 'Invoice, Credit Note':)">Missing declaration of the version of UBL (:NABT-999 Row 2 Tab 'Invoice, Credit Note':)</assert>
      <assert test="bpc:codelist(cbc:DocumentCurrencyCode,'ISO-4217') (:NABT-005 Row 9 Tab 'Invoice, Credit Note':)">Document Currency Code not specified or value specified is not allowed. (:NABT-005 Row 9 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:OrderReference/cbc:ID) &lt;= 1 (:NABT-013 Row 14 Tab 'Invoice, Credit Note':)">Purchase order reference cannot be specified more than once. (:NABT-013 Row 14 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cbc:Note) &lt;=1 (:NABT-022 Row 30 Tab 'Invoice, Credit Note':)">More than one invoice note exists. (:NABT-022 Row 30 Tab 'Invoice, Credit Note':)</assert>
      <assert test="normalize-space(cbc:ProfileID) = 'bpc-0.4-process#Invoice' (:NABT-023 Row 38 Tab 'Invoice, Credit Note':)">Business process type not specified or value specified is not valid. (:NABT-023 Row 38 Tab 'Invoice, Credit Note':)</assert>
      <assert test="normalize-space(cbc:CustomizationID) = 'urn:oasis:names:specification:ubl:schema:xsd:Invoice-2::Invoice##bpc-0.4-data-Minimum' (:NABT-024 Row 40 Tab 'Invoice, Credit Note':)">Specification Identifier not specified or value specified is not valid. (:NABT-024 Row 40 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress) = 1 (:NABG-005 Row 58 Tab 'Invoice, Credit Note':)">Supplier - Accounts Receivable Party not specified, or Postal Address is not specified, or either exists more than once. (:NABG-005 Row 58 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cac:AccountingCustomerParty)= 1 (:NABG-007 Row 106 Tab 'Invoice, Credit Note':)">Customer - Accounts Payable is not specified or exists more than once. (:NABG-007 Row 106 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count( cac:TaxTotal ) &lt;= 1 (:NABG-023 Row 194 Tab 'Invoice, Credit Note':)">Too many tax total information items (:NABG-023 Row 194 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:AccountingSupplierParty (:NABG-004 NABT-028 NABT-029 Row 47 49 50 Tab 'Invoice, Credit Note':)">
      <assert test="count (cac:Party) = 1 (:NABG-004 Row 47 Tab 'Invoice, Credit Note':)">Supplier - Accounts Receivable is not specified or exists more than once. (:NABG-004 Row 47 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:Party/cac:PartyName/cbc:Name) = 1 (:NABT-028 Row 49 Tab 'Invoice, Credit Note':)">Fewer or more than one trading name. (:NABT-028 Row 49 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:Party/cac:PartyIdentification/cbc:ID) = 1 (:NABT-029 Row 50 Tab 'Invoice, Credit Note':)">Fewer or more than one party identifier. (:NABT-029 Row 50 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)">
      <assert test="count (@schemeID ) = 1 (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)">Scheme Identifier does not exist when Supplier - Accounts Receivable Identifier is provided. (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)">Supplier - Accounts Receivable Contact Country Code is not specified or exists more than once. (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:AccountingCustomerParty (:NABT-045 NABT-046 Row 108 109 Tab 'Invoice, Credit Note':)">
      <assert test="count(cac:Party/cac:PartyName/cbc:Name) = 1 (:NABT-045 Row 108 Tab 'Invoice, Credit Note':)">Fewer or more than one trading name. (:NABT-045 Row 108 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:Party/cac:PartyIdentification/cbc:ID) = 1 (:NABT-046 Row 109 Tab 'Invoice, Credit Note':)">Fewer or more than one party identifier. (:NABT-046 Row 109 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)">
      <assert test="count( @schemeID ) = 1 (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)">The scheme of the party identifier is missing. (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)">Customer - Accounts Payable Country Code is not valid. (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:PaymentMeans (:NABT-081 Row 142 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(cbc:PaymentMeansCode,'UNECE-4461') (:NABT-081 Row 142 Tab 'Invoice, Credit Note':)">Invalid payment method type code. (:NABT-081 Row 142 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:PaymentMeans/cbc:PaymentMeansCode (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)">
      <assert test="if (some $code in (17, 18, 28, 29, 30, 32, 33, 35, 36, 39, 40, 41, 43, 48, 49) satisfies normalize-space(.) = string($code) ) then count (../cac:PayeeFinancialAccount/cbc:ID) = 1 else true() (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)">Missing required Payment Account Identifier for the payment means that requires an account. (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount (:NABT-084 NABT-086 Row 148 150 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:ID) = 1 (:NABT-084 Row 148 Tab 'Invoice, Credit Note':)">Payment Account Identifier is missing. (:NABT-084 Row 148 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cac:FinancialInstitutionBranch/cbc:ID) = 1 (:NABT-086 Row 150 Tab 'Invoice, Credit Note':)">The financial branch identifier is missing. (:NABT-086 Row 150 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:AllowanceCharge (:NABT-097 NABT-104 Row 167 177 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:AllowanceChargeReason) &gt;= 1 or count (cbc:AllowanceChargeReasonCode) = 1 (:NABT-097 Row 167 Tab 'Invoice, Credit Note':)">Missing Discount Reason and/or Discount Reason Code. (:NABT-097 Row 167 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cbc:AllowanceChargeReason) &gt;= 1 or count(cbc:AllowanceChargeReasonCode) = 1 (:NABT-104 Row 177 Tab 'Invoice, Credit Note':)">Missing Charge Reason and/or Charge Reason Code when document level Charge information is provided. (:NABT-104 Row 177 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:AllowanceCharge/cac:TaxCategory (:NABT-102 Row 174 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-102 Row 174 Tab 'Invoice, Credit Note':)">Invalid Document level charge tax category code. (:NABT-102 Row 174 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-950 Row 176 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(.,'UNECE-5153') (:NABT-950 Row 176 Tab 'Invoice, Credit Note':)">Tax Scheme value specified is invalid. (:NABT-950 Row 176 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:LegalMonetaryTotal (:NABG-022 NABT-109 NABT-112 Row 179 183 188 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:LineExtensionAmount) = 1 (:NABG-022 Row 179 Tab 'Invoice, Credit Note':)">Sum of invoice line net amount is not specified. (:NABG-022 Row 179 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cbc:TaxExclusiveAmount) = 1 (:NABT-109 Row 183 Tab 'Invoice, Credit Note':)">Missing the Invoice total amount without tax. (:NABT-109 Row 183 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cbc:TaxInclusiveAmount) = 1 (:NABT-112 Row 188 Tab 'Invoice, Credit Note':)">Missing the Invoice total amount with tax. (:NABT-112 Row 188 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)">
      <assert test="if( . &gt; 0 ) then ( count( /*/cbc:DueDate )&gt;0 or count( /*/cac:PaymentTerms/cbc:Note )&gt;0 ) else true() (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)">The Amount due for Payment is positive, but neither the Payment Due Date or Payment Terms exists. (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:TaxTotal[1] (:NABG-023 Row 195 Tab 'Invoice, Credit Note':)">
      <assert test="count( cac:TaxSubtotal ) &gt;= 1 (:NABG-023 Row 195 Tab 'Invoice, Credit Note':)">Missing Tax Breakdown information. (:NABG-023 Row 195 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:TaxCategory (:NABT-118 Row 200 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-118 Row 200 Tab 'Invoice, Credit Note':)">Tax category code not specified or value specified is invalid. (:NABT-118 Row 200 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/Invoice:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(.,'UNECE-5153') (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)">Tax Scheme value specified is invalid. (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:InvoiceLine (:NABT-129 NABG-029 Row 223 270 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:InvoicedQuantity) =1 (:NABT-129 Row 223 Tab 'Invoice, Credit Note':)">Invoiced quantity is not specified or exists more than once. (:NABT-129 Row 223 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cac:Price) = 1 (:NABG-029 Row 270 Tab 'Invoice, Credit Note':)">Price Details is not specified or exists more than once. (:NABG-029 Row 270 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:CreditNoteLine (:NABT-129 Row 224 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:CreditedQuantity) =1 (:NABT-129 Row 224 Tab 'Invoice, Credit Note':)">Credited quantity is not specified or exists more than once. (:NABT-129 Row 224 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:InvoiceLine/cac:Item (:NABT-153 Row 292 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:Name) = 1 (:NABT-153 Row 292 Tab 'Invoice, Credit Note':)">Item Name is not specified or exists more than once. (:NABT-153 Row 292 Tab 'Invoice, Credit Note':)</assert>
   </rule>
</pattern>
