{{ config(materialized='table',
    alias='DQ_NULL_CHECK_EXPENSE_CLAIMS'
) }}

WITH dq_check AS (

    {{ check_nulls(ref('stg_expense_claim'), 
       ['claim_id','employee_id','amount']) }}

)

SELECT *
FROM dq_check
WHERE null_check_status = 'FAIL'