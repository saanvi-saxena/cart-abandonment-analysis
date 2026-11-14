
USE cart_abandonment;

SELECT
    s.product_category,

    COUNT(DISTINCT CASE
        WHEN e.event_name = 'add_to_cart'
        THEN e.session_id
    END) AS cart_sessions,

    COUNT(DISTINCT CASE
        WHEN e.event_name = 'purchase_completed'
        THEN e.session_id
    END) AS purchase_sessions,

    COUNT(DISTINCT CASE
        WHEN e.event_name = 'add_to_cart'
        THEN e.session_id
    END)
    -
    COUNT(DISTINCT CASE
        WHEN e.event_name = 'purchase_completed'
        THEN e.session_id
    END) AS abandoned_sessions,

    ROUND(
        (
            COUNT(DISTINCT CASE
                WHEN e.event_name = 'add_to_cart'
                THEN e.session_id
            END)
            -
            COUNT(DISTINCT CASE
                WHEN e.event_name = 'purchase_completed'
                THEN e.session_id
            END)
        ) * 100.0 /
        COUNT(DISTINCT CASE
            WHEN e.event_name = 'add_to_cart'
            THEN e.session_id
        END),
        2
    ) AS abandonment_rate

FROM sessions s
JOIN events e
ON s.session_id = e.session_id

GROUP BY s.product_category;
