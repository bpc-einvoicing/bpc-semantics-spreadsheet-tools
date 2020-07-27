<!--
    This Schematron schema incorporates the BPC business rules
    for process {bpc:process}.
    
    Business Payments Coalition Semantics Group - (skeleton:20200727-1900z)
-->
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
  <title>BPC Schematron Constraints for process {bpc:process}</title>
  <ns prefix="ext"
uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
  <ns prefix="cbc" 
uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
  <include href="UBL-DocumentConstraints-2.3.pattern.sch"/>
  <include href="BPC-{bpc:process}-Constraints.pattern.sch"/>
</schema>
