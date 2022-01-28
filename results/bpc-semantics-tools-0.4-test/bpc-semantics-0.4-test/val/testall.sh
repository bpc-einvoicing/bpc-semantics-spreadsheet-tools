
sh validate.sh Minimum ApplicationResponse ApplicationResponse-test-bad-data-1.xml
sh validate.sh Minimum ApplicationResponse ApplicationResponse-test-bad-data-2.xml
sh validate.sh Minimum ApplicationResponse ApplicationResponse-test-good.xml

sh validate.sh InvoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-1.xml
sh validate.sh InvoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-2.xml
sh validate.sh InvoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-3.xml
sh validate.sh InvoiceStatus DocumentStatus InvoiceDocumentStatus-test-good.xml

sh validate.sh Core Invoice Invoice-Core-test-bad-syntax.xml
sh validate.sh Core Invoice Invoice-Core-test-bad-model.xml
sh validate.sh Core Invoice Invoice-Core-test-bad-data.xml
sh validate.sh Core Invoice Invoice-Core-test-good.xml

sh validate.sh Minimum Invoice Invoice-Minimum-test-bad-syntax.xml
sh validate.sh Minimum Invoice Invoice-Minimum-test-bad-model.xml
sh validate.sh Minimum Invoice Invoice-Minimum-test-bad-data.xml
sh validate.sh Minimum Invoice Invoice-Minimum-test-good.xml

sh validate.sh Extended Invoice Invoice-Extended-test-bad-syntax.xml
sh validate.sh Extended Invoice Invoice-Extended-test-bad-model.xml
sh validate.sh Extended Invoice Invoice-Extended-test-bad-data.xml
sh validate.sh Extended Invoice Invoice-Extended-test-good.xml

sh validate.sh Core CreditNote CreditNote-Core-test-bad-syntax.xml
sh validate.sh Core CreditNote CreditNote-Core-test-bad-model.xml
sh validate.sh Core CreditNote CreditNote-Core-test-bad-data.xml
sh validate.sh Core CreditNote CreditNote-Core-test-good.xml

sh validate.sh Minimum CreditNote CreditNote-Minimum-test-bad-syntax.xml
sh validate.sh Minimum CreditNote CreditNote-Minimum-test-bad-model.xml
sh validate.sh Minimum CreditNote CreditNote-Minimum-test-bad-data.xml
sh validate.sh Minimum CreditNote CreditNote-Minimum-test-good.xml

sh validate.sh Extended CreditNote CreditNote-Extended-test-bad-syntax.xml
sh validate.sh Extended CreditNote CreditNote-Extended-test-bad-model.xml
sh validate.sh Extended CreditNote CreditNote-Extended-test-bad-data.xml
sh validate.sh Extended CreditNote CreditNote-Extended-test-good.xml
