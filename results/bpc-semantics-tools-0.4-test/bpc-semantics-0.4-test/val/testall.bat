@echo off
call validate Minimum ApplicationResponse ApplicationResponse-test-bad-data-1.xml
call validate Minimum ApplicationResponse ApplicationResponse-test-bad-data-2.xml
call validate Minimum ApplicationResponse ApplicationResponse-test-good.xml

call validate InvoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-1.xml
call validate InvoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-2.xml
call validate InvoiceStatus DocumentStatus InvoiceDocumentStatus-test-bad-data-3.xml
call validate InvoiceStatus DocumentStatus InvoiceDocumentStatus-test-good.xml

call validate Core Invoice Invoice-Core-test-bad-syntax.xml
call validate Core Invoice Invoice-Core-test-bad-model.xml
call validate Core Invoice Invoice-Core-test-bad-data.xml
call validate Core Invoice Invoice-Core-test-good.xml

call validate Minimum Invoice Invoice-Minimum-test-bad-syntax.xml
call validate Minimum Invoice Invoice-Minimum-test-bad-model.xml
call validate Minimum Invoice Invoice-Minimum-test-bad-data.xml
call validate Minimum Invoice Invoice-Minimum-test-good.xml

call validate Extended Invoice Invoice-Extended-test-bad-syntax.xml
call validate Extended Invoice Invoice-Extended-test-bad-model.xml
call validate Extended Invoice Invoice-Extended-test-bad-data.xml
call validate Extended Invoice Invoice-Extended-test-good.xml

call validate Core CreditNote CreditNote-Core-test-bad-syntax.xml
call validate Core CreditNote CreditNote-Core-test-bad-model.xml
call validate Core CreditNote CreditNote-Core-test-bad-data.xml
call validate Core CreditNote CreditNote-Core-test-good.xml

call validate Minimum CreditNote CreditNote-Minimum-test-bad-syntax.xml
call validate Minimum CreditNote CreditNote-Minimum-test-bad-model.xml
call validate Minimum CreditNote CreditNote-Minimum-test-bad-data.xml
call validate Minimum CreditNote CreditNote-Minimum-test-good.xml

call validate Extended CreditNote CreditNote-Extended-test-bad-syntax.xml
call validate Extended CreditNote CreditNote-Extended-test-bad-model.xml
call validate Extended CreditNote CreditNote-Extended-test-bad-data.xml
call validate Extended CreditNote CreditNote-Extended-test-good.xml

echo.
echo.
pause
