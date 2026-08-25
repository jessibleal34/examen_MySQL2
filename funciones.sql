-- funcion verificar disponoblilidad
DELIMITER $$

CREATE FUNCTION verificar_disponibilidad(
    p_salon_id INT,
    p_fecha_inicio DATETIME,
    p_fecha_fin DATETIME
)
RETURNS TINYINT
READS SQL DATA
BEGIN

    DECLARE v_reservas INT;

    SELECT COUNT(*)
    INTO v_reservas
    FROM reservas
    WHERE id_salon = p_salon_id
      AND estado = 'Activa'
      AND p_fecha_inicio < fecha_fin
      AND p_fecha_fin > fecha_inicio;

    IF v_reservas = 0 THEN
        RETURN 1;
    ELSE
        RETURN 0;
    END IF;

END $$

DELIMITER ;