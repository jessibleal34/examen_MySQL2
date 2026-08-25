-- create DATABASE eventosPremier;
-- USE eventosPremier;
CREATE TABLE salones (
    id_salon INT AUTO_INCREMENT,
    nombre_salon VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL,
    precio_hora DECIMAL(10,2) NOT NULL,
    estado ENUM('Disponible', 'Ocupado', 'En mantenimiento') 
        DEFAULT 'Disponible',
    encargado VARCHAR(100) NOT NULL,

    PRIMARY KEY (id_salon)
);
INSERT INTO salones
(nombre_salon, capacidad, precio_hora, estado, encargado)
VALUES
('Salón Imperial', 100, 150000, 'Disponible', 'Carlos Gómez'),
('Salón Real', 50, 90000, 'Disponible', 'Laura Martínez'),
('Salón Ejecutivo', 30, 70000, 'Disponible', 'Andrés Pérez'),
('Salón Gran Gala', 200, 250000, 'En mantenimiento', 'María Rodríguez'),
('Salón Empresarial', 80, 120000, 'Disponible', 'Sofía Torres');

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT,
    nombre_completo VARCHAR(150) NOT NULL,
    identificacion VARCHAR(30) NOT NULL UNIQUE,
    telefono VARCHAR(30),
    correo_electronico VARCHAR(150),
    tipo_cliente ENUM('Individual', 'Corporativo') NOT NULL,

    PRIMARY KEY (id_cliente)
);
INSERT INTO clientes
(nombre_completo, identificacion, telefono, correo_electronico, tipo_cliente)
VALUES
('Juan Pérez', '1001001001', '3001111111', 'juan@gmail.com', 'Individual'),

('María González', '1001001002', '3002222222', 'maria@gmail.com', 'Individual'),

('Empresa ABC S.A.S.', '900100001', '3003333333', 'contacto@abc.com', 'Corporativo'),

('Corporación XYZ', '900100002', '3004444444', 'contacto@xyz.com', 'Corporativo'),

('Eventos Santander S.A.S.', '900100003', '3005555555', 'eventos@santander.com', 'Corporativo');

CREATE TABLE reservas (
    id_reserva INT AUTO_INCREMENT,
    fecha_inicio DATETIME NOT NULL,
    fecha_fin DATETIME NOT NULL,
    id_cliente INT NOT NULL,
    id_salon INT NOT NULL,
    total_horas DECIMAL(10,2),
    valor_total DECIMAL(12,2),
    estado ENUM('Activa', 'Cancelada', 'Finalizada') 
        DEFAULT 'Activa',

    PRIMARY KEY (id_reserva),

    FOREIGN KEY (id_cliente)
        REFERENCES clientes(id_cliente),

    FOREIGN KEY (id_salon)
        REFERENCES salones(id_salon),

    CHECK (fecha_fin > fecha_inicio)
);

INSERT INTO reservas
(fecha_inicio, fecha_fin, id_cliente, id_salon, total_horas, valor_total)
VALUES
('2026-08-20 08:00:00', '2026-08-20 12:00:00', 1, 1, 4, 714000),

('2026-08-21 14:00:00', '2026-08-21 18:00:00', 3, 2, 4, 428400),

('2026-08-22 09:00:00', '2026-08-22 15:00:00', 4, 3, 6, 499800);

CREATE TABLE pagos (
    id_pago INT AUTO_INCREMENT,
    id_reserva INT NOT NULL,
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    monto_pagado DECIMAL(12,2) NOT NULL,
    metodo_pago ENUM(
        'Efectivo',
        'Tarjeta',
        'Transferencia'
    ) NOT NULL,

    PRIMARY KEY (id_pago),

    FOREIGN KEY (id_reserva)
        REFERENCES reservas(id_reserva),

    CHECK (monto_pagado > 0)
);

CREATE TABLE auditoria_precios (
    id_auditoria INT AUTO_INCREMENT,
    id_salon INT NOT NULL,
    usuario VARCHAR(100),
    fecha_cambio DATETIME DEFAULT CURRENT_TIMESTAMP,
    valor_anterior DECIMAL(10,2),
    valor_nuevo DECIMAL(10,2),

    PRIMARY KEY (id_auditoria),

    FOREIGN KEY (id_salon)
        REFERENCES salones(id_salon)
);
DELIMITER $$
