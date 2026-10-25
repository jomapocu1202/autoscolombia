-- Creación de la base de datos
CREATE DATABASE parqueadero_autos_colombia;
USE parqueadero_autos_colombia;

-- 1. Tabla de Usuarios
CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    tipo_documento VARCHAR(10) NOT NULL,
    numero_documento VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(80) NOT NULL,
    apellido VARCHAR(80) NOT NULL,
    telefono VARCHAR(20),
    correo VARCHAR(100),
    estado ENUM('Activo', 'Inactivo') DEFAULT 'Activo'
);

-- 2. Tabla de Vehículos
CREATE TABLE vehiculo (
    placa VARCHAR(10) PRIMARY KEY,
    marca VARCHAR(50) NOT NULL,
    modelo VARCHAR(20),
    color VARCHAR(30),
    tipo_vehiculo ENUM('Automovil', 'Camioneta', 'Motocicleta') NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT fk_vehiculo_usuario FOREIGN KEY (id_usuario) 
        REFERENCES usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE
);

-- 3. Tabla de Mensualidades
CREATE TABLE mensualidad (
    id_mensualidad INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    placa VARCHAR(10) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    estado ENUM('Activa', 'Vencida', 'Suspendida') DEFAULT 'Activa',
    valor DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_mensualidad_usuario FOREIGN KEY (id_usuario) 
        REFERENCES usuario(id_usuario),
    CONSTRAINT fk_mensualidad_vehiculo FOREIGN KEY (placa) 
        REFERENCES vehiculo(placa)
);

-- 4. Tabla de Celdas
CREATE TABLE celda (
    id_celda VARCHAR(10) PRIMARY KEY,
    tipo_permitido ENUM('Automovil', 'Camioneta', 'Motocicleta') NOT NULL,
    ubicacion_zona VARCHAR(50) NOT NULL,
    estado ENUM('Disponible', 'Ocupada', 'Mantenimiento') DEFAULT 'Disponible'
);

-- 5. Tabla de Registro de Acceso (Entrada y Salida)
CREATE TABLE registro_acceso (
    id_registro INT AUTO_INCREMENT PRIMARY KEY,
    placa VARCHAR(10) NOT NULL,
    id_celda VARCHAR(10) NOT NULL,
    fecha_hora_entrada DATETIME NOT NULL,
    fecha_hora_salida DATETIME NULL,
    estado_estancia ENUM('En_Parqueadero', 'Finalizado') DEFAULT 'En_Parqueadero',
    CONSTRAINT fk_registro_vehiculo FOREIGN KEY (placa) 
        REFERENCES vehiculo(placa),
    CONSTRAINT fk_registro_celda FOREIGN KEY (id_celda) 
        REFERENCES celda(id_celda)
);

-- 6. Tabla de Novedades de Vehículos
CREATE TABLE novedad (
    id_novedad INT AUTO_INCREMENT PRIMARY KEY,
    id_registro INT NOT NULL,
    momento ENUM('Entrada', 'Salida', 'Durante_Estancia') NOT NULL,
    tipo_novedad VARCHAR(50) NOT NULL,
    descripcion TEXT NOT NULL,
    fecha_hora DATETIME NOT NULL,
    CONSTRAINT fk_novedad_registro FOREIGN KEY (id_registro) 
        REFERENCES registro_acceso(id_registro) ON DELETE CASCADE
);
