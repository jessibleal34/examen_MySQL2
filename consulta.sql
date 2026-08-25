-- consulta

SELECT c.id_clientes, s.id_salones, p.pagp-total
FROM reservas r
LEFT JOIN pagos p ON p.id_reserva = r.id_reserva
WHERE p.id_pago and   metodo_pago ='Transferencia' IS NULL;
