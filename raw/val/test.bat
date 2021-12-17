@echo off
call validate Core Invoice Invoice-Core-test-bad-syntax.xml
call validate Core Invoice Invoice-Core-test-bad-model.xml
call validate Core Invoice Invoice-Core-test-bad-data.xml
call validate Core Invoice Invoice-Core-test-good.xml
