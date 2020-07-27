@echo off
java -jar "%~dp0xjparse.jar" -c %~dp0catalog.xml -S "%~1" "%~2"
