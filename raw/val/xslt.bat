@echo off
java -jar "%~dp0saxon9he.jar" "-o:%~3" "-s:%~1" "-xsl:%~2"
