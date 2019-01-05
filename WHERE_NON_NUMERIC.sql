Filter the accounts TABLE TO include the company name,
                                         website,
AND the PRIMARY point OF contact (primary_poc) just
FOR the Exxon Mobil company IN the accounts table.
SELECT name,
       website,
       primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

