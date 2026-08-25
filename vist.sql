-- consulta

SELECT c.id_clientes, s.id_salones, p.pagp-total
FROM reservas r
LEFT JOIN pagos p ON p.id_reserva = r.id_reserva
WHERE p.id_pago and   metodo_pago ='Transferencia' IS NULL;

-- vista
CREATE VIEW vista_resumen_pagos AS
SELECT
    r.id_reserva,
    c.nombre_completo AS cliente,
    s.nombre_salon AS pagos,
	m.metodo_pago ,
    r.fecha_pago
    r.valor_total AS total,
    r.estado
FROM reservas r
JOIN clientes c
    ON r.id_cliente = c.id_cliente
JOIN salones s
    ON r.id_salon = s.id_salon;

SELECT * FROM vista_resumen_pagos;