USE cart_abandonment;

SELECT
    event_name,
    COUNT(DISTINCT session_id) AS total_sessions

FROM events

GROUP BY event_name

ORDER BY FIELD(
    event_name,
    'product_view',
    'add_to_cart',
    'checkout_initiated',
    'payment_initiated',
    'purchase_completed'
);