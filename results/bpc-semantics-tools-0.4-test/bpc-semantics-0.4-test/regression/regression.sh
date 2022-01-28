if [ -d results ]; then rm -r results ; fi
mkdir results

sh one-regression.sh Extended Invoice Extended-Invoice-good
if [ "$?" != "0" ]; then exit 1 ; fi

sh one-regression.sh Extended Invoice NABT-003-Extended-Invoice-bad-type
sh one-regression.sh Extended Invoice NABT-005-Extended-Invoice-bad-value
sh one-regression.sh Extended Invoice NABT-006-Extended-Invoice-bad-value
sh one-regression.sh Extended Invoice NABT-073-Extended-Invoice-bad-date
sh one-regression.sh Extended Invoice NABT-074-Extended-Invoice-bad-date
sh one-regression.sh Extended Invoice NABT-074-Extended-Invoice-bad-time
sh one-regression.sh Extended Invoice NABT-081-Extended-Invoice-bad-code
sh one-regression.sh Extended Invoice NABT-081-Extended-Invoice-missing-account
sh one-regression.sh Extended Invoice NABT-086-Extended-Invoice-missing-branch
sh one-regression.sh Extended Invoice NABT-111-Extended-Invoice-bad-tax-total-currency
sh one-regression.sh Extended Invoice NABT-134-Extended-Invoice-bad-date
sh one-regression.sh Extended Invoice NABT-135-Extended-Invoice-bad-date
sh one-regression.sh Extended Invoice NABT-135-Extended-Invoice-bad-time
sh one-regression.sh Extended Invoice NABT-919-Extended-Invoice-bad-date
sh one-regression.sh Extended Invoice NABT-919-Extended-Invoice-bad-time
sh one-regression.sh Extended Invoice NABT-921-Extended-Invoice-bad-date
sh one-regression.sh Extended Invoice NABT-999-Extended-Invoice-bad-missing-id
sh one-regression.sh Core Invoice     NABG-023-Core-Invoice-bad-tax-total-count
sh one-regression.sh Extended Invoice NABG-023-Extended-Invoice-bad-tax-info 
sh one-regression.sh Core Invoice     NABG-990-Core-Invoice-bad-tax-totals
sh one-regression.sh Extended Invoice NABG-990-Extended-Invoice-bad-tax-totals
sh one-regression.sh Extended Invoice NABG-999-Extended-Invoice-bad-missing-terms-1

