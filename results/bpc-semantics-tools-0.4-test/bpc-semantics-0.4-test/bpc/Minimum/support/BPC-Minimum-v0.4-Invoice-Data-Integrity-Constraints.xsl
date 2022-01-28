<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:sch="http://purl.oclc.org/dsdl/schematron"
               xmlns:error="https://doi.org/10.5281/zenodo.1495494#error"
               xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
               xmlns:schxslt-api="https://doi.org/10.5281/zenodo.1495494#api"
               xmlns:schxslt="https://doi.org/10.5281/zenodo.1495494"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:Invoice="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"
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
      <dct:created>2022-01-28T15:20:08.41-05:00</dct:created>
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
                  <dct:created>2022-01-28T15:20:08.41-05:00</dct:created>
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
                              title="BPC Schematron Constraints for customization Minimum v0.4 - test">
         <svrl:ns-prefix-in-attribute-values prefix="Invoice"
                                             uri="urn:oasis:names:specification:ubl:schema:xsd:Invoice-2"/>
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
                                    name="BPC Schematron Expressions for process Minimum v0.4 - test from worksheet Invoice, Credit Note">
                  <xsl:attribute name="documents" select="base-uri(.)"/>
               </svrl:active-pattern>
            </xsl:for-each>
         </schxslt:pattern>
         <xsl:apply-templates mode="d14e18" select="/"/>
      </schxslt:document>
   </xsl:template>
   <xsl:template match="ext:ExtensionContent//*[not(*) and not(normalize-space(.))] |                   ext:ExtensionContent//@*[not(normalize-space(.))]"
                 priority="24"
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
                 priority="23"
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
   <xsl:template match="@*[not(normalize-space(.))]" priority="22" mode="d14e18">
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
                 priority="21"
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
   <xsl:template match="/Invoice:Invoice (:NABT-999 NABT-005 NABT-013 NABT-022 NABT-023 NABT-024 NABG-005 NABG-007 NABG-023 Row 2 9 14 30 38 40 58 106 194 Tab 'Invoice, Credit Note':)"
                 priority="20"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice (:NABT-999 NABT-005 NABT-013 NABT-022 NABT-023 NABT-024 NABG-005 NABG-007 NABG-023 Row 2 9 14 30 38 40 58 106 194 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice (:NABT-999 NABT-005 NABT-013 NABT-022 NABT-023 NABT-024 NABG-005 NABG-007 NABG-023 Row 2 9 14 30 38 40 58 106 194 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice (:NABT-999 NABT-005 NABT-013 NABT-022 NABT-023 NABT-024 NABG-005 NABG-007 NABG-023 Row 2 9 14 30 38 40 58 106 194 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count(cbc:UBLVersionID) = 1 (:NABT-999 Row 2 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cbc:UBLVersionID) = 1 (:NABT-999 Row 2 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Missing declaration of the version of UBL (:NABT-999 Row 2 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(bpc:codelist(cbc:DocumentCurrencyCode,'ISO-4217') (:NABT-005 Row 9 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cbc:DocumentCurrencyCode,'ISO-4217') (:NABT-005 Row 9 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Document Currency Code not specified or value specified is not allowed. (:NABT-005 Row 9 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:OrderReference/cbc:ID) &lt;= 1 (:NABT-013 Row 14 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:OrderReference/cbc:ID) &lt;= 1 (:NABT-013 Row 14 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Purchase order reference cannot be specified more than once. (:NABT-013 Row 14 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cbc:Note) &lt;=1 (:NABT-022 Row 30 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:Note) &lt;=1 (:NABT-022 Row 30 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one invoice note exists. (:NABT-022 Row 30 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(normalize-space(cbc:ProfileID) = 'bpc-0.4-process#Invoice' (:NABT-023 Row 38 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">normalize-space(cbc:ProfileID) = 'bpc-0.4-process#Invoice' (:NABT-023 Row 38 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Business process type not specified or value specified is not valid. (:NABT-023 Row 38 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(normalize-space(cbc:CustomizationID) = 'urn:oasis:names:specification:ubl:schema:xsd:Invoice-2::Invoice##bpc-0.4-data-Minimum' (:NABT-024 Row 40 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">normalize-space(cbc:CustomizationID) = 'urn:oasis:names:specification:ubl:schema:xsd:Invoice-2::Invoice##bpc-0.4-data-Minimum' (:NABT-024 Row 40 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Specification Identifier not specified or value specified is not valid. (:NABT-024 Row 40 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress) = 1 (:NABG-005 Row 58 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:AccountingSupplierParty/cac:Party/cac:PostalAddress) = 1 (:NABG-005 Row 58 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Supplier - Accounts Receivable Party not specified, or Postal Address is not specified, or either exists more than once. (:NABG-005 Row 58 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cac:AccountingCustomerParty)= 1 (:NABG-007 Row 106 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cac:AccountingCustomerParty)= 1 (:NABG-007 Row 106 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Customer - Accounts Payable is not specified or exists more than once. (:NABG-007 Row 106 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count( cac:TaxTotal ) &lt;= 1 (:NABG-023 Row 194 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count( cac:TaxTotal ) &lt;= 1 (:NABG-023 Row 194 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Too many tax total information items (:NABG-023 Row 194 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:AccountingSupplierParty (:NABG-004 NABT-028 NABT-029 Row 47 49 50 Tab 'Invoice, Credit Note':)"
                 priority="19"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:AccountingSupplierParty (:NABG-004 NABT-028 NABT-029 Row 47 49 50 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AccountingSupplierParty (:NABG-004 NABT-028 NABT-029 Row 47 49 50 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AccountingSupplierParty (:NABG-004 NABT-028 NABT-029 Row 47 49 50 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cac:Party) = 1 (:NABG-004 Row 47 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cac:Party) = 1 (:NABG-004 Row 47 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Supplier - Accounts Receivable is not specified or exists more than once. (:NABG-004 Row 47 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:Party/cac:PartyName/cbc:Name) = 1 (:NABT-028 Row 49 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:Party/cac:PartyName/cbc:Name) = 1 (:NABT-028 Row 49 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Fewer or more than one trading name. (:NABT-028 Row 49 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:Party/cac:PartyIdentification/cbc:ID) = 1 (:NABT-029 Row 50 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:Party/cac:PartyIdentification/cbc:ID) = 1 (:NABT-029 Row 50 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Fewer or more than one party identifier. (:NABT-029 Row 50 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)"
                 priority="18"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (@schemeID ) = 1 (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (@schemeID ) = 1 (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Scheme Identifier does not exist when Supplier - Accounts Receivable Identifier is provided. (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)"
                 priority="17"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-040 Row 63 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Supplier - Accounts Receivable Contact Country Code is not specified or exists more than once. (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:AccountingCustomerParty (:NABT-045 NABT-046 Row 108 109 Tab 'Invoice, Credit Note':)"
                 priority="16"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:AccountingCustomerParty (:NABT-045 NABT-046 Row 108 109 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AccountingCustomerParty (:NABT-045 NABT-046 Row 108 109 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AccountingCustomerParty (:NABT-045 NABT-046 Row 108 109 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count(cac:Party/cac:PartyName/cbc:Name) = 1 (:NABT-045 Row 108 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:Party/cac:PartyName/cbc:Name) = 1 (:NABT-045 Row 108 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Fewer or more than one trading name. (:NABT-045 Row 108 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:Party/cac:PartyIdentification/cbc:ID) = 1 (:NABT-046 Row 109 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:Party/cac:PartyIdentification/cbc:ID) = 1 (:NABT-046 Row 109 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Fewer or more than one party identifier. (:NABT-046 Row 109 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)"
                 priority="15"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count( @schemeID ) = 1 (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count( @schemeID ) = 1 (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>The scheme of the party identifier is missing. (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)"
                 priority="14"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-055 Row 121 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Customer - Accounts Payable Country Code is not valid. (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:PaymentMeans (:NABT-081 Row 142 Tab 'Invoice, Credit Note':)"
                 priority="13"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:PaymentMeans (:NABT-081 Row 142 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:PaymentMeans (:NABT-081 Row 142 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:PaymentMeans (:NABT-081 Row 142 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(cbc:PaymentMeansCode,'UNECE-4461') (:NABT-081 Row 142 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cbc:PaymentMeansCode,'UNECE-4461') (:NABT-081 Row 142 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Invalid payment method type code. (:NABT-081 Row 142 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:PaymentMeans/cbc:PaymentMeansCode (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)"
                 priority="12"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:PaymentMeans/cbc:PaymentMeansCode (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:PaymentMeans/cbc:PaymentMeansCode (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:PaymentMeans/cbc:PaymentMeansCode (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(if (some $code in (17, 18, 28, 29, 30, 32, 33, 35, 36, 39, 40, 41, 43, 48, 49) satisfies normalize-space(.) = string($code) ) then count (../cac:PayeeFinancialAccount/cbc:ID) = 1 else true() (:NABT-081 Row 143 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">if (some $code in (17, 18, 28, 29, 30, 32, 33, 35, 36, 39, 40, 41, 43, 48, 49) satisfies normalize-space(.) = string($code) ) then count (../cac:PayeeFinancialAccount/cbc:ID) = 1 else true() (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Missing required Payment Account Identifier for the payment means that requires an account. (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount (:NABT-084 NABT-086 Row 148 150 Tab 'Invoice, Credit Note':)"
                 priority="11"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount (:NABT-084 NABT-086 Row 148 150 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount (:NABT-084 NABT-086 Row 148 150 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:PaymentMeans/cac:PayeeFinancialAccount (:NABT-084 NABT-086 Row 148 150 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:ID) = 1 (:NABT-084 Row 148 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:ID) = 1 (:NABT-084 Row 148 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Payment Account Identifier is missing. (:NABT-084 Row 148 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cac:FinancialInstitutionBranch/cbc:ID) = 1 (:NABT-086 Row 150 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cac:FinancialInstitutionBranch/cbc:ID) = 1 (:NABT-086 Row 150 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>The financial branch identifier is missing. (:NABT-086 Row 150 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:AllowanceCharge (:NABT-097 NABT-104 Row 167 177 Tab 'Invoice, Credit Note':)"
                 priority="10"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:AllowanceCharge (:NABT-097 NABT-104 Row 167 177 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AllowanceCharge (:NABT-097 NABT-104 Row 167 177 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AllowanceCharge (:NABT-097 NABT-104 Row 167 177 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:AllowanceChargeReason) &gt;= 1 or count (cbc:AllowanceChargeReasonCode) = 1 (:NABT-097 Row 167 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:AllowanceChargeReason) &gt;= 1 or count (cbc:AllowanceChargeReasonCode) = 1 (:NABT-097 Row 167 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Missing Discount Reason and/or Discount Reason Code. (:NABT-097 Row 167 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cbc:AllowanceChargeReason) &gt;= 1 or count(cbc:AllowanceChargeReasonCode) = 1 (:NABT-104 Row 177 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cbc:AllowanceChargeReason) &gt;= 1 or count(cbc:AllowanceChargeReasonCode) = 1 (:NABT-104 Row 177 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Missing Charge Reason and/or Charge Reason Code when document level Charge information is provided. (:NABT-104 Row 177 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:AllowanceCharge/cac:TaxCategory (:NABT-102 Row 174 Tab 'Invoice, Credit Note':)"
                 priority="9"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:AllowanceCharge/cac:TaxCategory (:NABT-102 Row 174 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AllowanceCharge/cac:TaxCategory (:NABT-102 Row 174 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AllowanceCharge/cac:TaxCategory (:NABT-102 Row 174 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-102 Row 174 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-102 Row 174 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Invalid Document level charge tax category code. (:NABT-102 Row 174 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-950 Row 176 Tab 'Invoice, Credit Note':)"
                 priority="8"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-950 Row 176 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-950 Row 176 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-950 Row 176 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(.,'UNECE-5153') (:NABT-950 Row 176 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(.,'UNECE-5153') (:NABT-950 Row 176 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Tax Scheme value specified is invalid. (:NABT-950 Row 176 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:LegalMonetaryTotal (:NABG-022 NABT-109 NABT-112 Row 179 183 188 Tab 'Invoice, Credit Note':)"
                 priority="7"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:LegalMonetaryTotal (:NABG-022 NABT-109 NABT-112 Row 179 183 188 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:LegalMonetaryTotal (:NABG-022 NABT-109 NABT-112 Row 179 183 188 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:LegalMonetaryTotal (:NABG-022 NABT-109 NABT-112 Row 179 183 188 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:LineExtensionAmount) = 1 (:NABG-022 Row 179 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:LineExtensionAmount) = 1 (:NABG-022 Row 179 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Sum of invoice line net amount is not specified. (:NABG-022 Row 179 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cbc:TaxExclusiveAmount) = 1 (:NABT-109 Row 183 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:TaxExclusiveAmount) = 1 (:NABT-109 Row 183 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Missing the Invoice total amount without tax. (:NABT-109 Row 183 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cbc:TaxInclusiveAmount) = 1 (:NABT-112 Row 188 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:TaxInclusiveAmount) = 1 (:NABT-112 Row 188 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Missing the Invoice total amount with tax. (:NABT-112 Row 188 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)"
                 priority="6"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:LegalMonetaryTotal/cbc:PayableAmount (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(if( . &gt; 0 ) then ( count( /*/cbc:DueDate )&gt;0 or count( /*/cac:PaymentTerms/cbc:Note )&gt;0 ) else true() (:NABT-115 Row 193 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">if( . &gt; 0 ) then ( count( /*/cbc:DueDate )&gt;0 or count( /*/cac:PaymentTerms/cbc:Note )&gt;0 ) else true() (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>The Amount due for Payment is positive, but neither the Payment Due Date or Payment Terms exists. (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:TaxTotal[1] (:NABG-023 Row 195 Tab 'Invoice, Credit Note':)"
                 priority="5"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:TaxTotal[1] (:NABG-023 Row 195 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxTotal[1] (:NABG-023 Row 195 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:TaxTotal[1] (:NABG-023 Row 195 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count( cac:TaxSubtotal ) &gt;= 1 (:NABG-023 Row 195 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count( cac:TaxSubtotal ) &gt;= 1 (:NABG-023 Row 195 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Missing Tax Breakdown information. (:NABG-023 Row 195 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:TaxCategory (:NABT-118 Row 200 Tab 'Invoice, Credit Note':)"
                 priority="4"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:TaxCategory (:NABT-118 Row 200 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxCategory (:NABT-118 Row 200 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:TaxCategory (:NABT-118 Row 200 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-118 Row 200 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-118 Row 200 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Tax category code not specified or value specified is invalid. (:NABT-118 Row 200 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/Invoice:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)"
                 priority="3"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/Invoice:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/Invoice:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/Invoice:Invoice/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(.,'UNECE-5153') (:NABT-949 Row 204 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(.,'UNECE-5153') (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Tax Scheme value specified is invalid. (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:InvoiceLine (:NABT-129 NABG-029 Row 223 270 Tab 'Invoice, Credit Note':)"
                 priority="2"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine (:NABT-129 NABG-029 Row 223 270 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine (:NABT-129 NABG-029 Row 223 270 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:InvoiceLine (:NABT-129 NABG-029 Row 223 270 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:InvoicedQuantity) =1 (:NABT-129 Row 223 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:InvoicedQuantity) =1 (:NABT-129 Row 223 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Invoiced quantity is not specified or exists more than once. (:NABT-129 Row 223 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cac:Price) = 1 (:NABG-029 Row 270 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cac:Price) = 1 (:NABG-029 Row 270 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Price Details is not specified or exists more than once. (:NABG-029 Row 270 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine (:NABT-129 Row 224 Tab 'Invoice, Credit Note':)"
                 priority="1"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine (:NABT-129 Row 224 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine (:NABT-129 Row 224 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine (:NABT-129 Row 224 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:CreditedQuantity) =1 (:NABT-129 Row 224 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:CreditedQuantity) =1 (:NABT-129 Row 224 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Credited quantity is not specified or exists more than once. (:NABT-129 Row 224 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:InvoiceLine/cac:Item (:NABT-153 Row 292 Tab 'Invoice, Credit Note':)"
                 priority="0"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine/cac:Item (:NABT-153 Row 292 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item (:NABT-153 Row 292 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Item (:NABT-153 Row 292 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:Name) = 1 (:NABT-153 Row 292 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:Name) = 1 (:NABT-153 Row 292 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Item Name is not specified or exists more than once. (:NABT-153 Row 292 Tab 'Invoice, Credit Note':)</svrl:text>
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
