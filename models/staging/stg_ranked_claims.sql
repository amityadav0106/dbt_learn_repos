WITH ranked_claims AS (
    SELECT
        claim_id,
        employee_id,
        claim_date,
        expense_type,
        amount,
        ROW_NUMBER() OVER (
            PARTITION BY claim_id 
            ORDER BY claim_date DESC
        ) AS rn
    FROM DBT_LEARNING.RAW.EXPENSES_CLAIM
)

SELECT
    claim_id,
    employee_id,
    claim_date,
    UPPER(expense_type) AS expense_type,
    amount
FROM ranked_claims
WHERE rn = 1
