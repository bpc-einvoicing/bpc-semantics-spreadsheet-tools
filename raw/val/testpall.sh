sh validate.sh ../ubl/xsd/maindoc/UBL-ApplicationResponse-2.3.xsd P ApplicationResponse ApplicationResponse-test-bad-data-1.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-ApplicationResponse-2.3.xsd P ApplicationResponse ApplicationResponse-test-bad-data-2.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-ApplicationResponse-2.3.xsd P ApplicationResponse ApplicationResponse-test-good.xml

sh validate.sh ../ubl/xsd/maindoc/UBL-DocumentStatus-2.3.xsd P DocumentStatus InvoiceDocumentStatus-test-bad-data-1.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-DocumentStatus-2.3.xsd P DocumentStatus InvoiceDocumentStatus-test-bad-data-2.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-DocumentStatus-2.3.xsd P DocumentStatus InvoiceDocumentStatus-test-bad-data-3.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-DocumentStatus-2.3.xsd P DocumentStatus InvoiceDocumentStatus-test-good.xml

sh validate.sh ../ubl/xsd/maindoc/UBL-Invoice-2.3.xsd P Invoice invoice-test-bad-syntax.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-Invoice-2.3.xsd P Invoice invoice-test-bad-model.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-Invoice-2.3.xsd P Invoice invoice-test-bad-data.xml
sh validate.sh ../ubl/xsd/maindoc/UBL-Invoice-2.3.xsd P Invoice invoice-test-good.xml
