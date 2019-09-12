REPORT demo_list_write_currency LINE-SIZE 40.

DATA: num1 TYPE p  DECIMALS 4 VALUE '12.3456',
      num2 TYPE p  DECIMALS 0 VALUE '123456'.

SET COUNTRY 'US'.

WRITE: 'USD', num1 CURRENCY 'USD', num2 CURRENCY 'USD',
     / 'BEF', num1 CURRENCY 'BEF', num2 CURRENCY 'BEF',
     / 'KUD', num1 CURRENCY 'KUD', num2 CURRENCY 'KUD'.