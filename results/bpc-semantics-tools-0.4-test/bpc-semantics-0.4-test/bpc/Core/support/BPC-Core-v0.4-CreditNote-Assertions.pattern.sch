<?xml version="1.0" encoding="UTF-8"?>
<pattern xmlns="http://purl.oclc.org/dsdl/schematron">
  <title>BPC Schematron Expressions for process Core v0.4 - test from worksheet Invoice, Credit Note</title>


   <!--Generated assertions from spreadsheet worksheet Invoice, Credit Note for customization Core-->
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
   <rule context="/CreditNote:CreditNote (:NABT-999 NABT-003 NABT-005 NABT-011 NABT-012 NABT-013 NABT-022 NABG-014 NABT-023 NABT-024 NABG-005 NABG-007 NABT-090 NABG-023 Row 2 7 9 12 13 14 30 32 38 41 58 106 157 194 Tab 'Invoice, Credit Note':)">
      <assert test="count(cbc:UBLVersionID) = 1 (:NABT-999 Row 2 Tab 'Invoice, Credit Note':)">Missing declaration of the version of UBL (:NABT-999 Row 2 Tab 'Invoice, Credit Note':)</assert>
      <assert test="normalize-space(cbc:CreditNoteTypeCode) = ('380','381') (:NABT-003 Row 7 Tab 'Invoice, Credit Note':)">Invoice Type Code not specified or value specified is not allowed. (:NABT-003 Row 7 Tab 'Invoice, Credit Note':)</assert>
      <assert test="bpc:codelist(cbc:DocumentCurrencyCode,'ISO-4217') (:NABT-005 Row 9 Tab 'Invoice, Credit Note':)">Document Currency Code not specified or value specified is not allowed. (:NABT-005 Row 9 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:ProjectReference/cbc:ID) &lt;= 1 (:NABT-011 Row 12 Tab 'Invoice, Credit Note':)">More than one project reference exists. (:NABT-011 Row 12 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:ContractDocumentReference/cbc:ID) &lt;= 1 (:NABT-012 Row 13 Tab 'Invoice, Credit Note':)">More than one contract number exists. (:NABT-012 Row 13 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:OrderReference/cbc:ID) &lt;= 1 (:NABT-013 Row 14 Tab 'Invoice, Credit Note':)">Purchase order reference cannot be specified more than once. (:NABT-013 Row 14 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cbc:Note) &lt;=1 (:NABT-022 Row 30 Tab 'Invoice, Credit Note':)">More than one invoice note exists. (:NABT-022 Row 30 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:InvoicePeriod) &lt;= 1 (:NABG-014 Row 32 Tab 'Invoice, Credit Note':)">More than one invoiced object identifier exists. (:NABG-014 Row 32 Tab 'Invoice, Credit Note':)</assert>
      <assert test="normalize-space(cbc:ProfileID) = 'bpc-0.4-process#CreditNote' (:NABT-023 Row 38 Tab 'Invoice, Credit Note':)">Business process type not specified or value specified is not valid. (:NABT-023 Row 38 Tab 'Invoice, Credit Note':)</assert>
      <assert test="normalize-space(cbc:CustomizationID) = 'urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2::CreditNote##bpc-0.4-data-Core' (:NABT-024 Row 41 Tab 'Invoice, Credit Note':)">Specification Identifier not specified or value specified is not valid. (:NABT-024 Row 41 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress) = 1 (:NABG-005 Row 58 Tab 'Invoice, Credit Note':)">Supplier - Accounts Receivable Party not specified, or Postal Address is not specified, or either exists more than once. (:NABG-005 Row 58 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cac:AccountingCustomerParty)= 1 (:NABG-007 Row 106 Tab 'Invoice, Credit Note':)">Customer - Accounts Payable is not specified or exists more than once. (:NABG-007 Row 106 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cac:PayeeParty/cac:PartyIdentification/cbc:ID) &lt;= 1 (:NABT-090 Row 157 Tab 'Invoice, Credit Note':)">More than one Bank Assigned Creditor Identifier exists. (:NABT-090 Row 157 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count( cac:TaxTotal ) &lt;= 1 (:NABG-023 Row 194 Tab 'Invoice, Credit Note':)">Too many tax total information items (:NABG-023 Row 194 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:PaymentTerms (:NABG-999 Row 22 Tab 'Invoice, Credit Note':)">
      <assert test="if( count( cbc:SettlementDiscountPercent ) &gt; 0 or count( cbc:SettlementDiscountAmount ) &gt; 0 or count( cbc:Amount ) &gt; 0 ) then ( count( cbc:SettlementDiscountPercent ) = 1 and count( cbc:SettlementDiscountAmount ) = 1 and count( cbc:Amount ) = 1 ) else true() (:NABG-999 Row 22 Tab 'Invoice, Credit Note':)">Payment Terms Discount Percent, Payment Terms Discount Amount or Basis for Terms Discount do not exist when one of the terms is provided. (:NABG-999 Row 22 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:InvoicePeriod (:NABT-073 NABT-074 Row 33 35 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:StartDate) = 1 and count (cbc:EndDate) = 1 (:NABT-073 Row 33 Tab 'Invoice, Credit Note':)">Missing Invoicing Period Start Date and/or Invoicing Period End Date. (:NABT-073 Row 33 Tab 'Invoice, Credit Note':)</assert>
      <assert test="if ( count(cbc:StartTime) = 0 and count(cbc:EndTime) = 0 ) then (:date, no time:) ( dateTime(cbc:EndDate,xsd:time('00:00:00')) &gt;= dateTime(cbc:StartDate,xsd:time('00:00:00')) ) else if ( count(cbc:StartTime) =1 and count(cbc:EndTime) = 1 ) then (:date and time:) ( dateTime(cbc:EndDate,cbc:EndTime) &gt;= dateTime(cbc:StartDate,cbc:StartTime) ) else false() (:NABT-074 Row 35 Tab 'Invoice, Credit Note':)">Invoicing Period is incomplete or the end is before the Invoicing Period start. (:NABT-074 Row 35 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference (:NABT-025 Row 44 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:ID) = 1 (:NABT-025 Row 44 Tab 'Invoice, Credit Note':)">Preceding Invoice Number is not specified or exists more than once if Preceding Invoice Reference is provided. (:NABT-025 Row 44 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:AccountingSupplierParty (:NABG-004 NABT-028 NABT-029 Row 47 49 50 Tab 'Invoice, Credit Note':)">
      <assert test="count (cac:Party) = 1 (:NABG-004 Row 47 Tab 'Invoice, Credit Note':)">Supplier - Accounts Receivable is not specified or exists more than once. (:NABG-004 Row 47 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:Party/cac:PartyName/cbc:Name) = 1 (:NABT-028 Row 49 Tab 'Invoice, Credit Note':)">Fewer or more than one trading name. (:NABT-028 Row 49 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:Party/cac:PartyIdentification/cbc:ID) = 1 (:NABT-029 Row 50 Tab 'Invoice, Credit Note':)">Fewer or more than one party identifier. (:NABT-029 Row 50 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)">
      <assert test="count (@schemeID ) = 1 (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)">Scheme Identifier does not exist when Supplier - Accounts Receivable Identifier is provided. (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party (:NABT-030 Row 52 Tab 'Invoice, Credit Note':)">
      <assert test="count (cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1 (:NABT-030 Row 52 Tab 'Invoice, Credit Note':)">More than one Supplier - Accounts Receivable Legal Registration Identifier exists. (:NABT-030 Row 52 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-030-1 Row 53 Tab 'Invoice, Credit Note':)">
      <assert test="count (@schemeID) = 1 (:NABT-030-1 Row 53 Tab 'Invoice, Credit Note':)">Scheme Identifier does not exist when Supplier - Accounts ReceivableLegal Registration Identifier is provided. (:NABT-030-1 Row 53 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID (:NABT-34-1 Row 57 Tab 'Invoice, Credit Note':)">
      <assert test="count(@schemeID) =1 (:NABT-34-1 Row 57 Tab 'Invoice, Credit Note':)">Supplier - Seller electronic address scheme identifier is not specified or exists more than once if Supplier - Seller electronic address is provided. (:NABT-34-1 Row 57 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)">Supplier - Accounts Receivable Contact Country Code is not specified or exists more than once. (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:PayeeParty (:NABT-59 NABT-60 NABT-61 Row 70 71 73 Tab 'Invoice, Credit Note':)">
      <assert test="count(cac:PartyName/cbc:Name) = 1 (:NABT-59 Row 70 Tab 'Invoice, Credit Note':)">Fewer or more than one payee party name. (:NABT-59 Row 70 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:PartyIdentification/cbc:ID) = 1 (:NABT-60 Row 71 Tab 'Invoice, Credit Note':)">Fewer or more than one payee party identifier. (:NABT-60 Row 71 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1 (:NABT-61 Row 73 Tab 'Invoice, Credit Note':)">More than one Supplier - payee legal registration identifier exists. (:NABT-61 Row 73 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID (:NABT-60-1 Row 72 Tab 'Invoice, Credit Note':)">
      <assert test="count (@schemeID) = 1 (:NABT-60-1 Row 72 Tab 'Invoice, Credit Note':)">Scheme Identifier does not exist when Supplier - payee Identifier is provided. (:NABT-60-1 Row 72 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID (:NABT-61-1 Row 74 Tab 'Invoice, Credit Note':)">
      <assert test="count (@schemeID) = 1 (:NABT-61-1 Row 74 Tab 'Invoice, Credit Note':)">Scheme Identifier does not exist when Supplier - payee Legal Registration Identifier is provided. (:NABT-61-1 Row 74 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:PayeeParty/cac:PostalAddress (:NABT-981 Row 80 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-981 Row 80 Tab 'Invoice, Credit Note':)">Supplier- Payee Country Code does not exist exactly once when Supplier - Payee Postal Address is provided. Supplier - Payee Country Code not specified or value specified is invalid. (:NABT-981 Row 80 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:SellerSupplierParty (:NABT-976 NABT-975 NABT-974 NABT-972 Row 87 88 89 91 Tab 'Invoice, Credit Note':)">
      <assert test="count(cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) = 1 (:NABT-976 Row 87 Tab 'Invoice, Credit Note':)">Seller name is not specified or exists more than once. (:NABT-976 Row 87 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:Party/cac:PartyName/cbc:Name) &lt;= 1 (:NABT-975 Row 88 Tab 'Invoice, Credit Note':)">More than one Supplier - Seller Trading Name exists. (:NABT-975 Row 88 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:Party/cac:PartyIdentification/cbc:ID) &lt;= 1 (:NABT-974 Row 89 Tab 'Invoice, Credit Note':)">More than one Supplier - Seller Identifier exists. (:NABT-974 Row 89 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1 (:NABT-972 Row 91 Tab 'Invoice, Credit Note':)">More than one Supplier - Seller legal registration identifier exists. (:NABT-972 Row 91 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-973 Row 90 Tab 'Invoice, Credit Note':)">
      <assert test="count (@schemeID) = 1 (:NABT-973 Row 90 Tab 'Invoice, Credit Note':)">Scheme Identifier does not exist when Supplier - Seller Identifier is provided. (:NABT-973 Row 90 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-971 Row 92 Tab 'Invoice, Credit Note':)">
      <assert test="count (@schemeID) = 1 (:NABT-971 Row 92 Tab 'Invoice, Credit Note':)">Scheme Identifier does not exist when Supplier - Seller Legal Registration Identifier is provided. (:NABT-971 Row 92 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:EndpointID (:NABT-969 Row 94 Tab 'Invoice, Credit Note':)">
      <assert test="count(@schemeID) =1 (:NABT-969 Row 94 Tab 'Invoice, Credit Note':)">Supplier - Seller electronic address scheme identifier is not specified or exists more than once if Supplier - Seller electronic address is provided. (:NABT-969 Row 94 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress (:NABT-964 Row 100 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-964 Row 100 Tab 'Invoice, Credit Note':)">Supplier- Seller Country Code does not exist exactly once when Supplier - Seller Postal Address is provided. Supplier - Seller Country Code not specified or value specified is invalid. (:NABT-964 Row 100 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:AccountingCustomerParty (:NABT-045 NABT-046 NABT-047 Row 108 109 111 Tab 'Invoice, Credit Note':)">
      <assert test="count(cac:Party/cac:PartyName/cbc:Name) = 1 (:NABT-045 Row 108 Tab 'Invoice, Credit Note':)">Fewer or more than one trading name. (:NABT-045 Row 108 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cac:Party/cac:PartyIdentification/cbc:ID) = 1 (:NABT-046 Row 109 Tab 'Invoice, Credit Note':)">Fewer or more than one party identifier. (:NABT-046 Row 109 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1 (:NABT-047 Row 111 Tab 'Invoice, Credit Note':)">More than one Customer - Accounts Payable Legal Registration Identifier exists. (:NABT-047 Row 111 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)">
      <assert test="count( @schemeID ) = 1 (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)">The scheme of the party identifier is missing. (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-047-1 Row 112 Tab 'Invoice, Credit Note':)">
      <assert test="count (@schemeID) = 1 (:NABT-047-1 Row 112 Tab 'Invoice, Credit Note':)">Scheme Identifier does not exist when Supplier - Accounts Payable Legal Registration Identifier is provided. (:NABT-047-1 Row 112 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID (:NABT-049-1 Row 115 Tab 'Invoice, Credit Note':)">
      <assert test="count (@schemeID) = 1 (:NABT-049-1 Row 115 Tab 'Invoice, Credit Note':)">Customer - Accounts Payable Electronic Address Scheme Identifier is not specified or exists more than once when Electronic Address is provided. (:NABT-049-1 Row 115 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)">Customer - Accounts Payable Country Code is not valid. (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:Delivery (:NABT-070 Row 129 Tab 'Invoice, Credit Note':)">
      <assert test="count (cac:DeliveryParty/cac:PartyName/cbc:Name) &lt;= 1 (:NABT-070 Row 129 Tab 'Invoice, Credit Note':)">More than one Deliver to party name exists. (:NABT-070 Row 129 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address (:NABT-080 Row 140 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-080 Row 140 Tab 'Invoice, Credit Note':)">Deliver to Country Code is invalid. (:NABT-080 Row 140 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:PaymentMeans (:NABT-081 NABT-083 Row 142 146 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(cbc:PaymentMeansCode,'UNECE-4461') (:NABT-081 Row 142 Tab 'Invoice, Credit Note':)">Invalid payment method type code. (:NABT-081 Row 142 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cbc:PaymentID) &lt;= 1 (:NABT-083 Row 146 Tab 'Invoice, Credit Note':)">More than one remittance requirement information entry exists. (:NABT-083 Row 146 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)">
      <assert test="if (some $code in (17, 18, 28, 29, 30, 32, 33, 35, 36, 39, 40, 41, 43, 48, 49) satisfies normalize-space(.) = string($code) ) then count (../cac:PayeeFinancialAccount/cbc:ID) = 1 else true() (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)">Missing required Payment Account Identifier for the payment means that requires an account. (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount (:NABT-084 NABT-086 Row 148 150 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:ID) = 1 (:NABT-084 Row 148 Tab 'Invoice, Credit Note':)">Payment Account Identifier is missing. (:NABT-084 Row 148 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cac:FinancialInstitutionBranch/cbc:ID) = 1 (:NABT-086 Row 150 Tab 'Invoice, Credit Note':)">The financial branch identifier is missing. (:NABT-086 Row 150 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:TaxCategory (:NABT-095 NABT-118 NABT-927 Row 164 200 251 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-095 Row 164 Tab 'Invoice, Credit Note':)">Document level discount tax category code is invalid. (:NABT-095 Row 164 Tab 'Invoice, Credit Note':)</assert>
      <assert test="bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-118 Row 200 Tab 'Invoice, Credit Note':)">Tax category code not specified or value specified is invalid. (:NABT-118 Row 200 Tab 'Invoice, Credit Note':)</assert>
      <assert test="bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-927 Row 251 Tab 'Invoice, Credit Note':)">Tax Category Code is not specified or specified value is invalid. (:NABT-927 Row 251 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:AllowanceCharge/cac:TaxCategory (:NABT-096 NABT-102 Row 165 174 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:Percent) &lt;= 1 (:NABT-096 Row 165 Tab 'Invoice, Credit Note':)">More than one document level discount tax rate exists. (:NABT-096 Row 165 Tab 'Invoice, Credit Note':)</assert>
      <assert test="bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-102 Row 174 Tab 'Invoice, Credit Note':)">Invalid Document level charge tax category code. (:NABT-102 Row 174 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-952 NABT-950 Row 166 176 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(.,'UNECE-5153') (:NABT-952 Row 166 Tab 'Invoice, Credit Note':)">Tax Scheme value specified is invalid. (:NABT-952 Row 166 Tab 'Invoice, Credit Note':)</assert>
      <assert test="bpc:codelist(.,'UNECE-5153') (:NABT-950 Row 176 Tab 'Invoice, Credit Note':)">Tax Scheme value specified is invalid. (:NABT-950 Row 176 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:AllowanceCharge (:NABT-097 NABT-104 Row 167 177 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:AllowanceChargeReason) &gt;= 1 or count (cbc:AllowanceChargeReasonCode) = 1 (:NABT-097 Row 167 Tab 'Invoice, Credit Note':)">Missing Discount Reason and/or Discount Reason Code. (:NABT-097 Row 167 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count(cbc:AllowanceChargeReason) &gt;= 1 or count(cbc:AllowanceChargeReasonCode) = 1 (:NABT-104 Row 177 Tab 'Invoice, Credit Note':)">Missing Charge Reason and/or Charge Reason Code when document level Charge information is provided. (:NABT-104 Row 177 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:LegalMonetaryTotal (:NABG-022 NABT-109 NABT-112 Row 179 183 188 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:LineExtensionAmount) = 1 (:NABG-022 Row 179 Tab 'Invoice, Credit Note':)">Sum of invoice line net amount is not specified. (:NABG-022 Row 179 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cbc:TaxExclusiveAmount) = 1 (:NABT-109 Row 183 Tab 'Invoice, Credit Note':)">Missing the Invoice total amount without tax. (:NABT-109 Row 183 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cbc:TaxInclusiveAmount) = 1 (:NABT-112 Row 188 Tab 'Invoice, Credit Note':)">Missing the Invoice total amount with tax. (:NABT-112 Row 188 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:LegalMonetaryTotal/cbc:PayableAmount (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)">
      <assert test="if( . &gt; 0 ) then ( count( /*/cbc:DueDate )&gt;0 or count( /*/cac:PaymentTerms/cbc:Note )&gt;0 ) else true() (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)">The Amount due for Payment is positive, but neither the Payment Due Date or Payment Terms exists. (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:TaxTotal[1] (:NABG-023 Row 195 Tab 'Invoice, Credit Note':)">
      <assert test="count( cac:TaxSubtotal ) &gt;= 1 (:NABG-023 Row 195 Tab 'Invoice, Credit Note':)">Missing Tax Breakdown information. (:NABG-023 Row 195 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:TaxTotal/cac:TaxSubtotal (:NABT-116 NABT-120 Row 198 202 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:TaxableAmount) =1 (:NABT-116 Row 198 Tab 'Invoice, Credit Note':)">Tax Category taxable amount is not specified or exists more than once. (:NABT-116 Row 198 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cac:TaxCategory/cbc:TaxExemptionReason) &lt;= 1 (:NABT-120 Row 202 Tab 'Invoice, Credit Note':)">More than one Tax Exemption Reason Text entry exists. (:NABT-120 Row 202 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="/CreditNote:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(.,'UNECE-5153') (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)">Tax Scheme value specified is invalid. (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:CreditNoteLine/cbc.Note (:NABT-127 Row 221 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc.Note) &lt;= 1 (:NABT-127 Row 221 Tab 'Invoice, Credit Note':)">More than one Invoice Line Note exists. (:NABT-127 Row 221 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:InvoiceLine (:NABT-129 Row 223 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:InvoicedQuantity) =1 (:NABT-129 Row 223 Tab 'Invoice, Credit Note':)">Invoiced quantity is not specified or exists more than once. (:NABT-129 Row 223 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:CreditNoteLine (:NABT-129 NABG-990 NABG-026 NABG-029 Row 224 246 253 270 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:CreditedQuantity) =1 (:NABT-129 Row 224 Tab 'Invoice, Credit Note':)">Credited quantity is not specified or exists more than once. (:NABT-129 Row 224 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count( cac:TaxTotal ) &lt;= 1 (:NABG-990 Row 246 Tab 'Invoice, Credit Note':)">Too many tax total information items (:NABG-990 Row 246 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cac:InvoicePeriod) &lt;= 1 (:NABG-026 Row 253 Tab 'Invoice, Credit Note':)">More than one Invoice Period on the line exists. (:NABG-026 Row 253 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cac:Price) = 1 (:NABG-029 Row 270 Tab 'Invoice, Credit Note':)">Price Details is not specified or exists more than once. (:NABG-029 Row 270 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:InvoiceLine/cbc:InvoicedQuantity/@unitCode (:NABT-130 Row 225 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(.,'UNECE-Rec-20-21') (:NABT-130 Row 225 Tab 'Invoice, Credit Note':)">Invoiced quantity unit of measure code not specified or value specified is not valid. (:NABT-130 Row 225 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:CreditNoteLine/cbc:CreditedQuantity/@unitCode (:NABT-130 Row 226 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(.,'UNECE-Rec-20-21') (:NABT-130 Row 226 Tab 'Invoice, Credit Note':)">Credited quantity unit of measure code not specified or value specified is not valid. (:NABT-130 Row 226 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:CreditNoteLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-926 Row 252 Tab 'Invoice, Credit Note':)">
      <assert test="bpc:codelist(.,'UNECE-5153') (:NABT-926 Row 252 Tab 'Invoice, Credit Note':)">Tax Scheme value specified is invalid. (:NABT-926 Row 252 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:CreditNoteLine/cac:InvoicePeriod (:NABT-134 NABT-135 Row 254 255 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:StartDate) = 1 and count (cbc:EndDate) = 1 (:NABT-134 Row 254 Tab 'Invoice, Credit Note':)">Missing Invoice line period start date and/or Invoice Line Period End Date. (:NABT-134 Row 254 Tab 'Invoice, Credit Note':)</assert>
      <assert test="if ( count(cbc:StartTime) = 0 and count(cbc:EndTime) = 0 ) then (:date, no time:) ( dateTime(cbc:EndDate,xsd:time('00:00:00')) &gt;= dateTime(cbc:StartDate,xsd:time('00:00:00')) ) else if ( count(cbc:StartTime) =1 and count(cbc:EndTime) = 1 ) then (:date and time:) ( dateTime(cbc:EndDate,cbc:EndTime) &gt;= dateTime(cbc:StartDate,cbc:StartTime) ) else false() (:NABT-135 Row 255 Tab 'Invoice, Credit Note':)">Missing Invoice line period start date and/or Invoice Line Period End Date. (:NABT-135 Row 255 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:CreditNoteLine/cac:AllowanceCharge (:NABT-139 NABT-144 Row 261 268 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:AllowanceChargeReason) = 1 or count (cbc:AllowanceChargeReasonCode) = 1 (:NABT-139 Row 261 Tab 'Invoice, Credit Note':)">Missing Invoice line discount reason and/or Invoice Line Discount Reason Code. (:NABT-139 Row 261 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cbc:AllowanceChargeReason) = 1 or count (cbc:AllowanceChargeReasonCode) = 1 (:NABT-144 Row 268 Tab 'Invoice, Credit Note':)">Missing Invoice line charge reason and/or Invoice line charge reason code. (:NABT-144 Row 268 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:CreditNoteLine/cac:Price/cac:AllowanceCharge (:NABT-148 Row 275 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:BaseAmount) &lt;= 1 (:NABT-148 Row 275 Tab 'Invoice, Credit Note':)">More than one item gross price exists. (:NABT-148 Row 275 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:BaseAmount (:NABT-148 Row 276 Tab 'Invoice, Credit Note':)">
      <assert test=". &gt;= 0 (:NABT-148 Row 276 Tab 'Invoice, Credit Note':)">Item gross price is negative. (:NABT-148 Row 276 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:ValidityPeriod (:NABT-921 NABT-919 Row 282 284 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:StartDate) = 1 and count (cbc:EndDate) = 1 (:NABT-921 Row 282 Tab 'Invoice, Credit Note':)">The period is missing either the start date and/or the end date. (:NABT-921 Row 282 Tab 'Invoice, Credit Note':)</assert>
      <assert test="if ( count(cbc:StartTime) = 0 and count(cbc:EndTime) = 0 ) then (:date, no time:) ( dateTime(cbc:EndDate,xsd:time('00:00:00')) &gt;= dateTime(cbc:StartDate,xsd:time('00:00:00')) ) else if ( count(cbc:StartTime) =1 and count(cbc:EndTime) = 1 ) then (:date and time:) ( dateTime(cbc:EndDate,cbc:EndTime) &gt;= dateTime(cbc:StartDate,cbc:StartTime) ) else false() (:NABT-919 Row 284 Tab 'Invoice, Credit Note':)">Period specified is incomplete or the end date and time is not later than the start date and time. (:NABT-919 Row 284 Tab 'Invoice, Credit Note':)</assert>
   </rule>
   <rule context="cac:CreditNoteLine/cac:Item (:NABT-153 NABT-154 Row 292 293 Tab 'Invoice, Credit Note':)">
      <assert test="count (cbc:Name) = 1 (:NABT-153 Row 292 Tab 'Invoice, Credit Note':)">Item Name is not specified or exists more than once. (:NABT-153 Row 292 Tab 'Invoice, Credit Note':)</assert>
      <assert test="count (cbc:Description) &lt;=1 (:NABT-154 Row 293 Tab 'Invoice, Credit Note':)">Product/Service description exists more than once. (:NABT-154 Row 293 Tab 'Invoice, Credit Note':)</assert>
   </rule>
</pattern>
