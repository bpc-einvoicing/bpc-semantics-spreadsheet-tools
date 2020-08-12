<!--
    This Schematron schema incorporates the BPC business rules
    for process {bpc:title}.
    
    Business Payments Coalition Semantics Group - (skeleton:20200812-2100z)
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <title>BPC Schematron Constraints for process {bpc:title}</title>
  <ns prefix="ext"
uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
  <ns prefix="cbc" 
uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <include href="UBL-DocumentConstraints-2.3.pattern.sch"/>
  <include href="BPC-{bpc:process}-v{bpc:version}-Assertions.pattern.sch"/>
</schema>
