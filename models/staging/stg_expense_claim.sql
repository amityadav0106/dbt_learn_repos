SELECT 
    claim_id,
    employee_id,
   upper(employee_name) as employee_name,
    lower(expense_type) as expense_type ,
    amount,
    claim_date
FROM dbt_learning.RAW.EXPENSES_CLAIM