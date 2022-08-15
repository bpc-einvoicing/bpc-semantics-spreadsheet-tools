if [ -d results ]; then rm -r results ; fi
mkdir results

#sh one-regression.sh Extended Invoice Extended-Invoice-good
if [ "$?" != "0" ]; then exit 1 ; fi

sh one-regression.sh Core     Invoice NABT-034-1-Core-Invoice-bad-a-r-endpoint-scheme

if [ 1 == 2 ]; then 

sh one-regression.sh Core     Invoice NABG-014-Core-Invoice-bad-invoice-period-count
sh one-regression.sh Core     Invoice NABG-022-Core-Invoice-bad-note-count
sh one-regression.sh Core     Invoice NABG-023-Core-Invoice-bad-tax-total-count
sh one-regression.sh Extended Invoice NABG-023-Extended-Invoice-bad-tax-info 
sh one-regression.sh Core     Invoice NABG-990-Core-Invoice-bad-tax-totals
sh one-regression.sh Extended Invoice NABG-990-Extended-Invoice-bad-tax-totals
sh one-regression.sh Extended Invoice NABG-999-Extended-Invoice-bad-missing-terms-1
sh one-regression.sh Extended Invoice NABT-003-Extended-Invoice-bad-type
sh one-regression.sh Extended Invoice NABT-005-Extended-Invoice-bad-value
sh one-regression.sh Extended Invoice NABT-006-Extended-Invoice-bad-value
sh one-regression.sh Extended Invoice NABT-011-Extended-invoice-bad-project-reference
sh one-regression.sh Extended Invoice NABT-012-Extended-invoice-bad-contract-reference
sh one-regression.sh Extended Invoice NABT-015-Extended-invoice-bad-receipt-reference
sh one-regression.sh Core     Invoice NABT-022-Core-Invoice-bad-note-count
sh one-regression.sh Core     Invoice NABT-023-Core-Invoice-bad-profile-value
sh one-regression.sh Extended Invoice NABT-024-Extended-Invoice-bad-customization-identifier
sh one-regression.sh Minimum  Invoice NABT-028-Minimum-Invoice-bad-trading-name-count
sh one-regression.sh Minimum  Invoice NABT-029-Minimum-Invoice-bad-trading-id-count
sh one-regression.sh Minimum  Invoice NABT-029-1-Minimum-Invoice-bad-trading-id-scheme
sh one-regression.sh Core     Invoice NABT-030-Core-Invoice-bad-a-r-legal-id-count
sh one-regression.sh Core     Invoice NABT-030-1-Core-Invoice-bad-a-r-legal-id-scheme

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
sh one-regression.sh Extended Invoice NABT-914-Extended-Invoice-bad-customization-id-scheme-id
sh one-regression.sh Extended Invoice NABT-919-Extended-Invoice-bad-date
sh one-regression.sh Extended Invoice NABT-919-Extended-Invoice-bad-time
sh one-regression.sh Extended Invoice NABT-921-Extended-Invoice-bad-date
sh one-regression.sh Extended Invoice NABT-988-Extended-Invoice-bad-preceding-invoice-status-value
sh one-regression.sh Extended Invoice NABT-999-Extended-Invoice-bad-missing-id

fi

# temporary - remove this when work is done
#cd . ; cp ../../../../raw/regression/regression.sh . ; cp ../../../../raw/regression/*.xml . ; sh regression.sh 