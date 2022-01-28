@echo off
call validate Core Invoice ../examples/Acme3099123-core-invoice.xml
call validate Core Invoice ../examples/MP-1-core-invoice.xml
call validate Core Invoice ../examples/MP-2-core-invoice.xml

echo.
echo.
pause
