<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:sch="http://purl.oclc.org/dsdl/schematron"
               xmlns:error="https://doi.org/10.5281/zenodo.1495494#error"
               xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
               xmlns:schxslt-api="https://doi.org/10.5281/zenodo.1495494#api"
               xmlns:schxslt="https://doi.org/10.5281/zenodo.1495494"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:DocumentStatus="urn:oasis:names:specification:ubl:schema:xsd:DocumentStatus-2"
               xmlns:xsd="http://www.w3.org/2001/XMLSchema"
               xmlns:ext="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"
               xmlns:cac="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"
               xmlns:cbc="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"
               xmlns:bpc="urn:X-BPC"
               version="2.0">
   <rdf:Description xmlns:dct="http://purl.org/dc/terms/"
                    xmlns:dc="http://purl.org/dc/elements/1.1/"
                    xmlns:skos="http://www.w3.org/2004/02/skos/core#">
      <dct:creator>
         <dct:Agent>
            <skos:prefLabel>SchXslt/1.8.6 SAXON/HE 9.8.0.15</skos:prefLabel>
            <schxslt.compile.typed-variables xmlns="https://doi.org/10.5281/zenodo.1495494#">true</schxslt.compile.typed-variables>
         </dct:Agent>
      </dct:creator>
      <dct:created>2022-01-28T15:20:21.732-05:00</dct:created>
   </rdf:Description>
   <xsl:output indent="yes"/>
   <xsl:template match="/">
      <xsl:variable name="metadata" as="element()?">
         <svrl:metadata xmlns:dct="http://purl.org/dc/terms/"
                        xmlns:skos="http://www.w3.org/2004/02/skos/core#"
                        xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
            <dct:creator>
               <dct:Agent>
                  <skos:prefLabel>
                     <xsl:variable name="prefix"
                                   as="xs:string?"
                                   select="if (doc-available('')) then in-scope-prefixes(document('')/*[1])[namespace-uri-for-prefix(., document('')/*[1]) eq 'http://www.w3.org/1999/XSL/Transform'][1] else ()"/>
                     <xsl:choose>
                        <xsl:when test="empty($prefix)">Unknown</xsl:when>
                        <xsl:otherwise>
                           <xsl:value-of separator="/"
                                         select="(system-property(concat($prefix, ':product-name')), system-property(concat($prefix,':product-version')))"/>
                        </xsl:otherwise>
                     </xsl:choose>
                  </skos:prefLabel>
               </dct:Agent>
            </dct:creator>
            <dct:created>
               <xsl:value-of select="current-dateTime()"/>
            </dct:created>
            <dct:source>
               <rdf:Description xmlns:dc="http://purl.org/dc/elements/1.1/">
                  <dct:creator>
                     <dct:Agent>
                        <skos:prefLabel>SchXslt/1.8.6 SAXON/HE 9.8.0.15</skos:prefLabel>
                        <schxslt.compile.typed-variables xmlns="https://doi.org/10.5281/zenodo.1495494#">true</schxslt.compile.typed-variables>
                     </dct:Agent>
                  </dct:creator>
                  <dct:created>2022-01-28T15:20:21.732-05:00</dct:created>
               </rdf:Description>
            </dct:source>
         </svrl:metadata>
      </xsl:variable>
      <xsl:variable name="report" as="element(schxslt:report)">
         <schxslt:report>
            <xsl:call-template name="d14e18"/>
         </schxslt:report>
      </xsl:variable>
      <xsl:variable name="schxslt:report" as="node()*">
         <xsl:sequence select="$metadata"/>
         <xsl:for-each select="$report/schxslt:document">
            <xsl:for-each select="schxslt:pattern">
               <xsl:sequence select="node()"/>
               <xsl:sequence select="../schxslt:rule[@pattern = current()/@id]/node()"/>
            </xsl:for-each>
         </xsl:for-each>
      </xsl:variable>
      <svrl:schematron-output xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                              title="BPC Schematron Constraints for customization InvoiceStatus v0.4 - test">
         <svrl:ns-prefix-in-attribute-values prefix="DocumentStatus"
                                             uri="urn:oasis:names:specification:ubl:schema:xsd:DocumentStatus-2"/>
         <svrl:ns-prefix-in-attribute-values prefix="xsd" uri="http://www.w3.org/2001/XMLSchema"/>
         <svrl:ns-prefix-in-attribute-values prefix="ext"
                                             uri="urn:oasis:names:specification:ubl:schema:xsd:CommonExtensionComponents-2"/>
         <svrl:ns-prefix-in-attribute-values prefix="cac"
                                             uri="urn:oasis:names:specification:ubl:schema:xsd:CommonAggregateComponents-2"/>
         <svrl:ns-prefix-in-attribute-values prefix="cbc"
                                             uri="urn:oasis:names:specification:ubl:schema:xsd:CommonBasicComponents-2"/>
         <svrl:ns-prefix-in-attribute-values prefix="bpc" uri="urn:X-BPC"/>
         <xsl:sequence select="$schxslt:report"/>
      </svrl:schematron-output>
   </xsl:template>
   <xsl:template match="text() | @*" mode="#all" priority="-10"/>
   <xsl:template match="/" mode="#all" priority="-10">
      <xsl:apply-templates mode="#current" select="node()"/>
   </xsl:template>
   <xsl:template match="*" mode="#all" priority="-10">
      <xsl:apply-templates mode="#current" select="@*"/>
      <xsl:apply-templates mode="#current" select="node()"/>
   </xsl:template>
   <xsl:template name="d14e18">
      <schxslt:document>
         <schxslt:pattern id="d14e18">
            <xsl:if test="exists(base-uri(/))">
               <xsl:attribute name="documents" select="base-uri(/)"/>
            </xsl:if>
            <xsl:for-each select="/">
               <svrl:active-pattern xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                    name="UBL-DocumentConstraints-2.3"
                                    id="UBL-DocumentConstraints-2.3">
                  <xsl:attribute name="documents" select="base-uri(.)"/>
               </svrl:active-pattern>
            </xsl:for-each>
         </schxslt:pattern>
         <schxslt:pattern id="d14e45">
            <xsl:if test="exists(base-uri(/))">
               <xsl:attribute name="documents" select="base-uri(/)"/>
            </xsl:if>
            <xsl:for-each select="/">
               <svrl:active-pattern xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                    name="BPC Schematron Expressions for process InvoiceStatus v0.4 - test from worksheet Document Status">
                  <xsl:attribute name="documents" select="base-uri(.)"/>
               </svrl:active-pattern>
            </xsl:for-each>
         </schxslt:pattern>
         <xsl:apply-templates mode="d14e18" select="/"/>
      </schxslt:document>
   </xsl:template>
   <xsl:template match="ext:ExtensionContent//*[not(*) and not(normalize-space(.))] |                   ext:ExtensionContent//@*[not(normalize-space(.))]"
                 priority="7"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e18']">
            <schxslt:rule pattern="d14e18">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule Extensions-IND5-IND9 for context "ext:ExtensionContent//*[not(*) and not(normalize-space(.))] | ext:ExtensionContent//@*[not(normalize-space(.))]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" id="Extensions-IND5-IND9">
                  <xsl:attribute name="context">ext:ExtensionContent//*[not(*) and not(normalize-space(.))] |                   ext:ExtensionContent//@*[not(normalize-space(.))]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d14e18">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl" id="Extensions-IND5-IND9">
                  <xsl:attribute name="context">ext:ExtensionContent//*[not(*) and not(normalize-space(.))] |                   ext:ExtensionContent//@*[not(normalize-space(.))]</xsl:attribute>
               </svrl:fired-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd14e18')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="*[not(*) and not(normalize-space(.))]"
                 priority="6"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e18']">
            <schxslt:rule pattern="d14e18">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "*[not(*) and not(normalize-space(.))]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">*[not(*) and not(normalize-space(.))]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d14e18">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">*[not(*) and not(normalize-space(.))]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="true()">
                  <svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                          location="{schxslt:location(.)}"
                                          id="IND5">
                     <xsl:attribute name="test">true()</xsl:attribute>
                     <svrl:text>[IND5] Elements SHALL NOT be empty</svrl:text>
                  </svrl:successful-report>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd14e18')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="@*[not(normalize-space(.))]" priority="5" mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e18']">
            <schxslt:rule pattern="d14e18">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "@*[not(normalize-space(.))]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">@*[not(normalize-space(.))]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d14e18">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">@*[not(normalize-space(.))]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="true()">
                  <svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                          location="{schxslt:location(.)}"
                                          id="IND9">
                     <xsl:attribute name="test">true()</xsl:attribute>
                     <svrl:text>[IND9] Attributes SHALL NOT be empty</svrl:text>
                  </svrl:successful-report>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd14e18')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cbc:AllowanceChargeReason[1] | cbc:Description[1] | cbc:Note[1] | cbc:JustificationDescription[1] | cbc:ProcessDescription[1] | cbc:ConditionsDescription[1] | cbc:ElectronicDeviceDescription[1] | cbc:Purpose[1] | cbc:Weight[1] | cbc:CalculationExpression[1] | cbc:MinimumImprovementBid[1] | cbc:AwardingCriterionDescription[1] | cbc:TechnicalCommitteeDescription[1] | cbc:LowTendersDescription[1] | cbc:PrizeDescription[1] | cbc:PaymentDescription[1] | cbc:WarrantyInformation[1] | cbc:Remarks[1] | cbc:Content[1] | cbc:SummaryDescription[1] | cbc:TariffDescription[1] | cbc:CarrierServiceInstructions[1] | cbc:CustomsClearanceServiceInstructions[1] | cbc:ForwarderServiceInstructions[1] | cbc:SpecialServiceInstructions[1] | cbc:HandlingInstructions[1] | cbc:Information[1] | cbc:SpecialInstructions[1] | cbc:DeliveryInstructions[1] | cbc:HaulageInstructions[1] | cbc:ModificationReasonDescription[1] | cbc:OptionsDescription[1] | cbc:CriterionDescription[1] | cbc:SpecialTerms[1] | cbc:LossRisk[1] | cbc:Instructions[1] | cbc:BackorderReason[1] | cbc:OutstandingReason[1] | cbc:XPath[1] | cbc:DocumentDescription[1] | cbc:RoleDescription[1] | cbc:LimitationDescription[1] | cbc:Expression[1] | cbc:CandidateStatement[1] | cbc:PaymentNote[1] | cbc:Justification[1] | cbc:Frequency[1] | cbc:AdditionalInformation[1] | cbc:Keyword[1] | cbc:TradingRestrictions[1] | cbc:ReplenishmentOwnerDescription[1] | cbc:ValueQualifier[1] | cbc:ListValue[1] | cbc:Title[1] | cbc:JurisdictionLevel[1] | cbc:Article[1] | cbc:Conditions[1] | cbc:GroupingLots[1] | cbc:ShipsRequirements[1] | cbc:MeterReadingComments[1] | cbc:PackingMaterial[1] | cbc:ExemptionReason[1] | cbc:InstructionNote[1] | cbc:PlannedOperationsDescription[1] | cbc:PlannedWorksDescription[1] | cbc:PlannedInspectionsDescription[1] | cbc:CargoAndBallastTankConditionDescription[1] | cbc:ShipRequirementsDescription[1] | cbc:PriceChangeReason[1] | cbc:ProcessReason[1] | cbc:FeeDescription[1] | cbc:ExclusionReason[1] | cbc:Resolution[1] | cbc:PersonalSituation[1] | cbc:RejectReason[1] | cbc:MonetaryScope[1] | cbc:Response[1] | cbc:Extension[1] | cbc:ServiceType[1] | cbc:DemurrageInstructions[1] | cbc:StatusReason[1] | cbc:Text[1] | cbc:Location[1] | cbc:TaxExemptionReason[1] | cbc:WeightingConsiderationDescription[1] | cbc:CertificationLevelDescription[1] | cbc:NegotiationDescription[1] | cbc:AcceptedVariantsDescription[1] | cbc:PriceRevisionFormulaDescription[1] | cbc:FundingProgram[1] | cbc:EstimatedTimingFurtherPublication[1] | cbc:AdditionalConditions[1] | cbc:DamageRemarks[1] | cbc:SpecialTransportRequirements[1] | cbc:TransportUserSpecialTerms[1] | cbc:TransportServiceProviderSpecialTerms[1] | cbc:ChangeConditions[1] | cbc:ShippingMarks[1] | cbc:RegistrationNationality[1] | cbc:TransportationServiceDescription[1] | cbc:WorkPhase[1] | cbc:ExportReason[1] | cbc:OtherInstruction[1] | cbc:BriefDescription[1] | cbc:RegulatoryDomain[1] | cbc:CancellationNote[1] | cbc:RejectionNote[1] | cbc:WeightScoringMethodologyNote[1] | cbc:DocumentStatusReasonDescription[1] | cbc:TransportUserRemarks[1] | cbc:TransportServiceProviderRemarks[1]"
                 priority="4"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e18']">
            <schxslt:rule pattern="d14e18">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cbc:AllowanceChargeReason[1] | cbc:Description[1] | cbc:Note[1] | cbc:JustificationDescription[1] | cbc:ProcessDescription[1] | cbc:ConditionsDescription[1] | cbc:ElectronicDeviceDescription[1] | cbc:Purpose[1] | cbc:Weight[1] | cbc:CalculationExpression[1] | cbc:MinimumImprovementBid[1] | cbc:AwardingCriterionDescription[1] | cbc:TechnicalCommitteeDescription[1] | cbc:LowTendersDescription[1] | cbc:PrizeDescription[1] | cbc:PaymentDescription[1] | cbc:WarrantyInformation[1] | cbc:Remarks[1] | cbc:Content[1] | cbc:SummaryDescription[1] | cbc:TariffDescription[1] | cbc:CarrierServiceInstructions[1] | cbc:CustomsClearanceServiceInstructions[1] | cbc:ForwarderServiceInstructions[1] | cbc:SpecialServiceInstructions[1] | cbc:HandlingInstructions[1] | cbc:Information[1] | cbc:SpecialInstructions[1] | cbc:DeliveryInstructions[1] | cbc:HaulageInstructions[1] | cbc:ModificationReasonDescription[1] | cbc:OptionsDescription[1] | cbc:CriterionDescription[1] | cbc:SpecialTerms[1] | cbc:LossRisk[1] | cbc:Instructions[1] | cbc:BackorderReason[1] | cbc:OutstandingReason[1] | cbc:XPath[1] | cbc:DocumentDescription[1] | cbc:RoleDescription[1] | cbc:LimitationDescription[1] | cbc:Expression[1] | cbc:CandidateStatement[1] | cbc:PaymentNote[1] | cbc:Justification[1] | cbc:Frequency[1] | cbc:AdditionalInformation[1] | cbc:Keyword[1] | cbc:TradingRestrictions[1] | cbc:ReplenishmentOwnerDescription[1] | cbc:ValueQualifier[1] | cbc:ListValue[1] | cbc:Title[1] | cbc:JurisdictionLevel[1] | cbc:Article[1] | cbc:Conditions[1] | cbc:GroupingLots[1] | cbc:ShipsRequirements[1] | cbc:MeterReadingComments[1] | cbc:PackingMaterial[1] | cbc:ExemptionReason[1] | cbc:InstructionNote[1] | cbc:PlannedOperationsDescription[1] | cbc:PlannedWorksDescription[1] | cbc:PlannedInspectionsDescription[1] | cbc:CargoAndBallastTankConditionDescription[1] | cbc:ShipRequirementsDescription[1] | cbc:PriceChangeReason[1] | cbc:ProcessReason[1] | cbc:FeeDescription[1] | cbc:ExclusionReason[1] | cbc:Resolution[1] | cbc:PersonalSituation[1] | cbc:RejectReason[1] | cbc:MonetaryScope[1] | cbc:Response[1] | cbc:Extension[1] | cbc:ServiceType[1] | cbc:DemurrageInstructions[1] | cbc:StatusReason[1] | cbc:Text[1] | cbc:Location[1] | cbc:TaxExemptionReason[1] | cbc:WeightingConsiderationDescription[1] | cbc:CertificationLevelDescription[1] | cbc:NegotiationDescription[1] | cbc:AcceptedVariantsDescription[1] | cbc:PriceRevisionFormulaDescription[1] | cbc:FundingProgram[1] | cbc:EstimatedTimingFurtherPublication[1] | cbc:AdditionalConditions[1] | cbc:DamageRemarks[1] | cbc:SpecialTransportRequirements[1] | cbc:TransportUserSpecialTerms[1] | cbc:TransportServiceProviderSpecialTerms[1] | cbc:ChangeConditions[1] | cbc:ShippingMarks[1] | cbc:RegistrationNationality[1] | cbc:TransportationServiceDescription[1] | cbc:WorkPhase[1] | cbc:ExportReason[1] | cbc:OtherInstruction[1] | cbc:BriefDescription[1] | cbc:RegulatoryDomain[1] | cbc:CancellationNote[1] | cbc:RejectionNote[1] | cbc:WeightScoringMethodologyNote[1] | cbc:DocumentStatusReasonDescription[1] | cbc:TransportUserRemarks[1] | cbc:TransportServiceProviderRemarks[1]" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cbc:AllowanceChargeReason[1] | cbc:Description[1] | cbc:Note[1] | cbc:JustificationDescription[1] | cbc:ProcessDescription[1] | cbc:ConditionsDescription[1] | cbc:ElectronicDeviceDescription[1] | cbc:Purpose[1] | cbc:Weight[1] | cbc:CalculationExpression[1] | cbc:MinimumImprovementBid[1] | cbc:AwardingCriterionDescription[1] | cbc:TechnicalCommitteeDescription[1] | cbc:LowTendersDescription[1] | cbc:PrizeDescription[1] | cbc:PaymentDescription[1] | cbc:WarrantyInformation[1] | cbc:Remarks[1] | cbc:Content[1] | cbc:SummaryDescription[1] | cbc:TariffDescription[1] | cbc:CarrierServiceInstructions[1] | cbc:CustomsClearanceServiceInstructions[1] | cbc:ForwarderServiceInstructions[1] | cbc:SpecialServiceInstructions[1] | cbc:HandlingInstructions[1] | cbc:Information[1] | cbc:SpecialInstructions[1] | cbc:DeliveryInstructions[1] | cbc:HaulageInstructions[1] | cbc:ModificationReasonDescription[1] | cbc:OptionsDescription[1] | cbc:CriterionDescription[1] | cbc:SpecialTerms[1] | cbc:LossRisk[1] | cbc:Instructions[1] | cbc:BackorderReason[1] | cbc:OutstandingReason[1] | cbc:XPath[1] | cbc:DocumentDescription[1] | cbc:RoleDescription[1] | cbc:LimitationDescription[1] | cbc:Expression[1] | cbc:CandidateStatement[1] | cbc:PaymentNote[1] | cbc:Justification[1] | cbc:Frequency[1] | cbc:AdditionalInformation[1] | cbc:Keyword[1] | cbc:TradingRestrictions[1] | cbc:ReplenishmentOwnerDescription[1] | cbc:ValueQualifier[1] | cbc:ListValue[1] | cbc:Title[1] | cbc:JurisdictionLevel[1] | cbc:Article[1] | cbc:Conditions[1] | cbc:GroupingLots[1] | cbc:ShipsRequirements[1] | cbc:MeterReadingComments[1] | cbc:PackingMaterial[1] | cbc:ExemptionReason[1] | cbc:InstructionNote[1] | cbc:PlannedOperationsDescription[1] | cbc:PlannedWorksDescription[1] | cbc:PlannedInspectionsDescription[1] | cbc:CargoAndBallastTankConditionDescription[1] | cbc:ShipRequirementsDescription[1] | cbc:PriceChangeReason[1] | cbc:ProcessReason[1] | cbc:FeeDescription[1] | cbc:ExclusionReason[1] | cbc:Resolution[1] | cbc:PersonalSituation[1] | cbc:RejectReason[1] | cbc:MonetaryScope[1] | cbc:Response[1] | cbc:Extension[1] | cbc:ServiceType[1] | cbc:DemurrageInstructions[1] | cbc:StatusReason[1] | cbc:Text[1] | cbc:Location[1] | cbc:TaxExemptionReason[1] | cbc:WeightingConsiderationDescription[1] | cbc:CertificationLevelDescription[1] | cbc:NegotiationDescription[1] | cbc:AcceptedVariantsDescription[1] | cbc:PriceRevisionFormulaDescription[1] | cbc:FundingProgram[1] | cbc:EstimatedTimingFurtherPublication[1] | cbc:AdditionalConditions[1] | cbc:DamageRemarks[1] | cbc:SpecialTransportRequirements[1] | cbc:TransportUserSpecialTerms[1] | cbc:TransportServiceProviderSpecialTerms[1] | cbc:ChangeConditions[1] | cbc:ShippingMarks[1] | cbc:RegistrationNationality[1] | cbc:TransportationServiceDescription[1] | cbc:WorkPhase[1] | cbc:ExportReason[1] | cbc:OtherInstruction[1] | cbc:BriefDescription[1] | cbc:RegulatoryDomain[1] | cbc:CancellationNote[1] | cbc:RejectionNote[1] | cbc:WeightScoringMethodologyNote[1] | cbc:DocumentStatusReasonDescription[1] | cbc:TransportUserRemarks[1] | cbc:TransportServiceProviderRemarks[1]</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d14e18">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cbc:AllowanceChargeReason[1] | cbc:Description[1] | cbc:Note[1] | cbc:JustificationDescription[1] | cbc:ProcessDescription[1] | cbc:ConditionsDescription[1] | cbc:ElectronicDeviceDescription[1] | cbc:Purpose[1] | cbc:Weight[1] | cbc:CalculationExpression[1] | cbc:MinimumImprovementBid[1] | cbc:AwardingCriterionDescription[1] | cbc:TechnicalCommitteeDescription[1] | cbc:LowTendersDescription[1] | cbc:PrizeDescription[1] | cbc:PaymentDescription[1] | cbc:WarrantyInformation[1] | cbc:Remarks[1] | cbc:Content[1] | cbc:SummaryDescription[1] | cbc:TariffDescription[1] | cbc:CarrierServiceInstructions[1] | cbc:CustomsClearanceServiceInstructions[1] | cbc:ForwarderServiceInstructions[1] | cbc:SpecialServiceInstructions[1] | cbc:HandlingInstructions[1] | cbc:Information[1] | cbc:SpecialInstructions[1] | cbc:DeliveryInstructions[1] | cbc:HaulageInstructions[1] | cbc:ModificationReasonDescription[1] | cbc:OptionsDescription[1] | cbc:CriterionDescription[1] | cbc:SpecialTerms[1] | cbc:LossRisk[1] | cbc:Instructions[1] | cbc:BackorderReason[1] | cbc:OutstandingReason[1] | cbc:XPath[1] | cbc:DocumentDescription[1] | cbc:RoleDescription[1] | cbc:LimitationDescription[1] | cbc:Expression[1] | cbc:CandidateStatement[1] | cbc:PaymentNote[1] | cbc:Justification[1] | cbc:Frequency[1] | cbc:AdditionalInformation[1] | cbc:Keyword[1] | cbc:TradingRestrictions[1] | cbc:ReplenishmentOwnerDescription[1] | cbc:ValueQualifier[1] | cbc:ListValue[1] | cbc:Title[1] | cbc:JurisdictionLevel[1] | cbc:Article[1] | cbc:Conditions[1] | cbc:GroupingLots[1] | cbc:ShipsRequirements[1] | cbc:MeterReadingComments[1] | cbc:PackingMaterial[1] | cbc:ExemptionReason[1] | cbc:InstructionNote[1] | cbc:PlannedOperationsDescription[1] | cbc:PlannedWorksDescription[1] | cbc:PlannedInspectionsDescription[1] | cbc:CargoAndBallastTankConditionDescription[1] | cbc:ShipRequirementsDescription[1] | cbc:PriceChangeReason[1] | cbc:ProcessReason[1] | cbc:FeeDescription[1] | cbc:ExclusionReason[1] | cbc:Resolution[1] | cbc:PersonalSituation[1] | cbc:RejectReason[1] | cbc:MonetaryScope[1] | cbc:Response[1] | cbc:Extension[1] | cbc:ServiceType[1] | cbc:DemurrageInstructions[1] | cbc:StatusReason[1] | cbc:Text[1] | cbc:Location[1] | cbc:TaxExemptionReason[1] | cbc:WeightingConsiderationDescription[1] | cbc:CertificationLevelDescription[1] | cbc:NegotiationDescription[1] | cbc:AcceptedVariantsDescription[1] | cbc:PriceRevisionFormulaDescription[1] | cbc:FundingProgram[1] | cbc:EstimatedTimingFurtherPublication[1] | cbc:AdditionalConditions[1] | cbc:DamageRemarks[1] | cbc:SpecialTransportRequirements[1] | cbc:TransportUserSpecialTerms[1] | cbc:TransportServiceProviderSpecialTerms[1] | cbc:ChangeConditions[1] | cbc:ShippingMarks[1] | cbc:RegistrationNationality[1] | cbc:TransportationServiceDescription[1] | cbc:WorkPhase[1] | cbc:ExportReason[1] | cbc:OtherInstruction[1] | cbc:BriefDescription[1] | cbc:RegulatoryDomain[1] | cbc:CancellationNote[1] | cbc:RejectionNote[1] | cbc:WeightScoringMethodologyNote[1] | cbc:DocumentStatusReasonDescription[1] | cbc:TransportUserRemarks[1] | cbc:TransportServiceProviderRemarks[1]</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="@languageID and                    following-sibling::*[name(.)=name(current())][@languageID=current()/@languageID]">
                  <svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                          location="{schxslt:location(.)}"
                                          id="IND7">
                     <xsl:attribute name="test">@languageID and                    following-sibling::*[name(.)=name(current())][@languageID=current()/@languageID]</xsl:attribute>
                     <svrl:text>[IND7] Two or more sibling "Text.Type" cannot both have the same "languageID" attribute value.
     </svrl:text>
                  </svrl:successful-report>
               </xsl:if>
               <xsl:if test="not(@languageID) and                    following-sibling::*[name(.)=name(current())][not(@languageID)]">
                  <svrl:successful-report xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                          location="{schxslt:location(.)}"
                                          id="IND8">
                     <xsl:attribute name="test">not(@languageID) and                    following-sibling::*[name(.)=name(current())][not(@languageID)]</xsl:attribute>
                     <svrl:text>[IND8] Two or more sibling "Text.Type" cannot both omit the "languageID" attribute.
     </svrl:text>
                  </svrl:successful-report>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd14e18')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="/DocumentStatus:DocumentStatus (:NABT-2002 NABT-2003 NABT-2004 NABT-2008 NABT-2011 Row 3 4 6 11 14 Tab 'Document Status':)"
                 priority="3"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/DocumentStatus:DocumentStatus (:NABT-2002 NABT-2003 NABT-2004 NABT-2008 NABT-2011 Row 3 4 6 11 14 Tab 'Document Status':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/DocumentStatus:DocumentStatus (:NABT-2002 NABT-2003 NABT-2004 NABT-2008 NABT-2011 Row 3 4 6 11 14 Tab 'Document Status':)</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d14e45">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/DocumentStatus:DocumentStatus (:NABT-2002 NABT-2003 NABT-2004 NABT-2008 NABT-2011 Row 3 4 6 11 14 Tab 'Document Status':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count(cbc:UBLVersionID) = 1 (:NABT-2002 Row 3 Tab 'Document Status':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cbc:UBLVersionID) = 1 (:NABT-2002 Row 3 Tab 'Document Status':)</xsl:attribute>
                     <svrl:text>Missing declaration of the version of UBL (:NABT-2002 Row 3 Tab 'Document Status':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(normalize-space(cbc:CustomizationID) = 'urn:oasis:names:specification:ubl:schema:xsd:DocumentStatus-2::DocumentStatus##bpc-0.4-data-InvoiceStatus' (:NABT-2003 Row 4 Tab 'Document Status':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">normalize-space(cbc:CustomizationID) = 'urn:oasis:names:specification:ubl:schema:xsd:DocumentStatus-2::DocumentStatus##bpc-0.4-data-InvoiceStatus' (:NABT-2003 Row 4 Tab 'Document Status':)</xsl:attribute>
                     <svrl:text>Missing or invalid customization identifier (:NABT-2003 Row 4 Tab 'Document Status':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(normalize-space(cbc:ProfileID) = 'bpc-0.4-process#InvoiceStatus' (:NABT-2004 Row 6 Tab 'Document Status':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">normalize-space(cbc:ProfileID) = 'bpc-0.4-process#InvoiceStatus' (:NABT-2004 Row 6 Tab 'Document Status':)</xsl:attribute>
                     <svrl:text>Missing or invalid profile identifier (:NABT-2004 Row 6 Tab 'Document Status':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:SenderParty/cac:PartyIdentification/cbc:ID) = 1 and count(cac:SenderParty/cac:PartyName/cbc:Name) = 1 (:NABT-2008 Row 11 Tab 'Document Status':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:SenderParty/cac:PartyIdentification/cbc:ID) = 1 and count(cac:SenderParty/cac:PartyName/cbc:Name) = 1 (:NABT-2008 Row 11 Tab 'Document Status':)</xsl:attribute>
                     <svrl:text>Missing sender party identification or name (:NABT-2008 Row 11 Tab 'Document Status':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:ReceiverParty/cac:PartyIdentification/cbc:ID) = 1 and count(cac:ReceiverParty/cac:PartyName/cbc:Name) = 1 (:NABT-2011 Row 14 Tab 'Document Status':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:ReceiverParty/cac:PartyIdentification/cbc:ID) = 1 and count(cac:ReceiverParty/cac:PartyName/cbc:Name) = 1 (:NABT-2011 Row 14 Tab 'Document Status':)</xsl:attribute>
                     <svrl:text>Missing receiver party identification or name (:NABT-2011 Row 14 Tab 'Document Status':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd14e45')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:DocumentResponse/cac:Response (:NABT-2015 Row 18 Tab 'Document Status':)"
                 priority="2"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:DocumentResponse/cac:Response (:NABT-2015 Row 18 Tab 'Document Status':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:DocumentResponse/cac:Response (:NABT-2015 Row 18 Tab 'Document Status':)</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d14e45">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:DocumentResponse/cac:Response (:NABT-2015 Row 18 Tab 'Document Status':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count(cbc:ResponseCode) = 1 (:NABT-2015 Row 18 Tab 'Document Status':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cbc:ResponseCode) = 1 (:NABT-2015 Row 18 Tab 'Document Status':)</xsl:attribute>
                     <svrl:text>The response code is missing. (:NABT-2015 Row 18 Tab 'Document Status':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd14e45')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:Response/cbc:ResponseCode (:NABT-2016 Row 19 Tab 'Document Status':)"
                 priority="1"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:Response/cbc:ResponseCode (:NABT-2016 Row 19 Tab 'Document Status':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:Response/cbc:ResponseCode (:NABT-2016 Row 19 Tab 'Document Status':)</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d14e45">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:Response/cbc:ResponseCode (:NABT-2016 Row 19 Tab 'Document Status':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(. = ( 'AB','IP','UQ','CA','RE','AP','PD' ) (:NABT-2016 Row 19 Tab 'Document Status':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">. = ( 'AB','IP','UQ','CA','RE','AP','PD' ) (:NABT-2016 Row 19 Tab 'Document Status':)</xsl:attribute>
                     <svrl:text>The response code is invalid. (:NABT-2016 Row 19 Tab 'Document Status':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd14e45')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:template match="cac:Response/cac:Status (:NABT-2019 Row 23 Tab 'Document Status':)"
                 priority="0"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:Response/cac:Status (:NABT-2019 Row 23 Tab 'Document Status':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:Response/cac:Status (:NABT-2019 Row 23 Tab 'Document Status':)</xsl:attribute>
               </svrl:suppressed-rule>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="$schxslt:patterns-matched"/>
            </xsl:next-match>
         </xsl:when>
         <xsl:otherwise>
            <schxslt:rule pattern="d14e45">
               <svrl:fired-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:Response/cac:Status (:NABT-2019 Row 23 Tab 'Document Status':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count(cbc:StatusReasonCode) = 1 or count(cbc:StatusReason) &gt; 0 (:NABT-2019 Row 23 Tab 'Document Status':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cbc:StatusReasonCode) = 1 or count(cbc:StatusReason) &gt; 0 (:NABT-2019 Row 23 Tab 'Document Status':)</xsl:attribute>
                     <svrl:text>The status reason is missing in either coded or text format. (:NABT-2019 Row 23 Tab 'Document Status':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
            </schxslt:rule>
            <xsl:next-match>
               <xsl:with-param name="schxslt:patterns-matched"
                               as="xs:string*"
                               select="($schxslt:patterns-matched, 'd14e45')"/>
            </xsl:next-match>
         </xsl:otherwise>
      </xsl:choose>
   </xsl:template>
   <xsl:function name="schxslt:location" as="xs:string">
      <xsl:param name="node" as="node()"/>
      <xsl:variable name="segments" as="xs:string*">
         <xsl:for-each select="($node/ancestor-or-self::node())">
            <xsl:variable name="position">
               <xsl:number level="single"/>
            </xsl:variable>
            <xsl:choose>
               <xsl:when test=". instance of element()">
                  <xsl:value-of select="concat('Q{', namespace-uri(.), '}', local-name(.), '[', $position, ']')"/>
               </xsl:when>
               <xsl:when test=". instance of attribute()">
                  <xsl:value-of select="concat('@Q{', namespace-uri(.), '}', local-name(.))"/>
               </xsl:when>
               <xsl:when test=". instance of processing-instruction()">
                  <xsl:value-of select="concat('processing-instruction(&#34;', name(.), '&#34;)[', $position, ']')"/>
               </xsl:when>
               <xsl:when test=". instance of comment()">
                  <xsl:value-of select="concat('comment()[', $position, ']')"/>
               </xsl:when>
               <xsl:when test=". instance of text()">
                  <xsl:value-of select="concat('text()[', $position, ']')"/>
               </xsl:when>
               <xsl:otherwise/>
            </xsl:choose>
         </xsl:for-each>
      </xsl:variable>
      <xsl:value-of select="concat('/', string-join($segments, '/'))"/>
   </xsl:function>
</xsl:transform>
