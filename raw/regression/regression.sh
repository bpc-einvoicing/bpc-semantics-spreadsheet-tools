if [ -d results ]; then rm -r results ; fi
mkdir results

sh one-regression.sh Extended Invoice Extended-Invoice-good
if [ "$?" != "0" ]; then exit 1 ; fi

sh one-regression.sh Extended CreditNote Extended-CreditNote-good
if [ "$?" != "0" ]; then exit 1 ; fi

# if [ 1 == 2 ]; then 

#NABG

sh one-regression.sh Core     Invoice NABG-005-Core-Invoice-missing-address
sh one-regression.sh Extended Invoice NABG-007-Extended-Invoice-missing-customer-party
sh one-regression.sh Core     Invoice NABG-014-Core-Invoice-bad-invoice-period-count
sh one-regression.sh Core     Invoice NABG-022-Core-Invoice-bad-note-count
sh one-regression.sh Core     Invoice NABG-023-Core-Invoice-bad-tax-total-count
sh one-regression.sh Extended Invoice NABG-023-Extended-Invoice-bad-tax-info 
sh one-regression.sh Core     Invoice NABG-023-Core-Invoice-missing-tax-breakdown
sh one-regression.sh Extended Invoice NABG-023-Extended-Invoice-too-much-tax-info 
sh one-regression.sh Extended Invoice NABG-026-Extended-Invoice-too-many-invoice-periods
sh one-regression.sh Extended Invoice NABG-029-Extended-Invoice-missing-price
sh one-regression.sh Extended CreditNote NABG-029-Extended-CreditNote-missing-price 
sh one-regression.sh Extended Invoice NABG-030-Extended-Invoice-conflicting-tax-criteria
sh one-regression.sh Core     Invoice NABG-990-Core-Invoice-bad-tax-totals
sh one-regression.sh Extended Invoice NABG-990-Extended-Invoice-bad-tax-totals
sh one-regression.sh Extended Invoice NABG-999-Extended-Invoice-bad-missing-terms-1

#NABT

sh one-regression.sh Extended Invoice NABT-003-Extended-Invoice-bad-type
sh one-regression.sh Extended Invoice NABT-005-Extended-Invoice-bad-value
sh one-regression.sh Extended Invoice NABT-006-Extended-Invoice-bad-value
sh one-regression.sh Extended Invoice NABT-011-Extended-Invoice-bad-project-reference
sh one-regression.sh Extended Invoice NABT-012-Extended-Invoice-bad-contract-reference
sh one-regression.sh Extended Invoice NABT-015-Extended-Invoice-bad-receipt-reference
sh one-regression.sh Core     Invoice NABT-022-Core-Invoice-bad-note-count
sh one-regression.sh Core     Invoice NABT-023-Core-Invoice-bad-profile-value
sh one-regression.sh Core     Invoice NABT-024-Core-Invoice-bad-customization-identifier
sh one-regression.sh Minimum  Invoice NABT-024-Minimum-Invoice-bad-customization-identifier
sh one-regression.sh Extended Invoice NABT-024-Extended-Invoice-bad-customization-identifier
sh one-regression.sh Minimum  Invoice NABT-028-Minimum-Invoice-bad-trading-name-count
sh one-regression.sh Minimum  Invoice NABT-029-Minimum-Invoice-bad-trading-id-count
sh one-regression.sh Minimum  Invoice NABT-029-1-Minimum-Invoice-bad-trading-id-scheme
sh one-regression.sh Core     Invoice NABT-030-Core-Invoice-bad-a-r-legal-id-count
sh one-regression.sh Core     Invoice NABT-030-1-Core-Invoice-bad-a-r-legal-id-scheme
sh one-regression.sh Core     Invoice NABT-034-1-Core-Invoice-bad-a-r-endpoint-scheme
sh one-regression.sh Extended Invoice NABT-040-Extended-Invoice-bad-country
sh one-regression.sh Extended Invoice NABT-040-Extended-Invoice-missing-country
sh one-regression.sh Extended Invoice NABT-045-Extended-Invoice-too-many-customer-names
sh one-regression.sh Extended Invoice NABT-045-Extended-Invoice-missing-customer-name
sh one-regression.sh Extended Invoice NABT-046-Extended-Invoice-too-many-customer-ids
sh one-regression.sh Extended Invoice NABT-046-Extended-Invoice-missing-customer-id
sh one-regression.sh Extended Invoice NABT-046-1-Extended-Invoice-missing-customer-id-scheme
sh one-regression.sh Extended Invoice NABT-047-Extended-Invoice-too-many-customer-company-ids
sh one-regression.sh Extended Invoice NABT-047-1-Extended-Invoice-missing-customer-company-id-scheme
sh one-regression.sh Extended Invoice NABT-049-1-Extended-Invoice-missing-customer-endpoint-id-scheme
sh one-regression.sh Extended Invoice NABT-055-Extended-Invoice-bad-customer-country-id
sh one-regression.sh Core     Invoice NABT-059-Core-Invoice-missing-payee-name
sh one-regression.sh Core     Invoice NABT-060-Core-Invoice-missing-payee-identifier
sh one-regression.sh Core     Invoice NABT-060-1-Core-Invoice-missing-payee-identifier-scheme
sh one-regression.sh Core     Invoice NABT-061-Core-Invoice-multiple-company-identifiers
sh one-regression.sh Core     Invoice NABT-061-1-Core-Invoice-missing-company-identifier-scheme
sh one-regression.sh Extended Invoice NABT-070-Extended-Invoice-too-many-delivery-party-names
sh one-regression.sh Extended Invoice NABT-073-Extended-Invoice-bad-date
sh one-regression.sh Extended Invoice NABT-074-Extended-Invoice-bad-date
sh one-regression.sh Extended Invoice NABT-074-Extended-Invoice-bad-time
sh one-regression.sh Extended Invoice NABT-080-Extended-Invoice-bad-delivery-country-id
sh one-regression.sh Extended Invoice NABT-081-Extended-Invoice-bad-code
sh one-regression.sh Extended Invoice NABT-081-Extended-Invoice-missing-account
sh one-regression.sh Extended Invoice NABT-083-Extended-Invoice-too-many-payment-means-ids
sh one-regression.sh Extended Invoice NABT-084-Extended-Invoice-missing-payee-financial-account-id
sh one-regression.sh Extended Invoice NABT-086-Extended-Invoice-missing-branch
sh one-regression.sh Extended Invoice NABT-090-Extended-Invoice-too-many-payee-party-ids
sh one-regression.sh Extended Invoice NABT-096-Extended-Invoice-too-many-percentages
sh one-regression.sh Extended Invoice NABT-097-Extended-Invoice-missing-allowance-charge-reason
sh one-regression.sh Extended Invoice NABT-098-Extended-Invoice-invalid-allowance-charge-code
sh one-regression.sh Extended Invoice NABT-106-Extended-Invoice-missing-line-extension-amount
sh one-regression.sh Extended Invoice NABT-109-Extended-Invoice-missing-tax-exclusive-amount
sh one-regression.sh Extended Invoice NABT-111-Extended-Invoice-bad-tax-total-document-currency
sh one-regression.sh Extended Invoice NABT-111-Extended-Invoice-bad-tax-total-tax-currency
sh one-regression.sh Extended Invoice NABT-112-Extended-Invoice-missing-tax-inclusive-amount
sh one-regression.sh Extended Invoice NABT-115-Extended-Invoice-missing-due-date-and-terms
sh one-regression.sh Extended Invoice NABT-116-Extended-Invoice-missing-subtotal-taxable-amount
sh one-regression.sh Extended Invoice NABT-120-Extended-Invoice-too-many-exemption-reasons
sh one-regression.sh Extended Invoice NABT-125-1-Extended-Invoice-invalid-media-type
sh one-regression.sh Extended Invoice NABT-125-2-Extended-Invoice-missing-filename
sh one-regression.sh Core     Invoice NABT-127-Core-Invoice-too-many-line-notes
sh one-regression.sh Extended Invoice NABT-129-Extended-Invoice-missing-line-quantity
sh one-regression.sh Extended CreditNote NABT-129-Extended-CreditNote-missing-line-quantity
sh one-regression.sh Extended Invoice NABT-130-Extended-Invoice-bad-quantity-units
sh one-regression.sh Extended CreditNote NABT-130-Extended-CreditNote-bad-quantity-units
sh one-regression.sh Extended Invoice NABT-132-Extended-Invoice-too-many-line-references
sh one-regression.sh Extended CreditNote NABT-132-Extended-CreditNote-too-many-line-references
sh one-regression.sh Extended Invoice NABT-134-Extended-Invoice-bad-date
sh one-regression.sh Extended Invoice NABT-135-Extended-Invoice-bad-date
sh one-regression.sh Extended Invoice NABT-135-Extended-Invoice-bad-time
sh one-regression.sh Extended Invoice NABT-147-Extended-Invoice-too-many-price-discounts
sh one-regression.sh Extended CreditNote NABT-147-Extended-CreditNote-too-many-price-discounts 
sh one-regression.sh Extended Invoice NABT-148-Extended-Invoice-too-many-gross-prices
sh one-regression.sh Extended CreditNote NABT-148-Extended-CreditNote-too-many-gross-prices 
sh one-regression.sh Extended Invoice NABT-148-Extended-Invoice-negative-base-amount
sh one-regression.sh Extended CreditNote NABT-148-Extended-CreditNote-negative-base-amount 
sh one-regression.sh Extended Invoice NABT-150-Extended-Invoice-invalid-base-unit-code
sh one-regression.sh Extended CreditNote NABT-150-Extended-CreditNote-invalid-base-unit-code 
sh one-regression.sh Extended Invoice NABT-153-Extended-Invoice-missing-item-name
sh one-regression.sh Extended CreditNote NABT-153-Extended-CreditNote-missing-item-name 
sh one-regression.sh Core Invoice NABT-154-Core-Invoice-too-many-item-definitions
sh one-regression.sh Core CreditNote NABT-154-Core-CreditNote-too-many-item-definitions  
sh one-regression.sh Extended Invoice NABT-157-Extended-Invoice-missing-item-identification
sh one-regression.sh Extended CreditNote NABT-157-Extended-CreditNote-missing-item-identification  
sh one-regression.sh Extended Invoice NABT-157-1-Extended-Invoice-missing-item-identification-scheme
sh one-regression.sh Extended CreditNote NABT-157-1-Extended-CreditNote-missing-item-identification-scheme  
sh one-regression.sh Extended Invoice NABT-158-1-Extended-Invoice-missing-classification-list-id
sh one-regression.sh Extended CreditNote NABT-158-1-Extended-CreditNote-missing-classification-list-id  
sh one-regression.sh Extended Invoice NABT-159-Extended-Invoice-bad-origin-country
sh one-regression.sh Extended CreditNote NABT-159-Extended-CreditNote-missing-origin-country  
sh one-regression.sh Extended Invoice NABT-915-Extended-Invoice-missing-lot-number-id
sh one-regression.sh Extended CreditNote NABT-915-Extended-CreditNote-missing-lot-number-id  
sh one-regression.sh Extended Invoice NABT-919-Extended-Invoice-bad-date
sh one-regression.sh Extended Invoice NABT-919-Extended-Invoice-bad-time
sh one-regression.sh Extended Invoice NABT-921-Extended-Invoice-bad-date
sh one-regression.sh Extended Invoice NABT-930-Extended-Invoice-bad-delivery-country
sh one-regression.sh Extended CreditNote NABT-930-Extended-CreditNote-bad-delivery-country 
sh one-regression.sh Extended Invoice NABT-940-Extended-Invoice-too-many-delivery-names
sh one-regression.sh Extended CreditNote NABT-940-Extended-CreditNote-too-many-delivery-names

sh one-regression.sh Extended Invoice NABT-964-Extended-Invoice-invalid-seller-country
sh one-regression.sh Extended Invoice NABT-969-Extended-Invoice-missing-endpoint-id-scheme
sh one-regression.sh Extended Invoice NABT-971-Extended-Invoice-missing-seller-company-id-scheme
sh one-regression.sh Extended Invoice NABT-972-Extended-Invoice-too-many-seller-company-ids
sh one-regression.sh Extended Invoice NABT-973-Extended-Invoice-missing-seller-id-scheme
sh one-regression.sh Extended Invoice NABT-974-Extended-Invoice-too-many-seller-ids
sh one-regression.sh Extended Invoice NABT-975-Extended-Invoice-too-many-seller-names
sh one-regression.sh Core     Invoice NABT-976-Core-Invoice-multiple-seller-name
sh one-regression.sh Core     Invoice NABT-976-Core-Invoice-absent-seller-name
sh one-regression.sh Core     Invoice NABT-981-Core-Invoice-payee-missing-country
sh one-regression.sh Core     Invoice NABT-981-Core-Invoice-payee-invalid-country
sh one-regression.sh Extended Invoice NABT-988-Extended-Invoice-bad-preceding-invoice-status-value
sh one-regression.sh Extended Invoice NABT-989-Extended-Invoice-missing-session-id
sh one-regression.sh Extended Invoice NABT-999-Extended-Invoice-bad-missing-id

# fi

# temporary - remove this when work is done
# d ; cd . ; cp ../../../../raw/regression/regression.sh . ; cp ../../../../raw/regression/*.xml . ; sh regression.sh 