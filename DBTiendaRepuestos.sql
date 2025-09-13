-- DROP DATABASE IF EXISTS DBTiendaRepuestos;
CREATE DATABASE DBTiendaRepuestos;
USE DBTiendaRepuestos;

CREATE TABLE clientes (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    telefono VARCHAR(20),
    PRIMARY KEY (id_cliente)
);

CREATE TABLE empleados (
    id_empleado INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    puesto VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    PRIMARY KEY (id_empleado)
);

CREATE TABLE productos (
    id_producto INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(200),
    precio DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL,
    PRIMARY KEY (id_producto)
);

CREATE TABLE ventas (
    id_venta INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_empleado INT NOT NULL,
    fecha DATE NOT NULL,
    total DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (id_venta),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) On delete cascade on update cascade,
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado) On delete cascade on update cascade
);

DELIMITER $$

CREATE PROCEDURE sp_AgregarCliente (
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_email VARCHAR(100),
    IN p_telefono VARCHAR(20)
)
BEGIN
    INSERT INTO clientes (nombre, apellido, email, telefono)
    VALUES (p_nombre, p_apellido, p_email, p_telefono);
END$$

DELIMITER ;
CALL sp_AgregarCliente('Juan', 'Pérez', 'juan1@gmail.com', '12345678');
CALL sp_AgregarCliente('Ana', 'Gómez', 'ana2@yahoo.com', '23456789');
CALL sp_AgregarCliente('Luis', 'Ramírez', 'luis3@gmail.com', '34567890');
CALL sp_AgregarCliente('María', 'López', 'maria4@yahoo.com', '45678901');
CALL sp_AgregarCliente('Pedro', 'Martínez', 'pedro5@gmail.com', '56789012');
CALL sp_AgregarCliente('Laura', 'Hernández', 'laura6@yahoo.com', '67890123');
CALL sp_AgregarCliente('Carlos', 'Torres', 'carlos7@gmail.com', '78901234');
CALL sp_AgregarCliente('Sofía', 'Vargas', 'sofia8@yahoo.com', '89012345');
CALL sp_AgregarCliente('Jorge', 'Cruz', 'jorge9@gmail.com', '90123456');
CALL sp_AgregarCliente('Lucía', 'Rojas', 'lucia10@yahoo.com', '01234567');


DELIMITER $$

CREATE PROCEDURE sp_AgregarEmpleado (
    IN p_nombre VARCHAR(50),
    IN p_apellido VARCHAR(50),
    IN p_puesto VARCHAR(50),
    IN p_email VARCHAR(100)
)
BEGIN
    INSERT INTO empleados (nombre, apellido, puesto, email)
    VALUES (p_nombre, p_apellido, p_puesto, p_email);
END$$

DELIMITER ;
CALL sp_AgregarEmpleado('Miguel', 'Santos', 'Vendedor', 'miguel1@gmail.com');
CALL sp_AgregarEmpleado('Elena', 'Flores', 'Cajero', 'elena2@yahoo.com');
CALL sp_AgregarEmpleado('Raúl', 'Ortiz', 'Vendedor', 'raul3@gmail.com');
CALL sp_AgregarEmpleado('Verónica', 'Méndez', 'Administrativo', 'veronica4@yahoo.com');
CALL sp_AgregarEmpleado('Hugo', 'García', 'Cajero', 'hugo5@gmail.com');
CALL sp_AgregarEmpleado('Patricia', 'Ramos', 'Vendedor', 'patricia6@yahoo.com');
CALL sp_AgregarEmpleado('Diego', 'Pineda', 'Administrativo', 'diego7@gmail.com');
CALL sp_AgregarEmpleado('Camila', 'Reyes', 'Vendedor', 'camila8@yahoo.com');
CALL sp_AgregarEmpleado('Alfredo', 'Castañeda', 'Cajero', 'alfredo9@gmail.com');
CALL sp_AgregarEmpleado('Natalia', 'Serrano', 'Vendedor', 'natalia10@yahoo.com');

DELIMITER $$

CREATE PROCEDURE sp_AgregarProducto (
    IN p_nombre VARCHAR(100),
    IN p_descripcion VARCHAR(200),
    IN p_precio DECIMAL(10,2),
    IN p_stock INT
)
BEGIN
    INSERT INTO productos (nombre, descripcion, precio, stock)
    VALUES (p_nombre, p_descripcion, p_precio, p_stock);
END$$

DELIMITER ;
CALL sp_AgregarProducto('Filtro de aire', 'Filtro de aire para motor', 15.50, 50);
CALL sp_AgregarProducto('Bujía', 'Bujía de encendido', 8.75, 100);
CALL sp_AgregarProducto('Aceite 5W-30', 'Aceite sintético 1L', 12.00, 200);
CALL sp_AgregarProducto('Pastillas de freno', 'Pastillas delanteras', 25.00, 75);
CALL sp_AgregarProducto('Amortiguador', 'Amortiguador delantero', 55.00, 30);
CALL sp_AgregarProducto('Batería 12V', 'Batería para autos', 80.00, 40);
CALL sp_AgregarProducto('Correa de distribución', 'Correa motor 1.6', 35.00, 25);
CALL sp_AgregarProducto('Radiador', 'Radiador para motor', 120.00, 15);
CALL sp_AgregarProducto('Lámpara LED', 'Lámpara frontal', 10.00, 60);
CALL sp_AgregarProducto('Aceite de transmisión', 'Aceite 1L', 14.50, 50);

DELIMITER $$

CREATE PROCEDURE sp_AgregarVenta (
    IN p_id_cliente INT,
    IN p_id_empleado INT,
    IN p_fecha DATE,
    IN p_total DECIMAL(10,2)
)
BEGIN
    INSERT INTO ventas (id_cliente, id_empleado, fecha, total)
    VALUES (p_id_cliente, p_id_empleado, p_fecha, p_total);
END$$

DELIMITER ;
CALL sp_AgregarVenta(1, 1, '2025-09-12', 100.50);
CALL sp_AgregarVenta(2, 2, '2025-09-12', 50.00);
CALL sp_AgregarVenta(3, 3, '2025-09-12', 75.25);
CALL sp_AgregarVenta(4, 4, '2025-09-12', 200.00);
CALL sp_AgregarVenta(5, 5, '2025-09-12', 150.75);
CALL sp_AgregarVenta(6, 6, '2025-09-12', 300.50);
CALL sp_AgregarVenta(7, 7, '2025-09-12', 90.00);
CALL sp_AgregarVenta(8, 8, '2025-09-12', 60.25);
CALL sp_AgregarVenta(9, 9, '2025-09-12', 120.00);
CALL sp_AgregarVenta(10, 10, '2025-09-12', 80.50);


SELECT * FROM clientes;
SELECT * FROM empleados;
SELECT * FROM productos;
SELECT * FROM ventas;
