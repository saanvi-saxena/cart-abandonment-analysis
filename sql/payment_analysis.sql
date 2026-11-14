USE cart_abandonment;

-- 1. Payment method usage
SELECT
    payment_method,
    COUNT(DISTINCT session_id) AS payment_sessions
FROM events
WHERE event_name = 'payment_initiated'
GROUP BY payment_method
ORDER BY payment_sessions DESC;


-- 2. Payment status summary
SELECT
    payment_status,
    COUNT(*) AS total_payments
FROM events
WHERE event_name = 'payment_initiated'
GROUP BY payment_status;


-- 3. Payment failure reasons
SELECT
    payment_failure_reason,
    COUNT(*) AS failed_payments,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*)
         FROM events
         WHERE event_name = 'payment_initiated'
         AND payment_status = 'Failed'),
        2
    ) AS failure_percentage
FROM events
WHERE event_name = 'payment_initiated'
AND payment_status = 'Failed'
GROUP BY payment_failure_reason
ORDER BY failed_payments DESC;