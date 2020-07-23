# A repository for tools related to the BPC Semantics spreadsheet

The [BPC Semantics Group spreadsheet](https://docs.google.com/spreadsheets/d/1qAz_aAbJ99ikA4zUk97FyjyDLcsQ3B3vqjEK-b3C_h8/view) is an artifact used to capture decisions by the Semantics Group regarding the document model and associated business rules imposed on corners 2 and 3 in the 4-corner model for interoperability.

Various artifacts need to be created to help in the generation and validation of UBL documents in conformance with the subset and business rules defined by the BPC e-Invoicing Semantics Group.

This diagram outlines the role of a subset of UBL schemas in the generation of XML documents, independent of the role of the full UBL schemas when ingesting XML documents:

![The role of a UBL subset schema](README-subset.png "The role of a UBL subset schema")

The three sets of artifacts identified in the diagram are numbered as follows:

1. The full UBL schemas without being subset.
1. The subset UBL schemas supporting only the constructs needed for XML generation, optionally used to structurally-validate the output before it is sent to the recipient.
1. The additional value constraints expressed in XSLT and authored using technologies such as ISO/IEC 19757-3 Schematron, OASIS Context/Value Association (CVA), OASIS genericode, or other means, used both to pre-validate the value constraints before the document is sent to the recipient, and to validate the value constraints after the document is received by the recipient.

The artifact labeled (1) comes from the OASIS UBL Technical Committee. The artifacts labeled (2) and (3) are created, respectively, indirectly and directly from the semantics spreadsheet.

## Subset constraints XSD schema

The semantics spreadsheet produces a genericode input file that is used indirectly to a schema subsetting process to create the XSD schemas according to the subset specification for each of the identified business processes.

## Value constraints Schematron schema

The semantics spreadsheet produces a Schematron pattern for each of the identified business processes.

_(more documentation to come)_
