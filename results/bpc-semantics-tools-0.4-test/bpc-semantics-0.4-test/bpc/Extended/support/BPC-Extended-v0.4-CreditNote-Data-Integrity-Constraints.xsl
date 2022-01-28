<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
               xmlns:sch="http://purl.oclc.org/dsdl/schematron"
               xmlns:error="https://doi.org/10.5281/zenodo.1495494#error"
               xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
               xmlns:schxslt-api="https://doi.org/10.5281/zenodo.1495494#api"
               xmlns:schxslt="https://doi.org/10.5281/zenodo.1495494"
               xmlns:xs="http://www.w3.org/2001/XMLSchema"
               xmlns:CreditNote="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"
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
      <dct:created>2022-01-28T15:20:18.031-05:00</dct:created>
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
                  <dct:created>2022-01-28T15:20:18.031-05:00</dct:created>
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
                              title="BPC Schematron Constraints for customization Extended v0.4 - test">
         <svrl:ns-prefix-in-attribute-values prefix="CreditNote"
                                             uri="urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2"/>
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
                                    name="BPC Schematron Expressions for process Extended v0.4 - test from worksheet Invoice, Credit Note">
                  <xsl:attribute name="documents" select="base-uri(.)"/>
               </svrl:active-pattern>
            </xsl:for-each>
         </schxslt:pattern>
         <xsl:apply-templates mode="d14e18" select="/"/>
      </schxslt:document>
   </xsl:template>
   <xsl:template match="ext:ExtensionContent//*[not(*) and not(normalize-space(.))] |                   ext:ExtensionContent//@*[not(normalize-space(.))]"
                 priority="70"
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
                 priority="69"
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
   <xsl:template match="@*[not(normalize-space(.))]" priority="68" mode="d14e18">
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
                 priority="67"
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
   <xsl:template match="/CreditNote:CreditNote (:NABT-999 NABT-003 NABT-005 NABT-011 NABT-012 NABT-013 NABT-015 NABT-022 NABG-014 NABT-023 NABT-989 NABT-024 NABG-005 NABG-007 NABT-090 NABG-023 Row 2 7 9 12 13 14 17 30 32 38 39 42 58 106 157 196 Tab 'Invoice, Credit Note':)"
                 priority="66"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote (:NABT-999 NABT-003 NABT-005 NABT-011 NABT-012 NABT-013 NABT-015 NABT-022 NABG-014 NABT-023 NABT-989 NABT-024 NABG-005 NABG-007 NABT-090 NABG-023 Row 2 7 9 12 13 14 17 30 32 38 39 42 58 106 157 196 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote (:NABT-999 NABT-003 NABT-005 NABT-011 NABT-012 NABT-013 NABT-015 NABT-022 NABG-014 NABT-023 NABT-989 NABT-024 NABG-005 NABG-007 NABT-090 NABG-023 Row 2 7 9 12 13 14 17 30 32 38 39 42 58 106 157 196 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote (:NABT-999 NABT-003 NABT-005 NABT-011 NABT-012 NABT-013 NABT-015 NABT-022 NABG-014 NABT-023 NABT-989 NABT-024 NABG-005 NABG-007 NABT-090 NABG-023 Row 2 7 9 12 13 14 17 30 32 38 39 42 58 106 157 196 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count(cbc:UBLVersionID) = 1 (:NABT-999 Row 2 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cbc:UBLVersionID) = 1 (:NABT-999 Row 2 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Missing declaration of the version of UBL (:NABT-999 Row 2 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(normalize-space(cbc:CreditNoteTypeCode) = ('380','381') (:NABT-003 Row 7 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">normalize-space(cbc:CreditNoteTypeCode) = ('380','381') (:NABT-003 Row 7 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Invoice Type Code not specified or value specified is not allowed. (:NABT-003 Row 7 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(bpc:codelist(cbc:DocumentCurrencyCode,'ISO-4217') (:NABT-005 Row 9 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cbc:DocumentCurrencyCode,'ISO-4217') (:NABT-005 Row 9 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Document Currency Code not specified or value specified is not allowed. (:NABT-005 Row 9 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:ProjectReference/cbc:ID) &lt;= 1 (:NABT-011 Row 12 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:ProjectReference/cbc:ID) &lt;= 1 (:NABT-011 Row 12 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one project reference exists. (:NABT-011 Row 12 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:ContractDocumentReference/cbc:ID) &lt;= 1 (:NABT-012 Row 13 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:ContractDocumentReference/cbc:ID) &lt;= 1 (:NABT-012 Row 13 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one contract number exists. (:NABT-012 Row 13 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:OrderReference/cbc:ID) &lt;= 1 (:NABT-013 Row 14 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:OrderReference/cbc:ID) &lt;= 1 (:NABT-013 Row 14 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Purchase order reference cannot be specified more than once. (:NABT-013 Row 14 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:ReceiptDocumentReference/cbc:ID) &lt;= 1 (:NABT-015 Row 17 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:ReceiptDocumentReference/cbc:ID) &lt;= 1 (:NABT-015 Row 17 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one proof of delivery reference exists. (:NABT-015 Row 17 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cbc:Note) &lt;=1 (:NABT-022 Row 30 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:Note) &lt;=1 (:NABT-022 Row 30 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one invoice note exists. (:NABT-022 Row 30 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:InvoicePeriod) &lt;= 1 (:NABG-014 Row 32 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:InvoicePeriod) &lt;= 1 (:NABG-014 Row 32 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one invoiced object identifier exists. (:NABG-014 Row 32 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(normalize-space(cbc:ProfileID) = 'bpc-0.4-process#CreditNote' (:NABT-023 Row 38 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">normalize-space(cbc:ProfileID) = 'bpc-0.4-process#CreditNote' (:NABT-023 Row 38 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Business process type not specified or value specified is not valid. (:NABT-023 Row 38 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cbc:ProfileExecutionID) =1 (:NABT-989 Row 39 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cbc:ProfileExecutionID) =1 (:NABT-989 Row 39 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Session Identifier is not specified or exists more than once. (:NABT-989 Row 39 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(normalize-space(cbc:CustomizationID) = 'urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2::CreditNote##bpc-0.4-data-Extended' (:NABT-024 Row 42 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">normalize-space(cbc:CustomizationID) = 'urn:oasis:names:specification:ubl:schema:xsd:CreditNote-2::CreditNote##bpc-0.4-data-Extended' (:NABT-024 Row 42 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Specification Identifier not specified or value specified is not valid. (:NABT-024 Row 42 Tab 'Invoice, Credit Note':)</svrl:text>
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
               <xsl:if test="not(count (cac:PayeeParty/cac:PartyIdentification/cbc:ID) &lt;= 1 (:NABT-090 Row 157 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cac:PayeeParty/cac:PartyIdentification/cbc:ID) &lt;= 1 (:NABT-090 Row 157 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one Bank Assigned Creditor Identifier exists. (:NABT-090 Row 157 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(if( exists( cbc:TaxCurrencyCode ) ) then count( cac:TaxTotal ) &lt;= 2 else count( cac:TaxTotal ) &lt;= 1 (:NABG-023 Row 196 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">if( exists( cbc:TaxCurrencyCode ) ) then count( cac:TaxTotal ) &lt;= 2 else count( cac:TaxTotal ) &lt;= 1 (:NABG-023 Row 196 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Too many tax total information items (:NABG-023 Row 196 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cbc:TaxCurrencyCode (:NABT-006 Row 10 Tab 'Invoice, Credit Note':)"
                 priority="65"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cbc:TaxCurrencyCode (:NABT-006 Row 10 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cbc:TaxCurrencyCode (:NABT-006 Row 10 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cbc:TaxCurrencyCode (:NABT-006 Row 10 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(.,'ISO-4217') (:NABT-006 Row 10 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(.,'ISO-4217') (:NABT-006 Row 10 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Tax Currency Code value specified is not allowed. (:NABT-006 Row 10 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:PaymentTerms (:NABG-999 Row 22 Tab 'Invoice, Credit Note':)"
                 priority="64"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:PaymentTerms (:NABG-999 Row 22 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:PaymentTerms (:NABG-999 Row 22 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:PaymentTerms (:NABG-999 Row 22 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(if( count( cbc:SettlementDiscountPercent ) &gt; 0 or count( cbc:SettlementDiscountAmount ) &gt; 0 or count( cbc:Amount ) &gt; 0 ) then ( count( cbc:SettlementDiscountPercent ) = 1 and count( cbc:SettlementDiscountAmount ) = 1 and count( cbc:Amount ) = 1 ) else true() (:NABG-999 Row 22 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">if( count( cbc:SettlementDiscountPercent ) &gt; 0 or count( cbc:SettlementDiscountAmount ) &gt; 0 or count( cbc:Amount ) &gt; 0 ) then ( count( cbc:SettlementDiscountPercent ) = 1 and count( cbc:SettlementDiscountAmount ) = 1 and count( cbc:Amount ) = 1 ) else true() (:NABG-999 Row 22 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Payment Terms Discount Percent, Payment Terms Discount Amount or Basis for Terms Discount do not exist when one of the terms is provided. (:NABG-999 Row 22 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:InvoicePeriod (:NABT-073 NABT-074 Row 33 35 Tab 'Invoice, Credit Note':)"
                 priority="63"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:InvoicePeriod (:NABT-073 NABT-074 Row 33 35 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:InvoicePeriod (:NABT-073 NABT-074 Row 33 35 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:InvoicePeriod (:NABT-073 NABT-074 Row 33 35 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:StartDate) = 1 and count (cbc:EndDate) = 1 (:NABT-073 Row 33 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:StartDate) = 1 and count (cbc:EndDate) = 1 (:NABT-073 Row 33 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Missing Invoicing Period Start Date and/or Invoicing Period End Date. (:NABT-073 Row 33 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(if ( count(cbc:StartTime) = 0 and count(cbc:EndTime) = 0 ) then (:date, no time:) ( dateTime(cbc:EndDate,xsd:time('00:00:00')) &gt;= dateTime(cbc:StartDate,xsd:time('00:00:00')) ) else if ( count(cbc:StartTime) =1 and count(cbc:EndTime) = 1 ) then (:date and time:) ( dateTime(cbc:EndDate,cbc:EndTime) &gt;= dateTime(cbc:StartDate,cbc:StartTime) ) else false() (:NABT-074 Row 35 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">if ( count(cbc:StartTime) = 0 and count(cbc:EndTime) = 0 ) then (:date, no time:) ( dateTime(cbc:EndDate,xsd:time('00:00:00')) &gt;= dateTime(cbc:StartDate,xsd:time('00:00:00')) ) else if ( count(cbc:StartTime) =1 and count(cbc:EndTime) = 1 ) then (:date and time:) ( dateTime(cbc:EndDate,cbc:EndTime) &gt;= dateTime(cbc:StartDate,cbc:StartTime) ) else false() (:NABT-074 Row 35 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Invoicing Period is incomplete or the end is before the Invoicing Period start. (:NABT-074 Row 35 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference (:NABT-025 Row 44 Tab 'Invoice, Credit Note':)"
                 priority="62"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference (:NABT-025 Row 44 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference (:NABT-025 Row 44 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference (:NABT-025 Row 44 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:ID) = 1 (:NABT-025 Row 44 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:ID) = 1 (:NABT-025 Row 44 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Preceding Invoice Number is not specified or exists more than once if Preceding Invoice Reference is provided. (:NABT-025 Row 44 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode (:NABT-988 Row 45 Tab 'Invoice, Credit Note':)"
                 priority="61"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode (:NABT-988 Row 45 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode (:NABT-988 Row 45 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:BillingReference/cac:InvoiceDocumentReference/cbc:DocumentStatusCode (:NABT-988 Row 45 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(.,'UNECE-1373') (:NABT-988 Row 45 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(.,'UNECE-1373') (:NABT-988 Row 45 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Value is not found in code list UNECE-1373. (:NABT-988 Row 45 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AccountingSupplierParty (:NABG-004 NABT-028 NABT-029 Row 47 49 50 Tab 'Invoice, Credit Note':)"
                 priority="60"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AccountingSupplierParty (:NABG-004 NABT-028 NABT-029 Row 47 49 50 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingSupplierParty (:NABG-004 NABT-028 NABT-029 Row 47 49 50 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingSupplierParty (:NABG-004 NABT-028 NABT-029 Row 47 49 50 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)"
                 priority="59"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-029-1 Row 51 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party (:NABT-030 Row 52 Tab 'Invoice, Credit Note':)"
                 priority="58"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party (:NABT-030 Row 52 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party (:NABT-030 Row 52 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party (:NABT-030 Row 52 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1 (:NABT-030 Row 52 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1 (:NABT-030 Row 52 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one Supplier - Accounts Receivable Legal Registration Identifier exists. (:NABT-030 Row 52 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-030-1 Row 53 Tab 'Invoice, Credit Note':)"
                 priority="57"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-030-1 Row 53 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-030-1 Row 53 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-030-1 Row 53 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (@schemeID) = 1 (:NABT-030-1 Row 53 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (@schemeID) = 1 (:NABT-030-1 Row 53 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Scheme Identifier does not exist when Supplier - Accounts ReceivableLegal Registration Identifier is provided. (:NABT-030-1 Row 53 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID (:NABT-34-1 Row 57 Tab 'Invoice, Credit Note':)"
                 priority="56"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID (:NABT-34-1 Row 57 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID (:NABT-34-1 Row 57 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cbc:EndpointID (:NABT-34-1 Row 57 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count(@schemeID) =1 (:NABT-34-1 Row 57 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(@schemeID) =1 (:NABT-34-1 Row 57 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Supplier - Seller electronic address scheme identifier is not specified or exists more than once if Supplier - Seller electronic address is provided. (:NABT-34-1 Row 57 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)"
                 priority="55"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingSupplierParty/cac:Party/cac:PostalAddress (:NABT-040 Row 63 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
   <xsl:template match="/CreditNote:CreditNote/cac:PayeeParty (:NABT-59 NABT-60 NABT-61 Row 70 71 73 Tab 'Invoice, Credit Note':)"
                 priority="54"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:PayeeParty (:NABT-59 NABT-60 NABT-61 Row 70 71 73 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:PayeeParty (:NABT-59 NABT-60 NABT-61 Row 70 71 73 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:PayeeParty (:NABT-59 NABT-60 NABT-61 Row 70 71 73 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count(cac:PartyName/cbc:Name) = 1 (:NABT-59 Row 70 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:PartyName/cbc:Name) = 1 (:NABT-59 Row 70 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Fewer or more than one payee party name. (:NABT-59 Row 70 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:PartyIdentification/cbc:ID) = 1 (:NABT-60 Row 71 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:PartyIdentification/cbc:ID) = 1 (:NABT-60 Row 71 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Fewer or more than one payee party identifier. (:NABT-60 Row 71 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1 (:NABT-61 Row 73 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1 (:NABT-61 Row 73 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one Supplier - payee legal registration identifier exists. (:NABT-61 Row 73 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID (:NABT-60-1 Row 72 Tab 'Invoice, Credit Note':)"
                 priority="53"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID (:NABT-60-1 Row 72 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID (:NABT-60-1 Row 72 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:PayeeParty/cac:PartyIdentification/cbc:ID (:NABT-60-1 Row 72 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (@schemeID) = 1 (:NABT-60-1 Row 72 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (@schemeID) = 1 (:NABT-60-1 Row 72 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Scheme Identifier does not exist when Supplier - payee Identifier is provided. (:NABT-60-1 Row 72 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID (:NABT-61-1 Row 74 Tab 'Invoice, Credit Note':)"
                 priority="52"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID (:NABT-61-1 Row 74 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID (:NABT-61-1 Row 74 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:PayeeParty/cac:PartyLegalEntity/cbc:CompanyID (:NABT-61-1 Row 74 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (@schemeID) = 1 (:NABT-61-1 Row 74 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (@schemeID) = 1 (:NABT-61-1 Row 74 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Scheme Identifier does not exist when Supplier - payee Legal Registration Identifier is provided. (:NABT-61-1 Row 74 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:PayeeParty/cac:PostalAddress (:NABT-981 Row 80 Tab 'Invoice, Credit Note':)"
                 priority="51"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:PayeeParty/cac:PostalAddress (:NABT-981 Row 80 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:PayeeParty/cac:PostalAddress (:NABT-981 Row 80 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:PayeeParty/cac:PostalAddress (:NABT-981 Row 80 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-981 Row 80 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-981 Row 80 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Supplier- Payee Country Code does not exist exactly once when Supplier - Payee Postal Address is provided. Supplier - Payee Country Code not specified or value specified is invalid. (:NABT-981 Row 80 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:SellerSupplierParty (:NABT-976 NABT-975 NABT-974 NABT-972 Row 87 88 89 91 Tab 'Invoice, Credit Note':)"
                 priority="50"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:SellerSupplierParty (:NABT-976 NABT-975 NABT-974 NABT-972 Row 87 88 89 91 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:SellerSupplierParty (:NABT-976 NABT-975 NABT-974 NABT-972 Row 87 88 89 91 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:SellerSupplierParty (:NABT-976 NABT-975 NABT-974 NABT-972 Row 87 88 89 91 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count(cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) = 1 (:NABT-976 Row 87 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:Party/cac:PartyLegalEntity/cbc:RegistrationName) = 1 (:NABT-976 Row 87 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Seller name is not specified or exists more than once. (:NABT-976 Row 87 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:Party/cac:PartyName/cbc:Name) &lt;= 1 (:NABT-975 Row 88 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:Party/cac:PartyName/cbc:Name) &lt;= 1 (:NABT-975 Row 88 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one Supplier - Seller Trading Name exists. (:NABT-975 Row 88 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:Party/cac:PartyIdentification/cbc:ID) &lt;= 1 (:NABT-974 Row 89 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:Party/cac:PartyIdentification/cbc:ID) &lt;= 1 (:NABT-974 Row 89 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one Supplier - Seller Identifier exists. (:NABT-974 Row 89 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count(cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1 (:NABT-972 Row 91 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1 (:NABT-972 Row 91 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one Supplier - Seller legal registration identifier exists. (:NABT-972 Row 91 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-973 Row 90 Tab 'Invoice, Credit Note':)"
                 priority="49"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-973 Row 90 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-973 Row 90 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-973 Row 90 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (@schemeID) = 1 (:NABT-973 Row 90 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (@schemeID) = 1 (:NABT-973 Row 90 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Scheme Identifier does not exist when Supplier - Seller Identifier is provided. (:NABT-973 Row 90 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-971 Row 92 Tab 'Invoice, Credit Note':)"
                 priority="48"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-971 Row 92 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-971 Row 92 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-971 Row 92 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (@schemeID) = 1 (:NABT-971 Row 92 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (@schemeID) = 1 (:NABT-971 Row 92 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Scheme Identifier does not exist when Supplier - Seller Legal Registration Identifier is provided. (:NABT-971 Row 92 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:EndpointID (:NABT-969 Row 94 Tab 'Invoice, Credit Note':)"
                 priority="47"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:EndpointID (:NABT-969 Row 94 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:EndpointID (:NABT-969 Row 94 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cbc:EndpointID (:NABT-969 Row 94 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count(@schemeID) =1 (:NABT-969 Row 94 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count(@schemeID) =1 (:NABT-969 Row 94 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Supplier - Seller electronic address scheme identifier is not specified or exists more than once if Supplier - Seller electronic address is provided. (:NABT-969 Row 94 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress (:NABT-964 Row 100 Tab 'Invoice, Credit Note':)"
                 priority="46"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress (:NABT-964 Row 100 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress (:NABT-964 Row 100 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:SellerSupplierParty/cac:Party/cac:PostalAddress (:NABT-964 Row 100 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-964 Row 100 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-964 Row 100 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Supplier- Seller Country Code does not exist exactly once when Supplier - Seller Postal Address is provided. Supplier - Seller Country Code not specified or value specified is invalid. (:NABT-964 Row 100 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AccountingCustomerParty (:NABT-045 NABT-046 NABT-047 Row 108 109 111 Tab 'Invoice, Credit Note':)"
                 priority="45"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AccountingCustomerParty (:NABT-045 NABT-046 NABT-047 Row 108 109 111 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingCustomerParty (:NABT-045 NABT-046 NABT-047 Row 108 109 111 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingCustomerParty (:NABT-045 NABT-046 NABT-047 Row 108 109 111 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
               <xsl:if test="not(count (cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1 (:NABT-047 Row 111 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cac:Party/cac:PartyLegalEntity/cbc:CompanyID) &lt;= 1 (:NABT-047 Row 111 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one Customer - Accounts Payable Legal Registration Identifier exists. (:NABT-047 Row 111 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)"
                 priority="44"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyIdentification/cbc:ID (:NABT-046-1 Row 110 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-047-1 Row 112 Tab 'Invoice, Credit Note':)"
                 priority="43"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-047-1 Row 112 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-047-1 Row 112 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PartyLegalEntity/cbc:CompanyID (:NABT-047-1 Row 112 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (@schemeID) = 1 (:NABT-047-1 Row 112 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (@schemeID) = 1 (:NABT-047-1 Row 112 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Scheme Identifier does not exist when Supplier - Accounts Payable Legal Registration Identifier is provided. (:NABT-047-1 Row 112 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID (:NABT-049-1 Row 115 Tab 'Invoice, Credit Note':)"
                 priority="42"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID (:NABT-049-1 Row 115 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID (:NABT-049-1 Row 115 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cbc:EndpointID (:NABT-049-1 Row 115 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (@schemeID) = 1 (:NABT-049-1 Row 115 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (@schemeID) = 1 (:NABT-049-1 Row 115 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Customer - Accounts Payable Electronic Address Scheme Identifier is not specified or exists more than once when Electronic Address is provided. (:NABT-049-1 Row 115 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)"
                 priority="41"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AccountingCustomerParty/cac:Party/cac:PostalAddress (:NABT-055 Row 121 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
   <xsl:template match="/CreditNote:CreditNote/cac:Delivery (:NABT-070 Row 129 Tab 'Invoice, Credit Note':)"
                 priority="40"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:Delivery (:NABT-070 Row 129 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:Delivery (:NABT-070 Row 129 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:Delivery (:NABT-070 Row 129 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cac:DeliveryParty/cac:PartyName/cbc:Name) &lt;= 1 (:NABT-070 Row 129 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cac:DeliveryParty/cac:PartyName/cbc:Name) &lt;= 1 (:NABT-070 Row 129 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one Deliver to party name exists. (:NABT-070 Row 129 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address (:NABT-080 Row 140 Tab 'Invoice, Credit Note':)"
                 priority="39"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address (:NABT-080 Row 140 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address (:NABT-080 Row 140 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:Delivery/cac:DeliveryLocation/cac:Address (:NABT-080 Row 140 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-080 Row 140 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-080 Row 140 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Deliver to Country Code is invalid. (:NABT-080 Row 140 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:PaymentMeans (:NABT-081 NABT-083 Row 142 146 Tab 'Invoice, Credit Note':)"
                 priority="38"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:PaymentMeans (:NABT-081 NABT-083 Row 142 146 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:PaymentMeans (:NABT-081 NABT-083 Row 142 146 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:PaymentMeans (:NABT-081 NABT-083 Row 142 146 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(cbc:PaymentMeansCode,'UNECE-4461') (:NABT-081 Row 142 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cbc:PaymentMeansCode,'UNECE-4461') (:NABT-081 Row 142 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Invalid payment method type code. (:NABT-081 Row 142 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cbc:PaymentID) &lt;= 1 (:NABT-083 Row 146 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:PaymentID) &lt;= 1 (:NABT-083 Row 146 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one remittance requirement information entry exists. (:NABT-083 Row 146 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)"
                 priority="37"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:PaymentMeans/cbc:PaymentMeansCode (:NABT-081 Row 143 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
   <xsl:template match="/CreditNote:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount (:NABT-084 NABT-086 Row 148 150 Tab 'Invoice, Credit Note':)"
                 priority="36"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount (:NABT-084 NABT-086 Row 148 150 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount (:NABT-084 NABT-086 Row 148 150 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:PaymentMeans/cac:PayeeFinancialAccount (:NABT-084 NABT-086 Row 148 150 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
   <xsl:template match="cac:TaxCategory (:NABT-095 NABT-118 NABT-927 NABT-151 Row 164 200 251 287 Tab 'Invoice, Credit Note':)"
                 priority="35"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:TaxCategory (:NABT-095 NABT-118 NABT-927 NABT-151 Row 164 200 251 287 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxCategory (:NABT-095 NABT-118 NABT-927 NABT-151 Row 164 200 251 287 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:TaxCategory (:NABT-095 NABT-118 NABT-927 NABT-151 Row 164 200 251 287 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-095 Row 164 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-095 Row 164 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Document level discount tax category code is invalid. (:NABT-095 Row 164 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-118 Row 200 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-118 Row 200 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Tax category code not specified or value specified is invalid. (:NABT-118 Row 200 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-927 Row 251 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-927 Row 251 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Tax Category Code is not specified or specified value is invalid. (:NABT-927 Row 251 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-151 Row 287 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cbc:ID,'UNECE-5305') (:NABT-151 Row 287 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Invoiced Item Tax Category Code is not specified or specified value is invalid. (:NABT-151 Row 287 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AllowanceCharge/cac:TaxCategory (:NABT-096 NABT-102 Row 165 174 Tab 'Invoice, Credit Note':)"
                 priority="34"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AllowanceCharge/cac:TaxCategory (:NABT-096 NABT-102 Row 165 174 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AllowanceCharge/cac:TaxCategory (:NABT-096 NABT-102 Row 165 174 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AllowanceCharge/cac:TaxCategory (:NABT-096 NABT-102 Row 165 174 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:Percent) &lt;= 1 (:NABT-096 Row 165 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:Percent) &lt;= 1 (:NABT-096 Row 165 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one document level discount tax rate exists. (:NABT-096 Row 165 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-952 NABT-950 Row 166 176 Tab 'Invoice, Credit Note':)"
                 priority="33"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-952 NABT-950 Row 166 176 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-952 NABT-950 Row 166 176 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AllowanceCharge/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-952 NABT-950 Row 166 176 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(.,'UNECE-5153') (:NABT-952 Row 166 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(.,'UNECE-5153') (:NABT-952 Row 166 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Tax Scheme value specified is invalid. (:NABT-952 Row 166 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AllowanceCharge (:NABT-097 NABT-104 Row 167 177 Tab 'Invoice, Credit Note':)"
                 priority="32"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AllowanceCharge (:NABT-097 NABT-104 Row 167 177 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AllowanceCharge (:NABT-097 NABT-104 Row 167 177 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AllowanceCharge (:NABT-097 NABT-104 Row 167 177 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode (:NABT-098 NABT-105 Row 168 178 Tab 'Invoice, Credit Note':)"
                 priority="31"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode (:NABT-098 NABT-105 Row 168 178 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode (:NABT-098 NABT-105 Row 168 178 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode (:NABT-098 NABT-105 Row 168 178 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(.,'UNECE-5189') (:NABT-098 Row 168 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(.,'UNECE-5189') (:NABT-098 Row 168 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Document level discount reason code is invalid. (:NABT-098 Row 168 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(bpc:codelist(.,'UNECE-5189') (:NABT-105 Row 178 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(.,'UNECE-5189') (:NABT-105 Row 178 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Document level charge reason code is not a valid value from UNECE-5189 code list. (:NABT-105 Row 178 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:LegalMonetaryTotal (:NABG-022 NABT-109 NABT-112 Row 179 183 188 Tab 'Invoice, Credit Note':)"
                 priority="30"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:LegalMonetaryTotal (:NABG-022 NABT-109 NABT-112 Row 179 183 188 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:LegalMonetaryTotal (:NABG-022 NABT-109 NABT-112 Row 179 183 188 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:LegalMonetaryTotal (:NABG-022 NABT-109 NABT-112 Row 179 183 188 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
   <xsl:template match="cac:TaxTotal[1]/cbc:TaxAmount (:NABT-111 Row 186 Tab 'Invoice, Credit Note':)"
                 priority="29"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:TaxTotal[1]/cbc:TaxAmount (:NABT-111 Row 186 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxTotal[1]/cbc:TaxAmount (:NABT-111 Row 186 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:TaxTotal[1]/cbc:TaxAmount (:NABT-111 Row 186 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(@currencyID = /*/cbc:DocumentCurrencyCode (:NABT-111 Row 186 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">@currencyID = /*/cbc:DocumentCurrencyCode (:NABT-111 Row 186 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>The first tax total is not in the document currency. (:NABT-111 Row 186 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:TaxTotal[2]/cbc:TaxAmount (:NABT-111 Row 187 Tab 'Invoice, Credit Note':)"
                 priority="28"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:TaxTotal[2]/cbc:TaxAmount (:NABT-111 Row 187 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxTotal[2]/cbc:TaxAmount (:NABT-111 Row 187 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:TaxTotal[2]/cbc:TaxAmount (:NABT-111 Row 187 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(@currencyID = /*/cbc:TaxCurrencyCode (:NABT-111 Row 187 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">@currencyID = /*/cbc:TaxCurrencyCode (:NABT-111 Row 187 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>The second tax total is not in the tax currency. (:NABT-111 Row 187 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:LegalMonetaryTotal/cbc:PayableAmount (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)"
                 priority="27"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:LegalMonetaryTotal/cbc:PayableAmount (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:LegalMonetaryTotal/cbc:PayableAmount (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:LegalMonetaryTotal/cbc:PayableAmount (:NABT-115 Row 193 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
   <xsl:template match="cac:TaxTotal[2] (:NABG-023 Row 197 Tab 'Invoice, Credit Note':)"
                 priority="26"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:TaxTotal[2] (:NABG-023 Row 197 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:TaxTotal[2] (:NABG-023 Row 197 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:TaxTotal[2] (:NABG-023 Row 197 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count( cac:TaxSubtotal ) = 0 (:NABG-023 Row 197 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count( cac:TaxSubtotal ) = 0 (:NABG-023 Row 197 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>The second tax total incorrectly has breakdown information. (:NABG-023 Row 197 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:TaxTotal/cac:TaxSubtotal (:NABT-116 NABT-120 Row 198 202 Tab 'Invoice, Credit Note':)"
                 priority="25"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:TaxTotal/cac:TaxSubtotal (:NABT-116 NABT-120 Row 198 202 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:TaxTotal/cac:TaxSubtotal (:NABT-116 NABT-120 Row 198 202 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:TaxTotal/cac:TaxSubtotal (:NABT-116 NABT-120 Row 198 202 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:TaxableAmount) =1 (:NABT-116 Row 198 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:TaxableAmount) =1 (:NABT-116 Row 198 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Tax Category taxable amount is not specified or exists more than once. (:NABT-116 Row 198 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cac:TaxCategory/cbc:TaxExemptionReason) &lt;= 1 (:NABT-120 Row 202 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cac:TaxCategory/cbc:TaxExemptionReason) &lt;= 1 (:NABT-120 Row 202 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one Tax Exemption Reason Text entry exists. (:NABT-120 Row 202 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)"
                 priority="24"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-949 Row 204 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode (:NABT-125-1 Row 217 Tab 'Invoice, Credit Note':)"
                 priority="23"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode (:NABT-125-1 Row 217 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode (:NABT-125-1 Row 217 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject/@mimeCode (:NABT-125-1 Row 217 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(.,'IANA-Media-Types') (:NABT-125-1 Row 217 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(.,'IANA-Media-Types') (:NABT-125-1 Row 217 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Embedded binary object MIME code is not valid. (:NABT-125-1 Row 217 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="/CreditNote:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject (:NABT-125-2 Row 218 Tab 'Invoice, Credit Note':)"
                 priority="22"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "/CreditNote:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject (:NABT-125-2 Row 218 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject (:NABT-125-2 Row 218 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">/CreditNote:CreditNote/cac:AdditionalDocumentReference/cac:Attachment/cbc:EmbeddedDocumentBinaryObject (:NABT-125-2 Row 218 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (@filename ) = 1 (:NABT-125-2 Row 218 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (@filename ) = 1 (:NABT-125-2 Row 218 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Attached document filename is not specified. (:NABT-125-2 Row 218 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cbc.Note (:NABT-127 Row 221 Tab 'Invoice, Credit Note':)"
                 priority="21"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cbc.Note (:NABT-127 Row 221 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cbc.Note (:NABT-127 Row 221 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cbc.Note (:NABT-127 Row 221 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc.Note) &lt;= 1 (:NABT-127 Row 221 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc.Note) &lt;= 1 (:NABT-127 Row 221 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one Invoice Line Note exists. (:NABT-127 Row 221 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:InvoiceLine (:NABT-129 Row 223 Tab 'Invoice, Credit Note':)"
                 priority="20"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine (:NABT-129 Row 223 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine (:NABT-129 Row 223 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:InvoiceLine (:NABT-129 Row 223 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:InvoicedQuantity) =1 (:NABT-129 Row 223 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:InvoicedQuantity) =1 (:NABT-129 Row 223 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Invoiced quantity is not specified or exists more than once. (:NABT-129 Row 223 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine (:NABT-129 NABT-132 NABG-990 NABG-026 NABG-029 Row 224 228 247 253 270 Tab 'Invoice, Credit Note':)"
                 priority="19"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine (:NABT-129 NABT-132 NABG-990 NABG-026 NABG-029 Row 224 228 247 253 270 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine (:NABT-129 NABT-132 NABG-990 NABG-026 NABG-029 Row 224 228 247 253 270 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine (:NABT-129 NABT-132 NABG-990 NABG-026 NABG-029 Row 224 228 247 253 270 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:CreditedQuantity) =1 (:NABT-129 Row 224 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:CreditedQuantity) =1 (:NABT-129 Row 224 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Credited quantity is not specified or exists more than once. (:NABT-129 Row 224 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cac:OrderLineReference/cbc:LineID) =1 (:NABT-132 Row 228 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cac:OrderLineReference/cbc:LineID) =1 (:NABT-132 Row 228 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Purchase Order Line Number is not specified or exists more than once. (:NABT-132 Row 228 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(if( exists( /*/cbc:TaxCurrencyCode ) ) then count( cac:TaxTotal ) &lt;= 2 else count( cac:TaxTotal ) &lt;= 1 (:NABG-990 Row 247 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">if( exists( /*/cbc:TaxCurrencyCode ) ) then count( cac:TaxTotal ) &lt;= 2 else count( cac:TaxTotal ) &lt;= 1 (:NABG-990 Row 247 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Too many tax total information items (:NABG-990 Row 247 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cac:InvoicePeriod) &lt;= 1 (:NABG-026 Row 253 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cac:InvoicePeriod) &lt;= 1 (:NABG-026 Row 253 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one Invoice Period on the line exists. (:NABG-026 Row 253 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:InvoiceLine/cbc:InvoicedQuantity/@unitCode (:NABT-130 Row 225 Tab 'Invoice, Credit Note':)"
                 priority="18"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine/cbc:InvoicedQuantity/@unitCode (:NABT-130 Row 225 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cbc:InvoicedQuantity/@unitCode (:NABT-130 Row 225 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:InvoiceLine/cbc:InvoicedQuantity/@unitCode (:NABT-130 Row 225 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(.,'UNECE-Rec-20-21') (:NABT-130 Row 225 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(.,'UNECE-Rec-20-21') (:NABT-130 Row 225 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Invoiced quantity unit of measure code not specified or value specified is not valid. (:NABT-130 Row 225 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cbc:CreditedQuantity/@unitCode (:NABT-130 Row 226 Tab 'Invoice, Credit Note':)"
                 priority="17"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cbc:CreditedQuantity/@unitCode (:NABT-130 Row 226 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cbc:CreditedQuantity/@unitCode (:NABT-130 Row 226 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cbc:CreditedQuantity/@unitCode (:NABT-130 Row 226 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(.,'UNECE-Rec-20-21') (:NABT-130 Row 226 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(.,'UNECE-Rec-20-21') (:NABT-130 Row 226 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Credited quantity unit of measure code not specified or value specified is not valid. (:NABT-130 Row 226 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:Delivery (:NABT-940 Row 234 Tab 'Invoice, Credit Note':)"
                 priority="16"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:Delivery (:NABT-940 Row 234 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Delivery (:NABT-940 Row 234 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Delivery (:NABT-940 Row 234 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cac:DeliveryParty/cac:PartyName/cbc:Name) &lt;= 1 (:NABT-940 Row 234 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cac:DeliveryParty/cac:PartyName/cbc:Name) &lt;= 1 (:NABT-940 Row 234 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one Document Line Deliver to party name exists. (:NABT-940 Row 234 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address (:NABT-930 Row 245 Tab 'Invoice, Credit Note':)"
                 priority="15"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address (:NABT-930 Row 245 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address (:NABT-930 Row 245 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Delivery/cac:DeliveryLocation/cac:Address (:NABT-930 Row 245 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-930 Row 245 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cac:Country/cbc:IdentificationCode,'ISO-3166') (:NABT-930 Row 245 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Document Line Deliver to Country Code is invalid. (:NABT-930 Row 245 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-926 Row 252 Tab 'Invoice, Credit Note':)"
                 priority="14"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-926 Row 252 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-926 Row 252 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:TaxTotal/cac:TaxSubtotal/cac:TaxCategory/cac:TaxScheme/cbc:ID (:NABT-926 Row 252 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(.,'UNECE-5153') (:NABT-926 Row 252 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(.,'UNECE-5153') (:NABT-926 Row 252 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Tax Scheme value specified is invalid. (:NABT-926 Row 252 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:InvoicePeriod (:NABT-134 NABT-135 Row 254 255 Tab 'Invoice, Credit Note':)"
                 priority="13"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:InvoicePeriod (:NABT-134 NABT-135 Row 254 255 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:InvoicePeriod (:NABT-134 NABT-135 Row 254 255 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:InvoicePeriod (:NABT-134 NABT-135 Row 254 255 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:StartDate) = 1 and count (cbc:EndDate) = 1 (:NABT-134 Row 254 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:StartDate) = 1 and count (cbc:EndDate) = 1 (:NABT-134 Row 254 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Missing Invoice line period start date and/or Invoice Line Period End Date. (:NABT-134 Row 254 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(if ( count(cbc:StartTime) = 0 and count(cbc:EndTime) = 0 ) then (:date, no time:) ( dateTime(cbc:EndDate,xsd:time('00:00:00')) &gt;= dateTime(cbc:StartDate,xsd:time('00:00:00')) ) else if ( count(cbc:StartTime) =1 and count(cbc:EndTime) = 1 ) then (:date and time:) ( dateTime(cbc:EndDate,cbc:EndTime) &gt;= dateTime(cbc:StartDate,cbc:StartTime) ) else false() (:NABT-135 Row 255 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">if ( count(cbc:StartTime) = 0 and count(cbc:EndTime) = 0 ) then (:date, no time:) ( dateTime(cbc:EndDate,xsd:time('00:00:00')) &gt;= dateTime(cbc:StartDate,xsd:time('00:00:00')) ) else if ( count(cbc:StartTime) =1 and count(cbc:EndTime) = 1 ) then (:date and time:) ( dateTime(cbc:EndDate,cbc:EndTime) &gt;= dateTime(cbc:StartDate,cbc:StartTime) ) else false() (:NABT-135 Row 255 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Missing Invoice line period start date and/or Invoice Line Period End Date. (:NABT-135 Row 255 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:AllowanceCharge (:NABT-139 NABT-144 Row 261 268 Tab 'Invoice, Credit Note':)"
                 priority="12"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:AllowanceCharge (:NABT-139 NABT-144 Row 261 268 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:AllowanceCharge (:NABT-139 NABT-144 Row 261 268 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:AllowanceCharge (:NABT-139 NABT-144 Row 261 268 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:AllowanceChargeReason) = 1 or count (cbc:AllowanceChargeReasonCode) = 1 (:NABT-139 Row 261 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:AllowanceChargeReason) = 1 or count (cbc:AllowanceChargeReasonCode) = 1 (:NABT-139 Row 261 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Missing Invoice line discount reason and/or Invoice Line Discount Reason Code. (:NABT-139 Row 261 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cbc:AllowanceChargeReason) = 1 or count (cbc:AllowanceChargeReasonCode) = 1 (:NABT-144 Row 268 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:AllowanceChargeReason) = 1 or count (cbc:AllowanceChargeReasonCode) = 1 (:NABT-144 Row 268 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Missing Invoice line charge reason and/or Invoice line charge reason code. (:NABT-144 Row 268 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode (:NABT-140 NABT-145 Row 262 269 Tab 'Invoice, Credit Note':)"
                 priority="11"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode (:NABT-140 NABT-145 Row 262 269 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode (:NABT-140 NABT-145 Row 262 269 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:AllowanceCharge/cbc:AllowanceChargeReasonCode (:NABT-140 NABT-145 Row 262 269 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(.,'UNECE-5189') (:NABT-140 Row 262 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(.,'UNECE-5189') (:NABT-140 Row 262 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Invoice line discount reason code is invalid. (:NABT-140 Row 262 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(bpc:codelist(.,'UNECE-5189') (:NABT-145 Row 269 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(.,'UNECE-5189') (:NABT-145 Row 269 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Invoice line charge reason code is invalid. (:NABT-145 Row 269 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:Price/cac:AllowanceCharge (:NABT-147 NABT-148 Row 273 275 Tab 'Invoice, Credit Note':)"
                 priority="10"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:Price/cac:AllowanceCharge (:NABT-147 NABT-148 Row 273 275 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Price/cac:AllowanceCharge (:NABT-147 NABT-148 Row 273 275 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Price/cac:AllowanceCharge (:NABT-147 NABT-148 Row 273 275 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:Amount) &lt;= 1 (:NABT-147 Row 273 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:Amount) &lt;= 1 (:NABT-147 Row 273 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one item price discount exists. (:NABT-147 Row 273 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cbc:BaseAmount) &lt;= 1 (:NABT-148 Row 275 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:BaseAmount) &lt;= 1 (:NABT-148 Row 275 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>More than one item gross price exists. (:NABT-148 Row 275 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:BaseAmount (:NABT-148 Row 276 Tab 'Invoice, Credit Note':)"
                 priority="9"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:BaseAmount (:NABT-148 Row 276 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:BaseAmount (:NABT-148 Row 276 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Price/cac:AllowanceCharge/cbc:BaseAmount (:NABT-148 Row 276 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(. &gt;= 0 (:NABT-148 Row 276 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">. &gt;= 0 (:NABT-148 Row 276 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Item gross price is negative. (:NABT-148 Row 276 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:Price/cbc:BaseQuantity/@unitCode (:NABT-150 Row 278 280 Tab 'Invoice, Credit Note':)"
                 priority="8"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:Price/cbc:BaseQuantity/@unitCode (:NABT-150 Row 278 280 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Price/cbc:BaseQuantity/@unitCode (:NABT-150 Row 278 280 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Price/cbc:BaseQuantity/@unitCode (:NABT-150 Row 278 280 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(.,'UNECE-Rec-20-21') (:NABT-150 Row 278 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(.,'UNECE-Rec-20-21') (:NABT-150 Row 278 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Item Price Base Quantity Unit of Measure Code is not a valid value from UN/ECE Recommendation N. 20 code list or UN/ECE Recommendation N. 21 (with the prefix 'X' on each) code list. (:NABT-150 Row 278 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(. = ../../cbc:CreditedQuantity/@unitCode (:NABT-150 Row 280 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">. = ../../cbc:CreditedQuantity/@unitCode (:NABT-150 Row 280 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Item Price Base Quantity Unit of Measure Code does not equal Credited Quantity Unit of Measure Code. (:NABT-150 Row 280 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:InvoiceLine/cac:Price/cbc:BaseQuantity/@unitCode (:NABT-150 Row 279 Tab 'Invoice, Credit Note':)"
                 priority="7"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:InvoiceLine/cac:Price/cbc:BaseQuantity/@unitCode (:NABT-150 Row 279 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Price/cbc:BaseQuantity/@unitCode (:NABT-150 Row 279 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:InvoiceLine/cac:Price/cbc:BaseQuantity/@unitCode (:NABT-150 Row 279 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(. = ../../cbc:InvoicedQuantity/@unitCode (:NABT-150 Row 279 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">. = ../../cbc:InvoicedQuantity/@unitCode (:NABT-150 Row 279 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Item Price Base Quantity Unit of Measure Code does not equal Invoiced Quantity Unit of Measure Code. (:NABT-150 Row 279 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:ValidityPeriod (:NABT-921 NABT-919 Row 282 284 Tab 'Invoice, Credit Note':)"
                 priority="6"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:ValidityPeriod (:NABT-921 NABT-919 Row 282 284 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:ValidityPeriod (:NABT-921 NABT-919 Row 282 284 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:ValidityPeriod (:NABT-921 NABT-919 Row 282 284 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:StartDate) = 1 and count (cbc:EndDate) = 1 (:NABT-921 Row 282 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:StartDate) = 1 and count (cbc:EndDate) = 1 (:NABT-921 Row 282 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>The period is missing either the start date and/or the end date. (:NABT-921 Row 282 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(if ( count(cbc:StartTime) = 0 and count(cbc:EndTime) = 0 ) then (:date, no time:) ( dateTime(cbc:EndDate,xsd:time('00:00:00')) &gt;= dateTime(cbc:StartDate,xsd:time('00:00:00')) ) else if ( count(cbc:StartTime) =1 and count(cbc:EndTime) = 1 ) then (:date and time:) ( dateTime(cbc:EndDate,cbc:EndTime) &gt;= dateTime(cbc:StartDate,cbc:StartTime) ) else false() (:NABT-919 Row 284 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">if ( count(cbc:StartTime) = 0 and count(cbc:EndTime) = 0 ) then (:date, no time:) ( dateTime(cbc:EndDate,xsd:time('00:00:00')) &gt;= dateTime(cbc:StartDate,xsd:time('00:00:00')) ) else if ( count(cbc:StartTime) =1 and count(cbc:EndTime) = 1 ) then (:date and time:) ( dateTime(cbc:EndDate,cbc:EndTime) &gt;= dateTime(cbc:StartDate,cbc:StartTime) ) else false() (:NABT-919 Row 284 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Period specified is incomplete or the end date and time is not later than the start date and time. (:NABT-919 Row 284 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory (:NABG-030 Row 286 Tab 'Invoice, Credit Note':)"
                 priority="5"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory (:NABG-030 Row 286 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory (:NABG-030 Row 286 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory (:NABG-030 Row 286 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(if( count(cbc:Percent) = 1 and count(cbc:PerUnitAmount) = 1 ) then false() else true() (:NABG-030 Row 286 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">if( count(cbc:Percent) = 1 and count(cbc:PerUnitAmount) = 1 ) then false() else true() (:NABG-030 Row 286 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Invoiced Item Tax Rate and Per Unit Tax Amount are mutually exclusive. (:NABG-030 Row 286 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme (:NABT-167 Row 290 Tab 'Invoice, Credit Note':)"
                 priority="4"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme (:NABT-167 Row 290 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme (:NABT-167 Row 290 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Item/cac:ClassifiedTaxCategory/cac:TaxScheme (:NABT-167 Row 290 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(bpc:codelist(cbc:ID,'UNECE-5153') (:NABT-167 Row 290 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cbc:ID,'UNECE-5153') (:NABT-167 Row 290 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Invoiced Item Tax Scheme Identifier value specified is not valid. (:NABT-167 Row 290 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:Item (:NABT-153 NABT-154 NABT-157 NABT-159 Row 292 293 297 301 Tab 'Invoice, Credit Note':)"
                 priority="3"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:Item (:NABT-153 NABT-154 NABT-157 NABT-159 Row 292 293 297 301 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Item (:NABT-153 NABT-154 NABT-157 NABT-159 Row 292 293 297 301 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Item (:NABT-153 NABT-154 NABT-157 NABT-159 Row 292 293 297 301 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:Name) = 1 (:NABT-153 Row 292 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:Name) = 1 (:NABT-153 Row 292 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Item Name is not specified or exists more than once. (:NABT-153 Row 292 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cbc:Description) &lt;=1 (:NABT-154 Row 293 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:Description) &lt;=1 (:NABT-154 Row 293 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Product/Service description exists more than once. (:NABT-154 Row 293 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(count (cac:StandardItemIdentification/cbc:ID) = 1 or count (cbc:Description) = 1 (:NABT-157 Row 297 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cac:StandardItemIdentification/cbc:ID) = 1 or count (cbc:Description) = 1 (:NABT-157 Row 297 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Both the standard identification number and description are missing. (:NABT-157 Row 297 Tab 'Invoice, Credit Note':)</svrl:text>
                  </svrl:failed-assert>
               </xsl:if>
               <xsl:if test="not(bpc:codelist(cac:OriginCountry/cbc:IdentificationCode,'ISO-3166') (:NABT-159 Row 301 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">bpc:codelist(cac:OriginCountry/cbc:IdentificationCode,'ISO-3166') (:NABT-159 Row 301 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Item country of origin code is not a valid value from International Organization for Standardization (ISO) ISO 3166-Country Codes. (:NABT-159 Row 301 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID (:NABT-157-1 Row 298 Tab 'Invoice, Credit Note':)"
                 priority="2"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID (:NABT-157-1 Row 298 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID (:NABT-157-1 Row 298 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Item/cac:StandardItemIdentification/cbc:ID (:NABT-157-1 Row 298 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (@schemeID ) = 1 (:NABT-157-1 Row 298 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (@schemeID ) = 1 (:NABT-157-1 Row 298 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Scheme Identifier does not exist when Product/Service Code is provided. (:NABT-157-1 Row 298 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode (:NABT-158-1 Row 300 Tab 'Invoice, Credit Note':)"
                 priority="1"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode (:NABT-158-1 Row 300 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode (:NABT-158-1 Row 300 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Item/cac:CommodityClassification/cbc:ItemClassificationCode (:NABT-158-1 Row 300 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (@listID ) = 1 (:NABT-158-1 Row 300 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (@listID ) = 1 (:NABT-158-1 Row 300 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Scheme Identifier does not exist when Item Classification Identifier is provided. (:NABT-158-1 Row 300 Tab 'Invoice, Credit Note':)</svrl:text>
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
   <xsl:template match="cac:CreditNoteLine/cac:Item/cac:ItemInstance/cac:LotIdentification (:NABT-915 Row 306 Tab 'Invoice, Credit Note':)"
                 priority="0"
                 mode="d14e18">
      <xsl:param name="schxslt:patterns-matched" as="xs:string*"/>
      <xsl:choose>
         <xsl:when test="$schxslt:patterns-matched[. = 'd14e45']">
            <schxslt:rule pattern="d14e45">
               <xsl:comment xmlns:svrl="http://purl.oclc.org/dsdl/svrl">WARNING: Rule for context "cac:CreditNoteLine/cac:Item/cac:ItemInstance/cac:LotIdentification (:NABT-915 Row 306 Tab 'Invoice, Credit Note':)" shadowed by preceding rule</xsl:comment>
               <svrl:suppressed-rule xmlns:svrl="http://purl.oclc.org/dsdl/svrl">
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Item/cac:ItemInstance/cac:LotIdentification (:NABT-915 Row 306 Tab 'Invoice, Credit Note':)</xsl:attribute>
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
                  <xsl:attribute name="context">cac:CreditNoteLine/cac:Item/cac:ItemInstance/cac:LotIdentification (:NABT-915 Row 306 Tab 'Invoice, Credit Note':)</xsl:attribute>
               </svrl:fired-rule>
               <xsl:if test="not(count (cbc:LotNumberID) = 1 (:NABT-915 Row 306 Tab 'Invoice, Credit Note':))">
                  <svrl:failed-assert xmlns:svrl="http://purl.oclc.org/dsdl/svrl"
                                      location="{schxslt:location(.)}">
                     <xsl:attribute name="test">count (cbc:LotNumberID) = 1 (:NABT-915 Row 306 Tab 'Invoice, Credit Note':)</xsl:attribute>
                     <svrl:text>Lot identification number is not specified or exists more than once. (:NABT-915 Row 306 Tab 'Invoice, Credit Note':)</svrl:text>
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
