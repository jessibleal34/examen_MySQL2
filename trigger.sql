 -- tirgger

CREATE TRIGGER auditoria_pagos_trigger
AFTER UPDATE
ON pagos
FOR EACH ROW
BEGIN

    IF OLD.precio_hora <> NEW.precio_hora THEN

        INSERT INTO auditoria_precios
        (
            id_salon,
            usuario,
            fecha_cambio,
            valor_anterior,
            valor_nuevo
        )
        VALUES
        (
            NEW.id_salon,
            USER(),
            NOW(),
            OLD.precio_hora,
            NEW.precio_hora
        );

    END IF;

END $$

DELIMITER ;
