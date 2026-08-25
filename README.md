EVENTOS-PREMIER
# Sistema de Gestión de Reservas - Eventos Premier S.A.S.

## Descripción del proyecto

Eventos Premier S.A.S. es una empresa dedicada al alquiler de salones para reuniones, fiestas, conferencias y diferentes tipos de eventos. El objetivo de este proyecto es diseñar e implementar una base de datos relacional en MySQL que permita digitalizar y organizar la información relacionada con los salones, clientes, reservas y pagos. El sistema permite controlar la disponibilidad de los salones, calcular automáticamente el valor de las reservas, registrar pagos, generar auditorías de cambios de precios y realizar consultas para apoyar la gestión administrativa de la empresa.

## Objetivo general

Diseñar e implementar una base de datos relacional en MySQL que permita gestionar de manera organizada las reservas de salones, clientes, pagos y disponibilidad de Eventos Premier S.A.S., aplicando funciones, triggers, vistas y consultas SQL.

## Objetivos específicos

Registrar y administrar los salones disponibles, almacenar la información de los clientes, gestionar las reservas realizadas, registrar los pagos asociados a cada reserva, calcular automáticamente el valor de las reservas incluyendo el IVA del 19%, verificar la disponibilidad de los salones, actualizar automáticamente el estado de los salones mediante triggers, registrar los cambios realizados en los precios de los salones y generar consultas para analizar la información del sistema.

## FUNCIONES 
crearn disponibilidad

## consultas
Crear una consulta que muestre:
•	El nombre del cliente, el nombre del salón y el total pagado,
•	Solo de las reservas con pagos realizados mediante “Transferencia”,
•	Ordenadas de mayor a menor monto pagado.
## vistas 
Crear una vista llamada vista_resumen_pagos
•	Debe mostrar:
•	Nombre del cliente
•	Nombre del salón
•	Método de pago
•	Fecha del pago
•	Monto pagado
•	Debe construirse 

## trigger
Crear un trigger llamado auditoria_pagos_trigger
•	Debe activarse después de insertar un nuevo pago (AFTER INSERT en pagos).
