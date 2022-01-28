<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <title>BPC Schematron Constraints for customization Minimum v0.4 - test</title>
  <ns prefix="CreditNote"
       uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"/>
  <ns prefix="xsd" uri="http://www.w3.org/2001/XMLSchema"/>
  <ns prefix="ext"
       uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
  <ns prefix="cac"
       uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="cbc"
       uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="bpc" uri="urn:X-BPC"/>
  <include href="support/UBL-DocumentConstraints-2.3.pattern.sch"/>
  <include href="support/BPC-Minimum-v0.4-CreditNote-Assertions.pattern.sch"/>
</schema>
