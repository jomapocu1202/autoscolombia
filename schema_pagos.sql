CREATE TABLE IF NOT EXISTS tarifas (
    id_tarifa INT AUTO_INCREMENT PRIMARY KEY,
    tipo_vehiculo VARCHAR(30) NOT NULL UNIQUE,
    valor_mensual DECIMAL(10, 2) NOT NULL,
    fecha_actualizacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS pagos (
    id_pago INT AUTO_INCREMENT PRIMARY KEY,
    numero_recibo VARCHAR(20) NOT NULL UNIQUE,
    placa_vehiculo VARCHAR(10) NOT NULL,
    id_usuario INT NOT NULL,
    periodo_pagado VARCHAR(20) NOT NULL,
    monto DECIMAL(10, 2) NOT NULL,
    metodo_pago VARCHAR(20) NOT NULL,
    fecha_pago DATETIME DEFAULT CURRENT_TIMESTAMP,
    fecha_vencimiento DATE NOT NULL,
    estado VARCHAR(15) DEFAULT 'ACTIVO',
    motivo_anulacion VARCHAR(255) NULL,
    CONSTRAINT fk_pago_vehiculo FOREIGN KEY (placa_vehiculo) REFERENCES vehiculos(placa),
    CONSTRAINT fk_pago_usuario FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);
