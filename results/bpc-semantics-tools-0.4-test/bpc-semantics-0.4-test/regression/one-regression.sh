# clean up any old results

if [ -f "$3.xml.error.txt" ]; then rm "$3.xml.error.txt" ; fi 
if [ -f "$3.xml.svrl.xml" ]; then rm "$3.xml.svrl.xml" ; fi 

# perform the validation

sh ../val/validate.sh $1 $2 "$3.xml"

if [ -f "$3.xml.error.txt" ]; then grep -E -v "(The following error report|xsl:message|^$)" "$3.xml.error.txt" > "results/$3.xml.error.txt" ; fi 

if [ -f "$3.xml.error.txt" ]; then rm "$3.xml.error.txt" ; fi 
if [ -f "$3.xml.svrl.xml" ]; then rm "$3.xml.svrl.xml" ; fi 

exit 0
