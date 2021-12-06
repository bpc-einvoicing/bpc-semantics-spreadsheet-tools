<!--
    This Schematron schema incorporates the BPC business rules
    for process {bpc:title}.
    
    Business Payments Coalition Semantics Group - (skeleton:20200812-2100z)
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  <title>BPC Schematron Constraints for customization {bpc:title}</title>
  <ns prefix="{bpc:doctype}" uri="urn:oasis:names:specification:ubl:schema:xsd:{bpc:doctype}-2"/>
  <ns prefix="ext"
uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
  <ns prefix="cac" 
uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
  <ns prefix="cbc" 
uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <ns prefix="bpc" uri="urn:X-BPC"/>
  <include href="support/UBL-DocumentConstraints-2.3.pattern.sch"/>
  <include href="support/BPC-{bpc:customization}-v{bpc:version}-{bpc:doctype}-Assertions.pattern.sch"/>
</schema>
