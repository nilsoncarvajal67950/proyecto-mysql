# proyecto-mysql

## AGROFINCA-NJ 👨‍🌾🐓🌱

Este repositorio contiene el código fuente de una base de datos para una finca que se nos plantea en el proyecto.

## Tecnologías utilizados :

 100% SQL
 
## Instrucciones de uso :

1. copiar la respectiva parte del código que desea ejecutar respetando el orden de los datos

## BASE DE DATOS :

```sql
-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS agrofincanj;
USE agrofincanj;

-- Tabla Empleados
CREATE TABLE Empleados (
    empleado_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    tipo_contrato VARCHAR(50),
    salario DECIMAL(10,2),
    especialidad VARCHAR(100),
    contacto VARCHAR(100),
    fecha_ingreso DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Tipo_Trabajo
CREATE TABLE Tipo_Trabajo (
    tipo_trabajo_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    descripcion TEXT,
    costo_hora DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Campos
CREATE TABLE Campos ( campo_id INT PRIMARY KEY AUTO_INCREMENT, 
nombre VARCHAR(100) NOT NULL, 
superficie_total DECIMAL(10,2), ubicacion VARCHAR(200),
tipo_suelo VARCHAR(100), 
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP );

-- Tabla Lotes
CREATE TABLE Lotes (
    lote_id INT PRIMARY KEY AUTO_INCREMENT,
    campo_id INT,
    area DECIMAL(10,2),
    estado VARCHAR(50),
    tipo_riego VARCHAR(100),
    FOREIGN KEY (campo_id) REFERENCES Campos(campo_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE    CURRENT_TIMESTAMP
);

-- Tabla Actividades_Agricolas
CREATE TABLE Actividades_Agricolas (
    actividad_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    tipo_trabajo_id INT,
    lote_id INT,
    fecha DATE,
    horas_trabajadas DECIMAL(5,2),
    observaciones TEXT,
    FOREIGN KEY (empleado_id) REFERENCES Empleados(empleado_id),
    FOREIGN KEY (tipo_trabajo_id) REFERENCES Tipo_Trabajo(tipo_trabajo_id),
    FOREIGN KEY (lote_id) REFERENCES Lotes(lote_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Productos
CREATE TABLE Productos (
    producto_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    unidad_medida VARCHAR(20),
    precio_referencia DECIMAL(10,2),
    temporada VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Cultivos
CREATE TABLE Cultivos (
    cultivo_id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT,
    variedad VARCHAR(100),
    dias_maduracion INT,
    temporada_siembra VARCHAR(50),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

-- Tabla Lote_Cultivos
CREATE TABLE Lote_Cultivos (
    lote_cultivo_id INT PRIMARY KEY AUTO_INCREMENT,
    lote_id INT,
    cultivo_id INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    estado VARCHAR(50),
    FOREIGN KEY (lote_id) REFERENCES Lotes(lote_id),
    FOREIGN KEY (cultivo_id) REFERENCES Cultivos(cultivo_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Plagas
CREATE TABLE Plagas (
    plaga_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    descripcion TEXT,
    tratamiento TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Registro_Plagas
CREATE TABLE Registro_Plagas (
    registro_plaga_id INT PRIMARY KEY AUTO_INCREMENT,
    lote_cultivo_id INT,
    plaga_id INT,
    fecha_deteccion DATE,
    nivel_afectacion VARCHAR(50),
    tratamiento_aplicado TEXT,
    FOREIGN KEY (lote_cultivo_id) REFERENCES Lote_Cultivos(lote_cultivo_id),
    FOREIGN KEY (plaga_id) REFERENCES Plagas(plaga_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Clima
CREATE TABLE Clima (
    clima_id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE,
    temperatura DECIMAL(5,2),
    precipitacion DECIMAL(6,2),
    humedad DECIMAL(5,2),
    condiciones VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Planificacion_Agricola
CREATE TABLE Planificacion_Agricola (
    plan_id INT PRIMARY KEY AUTO_INCREMENT,
    lote_id INT,
    cultivo_id INT,
    fecha_planificada DATE,
    area_planificada DECIMAL(10,2),
    produccion_esperada DECIMAL(10,2),
    FOREIGN KEY (lote_id) REFERENCES Lotes(lote_id),
    FOREIGN KEY (cultivo_id) REFERENCES Cultivos(cultivo_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Animales
CREATE TABLE Animales (
    animal_id INT PRIMARY KEY AUTO_INCREMENT,
    especie VARCHAR(50) NOT NULL,
    raza VARCHAR(50),
    fecha_nacimiento DATE,
    estado VARCHAR(50),
    proposito VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Produccion_Animales
CREATE TABLE Produccion_Animales (
    produccion_animal_id INT PRIMARY KEY AUTO_INCREMENT,
    animal_id INT,
    fecha DATE,
    tipo_produccion VARCHAR(50),
    cantidad DECIMAL(10,2),
    unidad_medida VARCHAR(20),
    FOREIGN KEY (animal_id) REFERENCES Animales(animal_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);

-- Tabla Clientes
CREATE TABLE Clientes (
    cliente_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    rfc VARCHAR(20),
    contacto VARCHAR(100),
    direccion TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Ventas
CREATE TABLE Ventas (
    venta_id INT PRIMARY KEY AUTO_INCREMENT,
    cliente_id INT,
    fecha DATE,
    total DECIMAL(12,2),
    estado VARCHAR(50),
    tipo_pago VARCHAR(50),
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Detalle_Ventas
CREATE TABLE Detalle_Ventas (
    detalle_venta_id INT PRIMARY KEY AUTO_INCREMENT,
    venta_id INT,
    producto_id INT,
    cantidad DECIMAL(10,2),
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (venta_id) REFERENCES Ventas(venta_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Proveedores
CREATE TABLE Proveedores (
    proveedor_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    rfc VARCHAR(20),
    tipo VARCHAR(50),
    contacto VARCHAR(100),
    especialidad VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Insumos
CREATE TABLE Insumos (
    insumo_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    categoria VARCHAR(50),
    unidad_medida VARCHAR(20),
    stock_minimo DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Compra_Insumos
CREATE TABLE Compra_Insumos (
    compra_insumo_id INT PRIMARY KEY AUTO_INCREMENT,
    proveedor_id INT,
    insumo_id INT,
    fecha DATE,
    cantidad DECIMAL(10,2),
    precio_unitario DECIMAL(10,2),
    FOREIGN KEY (proveedor_id) REFERENCES Proveedores(proveedor_id),
    FOREIGN KEY (insumo_id) REFERENCES Insumos(insumo_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Almacenes
CREATE TABLE Almacenes (
    almacen_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    capacidad DECIMAL(10,2),
    ubicacion VARCHAR(200),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Tabla Inventario
CREATE TABLE Inventario (
    inventario_id INT PRIMARY KEY AUTO_INCREMENT,
    almacen_id INT,
    producto_id INT NULL,
    insumo_id INT NULL,
    cantidad DECIMAL(10,2),
    fecha_actualizacion DATE,
    FOREIGN KEY (almacen_id) REFERENCES Almacenes(almacen_id),
    FOREIGN KEY (producto_id) REFERENCES Productos(producto_id),
    FOREIGN KEY (insumo_id) REFERENCES Insumos(insumo_id),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```
## Inserciones :

```sql
-- inserciones Empleados
INSERT INTO Empleados (nombre, apellidos, tipo_contrato, salario, especialidad, contacto, fecha_ingreso) VALUES
('Juan', 'García Pérez', 'Indefinido', 35000.00, 'Desarrollo Web', 'juan.garcia@email.com', '2020-01-15'),
('María', 'Martínez López', 'Temporal', 28000.00, 'Diseño UX/UI', 'maria.martinez@email.com', '2021-03-20'),
('Carlos', 'Rodríguez Sánchez', 'Indefinido', 42000.00, 'Backend Developer', 'carlos.rodriguez@email.com', '2019-11-05'),
('Ana', 'López García', 'Temporal', 25000.00, 'Frontend Developer', 'ana.lopez@email.com', '2022-01-10'),
('Pedro', 'Sánchez Martín', 'Indefinido', 38000.00, 'Full Stack', 'pedro.sanchez@email.com', '2020-06-15'),
('Laura', 'González Ruiz', 'Indefinido', 45000.00, 'DevOps', 'laura.gonzalez@email.com', '2019-08-22'),
('Miguel', 'Fernández Torres', 'Temporal', 30000.00, 'QA Testing', 'miguel.fernandez@email.com', '2021-09-30'),
('Carmen', 'Díaz Moreno', 'Indefinido', 36000.00, 'Mobile Developer', 'carmen.diaz@email.com', '2020-04-12'),
('David', 'Ruiz Navarro', 'Temporal', 29000.00, 'Frontend Developer', 'david.ruiz@email.com', '2022-02-28'),
('Elena', 'Torres Vega', 'Indefinido', 41000.00, 'Data Scientist', 'elena.torres@email.com', '2019-12-01'),
('Javier', 'Moreno Silva', 'Indefinido', 39000.00, 'Backend Developer', 'javier.moreno@email.com', '2020-03-15'),
('Isabel', 'Navarro Cruz', 'Temporal', 27000.00, 'UI Designer', 'isabel.navarro@email.com', '2021-07-20'),
('Francisco', 'Vega Ortiz', 'Indefinido', 43000.00, 'System Architect', 'francisco.vega@email.com', '2019-10-05'),
('Lucía', 'Cruz Jiménez', 'Temporal', 26000.00, 'QA Tester', 'lucia.cruz@email.com', '2022-03-10'),
('Antonio', 'Ortiz Romero', 'Indefinido', 37000.00, 'DevOps Engineer', 'antonio.ortiz@email.com', '2020-08-15'),
('Sofía', 'Jiménez Castro', 'Indefinido', 44000.00, 'Project Manager', 'sofia.jimenez@email.com', '2019-09-22'),
('Manuel', 'Romero Molina', 'Temporal', 31000.00, 'Mobile Developer', 'manuel.romero@email.com', '2021-11-30'),
('Paula', 'Castro Herrera', 'Indefinido', 35000.00, 'Frontend Developer', 'paula.castro@email.com', '2020-05-12'),
('Roberto', 'Molina Santos', 'Temporal', 28000.00, 'UI/UX Designer', 'roberto.molina@email.com', '2022-04-28'),
('Cristina', 'Herrera Flores', 'Indefinido', 40000.00, 'Full Stack', 'cristina.herrera@email.com', '2020-01-01'),
('Daniel', 'Santos Vargas', 'Indefinido', 36000.00, 'Backend Developer', 'daniel.santos@email.com', '2020-02-15'),
('Marina', 'Flores Reyes', 'Temporal', 29000.00, 'Frontend Developer', 'marina.flores@email.com', '2021-08-20'),
('Alejandro', 'Vargas Muñoz', 'Indefinido', 41000.00, 'Data Engineer', 'alejandro.vargas@email.com', '2019-12-05'),
('Raquel', 'Reyes Silva', 'Temporal', 27000.00, 'QA Testing', 'raquel.reyes@email.com', '2022-05-10'),
('José', 'Muñoz Torres', 'Indefinido', 38000.00, 'System Admin', 'jose.munoz@email.com', '2020-09-15'),
('Andrea', 'Silva Morales', 'Indefinido', 43000.00, 'Product Manager', 'andrea.silva@email.com', '2019-10-22'),
('Fernando', 'Torres Ruiz', 'Temporal', 32000.00, 'Mobile Developer', 'fernando.torres@email.com', '2021-12-30'),
('Natalia', 'Morales Vega', 'Indefinido', 34000.00, 'UI Designer', 'natalia.morales@email.com', '2020-06-12'),
('Diego', 'Ruiz Ortega', 'Temporal', 30000.00, 'Frontend Developer', 'diego.ruiz@email.com', '2022-06-28'),
('Sara', 'Vega Castro', 'Indefinido', 39000.00, 'Backend Developer', 'sara.vega@email.com', '2020-02-01'),
('Pablo', 'Ortega Jiménez', 'Indefinido', 37000.00, 'Full Stack', 'pablo.ortega@email.com', '2020-03-15'),
('Alba', 'Castro López', 'Temporal', 28000.00, 'QA Tester', 'alba.castro@email.com', '2021-09-20'),
('Hugo', 'Jiménez Martín', 'Indefinido', 42000.00, 'DevOps Engineer', 'hugo.jimenez@email.com', '2019-11-05'),
('Clara', 'López Sánchez', 'Temporal', 26000.00, 'UI/UX Designer', 'clara.lopez@email.com', '2022-07-10'),
('Adrián', 'Martín García', 'Indefinido', 36000.00, 'Mobile Developer', 'adrian.martin@email.com', '2020-10-15'),
('Eva', 'Sánchez Pérez', 'Indefinido', 45000.00, 'Project Manager', 'eva.sanchez@email.com', '2019-11-22'),
('Jorge', 'García Rodríguez', 'Temporal', 33000.00, 'Frontend Developer', 'jorge.garcia@email.com', '2022-01-30'),
('Julia', 'Rodríguez Díaz', 'Indefinido', 35000.00, 'Backend Developer', 'julia.rodriguez@email.com', '2020-07-12'),
('Víctor', 'Díaz González', 'Temporal', 29000.00, 'QA Testing', 'victor.diaz@email.com', '2022-08-28'),
('Carla', 'González Fernández', 'Indefinido', 38000.00, 'Data Scientist', 'carla.gonzalez@email.com', '2020-03-01'),
('Marcos', 'Fernández Martínez', 'Indefinido', 40000.00, 'System Architect', 'marcos.fernandez@email.com', '2020-04-15'),
('Lucía', 'Martínez Ruiz', 'Temporal', 27000.00, 'UI Designer', 'lucia.martinez@email.com', '2021-10-20'),
('Bruno', 'Ruiz Torres', 'Indefinido', 43000.00, 'Full Stack', 'bruno.ruiz@email.com', '2019-12-05'),
('Celia', 'Torres Moreno', 'Temporal', 28000.00, 'Frontend Developer', 'celia.torres@email.com', '2022-09-10'),
('Alberto', 'Moreno Cruz', 'Indefinido', 37000.00, 'Backend Developer', 'alberto.moreno@email.com', '2020-11-15'),
('Nuria', 'Cruz Ortiz', 'Indefinido', 44000.00, 'Product Owner', 'nuria.cruz@email.com', '2019-12-22'),
('Rubén', 'Ortiz Vega', 'Temporal', 31000.00, 'Mobile Developer', 'ruben.ortiz@email.com', '2022-02-28'),
('Marina', 'Vega Jiménez', 'Indefinido', 36000.00, 'DevOps Engineer', 'marina.vega@email.com', '2020-08-12'),
('Óscar', 'Jiménez Castro', 'Temporal', 30000.00, 'QA Tester', 'oscar.jimenez@email.com', '2022-10-28'),
('Emma', 'Castro Flores', 'Indefinido', 39000.00, 'Frontend Developer', 'emma.castro@email.com', '2020-04-01'),
('Leo', 'Flores Herrera', 'Indefinido', 41000.00, 'Backend Developer', 'leo.flores@email.com', '2020-05-15'),
('Alma', 'Herrera Santos', 'Temporal', 29000.00, 'UI/UX Designer', 'alma.herrera@email.com', '2021-11-20'),
('Mario', 'Santos Vargas', 'Indefinido', 42000.00, 'System Admin', 'mario.santos@email.com', '2020-01-05'),
('Luna', 'Vargas Reyes', 'Temporal', 27000.00, 'Frontend Developer', 'luna.vargas@email.com', '2022-11-10'),
('Oliver', 'Reyes Muñoz', 'Indefinido', 38000.00, 'Full Stack', 'oliver.reyes@email.com', '2020-12-15'),
('Vera', 'Muñoz Silva', 'Indefinido', 45000.00, 'Project Manager', 'vera.munoz@email.com', '2020-01-22'),
('Mateo', 'Silva Torres', 'Temporal', 32000.00, 'Mobile Developer', 'mateo.silva@email.com', '2022-03-30'),
('Abril', 'Torres Morales', 'Indefinido', 35000.00, 'Backend Developer', 'abril.torres@email.com', '2020-09-12'),
('Lucas', 'Morales Ruiz', 'Temporal', 28000.00, 'QA Testing', 'lucas.morales@email.com', '2022-12-28'),
('Martina', 'Ruiz Ortega', 'Indefinido', 40000.00, 'Data Engineer', 'martina.ruiz@email.com', '2020-05-01'),
('Thiago', 'Ortega Castro', 'Indefinido', 37000.00, 'Frontend Developer', 'thiago.ortega@email.com', '2020-06-15'),
('Valentina', 'Castro Jiménez', 'Temporal', 30000.00, 'UI Designer', 'valentina.castro@email.com', '2021-12-20'),
('Dylan', 'Jiménez López', 'Indefinido', 43000.00, 'DevOps Engineer', 'dylan.jimenez@email.com', '2020-02-05'),
('Olivia', 'López Martín', 'Temporal', 26000.00, 'Frontend Developer', 'olivia.lopez@email.com', '2023-01-10'),
('Max', 'Martín Sánchez', 'Indefinido', 36000.00, 'Backend Developer', 'max.martin@email.com', '2021-01-15'),
('Lola', 'Sánchez García', 'Indefinido', 44000.00, 'Product Manager', 'lola.sanchez@email.com', '2020-02-22'),
('Nicolás', 'García Rodríguez', 'Temporal', 33000.00, 'Mobile Developer', 'nicolas.garcia@email.com', '2022-04-30'),
('Jimena', 'Rodríguez Díaz', 'Indefinido', 34000.00, 'Full Stack', 'jimena.rodriguez@email.com', '2020-10-12'),
('Gabriel', 'Díaz González', 'Temporal', 29000.00, 'QA Tester', 'gabriel.diaz@email.com', '2023-02-28'),
('Vega', 'González Fernández', 'Indefinido', 41000.00, 'System Architect', 'vega.gonzalez@email.com', '2020-06-01'),
('Leo', 'Fernández Martínez', 'Indefinido', 38000.00, 'Backend Developer', 'leo.fernandez@email.com', '2020-07-15'),
('Lara', 'Martínez Ruiz', 'Temporal', 27000.00, 'UI/UX Designer', 'lara.martinez@email.com', '2022-01-20'),
('Enzo', 'Ruiz Torres', 'Indefinido', 42000.00, 'DevOps Engineer', 'enzo.ruiz@email.com', '2020-03-05'),
('Mía', 'Torres Moreno', 'Temporal', 28000.00, 'Frontend Developer', 'mia.torres@email.com', '2023-03-10'),
('Marco', 'Moreno Cruz', 'Indefinido', 37000.00, 'Full Stack', 'marco.moreno@email.com', '2021-02-15'),
('Sofía', 'Cruz Ortiz', 'Indefinido', 45000.00, 'Project Manager', 'sofia.cruz@email.com', '2020-03-22'),
('Noah', 'Ortiz Vega', 'Temporal', 31000.00, 'Mobile Developer', 'noah.ortiz@email.com', '2022-05-30'),
('Emma', 'Vega Jiménez', 'Indefinido', 35000.00, 'Backend Developer', 'emma.vega@email.com', '2020-11-12'),
('Matías', 'Jiménez Castro', 'Temporal', 30000.00, 'QA Testing', 'matias.jimenez@email.com', '2023-04-28');

-- inserciones Tipo_Trabajo

INSERT INTO Tipo_Trabajo (nombre, descripcion, costo_hora) VALUES
('Operación de Tractor', 'Manejo de tractor y maquinaria agrícola para siembra y cosecha', 45.00),
('Riego Manual', 'Aplicación de riego manual a cultivos y mantenimiento de sistemas de irrigación básicos', 20.00),
('Sistema de Riego Tecnificado', 'Instalación y mantenimiento de sistemas de riego por goteo y aspersión', 35.00),
('Cosecha Manual', 'Recolección manual de productos agrícolas', 22.00),
('Fumigación', 'Aplicación de pesticidas y control de plagas en cultivos', 30.00),
('Poda de Árboles Frutales', 'Poda y mantenimiento de árboles frutales para optimizar producción', 28.00),
('Manejo de Invernadero', 'Control y mantenimiento de cultivos en invernadero', 32.00),
('Fertilización', 'Aplicación de fertilizantes y mejoramiento de suelos', 25.00),
('Cuidado de Ganado', 'Alimentación y cuidado básico de ganado', 23.00),
('Ordeño Manual', 'Ordeño manual de ganado lechero', 22.00),
('Ordeño Mecanizado', 'Operación de sistemas de ordeño automático', 28.00),
('Esquila de Ovejas', 'Esquila y cuidado básico de ganado ovino', 30.00),
('Mantenimiento de Cercas', 'Reparación y mantenimiento de cercas y límites de propiedad', 20.00),
('Apicultura', 'Manejo y cuidado de colmenas de abejas', 35.00),
('Cultivo Hidropónico', 'Manejo de sistemas de cultivo hidropónico', 40.00),
('Compostaje', 'Elaboración y mantenimiento de composta orgánica', 25.00),
('Control Biológico', 'Implementación de control biológico de plagas', 32.00),
('Injertos', 'Realización de injertos en árboles frutales', 35.00),
('Manejo de Semilleros', 'Cuidado y mantenimiento de semilleros y almácigos', 28.00),
('Clasificación de Productos', 'Selección y clasificación de productos agrícolas', 20.00),
('Empaque de Productos', 'Empaquetado de productos agrícolas para distribución', 20.00),
('Manejo de Almacén', 'Control de almacén de productos e insumos agrícolas', 25.00),
('Operación de Cosechadora', 'Manejo de máquinas cosechadoras', 45.00),
('Mantenimiento de Maquinaria', 'Mantenimiento básico de maquinaria agrícola', 35.00),
('Agricultura de Precisión', 'Implementación de tecnologías de agricultura de precisión', 50.00),
('Análisis de Suelos', 'Toma de muestras y análisis básico de suelos', 35.00),
('Rotación de Cultivos', 'Planificación y manejo de rotación de cultivos', 30.00),
('Control de Malezas', 'Eliminación y control de malezas en cultivos', 22.00),
('Silvicultura', 'Manejo y cuidado de bosques cultivados', 28.00),
('Manejo de Vivero', 'Cuidado de plantas en vivero', 25.00),
('Propagación de Plantas', 'Reproducción y propagación de especies vegetales', 28.00),
('Cultivo Orgánico', 'Manejo de cultivos bajo certificación orgánica', 35.00),
('Conservación de Suelos', 'Implementación de técnicas de conservación de suelos', 32.00),
('Manejo de Residuos', 'Gestión de residuos agrícolas y ganaderos', 25.00),
('Cultivo de Hongos', 'Producción y manejo de hongos comestibles', 30.00),
('Acuicultura', 'Manejo de estanques de peces y crustáceos', 32.00),
('Lombricultura', 'Producción de humus y manejo de lombrices', 28.00),
('Cultivo de Flores', 'Producción y cuidado de flores ornamentales', 26.00),
('Manejo de Aguas', 'Gestión y conservación de recursos hídricos', 35.00),
('Avicultura', 'Cuidado y manejo de aves de corral', 25.00),
('Cunicultura', 'Cría y manejo de conejos', 24.00),
('Porcultura', 'Cría y manejo de cerdos', 26.00),
('Capricultura', 'Cría y manejo de cabras', 25.00),
('Manejo de Pastizales', 'Mantenimiento y gestión de áreas de pastoreo', 28.00),
('Ensilaje', 'Preparación y manejo de ensilaje para ganado', 30.00),
('Henificación', 'Proceso de henificación y almacenamiento', 28.00),
('Control de Erosión', 'Implementación de medidas contra la erosión', 32.00),
('Manejo de Plagas', 'Control integrado de plagas agrícolas', 30.00),
('Cultivo en Terrazas', 'Manejo de cultivos en sistema de terrazas', 32.00),
('Agricultura de Conservación', 'Implementación de técnicas de agricultura conservacionista', 35.00),
('Cultivo de Cactáceas', 'Producción y manejo de cactus y suculentas', 28.00),
('Cultivo de Bambú', 'Manejo y producción de bambú', 30.00),
('Cultivo de Berries', 'Producción especializada de berries', 32.00),
('Manejo de Cítricos', 'Cuidado y producción de cítricos', 28.00),
('Cultivo de Aguacate', 'Producción y manejo de aguacate', 32.00),
('Cultivo de Café', 'Producción y manejo de café', 30.00),
('Cultivo de Cacao', 'Producción y manejo de cacao', 30.00),
('Manejo de Palma', 'Producción y cuidado de palma', 32.00),
('Cultivo de Vainilla', 'Producción y procesamiento de vainilla', 35.00),
('Cultivo de Agave', 'Manejo y producción de agave', 28.00),
('Manejo de Nogal', 'Producción y cuidado de nogales', 32.00),
('Viticultura', 'Cultivo y manejo de vid', 35.00),
('Olivicultura', 'Producción y manejo de olivos', 32.00),
('Cultivo de Piña', 'Producción y manejo de piña', 28.00),
('Cultivo de Mango', 'Producción y manejo de mango', 30.00),
('Cultivo de Papaya', 'Producción y manejo de papaya', 28.00),
('Manejo de Forrajes', 'Producción y manejo de forrajes', 26.00),
('Cultivo de Stevia', 'Producción y manejo de stevia', 30.00),
('Cultivo de Aloe Vera', 'Producción y procesamiento de aloe vera', 28.00),
('Manejo de Especias', 'Producción de hierbas y especias', 30.00),
('Cultivo de Plantas Medicinales', 'Producción de plantas medicinales', 32.00),
('Manejo de Sotobosque', 'Gestión y aprovechamiento del sotobosque', 28.00),
('Agroforestería', 'Manejo de sistemas agroforestales', 35.00),
('Cultivo de Nopal', 'Producción y manejo de nopal', 26.00),
('Manejo de Plátano', 'Producción y cuidado de plátano', 28.00),
('Cultivo de Hortalizas', 'Producción de hortalizas variadas', 25.00),
('Cultivo de Tubérculos', 'Producción de papas y otros tubérculos', 26.00),
('Manejo de Granos', 'Producción de maíz, frijol y otros granos', 25.00),
('Cultivo de Caña', 'Producción y manejo de caña de azúcar', 28.00),
('Manejo de Algodón', 'Producción y cosecha de algodón', 30.00),
('Cultivo de Tabaco', 'Producción y procesamiento de tabaco', 32.00),
('Cultivo de Girasol', 'Producción de girasol', 26.00),
('Manejo de Soya', 'Producción y manejo de soya', 28.00),
('Cultivo de Sorgo', 'Producción y manejo de sorgo', 26.00),
('Manejo de Pastos', 'Producción y mantenimiento de pastos', 25.00),
('Cultivo de Arroz', 'Producción y manejo de arroz', 28.00),
('Manejo de Trigo', 'Producción y cosecha de trigo', 28.00),
('Cultivo de Cebada', 'Producción y manejo de cebada', 27.00),
('Manejo de Avena', 'Producción y cosecha de avena', 26.00),
('Cultivo de Centeno', 'Producción y manejo de centeno', 27.00),
('Manejo de Quinoa', 'Producción y procesamiento de quinoa', 30.00),
('Cultivo de Amaranto', 'Producción y manejo de amaranto', 30.00),
('Manejo de Chía', 'Producción y procesamiento de chía', 32.00),
('Cultivo de Lino', 'Producción y manejo de lino', 30.00),
('Manejo de Cáñamo', 'Producción y procesamiento de cáñamo industrial', 35.00),
('Cultivo de Cártamo', 'Producción y manejo de cártamo', 28.00),
('Manejo de Jatropha', 'Producción de jatropha para biocombustibles', 32.00),
('Cultivo de Kenaf', 'Producción y procesamiento de kenaf', 30.00),
('Manejo de Moringa', 'Producción y procesamiento de moringa', 32.00),
('Cultivo de Higuerilla', 'Producción y manejo de higuerilla', 30.00),
('Manejo de Ramio', 'Producción y procesamiento de ramio', 32.00),
('Cultivo de Yute', 'Producción y procesamiento de yute', 30.00),
('Manejo de Henequén', 'Producción y procesamiento de henequén', 32.00),
('Cultivo de Palma de Aceite', 'Producción y manejo de palma de aceite', 35.00);
                  

-- inserciones Campos

INSERT INTO Campos (nombre, superficie_total, ubicacion, tipo_suelo) VALUES
('Finca El Paraíso', 243.50, 'Valle Central, Zona 2', 'Arenoso'),
('Hacienda San José', 189.25, 'Sector Este, Área 3', 'Franco limoso'),
('Campo La Esperanza', 312.80, 'Región Sur, Parcela 4', 'Franco arcilloso'),
('Rancho Verde', 178.30, 'Valle Occidental, Lote 5', 'Franco arenoso'),
('Campo El Mirador', 265.90, 'Zona Norte, Sector 6-B', 'Arcilloso limoso'),
('Finca Santa Rosa', 145.60, 'Región Central, Área 7', 'Arenoso franco'),
('Campo Los Pinos', 198.40, 'Valle Este, Parcela 8', 'Franco'),
('Hacienda El Sol', 287.15, 'Sector Sur, Lote 9', 'Arcilloso'),
('Rancho Luna', 167.85, 'Región Oeste, Zona 10', 'Franco limoso'),
('Campo La Victoria', 234.60, 'Valle Norte, Sector 11', 'Franco arcilloso'),
('Finca El Carmen', 176.90, 'Área Central, Parcela 12', 'Arenoso'),
('Campo Los Álamos', 298.45, 'Región Este, Lote 13', 'Franco arenoso'),
('Hacienda Las Palmas', 145.30, 'Sector Oeste, Zona 14', 'Arcilloso'),
('Rancho El Dorado', 223.75, 'Valle Sur, Área 15', 'Franco'),
('Campo San Miguel', 189.60, 'Región Norte, Parcela 16', 'Franco limoso'),
('Finca Los Robles', 276.40, 'Sector Central, Lote 17', 'Arcilloso arenoso'),
('Campo La Primavera', 156.85, 'Valle Este, Zona 18', 'Franco arcilloso'),
('Hacienda El Bosque', 245.90, 'Región Oeste, Sector 19', 'Arenoso'),
('Rancho Azul', 187.25, 'Área Sur, Parcela 20', 'Franco'),
('Campo Los Cedros', 312.60, 'Valle Norte, Lote 21', 'Arcilloso'),
('Finca La Aurora', 167.45, 'Región Central, Zona 22', 'Franco limoso'),
('Campo San Juan', 289.30, 'Sector Este, Área 23', 'Franco arenoso'),
('Hacienda Verde', 198.75, 'Valle Oeste, Parcela 24', 'Arcilloso limoso'),
('Rancho Los Altos', 245.60, 'Región Sur, Lote 25', 'Arenoso'),
('Campo La Paz', 176.85, 'Área Norte, Sector 26', 'Franco'),
('Finca El Vergel', 298.40, 'Valle Central, Zona 27', 'Franco arcilloso'),
('Campo Las Acacias', 156.30, 'Región Este, Parcela 28', 'Arcilloso'),
('Hacienda El Valle', 267.75, 'Sector Oeste, Lote 29', 'Franco limoso'),
('Rancho La Sierra', 189.90, 'Valle Sur, Área 30', 'Arenoso franco'),
('Campo Los Nogales', 234.45, 'Región Norte, Zona 31', 'Franco'),
('Finca San Pedro', 178.60, 'Área Central, Sector 32', 'Arcilloso'),
('Campo El Manantial', 287.35, 'Valle Este, Parcela 33', 'Franco arenoso'),
('Hacienda Los Lagos', 167.80, 'Región Oeste, Lote 34', 'Franco limoso'),
('Rancho El Prado', 256.90, 'Sector Sur, Zona 35', 'Arcilloso arenoso'),
('Campo La Colina', 198.25, 'Valle Norte, Área 36', 'Franco'),
('Finca Las Flores', 312.70, 'Región Central, Parcela 37', 'Arenoso'),
('Campo El Horizonte', 145.85, 'Sector Este, Lote 38', 'Franco arcilloso'),
('Hacienda Nueva', 278.40, 'Valle Oeste, Zona 39', 'Arcilloso'),
('Rancho San Lucas', 187.60, 'Región Sur, Sector 40', 'Franco limoso'),
('Campo Los Sauces', 267.35, 'Área Norte, Parcela 41', 'Franco arenoso'),
('Finca El Edén', 198.90, 'Valle Central, Lote 42', 'Arcilloso limoso'),
('Campo La Luna', 245.45, 'Región Este, Zona 43', 'Arenoso'),
('Hacienda El Roble', 176.70, 'Sector Oeste, Área 44', 'Franco'),
('Rancho Las Palomas', 289.85, 'Valle Sur, Parcela 45', 'Franco arcilloso'),
('Campo San Antonio', 156.40, 'Región Norte, Lote 46', 'Arcilloso'),
('Finca Los Laureles', 234.75, 'Área Central, Zona 47', 'Franco limoso'),
('Campo El Recreo', 187.90, 'Valle Este, Sector 48', 'Arenoso franco'),
('Hacienda Los Pinos', 298.25, 'Región Oeste, Parcela 49', 'Franco'),
('Rancho El Monte', 167.60, 'Sector Sur, Lote 50', 'Arcilloso'),
('Campo La Granja', 276.35, 'Valle Norte, Zona 51', 'Franco arenoso'),
('Finca Santa Ana', 189.80, 'Región Central, Área 52', 'Franco limoso'),
('Campo Los Girasoles', 245.45, 'Sector Este, Parcela 53', 'Arcilloso arenoso'),
('Hacienda El Cerro', 178.70, 'Valle Oeste, Lote 54', 'Franco'),
('Rancho La Vega', 312.85, 'Región Sur, Zona 55', 'Arenoso'),
('Campo San Francisco', 156.50, 'Área Norte, Sector 56', 'Franco arcilloso'),
('Finca El Molino', 287.75, 'Valle Central, Parcela 57', 'Arcilloso'),
('Campo Las Palmeras', 198.90, 'Región Este, Lote 58', 'Franco limoso'),
('Hacienda Los Olmos', 267.45, 'Sector Oeste, Zona 59', 'Franco arenoso'),
('Rancho El Sauce', 187.60, 'Valle Sur, Área 60', 'Arcilloso limoso'),
('Campo La Pradera', 234.35, 'Región Norte, Parcela 61', 'Arenoso'),
('Finca Los Almendros', 176.80, 'Área Central, Lote 62', 'Franco'),
('Campo El Paraíso', 298.95, 'Valle Este, Zona 63', 'Franco arcilloso'),
('Hacienda La Loma', 167.40, 'Sector Oeste, Sector 64', 'Arcilloso'),
('Rancho Los Encinos', 289.75, 'Región Sur, Parcela 65', 'Franco limoso'),
('Campo Santa Clara', 198.90, 'Valle Norte, Lote 66', 'Arenoso franco'),
('Finca El Retiro', 245.55, 'Área Central, Zona 67', 'Franco'),
('Campo Los Naranjos', 178.70, 'Región Este, Área 68', 'Arcilloso'),
('Hacienda El Álamo', 276.85, 'Sector Oeste, Parcela 69', 'Franco arenoso'),
('Rancho La Meseta', 189.50, 'Valle Sur, Lote 70', 'Franco limoso'),
('Campo El Vergel', 312.65, 'Región Norte, Zona 71', 'Arcilloso arenoso'),
('Finca Las Higueras', 156.90, 'Área Central, Sector 72', 'Franco'),
('Campo San Martín', 287.45, 'Valle Este, Parcela 73', 'Arenoso'),
('Hacienda Los Cedros', 198.70, 'Sector Oeste, Lote 74', 'Franco arcilloso'),
('Rancho El Valle', 267.85, 'Región Sur, Zona 75', 'Arcilloso'),
('Campo Las Rosas', 187.40, 'Valle Norte, Área 76', 'Franco limoso'),
('Finca El Moral', 234.95, 'Área Central, Parcela 77', 'Franco arenoso'),
('Campo La Huerta', 176.60, 'Región Este, Lote 78', 'Arcilloso limoso'),
('Hacienda Los Fresnos', 298.75, 'Sector Oeste, Zona 79', 'Arenoso'),
('Rancho La Cañada', 167.90, 'Valle Sur, Sector 80', 'Franco'),
('Campo San Rafael', 289.45, 'Región Norte, Parcela 81', 'Franco arcilloso'),
('Finca Los Eucaliptos', 198.80, 'Área Central, Lote 82', 'Arcilloso'),
('Campo El Pantano', 245.35, 'Valle Este, Zona 83', 'Franco limoso'),
('Hacienda La Quebrada', 178.50, 'Sector Oeste, Área 84', 'Arenoso franco'),
('Rancho Los Álamos', 276.95, 'Región Sur, Parcela 85', 'Franco'),
('Campo Santa Teresa', 189.70, 'Valle Norte, Lote 86', 'Arcilloso'),
('Finca El Sendero', 312.85, 'Área Central, Zona 87', 'Franco arenoso'),
('Campo Los Manantiales', 156.40, 'Región Este, Sector 88', 'Franco limoso'),
('Hacienda El Potrero', 287.65, 'Sector Oeste, Parcela 89', 'Arcilloso arenoso'),
('Rancho La Llanura', 198.90, 'Valle Sur, Lote 90', 'Franco'),
('Campo San Lorenzo', 267.45, 'Región Norte, Zona 91', 'Arenoso'),
('Finca Las Palmas', 187.80, 'Área Central, Área 92', 'Franco arcilloso'),
('Campo El Bosque', 234.55, 'Valle Este, Parcela 93', 'Arcilloso'),
('Hacienda Los Prados', 176.70, 'Sector Oeste, Lote 94', 'Franco limoso'),
('Rancho El Pedregal', 298.85, 'Región Sur, Zona 95', 'Franco arenoso'),
('Campo La Alameda', 167.50, 'Valle Norte, Sector 96', 'Arcilloso limoso'),
('Finca San Isidro', 289.95, 'Área Central, Parcela 97', 'Arenoso'),
('Campo Los Cipreses', 198.60, 'Región Este, Lote 98', 'Franco'),
('Hacienda El Monte', 245.75, 'Sector Oeste, Zona 99', 'Franco arcilloso'),
('Rancho Las Colinas', 178.90, 'Valle Sur, Área 100', 'Arcilloso');

-- inserciones Lotes

INSERT INTO Lotes (campo_id, area, estado, tipo_riego) VALUES
(1, 5.00, 'Disponible', 'Goteo'),
(1, 4.00, 'Cultivando', 'Inundación'),
(1, 6.50, 'En cosecha', 'Aspersión'),
(2, 5.20, 'Disponible', 'Goteo'),
(2, 3.00, 'Cultivando', 'Inundación'),
(2, 8.00, 'En cosecha', 'Aspersión'),
(3, 7.25, 'Disponible', 'Goteo'),
(3, 3.15, 'Cultivando', 'Inundación'),
(3, 4.80, 'En cosecha', 'Aspersión'),
(4, 9.00, 'Disponible', 'Goteo'),
(4, 6.45, 'Cultivando', 'Inundación'),
(4, 5.20, 'En cosecha', 'Aspersión'),
(5, 10.00, 'Disponible', 'Goteo'),
(5, 3.50, 'Cultivando', 'Inundación'),
(5, 7.50, 'En cosecha', 'Aspersión'),
(6, 1.75, 'Disponible', 'Goteo'),
(6, 2.40, 'Cultivando', 'Inundación'),
(6, 8.00, 'En cosecha', 'Aspersión'),
(7, 4.80, 'Disponible', 'Goteo'),
(7, 5.50, 'Cultivando', 'Inundación'),
(7, 3.70, 'En cosecha', 'Aspersión'),
(8, 8.25, 'Disponible', 'Goteo'),
(8, 6.15, 'Cultivando', 'Inundación'),
(8, 7.30, 'En cosecha', 'Aspersión'),
(9, 10.50, 'Disponible', 'Goteo'),
(9, 2.90, 'Cultivando', 'Inundación'),
(9, 5.80, 'En cosecha', 'Aspersión'),
(10, 3.25, 'Disponible', 'Goteo'),
(10, 7.10, 'Cultivando', 'Inundación'),
(10, 4.55, 'En cosecha', 'Aspersión'),
(11, 6.00, 'Disponible', 'Goteo'),
(11, 9.50, 'Cultivando', 'Inundación'),
(11, 3.80, 'En cosecha', 'Aspersión'),
(12, 5.45, 'Disponible', 'Goteo'),
(12, 4.70, 'Cultivando', 'Inundación'),
(12, 8.50, 'En cosecha', 'Aspersión'),
(13, 2.00, 'Disponible', 'Goteo'),
(13, 6.25, 'Cultivando', 'Inundación'),
(13, 7.40, 'En cosecha', 'Aspersión'),
(14, 8.85, 'Disponible', 'Goteo'),
(14, 5.95, 'Cultivando', 'Inundación'),
(14, 9.10, 'En cosecha', 'Aspersión'),
(15, 9.30, 'Disponible', 'Goteo'),
(15, 6.45, 'Cultivando', 'Inundación'),
(15, 5.75, 'En cosecha', 'Aspersión'),
(16, 4.30, 'Disponible', 'Goteo'),
(16, 7.85, 'Cultivando', 'Inundación'),
(16, 3.95, 'En cosecha', 'Aspersión'),
(17, 5.90, 'Disponible', 'Goteo'),
(17, 4.60, 'Cultivando', 'Inundación'),
(18, 8.20, 'En cosecha', 'Aspersión'),
(18, 9.15, 'Disponible', 'Goteo'),
(18, 6.05, 'Cultivando', 'Inundación'),
(19, 3.60, 'En cosecha', 'Aspersión'),
(19, 4.75, 'Disponible', 'Goteo'),
(19, 5.80, 'Cultivando', 'Inundación'),
(20, 7.20, 'En cosecha', 'Aspersión'),
(20, 8.00, 'Disponible', 'Goteo'),
(20, 9.30, 'Cultivando', 'Inundación'),
(21, 6.85, 'Disponible', 'Goteo'),
(21, 5.50, 'Cultivando', 'Inundación'),
(21, 1.90, 'En cosecha', 'Aspersión'),
(22, 3.75, 'Disponible', 'Goteo'),
(22, 4.50, 'Cultivando', 'Inundación'),
(22, 8.50, 'En cosecha', 'Aspersión');

-- inserciones Actividades_Agricolas

INSERT INTO Actividades_Agricolas (empleado_id, tipo_trabajo_id, lote_id, fecha, horas_trabajadas, observaciones) VALUES
(1, 1, 1, '2024-01-01', 8.00, 'Siembra de maíz completada'),
(2, 2, 2, '2024-01-01', 7.50, 'Riego por aspersión realizado'),
(3, 3, 1, '2024-01-02', 6.75, 'Fertilización orgánica aplicada'),
(4, 1, 3, '2024-01-02', 8.25, 'Preparación de terreno'),
(5, 2, 2, '2024-01-03', 7.00, 'Mantenimiento de sistema de riego'),
(1, 3, 4, '2024-01-03', 6.50, 'Control de plagas efectuado'),
(2, 1, 5, '2024-01-04', 8.50, 'Siembra de frijol realizada'),
(3, 2, 3, '2024-01-04', 7.25, 'Riego manual completado'),
(4, 3, 2, '2024-01-05', 6.00, 'Aplicación de pesticidas'),
(5, 1, 1, '2024-01-05', 8.75, 'Limpieza de maleza'),
(1, 2, 4, '2024-01-06', 7.75, 'Sistema de riego revisado'),
(2, 3, 5, '2024-01-06', 6.25, 'Fertilización completada'),
(3, 1, 3, '2024-01-07', 8.50, 'Siembra de hortalizas'),
(4, 2, 2, '2024-01-07', 7.00, 'Mantenimiento de cultivos'),
(5, 3, 1, '2024-01-08', 6.75, 'Control de maleza realizado'),
(1, 1, 5, '2024-01-08', 8.25, 'Preparación de suelo'),
(2, 2, 4, '2024-01-09', 7.50, 'Riego programado completado'),
(3, 3, 3, '2024-01-09', 6.00, 'Aplicación de abono'),
(4, 1, 2, '2024-01-10', 8.75, 'Siembra de tomates'),
(5, 2, 1, '2024-01-10', 7.25, 'Mantenimiento general'),
(1, 3, 5, '2024-01-11', 6.50, 'Control de plagas'),
(2, 1, 4, '2024-01-11', 8.00, 'Preparación de parcelas'),
(3, 2, 3, '2024-01-12', 7.75, 'Riego por goteo'),
(4, 3, 2, '2024-01-12', 6.25, 'Fertilización realizada'),
(5, 1, 1, '2024-01-13', 8.50, 'Siembra de papas'),
(1, 2, 5, '2024-01-13', 7.00, 'Sistema de riego mantenido'),
(2, 3, 4, '2024-01-14', 6.75, 'Aplicación de fungicidas'),
(3, 1, 3, '2024-01-14', 8.25, 'Preparación de tierra'),
(4, 2, 2, '2024-01-15', 7.50, 'Riego completado'),
(5, 3, 1, '2024-01-15', 6.00, 'Control de maleza'),
(1, 1, 5, '2024-01-16', 8.75, 'Siembra de zanahorias'),
(2, 2, 4, '2024-01-16', 7.25, 'Mantenimiento de cultivos'),
(3, 3, 3, '2024-01-17', 6.50, 'Fumigación realizada'),
(4, 1, 2, '2024-01-17', 8.00, 'Preparación de semilleros'),
(5, 2, 1, '2024-01-18', 7.75, 'Riego manual'),
(1, 3, 5, '2024-01-18', 6.25, 'Fertilización foliar'),
(2, 1, 4, '2024-01-19', 8.50, 'Siembra de lechugas'),
(3, 2, 3, '2024-01-19', 7.00, 'Mantenimiento de equipo'),
(4, 3, 2, '2024-01-20', 6.75, 'Control de plagas'),
(5, 1, 1, '2024-01-20', 8.25, 'Preparación de camas'),
(1, 2, 5, '2024-01-21', 7.50, 'Sistema de riego'),
(2, 3, 4, '2024-01-21', 6.00, 'Aplicación de herbicidas'),
(3, 1, 3, '2024-01-22', 8.75, 'Siembra de cebollas'),
(4, 2, 2, '2024-01-22', 7.25, 'Riego por aspersión'),
(5, 3, 1, '2024-01-23', 6.50, 'Control de maleza'),
(1, 1, 5, '2024-01-23', 8.00, 'Preparación de suelo'),
(2, 2, 4, '2024-01-24', 7.75, 'Mantenimiento de riego'),
(3, 3, 3, '2024-01-24', 6.25, 'Fertilización completa'),
(4, 1, 2, '2024-01-25', 8.50, 'Siembra de pimientos'),
(5, 2, 1, '2024-01-25', 7.00, 'Riego programado'),
(1, 3, 5, '2024-01-26', 6.75, 'Control de plagas'),
(2, 1, 4, '2024-01-26', 8.25, 'Preparación de terreno'),
(3, 2, 3, '2024-01-27', 7.50, 'Sistema de riego'),
(4, 3, 2, '2024-01-27', 6.00, 'Aplicación de pesticidas'),
(5, 1, 1, '2024-01-28', 8.75, 'Siembra de calabazas'),
(1, 2, 5, '2024-01-28', 7.25, 'Mantenimiento general'),
(2, 3, 4, '2024-01-29', 6.50, 'Control de maleza'),
(3, 1, 3, '2024-01-29', 8.00, 'Preparación de parcelas'),
(4, 2, 2, '2024-01-30', 7.75, 'Riego por goteo'),
(5, 3, 1, '2024-01-30', 6.25, 'Fertilización orgánica'),
(1, 1, 5, '2024-01-31', 8.50, 'Siembra de betabel'),
(2, 2, 4, '2024-01-31', 7.00, 'Mantenimiento de equipo'),
(3, 3, 3, '2024-02-01', 6.75, 'Control de plagas'),
(4, 1, 2, '2024-02-01', 8.25, 'Preparación de suelo'),
(5, 2, 1, '2024-02-02', 7.50, 'Riego manual realizado'),
(1, 3, 5, '2024-02-02', 6.00, 'Aplicación de abono'),
(2, 1, 4, '2024-02-03', 8.75, 'Siembra de espinacas'),
(3, 2, 3, '2024-02-03', 7.25, 'Sistema de riego'),
(4, 3, 2, '2024-02-04', 6.50, 'Control de maleza'),
(5, 1, 1, '2024-02-04', 8.00, 'Preparación de camas'),
(1, 2, 5, '2024-02-05', 7.75, 'Riego programado'),
(2, 3, 4, '2024-02-05', 6.25, 'Fertilización completa'),
(3, 1, 3, '2024-02-06', 8.50, 'Siembra de rábanos'),
(4, 2, 2, '2024-02-06', 7.00, 'Mantenimiento de cultivos'),
(5, 3, 1, '2024-02-07', 6.75, 'Control de plagas'),
(1, 1, 5, '2024-02-07', 8.25, 'Preparación de terreno'),
(2, 2, 4, '2024-02-08', 7.50, 'Riego por aspersión'),
(3, 3, 3, '2024-02-08', 6.00, 'Aplicación de fungicidas'),
(4, 1, 2, '2024-02-09', 8.75, 'Siembra de cilantro'),
(5, 2, 1, '2024-02-09', 7.25, 'Sistema de riego'),
(1, 3, 5, '2024-02-10', 6.50, 'Control de maleza'),
(2, 1, 4, '2024-02-10', 8.00, 'Preparación de suelo'),
(3, 2, 3, '2024-02-11', 7.75, 'Riego manual'),
(4, 3, 2, '2024-02-11', 6.25, 'Fertilización foliar'),
(5, 1, 1, '2024-02-12', 8.50, 'Siembra de perejil'),
(1, 2, 5, '2024-02-12', 7.00, 'Mantenimiento de equipo'),
(2, 3, 4, '2024-02-13', 6.75, 'Control de plagas'),
(3, 1, 3, '2024-02-13', 8.25, 'Preparación de parcelas'),
(4, 2, 2, '2024-02-14', 7.50, 'Riego por goteo'),
(5, 3, 1, '2024-02-14', 6.00, 'Aplicación de herbicidas'),
(1, 1, 5, '2024-02-15', 8.75, 'Siembra de albahaca'),
(2, 2, 4, '2024-02-15', 7.25, 'Sistema de riego'),
(3, 3, 3, '2024-02-16', 6.50, 'Control de maleza'),
(4, 1, 2, '2024-02-16', 8.00, 'Preparación de tierra'),
(5, 2, 1, '2024-02-17', 7.75, 'Riego programado'),
(1, 3, 5, '2024-02-17', 6.25, 'Fertilización completa'),
(2, 1, 4, '2024-02-18', 8.50, 'Siembra de romero'),
(3, 2, 3, '2024-02-18', 7.00, 'Mantenimiento general');

-- inserciones Productos

INSERT INTO Productos (nombre, categoria, unidad_medida, precio_referencia, temporada)
VALUES
('Tractor Compacto', 'Maquinaria', 'Unidad', 25000.00, 'Todo el Año'),
('Arado Reversible', 'Maquinaria', 'Unidad', 1500.00, 'Todo el Año'),
('Rastrillo de Dientes', 'Herramientas', 'Unidad', 200.00, 'Todo el Año'),
('Sembradora Manual', 'Herramientas', 'Unidad', 300.00, 'Primavera'),
('Abono Orgánico', 'Insumos', 'Saco', 20.00, 'Primavera'),
('Pala de Mano', 'Herramientas', 'Unidad', 15.00, 'Todo el Año'),
('Motobomba de Riego', 'Riego', 'Unidad', 500.00, 'Verano'),
('Manguera de Alta Presión', 'Riego', 'Metro', 2.00, 'Todo el Año'),
('Fertilizante Líquido', 'Insumos', 'Litro', 10.00, 'Primavera'),
('Herbicida Selectivo', 'Insumos', 'Litro', 12.00, 'Todo el Año'),
('Insecticida de Contacto', 'Insumos', 'Litro', 15.00, 'Todo el Año'),
('Sistema de Riego por Goteo', 'Riego', 'Unidad', 200.00, 'Verano'),
('Aspersor de Jardín', 'Riego', 'Unidad', 25.00, 'Todo el Año'),
('Carreta de Carga', 'Accesorios', 'Unidad', 350.00, 'Todo el Año'),
('Cosechadora de Granos', 'Maquinaria', 'Unidad', 60000.00, 'Otoño'),
('Desgranadora de Maíz', 'Maquinaria', 'Unidad', 1500.00, 'Todo el Año'),
('Cortadora de Pasto', 'Maquinaria', 'Unidad', 1200.00, 'Verano'),
('Fumigadora Manual', 'Herramientas', 'Unidad', 50.00, 'Todo el Año'),
('Fumigadora Motorizada', 'Maquinaria', 'Unidad', 450.00, 'Primavera'),
('Rastrillo de Jardín', 'Herramientas', 'Unidad', 18.00, 'Todo el Año'),
('Carretilla de Metal', 'Herramientas', 'Unidad', 80.00, 'Todo el Año'),
('Malla Sombra', 'Accesorios', 'Metro', 2.50, 'Verano'),
('Cinta de Riego', 'Riego', 'Metro', 0.50, 'Primavera'),
('Fertilizante de Liberación Lenta', 'Insumos', 'Kilo', 5.00, 'Todo el Año'),
('Invernadero Portátil', 'Accesorios', 'Unidad', 800.00, 'Invierno'),
('Macetas de Plástico', 'Accesorios', 'Unidad', 3.00, 'Todo el Año'),
('Polvo Corrector de pH', 'Insumos', 'Kilo', 8.00, 'Todo el Año'),
('Medidor de pH para Suelos', 'Accesorios', 'Unidad', 25.00, 'Todo el Año'),
('Cinta Métrica para Cultivos', 'Accesorios', 'Unidad', 5.00, 'Todo el Año'),
('Guantes de Protección', 'Accesorios', 'Par', 8.00, 'Todo el Año'),
('Machete Curvo', 'Herramientas', 'Unidad', 25.00, 'Todo el Año'),
('Horquilla de Jardín', 'Herramientas', 'Unidad', 22.00, 'Todo el Año'),
('Tijera de Podar', 'Herramientas', 'Unidad', 15.00, 'Primavera'),
('Podadora de Altura', 'Herramientas', 'Unidad', 85.00, 'Primavera'),
('Cal para Suelos', 'Insumos', 'Saco', 10.00, 'Primavera'),
('Regadera de Metal', 'Accesorios', 'Unidad', 20.00, 'Primavera'),
('Canasta de Recolección', 'Accesorios', 'Unidad', 12.00, 'Todo el Año'),
('Trampa para Ios', 'Accesorios', 'Rollo', 5.00, 'Todo el Año'),
('Cinta Adhesiva para Injertos', 'Accesorios', 'Rollo', 3.00, 'Todo el Año'),
('Kit de Injertos', 'Accesorios', 'Unidad', 25.00, 'Primavera'),
('Malla Antipájaros', 'Accesorios', 'Metro', 1.50, 'Verano'),
('Cepillo para Animales', 'Ganadería', 'Unidad', 10.00, 'Todo el Año'),
('Comedero de Animales', 'Ganadería', 'Unidad', 40.00, 'Todo el Año'),
('Bebedero de Agua Automático', 'Ganadería', 'Unidad', 60.00, 'Todo el Año'),
('Semillas de Alfalfa', 'Insumos', 'Kilo', 7.00, 'Primavera'),
('Semillas de Trigo', 'Insumos', 'Kilo', 5.50, 'Otoño'),
('Semillas de Maíz', 'Insumos', 'Kilo', 6.00, 'Primavera'),
('Semillas de Girasol', 'Insumos', 'Kilo', 6.50, 'Primavera'),
('Semillas de Sorgo', 'Insumos', 'Kilo', 5.00, 'Otoño'),
('Abono de Lombrices', 'Insumos', 'Saco', 12.00, 'Primavera'),
('Riego Automático Programable', 'Riego', 'Unidad', 300.00, 'Todo el Año'),
('Kit de Reparación de Riego', 'Riego', 'Unidad', 25.00, 'Todo el Año'),
('Tractor de Cultivo Mediano', 'Maquinaria', 'Unidad', 40000.00, 'Todo el Año'),
('Arado de Discos', 'Maquinaria', 'Unidad', 2500.00, 'Todo el Año'),
('Cortadora de Heno', 'Maquinaria', 'Unidad', 7000.00, 'Primavera'),
('Rastrillo Hilerador', 'Maquinaria', 'Unidad', 4500.00, 'Todo el Año'),
('Pala Frontal para Tractor', 'Maquinaria', 'Unidad', 5000.00, 'Todo el Año'),
('Sistema de Riego Pivotante', 'Riego', 'Unidad', 15000.00, 'Todo el Año'),
('Balde de Leche de Acero', 'Ganadería', 'Unidad', 30.00, 'Todo el Año'),
('Cercas Eléctricas', 'Ganadería', 'Metro', 3.00, 'Todo el Año'),
('Postes de Madera', 'Ganadería', 'Unidad', 12.00, 'Todo el Año'),
('Tina de Agua para Animales', 'Ganadería', 'Unidad', 50.00, 'Todo el Año'),
('Esparcidor de Fertilizante', 'Maquinaria', 'Unidad', 3500.00, 'Todo el Año'),
('Plástico para Mulching', 'Insumos', 'Metro', 0.75, 'Primavera'),
('Termómetro de Suelos', 'Accesorios', 'Unidad', 15.00, 'Todo el Año'),
('Silo de Grano Portátil', 'Accesorios', 'Unidad', 500.00, 'Otoño'),
('Lona para Protección de Cultivos', 'Accesorios', 'Metro', 1.50, 'Todo el Año'),
('Cinta de Marcaje', 'Accesorios', 'Rollo', 2.00, 'Todo el Año'),
('Lampara UV para Cultivos', 'Accesorios', 'Unidad', 40.00, 'Invierno'),
('Ventilador para Invernaderos', 'Accesorios', 'Unidad', 250.00, 'Verano'),
('Tractor Compacto para Viñedos', 'Maquinaria', 'Unidad', 28000.00, 'Todo el Año'),
('Cubeta de Recolección de Frutas', 'Accesorios', 'Unidad', 15.00, 'Todo el Año'),
('Rodillo Nivelador de Suelos', 'Maquinaria', 'Unidad', 4000.00, 'Todo el Año'),
('Detector de Humedad', 'Accesorios', 'Unidad', 60.00, 'Todo el Año'),
('Aspersor de Mano', 'Riego', 'Unidad', 15.00, 'Todo el Año'),
('Motosierra de Mano', 'Herramientas', 'Unidad', 300.00, 'Invierno'),
('Cortasetos', 'Herramientas', 'Unidad', 150.00, 'Primavera'),
('Bolsa de Rafia para Recolección', 'Accesorios', 'Unidad', 10.00, 'Todo el Año');

-- inserciones Cultivos

INSERT INTO Cultivos (producto_id, variedad, dias_maduracion, temporada_siembra) VALUES
(1, 'Maíz Amarillo', 90, 'Primavera'),
(2, 'Frijol Negro', 80, 'Primavera'),
(3, 'Tomate Roma', 70, 'Primavera'),
(4, 'Zanahoria Nantes', 75, 'Primavera'),
(5, 'Lechuga Iceberg', 30, 'Primavera'),
(6, 'Fresa Aromática', 60, 'Primavera'),
(7, 'Naranja Valencia', 120, 'Verano'),
(8, 'Plátano Dominico', 240, 'Todo el año'),
(9, 'Cebolla Blanca', 100, 'Todo el año'),
(10, 'Cilantro Curado', 40, 'Todo el año'),
(1, 'Maíz Dulce', 80, 'Verano'),
(2, 'Frijol Pinto', 85, 'Verano'),
(3, 'Tomate Cherry', 75, 'Primavera'),
(4, 'Zanahoria Morada', 80, 'Otoño'),
(5, 'Lechuga Romana', 40, 'Primavera'),
(6, 'Fresa Albión', 90, 'Verano'),
(7, 'Naranja Navel', 130, 'Invierno'),
(8, 'Plátano Lady Finger', 220, 'Todo el año'),
(9, 'Cebolla Amarilla', 95, 'Otoño'),
(10, 'Cilantro Fresco', 40, 'Primavera'),
(1, 'Maíz Híbrido', 85, 'Verano'),
(2, 'Frijol de Soya', 100, 'Verano'),
(3, 'Tomate de Árbol', 85, 'Primavera'),
(4, 'Zanahoria Baby', 60, 'Primavera'),
(5, 'Lechuga Batavia', 35, 'Primavera'),
(6, 'Fresa de Bosque', 65, 'Verano'),
(7, 'Naranja Valencia', 110, 'Otoño'),
(8, 'Plátano de Cocción', 230, 'Todo el año'),
(9, 'Cebolla Dulce', 90, 'Primavera'),
(10, 'Cilantro Huasteco', 45, 'Primavera'),
(1, 'Maíz Pisingallo', 75, 'Verano'),
(2, 'Frijol Lima', 95, 'Verano'),
(3, 'Tomate Verde', 60, 'Primavera'),
(4, 'Zanahoria de Granada', 70, 'Otoño'),
(5, 'Lechuga de Hoja Suelta', 30, 'Primavera'),
(6, 'Fresa Medinaceli', 75, 'Verano'),
(7, 'Naranja de Sangre', 120, 'Invierno'),
(8, 'Plátano Manzano', 240, 'Todo el año'),
(9, 'Cebolla de Verdeo', 45, 'Primavera'),
(10, 'Cilantro Perjuanero', 60, 'Verano'),
(1, 'Maíz Criollo', 100, 'Otoño'),
(2, 'Frijol Garrofón', 90, 'Verano'),
(3, 'Tomate Salado', 70, 'Primavera'),
(4, 'Zanahoria en Ternero', 75, 'Otoño'),
(5, 'Lechuga de Mantequilla', 40, 'Primavera'),
(6, 'Fresa de Mesa', 80, 'Verano'),
(7, 'Naranja Mandarin', 130, 'Invierno'),
(8, 'Plátano Gros Michel', 230, 'Todo el año'),
(9, 'Cebolla Roja', 85, 'Primavera'),
(10, 'Cilantro de Tres Barbas', 50, 'Verano'),
(1, 'Maíz Albino', 90, 'Verano'),
(2, 'Frijol Verde', 80, 'Otoño'),
(3, 'Tomate Rosado', 70, 'Primavera'),
(4, 'Zanahoria de Palma', 80, 'Verano');

-- inserciones Lote_Cultivos

INSERT INTO Lote_Cultivos (lote_id, cultivo_id, fecha_inicio, fecha_fin, estado) VALUES
(1, 1, '2023-01-01', '2023-06-01', 'Activo'),
(2, 2, '2023-01-02', '2023-07-01', 'Activo'),
(3, 3, '2023-01-03', '2023-08-01', 'Activo'),
(4, 4, '2023-01-04', '2023-09-01', 'Inactivo'),
(5, 5, '2023-01-05', '2023-10-01', 'Activo'),
(6, 6, '2023-01-06', '2023-11-01', 'Activo'),
(7, 1, '2023-01-07', '2023-12-01', 'Inactivo'),
(8, 2, '2023-01-08', '2024-01-01', 'Activo'),
(9, 3, '2023-01-09', '2024-02-01', 'Activo'),
(10, 4, '2023-01-10', '2024-03-01', 'Inactivo'),
(11, 5, '2023-01-11', '2024-04-01', 'Activo'),
(12, 6, '2023-01-12', '2024-05-01', 'Activo'),
(13, 1, '2023-01-13', '2024-06-01', 'Inactivo'),
(14, 2, '2023-01-14', '2024-07-01', 'Activo'),
(15, 3, '2023-01-15', '2024-08-01', 'Activo'),
(16, 4, '2023-01-16', '2024-09-01', 'Inactivo'),
(17, 5, '2023-01-17', '2024-10-01', 'Activo'),
(18, 6, '2023-01-18', '2024-11-01', 'Activo'),
(19, 1, '2023-01-19', '2024-12-01', 'Inactivo'),
(20, 2, '2023-01-20', '2025-01-01', 'Activo'),
(21, 3, '2023-01-21', '2025-02-01', 'Activo'),
(22, 4, '2023-01-22', '2025-03-01', 'Inactivo'),
(23, 5, '2023-01-23', '2025-04-01', 'Activo'),
(24, 6, '2023-01-24', '2025-05-01', 'Activo'),
(25, 1, '2023-01-25', '2025-06-01', 'Inactivo'),
(26, 2, '2023-01-26', '2025-07-01', 'Activo'),
(27, 3, '2023-01-27', '2025-08-01', 'Activo'),
(28, 4, '2023-01-28', '2025-09-01', 'Inactivo'),
(29, 5, '2023-01-29', '2025-10-01', 'Activo'),
(30, 6, '2023-01-30', '2025-11-01', 'Activo'),
(31, 1, '2023-01-31', '2025-12-01', 'Inactivo'),
(32, 2, '2023-02-01', '2026-01-01', 'Activo'),
(33, 3, '2023-02-02', '2026-02-01', 'Activo'),
(34, 4, '2023-02-03', '2026-03-01', 'Inactivo'),
(35, 5, '2023-02-04', '2026-04-01', 'Activo'),
(36, 6, '2023-02-05', '2026-05-01', 'Activo'),
(37, 1, '2023-02-06', '2026-06-01', 'Inactivo'),
(38, 2, '2023-02-07', '2026-07-01', 'Activo'),
(39, 3, '2023-02-08', '2026-08-01', 'Activo'),
(40, 4, '2023-02-09', '2026-09-01', 'Inactivo'),
(41, 5, '2023-02-10', '2026-10-01', 'Activo'),
(42, 6, '2023-02-11', '2026-11-01', 'Activo'),
(43, 1, '2023-02-12', '2026-12-01', 'Inactivo'),
(44, 2, '2023-02-13', '2027-01-01', 'Activo'),
(45, 3, '2023-02-14', '2027-02-01', 'Activo'),
(46, 4, '2023-02-15', '2027-03-01', 'Inactivo'),
(47, 5, '2023-02-16', '2027-04-01', 'Activo'),
(48, 6, '2023-02-17', '2027-05-01', 'Activo'),
(49, 1, '2023-02-18', '2027-06-01', 'Inactivo'),
(50, 2, '2023-02-19', '2027-07-01', 'Activo');


-- inserciones Plagas

INSERT INTO Plagas (nombre, tipo, descripcion, tratamiento) VALUES
('Mosca blanca', 'Insecto', 'Pequeña mosca que afecta cultivos como tomate y algodón, causando amarillamiento de hojas.', 'Aplicar insecticidas sistémicos y trampas adhesivas.'),
('Gusano cogollero', 'Insecto', 'Larva que se alimenta de hojas y tallos, especialmente en maíz y sorgo.', 'Uso de biopesticidas y rotación de cultivos.'),
('Pulgón verde', 'Insecto', 'Insecto que succiona savia y puede transmitir virosis a los cultivos.', 'Aplicar jabón potásico y eliminar malas hierbas.'),
('Araña roja', 'Ácaro', 'Ácaro que provoca manchas amarillas y desecación de hojas.', 'Aplicar acaricidas y aumentar la humedad ambiental.'),
('Picudo del algodón', 'Insecto', 'Escarabajo que perfora los capullos del algodón, dañándolos.', 'Uso de trampas feromonales y limpieza de restos de cultivo.'),
('Trips', 'Insecto', 'Insecto que causa manchas plateadas y deformaciones en hojas y frutos.', 'Aplicar aceites hortícolas y trampas adhesivas.'),
('Langosta migratoria', 'Insecto', 'Insecto voraz que devora cultivos en grandes cantidades.', 'Control biológico con hongos y monitoreo constante.'),
('Nematodos del suelo', 'Parásito', 'Gusanos microscópicos que atacan raíces, debilitando las plantas.', 'Uso de nematicidas y rotación de cultivos.'),
('Mildiu', 'Hongo', 'Enfermedad que genera manchas amarillas en hojas y necrosis progresiva.', 'Aplicar fungicidas a base de cobre.'),
('Roya', 'Hongo', 'Hongo que produce pústulas anaranjadas en hojas y tallos.', 'Uso de variedades resistentes y fungicidas específicos.'),
('Tizón tardío', 'Hongo', 'Enfermedad grave que causa pudrición en papa y tomate.', 'Fungicidas preventivos y eliminación de plantas infectadas.'),
('Oídio', 'Hongo', 'Hongo que cubre hojas y frutos con un polvo blanco.', 'Aplicar azufre mojable y mejorar la ventilación.'),
('Caracol africano', 'Molusco', 'Caracol invasor que devora hojas y brotes tiernos.', 'Recolectar manualmente y usar barreras físicas.'),
('Gorgojo del arroz', 'Insecto', 'Insecto que perfora y daña granos almacenados.', 'Uso de almacenamiento hermético y fumigación.'),
('Mosca de la fruta', 'Insecto', 'Insecto que perfora frutos, causando daños internos.', 'Trampas con feromonas y control biológico.'),
('Hormiga cortadora', 'Insecto', 'Hormiga que corta hojas para transportar a su nido.', 'Aplicar cebos específicos y destruir nidos.'),
('Gusano alambre', 'Insecto', 'Larva que daña raíces y tubérculos.', 'Rotación de cultivos y control del suelo.'),
('Cochinilla algodonosa', 'Insecto', 'Insecto que succiona savia y genera una sustancia algodonosa.', 'Control biológico con mariquitas y aplicación de jabón potásico.'),
('Tizón temprano', 'Hongo', 'Hongo que provoca manchas negras en hojas de papa y tomate.', 'Aplicar fungicidas específicos.'),
('Gallina ciega', 'Insecto', 'Larva que daña raíces de maíz y hortalizas.', 'Uso de nematodos entomopatógenos y rotación de cultivos.'),
-- Continuar el patrón con más plagas
('Ceniza', 'Hongo', 'Hongo que cubre las hojas con un polvo gris.', 'Aplicar fungicidas y reducir la humedad en el cultivo.'),
('Peronospora', 'Hongo', 'Hongo que causa manchas marrones en hojas de viña.', 'Uso de fungicidas sistémicos.'),
('Minador de hojas', 'Insecto', 'Insecto que forma galerías dentro de las hojas.', 'Aplicar insecticidas sistémicos y eliminar hojas afectadas.'),
('Mosca negra', 'Insecto', 'Insecto que enrolla hojas y las deforma.', 'Insecticidas específicos y trampas adhesivas.'),
('Ácaro blanco', 'Ácaro', 'Ácaro que causa amarillamiento y caída prematura de hojas.', 'Aplicar acaricidas selectivos.'),
('Gorgojo de la vid', 'Insecto', 'Insecto que se alimenta de hojas y brotes tiernos.', 'Eliminación manual y control biológico.'),
('Antracnosis', 'Hongo', 'Hongo que afecta frutos y hojas con manchas hundidas.', 'Aplicar fungicidas a base de cobre.'),
('Escarabajo de las cucurbitáceas', 'Insecto', 'Insecto que devora hojas y frutos jóvenes.', 'Trampas de feromonas y eliminación manual.'),
('Chinche verde', 'Insecto', 'Insecto que succiona savia y genera manchas en frutos.', 'Uso de piretroides y control biológico.'),
('Barrenador del tallo', 'Insecto', 'Larva que perfora tallos, debilitando la planta.', 'Aplicar insecticidas sistémicos.'),
('Heliotis', 'Insecto', 'Larva que perfora frutos y flores.', 'Rotación de cultivos y biopesticidas.'),
('Escarabajo japonés', 'Insecto', 'Insecto que devora hojas y flores.', 'Aplicar insecticidas y trampas de feromonas.'),
('Pulgón negro', 'Insecto', 'Pulgón que afecta cultivos como frijol y soya.', 'Aplicar jabón potásico y control biológico.'),
('Chinche de patas rojas', 'Insecto', 'Insecto que succiona savia de semillas.', 'Uso de insecticidas piretroides.'),
('Carcoma de la madera', 'Insecto', 'Insecto que perfora estructuras de madera.', 'Fumigación y reemplazo de estructuras afectadas.'),
('Escarabajo barrenador', 'Insecto', 'Insecto que ataca troncos y ramas.', 'Aplicar insecticidas específicos.'),
('Caterpillar del maíz', 'Insecto', 'Larva que devora hojas de maíz.', 'Uso de trampas biológicas.'),
('Polilla del tomate', 'Insecto', 'Polilla que pone huevos en frutos y los daña.', 'Aplicar insecticidas y eliminar frutos infectados.'),
('Langosta del desierto', 'Insecto', 'Insecto que ataca cultivos de cereales.', 'Monitoreo constante y control biológico.'),
('Mancha negra', 'Hongo', 'Hongo que causa manchas negras en hojas y frutos.', 'Aplicar fungicidas preventivos.');

-- inserciones Registro_Plagas

INSERT INTO Registro_Plagas (lote_cultivo_id, plaga_id, fecha_deteccion, nivel_afectacion, tratamiento_aplicado)
VALUES
(1, 1, '2024-01-15', 'Alta', 'Aplicación de trampas adhesivas e insecticidas sistémicos.'),
(2, 3, '2024-02-10', 'Media', 'Uso de jabón potásico y eliminación manual de hojas afectadas.'),
(3, 5, '2024-03-05', 'Baja', 'Colocación de trampas feromonales y monitoreo constante.'),
(4, 2, '2024-01-22', 'Alta', 'Aplicación de biopesticidas y rotación de cultivos.'),
(5, 4, '2024-02-25', 'Media', 'Uso de acaricidas y mejora de la ventilación en el cultivo.'),
(6, 6, '2024-03-12', 'Baja', 'Trampas adhesivas y aceites hortícolas.'),
(7, 7, '2024-01-30', 'Alta', 'Control biológico mediante hongos específicos.'),
(8, 8, '2024-03-01', 'Media', 'Uso de nematicidas y eliminación de restos de cultivos.'),
(9, 9, '2024-03-18', 'Baja', 'Aplicación de fungicidas a base de cobre.'),
(10, 10, '2024-04-02', 'Alta', 'Uso de variedades resistentes y fungicidas específicos.'),
(11, 11, '2024-04-10', 'Media', 'Fungicidas preventivos y destrucción de plantas infectadas.'),
(12, 12, '2024-01-19', 'Baja', 'Azufre mojable y mejora de la circulación del aire.'),
(13, 13, '2024-02-14', 'Alta', 'Recolecta manual y barreras físicas contra caracoles.'),
(14, 14, '2024-03-08', 'Media', 'Fumigación de granos y almacenamiento hermético.'),
(15, 15, '2024-02-20', 'Alta', 'Control biológico con feromonas y eliminación de frutos dañados.'),
(16, 16, '2024-04-04', 'Media', 'Aplicación de cebos específicos para hormigas.'),
(17, 17, '2024-04-15', 'Baja', 'Rotación de cultivos y análisis del suelo.'),
(18, 18, '2024-02-12', 'Alta', 'Introducción de mariquitas para el control biológico.'),
(19, 19, '2024-03-28', 'Media', 'Aplicación de fungicidas específicos.'),
(20, 20, '2024-04-22', 'Baja', 'Control biológico con nematodos entomopatógenos.'),
(21, 21, '2024-05-03', 'Alta', 'Uso de fungicidas y reducción de riego excesivo.'),
(22, 22, '2024-02-07', 'Media', 'Eliminación manual de hojas afectadas y fungicidas.'),
(23, 23, '2024-03-13', 'Baja', 'Trampas adhesivas para captura de insectos.'),
(24, 24, '2024-04-16', 'Alta', 'Aplicación de acaricidas para ácaros específicos.'),
(25, 25, '2024-01-21', 'Media', 'Uso de trampas feromonales.'),
(26, 26, '2024-02-25', 'Baja', 'Aplicación de fungicidas a base de cobre.'),
(27, 27, '2024-03-17', 'Alta', 'Control con biopesticidas.'),
(28, 28, '2024-04-05', 'Media', 'Introducción de insectos depredadores.'),
(29, 29, '2024-02-03', 'Baja', 'Fungicidas preventivos.'),
(30, 30, '2024-01-11', 'Alta', 'Eliminación manual y uso de cebos químicos.'),
(31, 31, '2024-01-18', 'Media', 'Fumigación de tallos afectados.'),
(32, 32, '2024-03-06', 'Baja', 'Control biológico mediante hongos entomopatógenos.'),
(33, 33, '2024-04-10', 'Alta', 'Monitoreo constante y aplicación de insecticidas específicos.'),
(34, 34, '2024-02-15', 'Media', 'Fumigación y reemplazo de estructuras dañadas.'),
(35, 35, '2024-03-22', 'Baja', 'Rotación de cultivos y eliminación de plantas afectadas.'),
(36, 36, '2024-04-20', 'Alta', 'Control con trampas y feromonas.'),
(37, 37, '2024-02-28', 'Media', 'Introducción de depredadores naturales.'),
(38, 38, '2024-03-19', 'Baja', 'Uso de insecticidas orgánicos.'),
(39, 39, '2024-04-01', 'Alta', 'Aplicación de nematicidas específicos.'),
(40, 40, '2024-01-23', 'Media', 'Control biológico con hongos y trampas adhesivas.'),
(41, 41, '2024-03-25', 'Alta', 'Rotación de cultivos y control biológico con depredadores.'),
(42, 42, '2024-02-09', 'Media', 'Fungicidas preventivos y eliminación de restos de cultivo.'),
(43, 43, '2024-03-02', 'Baja', 'Eliminación manual de plagas visibles.'),
(44, 44, '2024-04-18', 'Alta', 'Fumigación y monitoreo constante.'),
(45, 45, '2024-01-27', 'Media', 'Uso de trampas adhesivas específicas.'),
(46, 46, '2024-03-07', 'Baja', 'Aplicación de insecticidas orgánicos.'),
(47, 47, '2024-04-23', 'Alta', 'Fumigación con biopesticidas efectivos.'),
(48, 48, '2024-01-17', 'Media', 'Control biológico con parasitoides específicos.'),
(49, 49, '2024-02-13', 'Baja', 'Uso de cebos específicos para plagas del suelo.'),
(50, 50, '2024-03-30', 'Alta', 'Control químico y monitoreo constante.');

-- inserciones Clima

INSERT INTO Clima (fecha, temperatura, precipitacion, humedad, condiciones)
VALUES
('2024-01-01', 22.50, 0.00, 45.00, 'Despejado'),
('2024-01-02', 23.20, 0.00, 47.00, 'Despejado'),
('2024-01-03', 21.80, 2.50, 50.00, 'Lluvia ligera'),
('2024-01-04', 19.40, 5.00, 55.00, 'Lluvia moderada'),
('2024-01-05', 18.00, 8.20, 60.00, 'Lluvia fuerte'),
('2024-01-06', 20.00, 0.00, 42.00, 'Nublado'),
('2024-01-07', 22.10, 0.00, 44.00, 'Despejado'),
('2024-01-08', 24.30, 0.00, 40.00, 'Soleado'),
('2024-01-09', 21.70, 3.00, 52.00, 'Lluvia ligera'),
('2024-01-10', 19.90, 6.00, 58.00, 'Lluvia moderada'),
('2024-01-11', 17.50, 10.00, 65.00, 'Tormenta'),
('2024-01-12', 20.80, 0.00, 45.00, 'Despejado'),
('2024-01-13', 23.50, 0.00, 43.00, 'Soleado'),
('2024-01-14', 22.20, 0.50, 47.00, 'Nublado'),
('2024-01-15', 21.00, 2.00, 50.00, 'Lluvia ligera'),
('2024-01-16', 18.90, 7.00, 62.00, 'Lluvia fuerte'),
('2024-01-17', 19.50, 5.50, 60.00, 'Lluvia moderada'),
('2024-01-18', 20.20, 0.00, 48.00, 'Despejado'),
('2024-01-19', 23.00, 0.00, 41.00, 'Soleado'),
('2024-01-20', 25.50, 0.00, 38.00, 'Caluroso'),
('2024-01-21', 21.80, 1.20, 53.00, 'Lluvia ligera'),
('2024-01-22', 19.70, 4.80, 57.00, 'Lluvia moderada'),
('2024-01-23', 18.40, 9.00, 63.00, 'Lluvia fuerte'),
('2024-01-24', 21.00, 0.00, 45.00, 'Nublado'),
('2024-01-25', 23.30, 0.00, 42.00, 'Despejado'),
('2024-01-26', 24.80, 0.00, 40.00, 'Soleado'),
('2024-01-27', 22.00, 1.50, 49.00, 'Lluvia ligera'),
('2024-01-28', 20.30, 6.20, 58.00, 'Lluvia moderada'),
('2024-01-29', 18.50, 11.00, 68.00, 'Tormenta'),
('2024-01-30', 21.50, 0.00, 46.00, 'Despejado'),
('2024-01-31', 23.10, 0.00, 43.00, 'Soleado'),
('2024-02-01', 22.00, 0.00, 45.00, 'Despejado'),
('2024-02-02', 20.80, 3.00, 54.00, 'Lluvia ligera'),
('2024-02-03', 19.10, 7.50, 61.00, 'Lluvia fuerte'),
('2024-02-04', 18.70, 6.00, 59.00, 'Lluvia moderada'),
('2024-02-05', 20.40, 0.00, 47.00, 'Nublado'),
('2024-02-06', 22.70, 0.00, 42.00, 'Soleado'),
('2024-02-07', 24.50, 0.00, 39.00, 'Caluroso'),
('2024-02-08', 22.20, 2.50, 51.00, 'Lluvia ligera'),
('2024-02-09', 20.10, 4.80, 56.00, 'Lluvia moderada'),
('2024-02-10', 18.90, 9.20, 64.00, 'Lluvia fuerte'),
('2024-02-11', 21.30, 0.00, 44.00, 'Nublado'),
('2024-02-12', 23.50, 0.00, 40.00, 'Soleado'),
('2024-02-13', 25.00, 0.00, 37.00, 'Caluroso'),
('2024-02-14', 22.50, 1.20, 48.00, 'Lluvia ligera'),
('2024-02-15', 19.80, 5.50, 59.00, 'Lluvia moderada'),
('2024-02-16', 18.00, 10.00, 66.00, 'Tormenta'),
('2024-02-17', 20.50, 0.00, 46.00, 'Despejado'),
('2024-02-18', 22.90, 0.00, 41.00, 'Soleado'),
('2024-02-19', 24.00, 0.00, 38.00, 'Caluroso'),
('2024-02-20', 21.70, 2.00, 50.00, 'Lluvia ligera'),
('2024-02-21', 20.20, 4.00, 55.00, 'Lluvia moderada'),
('2024-02-22', 19.00, 8.00, 62.00, 'Lluvia fuerte'),
('2024-02-23', 21.20, 0.00, 45.00, 'Despejado'),
('2024-02-24', 23.40, 0.00, 42.00, 'Soleado'),
('2024-02-25', 24.90, 0.00, 39.00, 'Caluroso'),
('2024-02-26', 22.60, 1.80, 49.00, 'Lluvia ligera'),
('2024-02-27', 20.40, 5.00, 57.00, 'Lluvia moderada'),
('2024-02-28', 18.80, 10.50, 67.00, 'Tormenta'),
('2024-03-01', 21.40, 0.00, 47.00, 'Nublado'),
('2024-03-02', 23.80, 0.00, 43.00, 'Soleado'),
('2024-03-03', 25.30, 0.00, 40.00, 'Caluroso');

-- inserciones Planificacion_Agricola

INSERT INTO Planificacion_Agricola (lote_id, cultivo_id, fecha_planificada, area_planificada, produccion_esperada) VALUES
(1, 3, '2024-01-15', 150.50, 4500.00),
(2, 1, '2024-01-20', 200.75, 6000.00),
(3, 2, '2024-02-01', 175.25, 5250.00),
(1, 4, '2024-02-15', 125.00, 3750.00),
(2, 5, '2024-03-01', 300.00, 9000.00),
(3, 1, '2024-03-15', 225.50, 6765.00),
(1, 2, '2024-04-01', 180.75, 5422.50),
(2, 3, '2024-04-15', 160.25, 4807.50),
(3, 4, '2024-05-01', 275.00, 8250.00),
(1, 5, '2024-05-15', 190.50, 5715.00),
(2, 1, '2024-06-01', 210.75, 6322.50),
(3, 2, '2024-06-15', 165.25, 4957.50),
(1, 3, '2024-07-01', 145.00, 4350.00),
(2, 4, '2024-07-15', 255.50, 7665.00),
(3, 5, '2024-08-01', 185.75, 5572.50),
(1, 1, '2024-08-15', 170.25, 5107.50),
(2, 2, '2024-09-01', 295.00, 8850.00),
(3, 3, '2024-09-15', 195.50, 5865.00),
(1, 4, '2024-10-01', 220.75, 6622.50),
(2, 5, '2024-10-15', 155.25, 4657.50),
(3, 1, '2024-11-01', 265.00, 7950.00),
(1, 2, '2024-11-15', 180.50, 5415.00),
(2, 3, '2024-12-01', 205.75, 6172.50),
(3, 4, '2024-12-15', 150.25, 4507.50),
(1, 5, '2025-01-01', 285.00, 8550.00),
(2, 1, '2025-01-15', 175.50, 5265.00),
(3, 2, '2025-02-01', 230.75, 6922.50),
(1, 3, '2025-02-15', 160.25, 4807.50),
(2, 4, '2025-03-01', 245.00, 7350.00),
(3, 5, '2025-03-15', 185.50, 5565.00),
(1, 1, '2025-04-01', 215.75, 6472.50),
(2, 2, '2025-04-15', 145.25, 4357.50),
(3, 3, '2025-05-01', 275.00, 8250.00),
(1, 4, '2025-05-15', 165.50, 4965.00),
(2, 5, '2025-06-01', 240.75, 7222.50),
(3, 1, '2025-06-15', 155.25, 4657.50),
(1, 2, '2025-07-01', 265.00, 7950.00),
(2, 3, '2025-07-15', 170.50, 5115.00),
(3, 4, '2025-08-01', 225.75, 6772.50),
(1, 5, '2025-08-15', 140.25, 4207.50),
(2, 1, '2025-09-01', 255.00, 7650.00),
(3, 2, '2025-09-15', 175.50, 5265.00),
(1, 3, '2025-10-01', 235.75, 7072.50),
(2, 4, '2025-10-15', 150.25, 4507.50),
(3, 5, '2025-11-01', 285.00, 8550.00),
(1, 1, '2025-11-15', 160.50, 4815.00),
(2, 2, '2025-12-01', 245.75, 7372.50),
(3, 3, '2025-12-15', 135.25, 4057.50),
(1, 4, '2026-01-01', 275.00, 8250.00),
(2, 5, '2026-01-15', 180.50, 5415.00),
(3, 1, '2026-02-01', 230.75, 6922.50),
(1, 2, '2026-02-15', 145.25, 4357.50),
(2, 3, '2026-03-01', 265.00, 7950.00),
(3, 4, '2026-03-15', 155.50, 4665.00),
(1, 5, '2026-04-01', 240.75, 7222.50),
(2, 1, '2026-04-15', 130.25, 3907.50),
(3, 2, '2026-05-01', 295.00, 8850.00),
(1, 3, '2026-05-15', 170.50, 5115.00),
(2, 4, '2026-06-01', 250.75, 7522.50),
(3, 5, '2026-06-15', 140.25, 4207.50),
(1, 1, '2026-07-01', 285.00, 8550.00),
(2, 2, '2026-07-15', 165.50, 4965.00),
(3, 3, '2026-08-01', 235.75, 7072.50),
(1, 4, '2026-08-15', 125.25, 3757.50),
(2, 5, '2026-09-01', 270.00, 8100.00),
(3, 1, '2026-09-15', 175.50, 5265.00),
(1, 2, '2026-10-01', 245.75, 7372.50),
(2, 3, '2026-10-15', 135.25, 4057.50),
(3, 4, '2026-11-01', 280.00, 8400.00),
(1, 5, '2026-11-15', 160.50, 4815.00),
(2, 1, '2026-12-01', 240.75, 7222.50),
(3, 2, '2026-12-15', 130.25, 3907.50);

-- inserciones Animales

INSERT INTO Animales (especie, raza, fecha_nacimiento, estado, proposito) VALUES 
('Bovino', 'Holstein-001', '2022-01-15', 'Activo', 'Leche'),
('Bovino', 'Jersey-001', '2022-02-20', 'Activo', 'Leche'),
('Bovino', 'Angus-001', '2022-03-10', 'Activo', 'Carne'),
('Bovino', 'Brahman-001', '2022-04-05', 'Activo', 'Carne'),
('Bovino', 'Simmental-001', '2022-05-12', 'Activo', 'Doble Propósito'),
('Porcino', 'Yorkshire-001', '2023-01-15', 'Activo', 'Carne'),
('Porcino', 'Duroc-001', '2023-02-18', 'Activo', 'Carne'),
('Porcino', 'Landrace-001', '2023-03-22', 'Activo', 'Carne'),
('Porcino', 'Hampshire-001', '2023-04-25', 'Activo', 'Carne'),
('Porcino', 'Pietrain-001', '2023-05-30', 'Activo', 'Carne'),
('Ovino', 'Merino-001', '2023-01-10', 'Activo', 'Lana'),
('Ovino', 'Suffolk-001', '2023-02-15', 'Activo', 'Carne'),
('Ovino', 'Dorper-001', '2023-03-20', 'Activo', 'Carne'),
('Ovino', 'Romney-001', '2023-04-25', 'Activo', 'Doble Propósito'),
('Ovino', 'Texel-001', '2023-05-30', 'Activo', 'Carne'),
('Caprino', 'Saanen-001', '2023-01-05', 'Activo', 'Leche'),
('Caprino', 'Boer-001', '2023-02-10', 'Activo', 'Carne'),
('Caprino', 'Alpina-001', '2023-03-15', 'Activo', 'Leche'),
('Caprino', 'Nubian-001', '2023-04-20', 'Activo', 'Doble Propósito'),
('Caprino', 'LaMancha-001', '2023-05-25', 'Activo', 'Leche'),
('Bovino', 'Holstein-002', '2022-06-15', 'Activo', 'Leche'),
('Bovino', 'Jersey-002', '2022-07-20', 'Enfermo', 'Leche'),
('Bovino', 'Angus-002', '2022-08-25', 'Activo', 'Carne'),
('Bovino', 'Brahman-002', '2022-09-30', 'Activo', 'Carne'),
('Bovino', 'Simmental-002', '2022-10-05', 'Activo', 'Doble Propósito'),
('Porcino', 'Yorkshire-002', '2023-06-15', 'Activo', 'Carne'),
('Porcino', 'Duroc-002', '2023-07-20', 'Enfermo', 'Carne'),
('Porcino', 'Landrace-002', '2023-08-25', 'Activo', 'Carne'),
('Porcino', 'Hampshire-002', '2023-09-30', 'Activo', 'Carne'),
('Porcino', 'Pietrain-002', '2023-10-05', 'Activo', 'Carne'),
('Ovino', 'Merino-002', '2023-06-10', 'Activo', 'Lana'),
('Ovino', 'Suffolk-002', '2023-07-15', 'Enfermo', 'Carne'),
('Ovino', 'Dorper-002', '2023-08-20', 'Activo', 'Carne'),
('Ovino', 'Romney-002', '2023-09-25', 'Activo', 'Doble Propósito'),
('Ovino', 'Texel-002', '2023-10-30', 'Activo', 'Carne'),
('Bovino', 'Holstein-003', '2022-11-15', 'Activo', 'Leche'),
('Bovino', 'Jersey-003', '2022-12-20', 'Activo', 'Leche'),
('Bovino', 'Angus-003', '2023-01-25', 'Inactivo', 'Carne'),
('Bovino', 'Brahman-003', '2023-02-28', 'Activo', 'Carne'),
('Bovino', 'Simmental-003', '2023-03-05', 'Activo', 'Doble Propósito'),
('Porcino', 'Yorkshire-003', '2023-11-15', 'Activo', 'Carne'),
('Porcino', 'Duroc-003', '2023-12-20', 'Activo', 'Carne'),
('Porcino', 'Landrace-003', '2024-01-25', 'Inactivo', 'Carne'),
('Porcino', 'Hampshire-003', '2024-02-29', 'Activo', 'Carne'),
('Porcino', 'Pietrain-003', '2024-03-05', 'Activo', 'Carne'),
('Caprino', 'Saanen-002', '2023-06-05', 'Activo', 'Leche'),
('Caprino', 'Boer-002', '2023-07-10', 'Enfermo', 'Carne'),
('Caprino', 'Alpina-002', '2023-08-15', 'Activo', 'Leche'),
('Caprino', 'Nubian-002', '2023-09-20', 'Activo', 'Doble Propósito'),
('Caprino', 'LaMancha-002', '2023-10-25', 'Activo', 'Leche'),
('Bovino', 'Holstein-004', '2023-04-15', 'Activo', 'Leche'),
('Bovino', 'Jersey-004', '2023-05-20', 'Activo', 'Leche'),
('Bovino', 'Angus-004', '2023-06-25', 'Activo', 'Carne'),
('Bovino', 'Brahman-004', '2023-07-30', 'Inactivo', 'Carne'),
('Bovino', 'Simmental-004', '2023-08-05', 'Activo', 'Doble Propósito'),
('Porcino', 'Yorkshire-004', '2024-04-15', 'Activo', 'Carne'),
('Porcino', 'Duroc-004', '2024-05-20', 'Activo', 'Carne'),
('Porcino', 'Landrace-004', '2024-06-25', 'Activo', 'Carne'),
('Porcino', 'Hampshire-004', '2024-07-30', 'Inactivo', 'Carne'),
('Porcino', 'Pietrain-004', '2024-08-05', 'Activo', 'Carne'),
('Ovino', 'Merino-003', '2023-11-10', 'Activo', 'Lana'),
('Ovino', 'Suffolk-003', '2023-12-15', 'Activo', 'Carne'),
('Ovino', 'Dorper-003', '2024-01-20', 'Enfermo', 'Carne'),
('Ovino', 'Romney-003', '2024-02-25', 'Activo', 'Doble Propósito'),
('Ovino', 'Texel-003', '2024-03-30', 'Activo', 'Carne'),
('Caprino', 'Saanen-003', '2023-11-05', 'Activo', 'Leche'),
('Caprino', 'Boer-003', '2023-12-10', 'Activo', 'Carne'),
('Caprino', 'Alpina-003', '2024-01-15', 'Enfermo', 'Leche'),
('Caprino', 'Nubian-003', '2024-02-20', 'Activo', 'Doble Propósito'),
('Caprino', 'LaMancha-003', '2024-03-25', 'Activo', 'Leche');

-- inserciones Produccion_Animales

INSERT INTO Produccion_Animales (animal_id, fecha, tipo_produccion, cantidad, unidad_medida) VALUES
(1, '2024-01-15', 'Leche A1', 25.50, 'Litros'),
(2, '2024-01-16', 'Leche Premium', 22.75, 'Litros'),
(3, '2024-01-17', 'Carne Primera', 450.00, 'Kilogramos'),
(4, '2024-01-18', 'Carne Select', 480.25, 'Kilogramos'),
(5, '2024-01-19', 'Leche Doble', 28.30, 'Litros'),
(6, '2024-01-20', 'Carne Magra', 95.50, 'Kilogramos'),
(7, '2024-01-21', 'Carne Premium', 98.75, 'Kilogramos'),
(8, '2024-01-22', 'Carne Selecta', 92.30, 'Kilogramos'),
(9, '2024-01-23', 'Carne Superior', 97.80, 'Kilogramos'),
(10, '2024-01-24', 'Carne Elite', 96.40, 'Kilogramos'),
(11, '2024-01-25', 'Lana Fina', 4.50, 'Kilogramos'),
(12, '2024-01-26', 'Carne Cordero Premium', 35.80, 'Kilogramos'),
(13, '2024-01-27', 'Carne Cordero Select', 38.20, 'Kilogramos'),
(14, '2024-01-28', 'Lana Premium', 4.80, 'Kilogramos'),
(15, '2024-01-29', 'Carne Cordero Plus', 37.90, 'Kilogramos'),
(16, '2024-01-30', 'Leche Cabra Gold', 3.80, 'Litros'),
(17, '2024-01-31', 'Carne Cabra Select', 42.50, 'Kilogramos'),
(18, '2024-02-01', 'Leche Cabra Premium', 3.95, 'Litros'),
(19, '2024-02-02', 'Leche Cabra Plus', 3.75, 'Litros'),
(20, '2024-02-03', 'Leche Cabra Elite', 3.90, 'Litros'),
(21, '2024-02-04', 'Leche Especial', 26.80, 'Litros'),
(22, '2024-02-05', 'Leche Superior', 23.90, 'Litros'),
(23, '2024-02-06', 'Carne Prime', 465.30, 'Kilogramos'),
(24, '2024-02-07', 'Carne Superior Plus', 475.80, 'Kilogramos'),
(25, '2024-02-08', 'Leche Premium Plus', 27.50, 'Litros'),
(26, '2024-02-09', 'Carne Selecta Plus', 96.80, 'Kilogramos'),
(27, '2024-02-10', 'Carne Suprema', 99.20, 'Kilogramos'),
(28, '2024-02-11', 'Carne Elite Plus', 94.70, 'Kilogramos'),
(29, '2024-02-12', 'Carne Premium Gold', 98.30, 'Kilogramos'),
(30, '2024-02-13', 'Carne Supreme', 97.90, 'Kilogramos'),
(31, '2024-02-14', 'Lana Superior', 4.70, 'Kilogramos'),
(32, '2024-02-15', 'Carne Cordero Gold', 36.90, 'Kilogramos'),
(33, '2024-02-16', 'Carne Cordero Prime', 39.30, 'Kilogramos'),
(34, '2024-02-17', 'Lana Select', 4.90, 'Kilogramos'),
(35, '2024-02-18', 'Carne Cordero Supreme', 38.80, 'Kilogramos'),
(36, '2024-02-19', 'Leche Extra', 24.90, 'Litros'),
(37, '2024-02-20', 'Leche Ultra', 25.80, 'Litros'),
(38, '2024-02-21', 'Carne Premium Select', 470.40, 'Kilogramos'),
(39, '2024-02-22', 'Carne Gold', 485.90, 'Kilogramos'),
(40, '2024-02-23', 'Leche Supreme', 26.40, 'Litros'),
(41, '2024-02-24', 'Carne Super Premium', 97.40, 'Kilogramos'),
(42, '2024-02-25', 'Carne Ultra Premium', 98.90, 'Kilogramos'),
(43, '2024-02-26', 'Carne Premium Supreme', 95.60, 'Kilogramos'),
(44, '2024-02-27', 'Carne Elite Supreme', 99.10, 'Kilogramos'),
(45, '2024-02-28', 'Carne Ultra Supreme', 96.70, 'Kilogramos'),
(46, '2024-02-29', 'Leche Cabra Suprema', 3.85, 'Litros'),
(47, '2024-03-01', 'Carne Cabra Premium', 43.60, 'Kilogramos'),
(48, '2024-03-02', 'Leche Cabra Superior', 3.70, 'Litros'),
(49, '2024-03-03', 'Leche Cabra Supreme', 3.95, 'Litros'),
(50, '2024-03-04', 'Leche Cabra Ultra', 3.80, 'Litros'),
(51, '2024-03-05', 'Leche Premium Supreme', 27.30, 'Litros'),
(52, '2024-03-06', 'Leche Ultra Premium', 26.90, 'Litros'),
(53, '2024-03-07', 'Carne Ultra Select', 468.50, 'Kilogramos'),
(54, '2024-03-08', 'Carne Supreme Select', 478.70, 'Kilogramos'),
(55, '2024-03-09', 'Leche Gold Supreme', 28.60, 'Litros'),
(56, '2024-03-10', 'Carne Extra Premium', 97.60, 'Kilogramos'),
(57, '2024-03-11', 'Carne Super Supreme', 98.50, 'Kilogramos'),
(58, '2024-03-12', 'Carne Ultra Gold', 96.90, 'Kilogramos'),
(59, '2024-03-13', 'Carne Gold Supreme', 99.40, 'Kilogramos'),
(60, '2024-03-14', 'Carne Premium Ultra', 97.20, 'Kilogramos'),
(61, '2024-03-15', 'Lana Ultra Premium', 4.85, 'Kilogramos'),
(62, '2024-03-16', 'Carne Cordero Supreme Plus', 37.40, 'Kilogramos'),
(63, '2024-03-17', 'Carne Cordero Ultra', 39.80, 'Kilogramos'),
(64, '2024-03-18', 'Lana Gold Supreme', 4.95, 'Kilogramos'),
(65, '2024-03-19', 'Carne Cordero Premium Ultra', 38.30, 'Kilogramos'),
(66, '2024-03-20', 'Leche Cabra Premium Gold', 3.88, 'Litros'),
(67, '2024-03-21', 'Carne Cabra Supreme', 44.20, 'Kilogramos'),
(68, '2024-03-22', 'Leche Cabra Ultra Premium', 3.92, 'Litros'),
(69, '2024-03-23', 'Leche Cabra Premium Supreme', 3.87, 'Litros'),
(70, '2024-03-24', 'Leche Cabra Gold Supreme', 3.93, 'Litros');

-- inserciones Clientes

INSERT INTO Clientes (nombre, tipo, rfc, contacto, direccion) VALUES
('Supermercados Elite SA', 'Mayorista', 'SEL940825RT9', 'Ana Martínez', 'Av. Reforma 1234, CDMX'),
('Carnes Selectas del Norte', 'Distribuidor', 'CSN880713HG5', 'Roberto García', 'Blvd. Industrial 567, Monterrey'),
('Lácteos Premium', 'Procesador', 'LPR910602KL8', 'Carlos Ruiz', 'Calle Industria 890, Guadalajara'),
('Agroexportadora Mundial', 'Exportador', 'AMU850421QW3', 'María Sánchez', 'Av. Puerto 234, Veracruz'),
('Mercado San Juan', 'Minorista', 'MSJ920815PO7', 'José Torres', 'Mercado Central Local 45, Puebla'),
('Distribuidor Agrícola del Centro', 'Distribuidor', 'DAC870930MN4', 'Laura Ramírez', 'Av. Central 678, Querétaro'),
('Productos Orgánicos Verdes', 'Procesador', 'POV900112XY9', 'Pedro López', 'Calle Verde 123, Morelia'),
('Exportadora Pacífico', 'Exportador', 'EPA880527BC1', 'Diana Flores', 'Av. Mar 456, Mazatlán'),
('Mercado La Merced', 'Minorista', 'MLM910618DE2', 'Fernando Díaz', 'Mercado La Merced Local 78, CDMX'),
('Alimentos Frescos SA', 'Mayorista', 'AFS860704FG3', 'Carmen Ortiz', 'Blvd. Alimentos 890, Tijuana'),
('Distribuidora Nacional', 'Distribuidor', 'DNA890815HI4', 'Raúl Mendoza', 'Av. Nacional 234, León'),
('Procesadora del Valle', 'Procesador', 'PVA900926JK5', 'Gloria Vázquez', 'Valle Industrial 567, Toluca'),
('Exportadora Agrícola', 'Exportador', 'EAG870307LM6', 'Miguel Ángel Ruiz', 'Puerto Comercial 890, Manzanillo'),
('Mercado Hidalgo', 'Minorista', 'MHI910418NO7', 'Patricia Hernández', 'Mercado Hidalgo Local 12, Guanajuato'),
('Distribuidora Central', 'Distribuidor', 'DCE880529PQ8', 'Ricardo Morales', 'Central de Abastos 345, CDMX'),
('Procesadora Regional', 'Procesador', 'PRE900630RS9', 'Silvia Jiménez', 'Zona Industrial 678, Aguascalientes'),
('Exportadora del Golfo', 'Exportador', 'EGO870741TU1', 'Alberto Cruz', 'Puerto Industrial 901, Tampico'),
('Mercado Juárez', 'Minorista', 'MJU910852VW2', 'Martha Medina', 'Mercado Juárez Local 34, Ciudad Juárez'),
('Distribuidora del Norte', 'Distribuidor', 'DNO880963XY3', 'Eduardo Castillo', 'Av. Norte 567, Chihuahua'),
('Procesadora del Sur', 'Procesador', 'PSU901074ZA4', 'Beatriz Luna', 'Sur Industrial 890, Mérida'),
('Agroexportadora Oriental', 'Exportador', 'AOR870185BC5', 'Francisco Rojas', 'Puerto Oriental 123, Cancún'),
('Mercado Morelos', 'Minorista', 'MMO911296DE6', 'Rosa Navarro', 'Mercado Morelos Local 56, Cuernavaca'),
('Distribuidora Peninsular', 'Distribuidor', 'DPE881307FG7', 'Arturo Campos', 'Av. Peninsula 234, Campeche'),
('Procesadora Occidental', 'Procesador', 'POC901418HI8', 'Lucía Contreras', 'Occidental 567, Guadalajara'),
('Exportadora del Pacífico Sur', 'Exportador', 'EPS871529JK9', 'Guillermo Ríos', 'Puerto Sur 890, Acapulco'),
('Mercado Reforma', 'Minorista', 'MRE911630LM0', 'Adriana Vargas', 'Mercado Reforma Local 78, Oaxaca'),
('Distribuidora Oriental', 'Distribuidor', 'DOR881741NO1', 'Héctor Romero', 'Oriental 345, Xalapa'),
('Procesadora del Norte', 'Procesador', 'PNO901852PQ2', 'Isabel Guzmán', 'Norte Industrial 678, Saltillo'),
('Exportadora Central', 'Exportador', 'ECE871963RS3', 'Javier Molina', 'Central Portuaria 901, Coatzacoalcos'),
('Mercado Libertad', 'Minorista', 'MLI912074TU4', 'Verónica Soto', 'Mercado Libertad Local 23, Guadalajara'),
('Distribuidora del Sur', 'Distribuidor', 'DSU882185VW5', 'Ramón Pacheco', 'Sur 567, Villahermosa'),
('Procesadora Oriental', 'Procesador', 'POR902296XY6', 'Teresa Aguilar', 'Oriental Industrial 890, Puebla'),
('Exportadora Occidental', 'Exportador', 'EOC872307ZA7', 'Óscar Valdez', 'Occidental Portuaria 123, Puerto Vallarta'),
('Mercado Central', 'Minorista', 'MCE912418BC8', 'Claudia Delgado', 'Mercado Central Local 45, Hermosillo'),
('Distribuidora Pacífico', 'Distribuidor', 'DPA882529DE9', 'Mario Luna', 'Pacífico 234, La Paz'),
('Procesadora Peninsular', 'Procesador', 'PPE902630FG0', 'Andrea Méndez', 'Peninsular Industrial 567, Mérida'),
('Exportadora del Norte', 'Exportador', 'ENO872741HI1', 'Sergio Cortés', 'Norte Portuaria 890, Ensenada'),
('Mercado Victoria', 'Minorista', 'MVI912852JK2', 'Gabriela Quintana', 'Mercado Victoria Local 67, Victoria'),
('Distribuidora Golfo', 'Distribuidor', 'DGO882963LM3', 'Roberto Paredes', 'Golfo 345, Veracruz'),
('Procesadora Pacífico', 'Procesador', 'PPA903074NO4', 'Mariana Cervantes', 'Pacífico Industrial 678, Mazatlán'),
('Exportadora del Sur', 'Exportador', 'ESU873185PQ5', 'Alejandro Rangel', 'Sur Portuaria 901, Salina Cruz'),
('Mercado Independencia', 'Minorista', 'MIN913296RS6', 'Carolina Mendoza', 'Mercado Independencia Local 89, Monterrey'),
('Distribuidora Occidental', 'Distribuidor', 'DOC883307TU7', 'Luis Guerrero', 'Occidental 567, Tepic'),
('Procesadora Golfo', 'Procesador', 'PGO903418VW8', 'Fernanda Rivas', 'Golfo Industrial 890, Tampico'),
('Exportadora Oriental', 'Exportador', 'EOR873529XY9', 'Daniel Ponce', 'Oriental Portuaria 123, Tuxpan'),
('Mercado Revolución', 'Minorista', 'MRE913630ZA0', 'Mónica Espinoza', 'Mercado Revolución Local 34, Tijuana'),
('Distribuidora Alimentos Frescos', 'Distribuidor', 'DAF883741BC1', 'Vicente Ochoa', 'Alimentos 234, Culiacán'),
('Procesadora Mar', 'Procesador', 'PMA903852DE2', 'Regina Castro', 'Mar Industrial 567, Los Cabos'),
('Exportadora Valle', 'Exportador', 'EVA873963FG3', 'Felipe Durán', 'Valle Portuario 890, Lázaro Cárdenas'),
('Mercado Popular', 'Minorista', 'MPO914074HI4', 'Susana Ibarra', 'Mercado Popular Local 56, Durango'),
('Distribuidora Campo', 'Distribuidor', 'DCA884185JK5', 'Ignacio Velasco', 'Campo 345, Zacatecas'),
('Procesadora Tierra', 'Procesador', 'PTI904296LM6', 'Elena Núñez', 'Tierra Industrial 678, San Luis Potosí'),
('Exportadora Mar', 'Exportador', 'EMA874307NO7', 'Jorge Rosales', 'Mar Portuario 901, Progreso'),
('Mercado Municipal', 'Minorista', 'MMU914418PQ8', 'Valeria Acosta', 'Mercado Municipal Local 78, Colima'),
('Distribuidora Tierra', 'Distribuidor', 'DTI884529RS9', 'Raúl Miranda', 'Tierra 567, Aguascalientes'),
('Procesadora Campo', 'Procesador', 'PCA904630TU0', 'Paola Zavala', 'Campo Industrial 890, Querétaro'),
('Exportadora Tierra', 'Exportador', 'ETI874741VW1', 'César Gallegos', 'Tierra Portuaria 123, Guaymas'),
('Mercado Campesino', 'Minorista', 'MCA914852XY2', 'Natalia Bonilla', 'Mercado Campesino Local 45, Morelia'),
('Distribuidora Mar', 'Distribuidor', 'DMA884963ZA3', 'Hugo Villanueva', 'Mar 234, Mazatlán'),
('Procesadora Valle', 'Procesador', 'PVA905074BC4', 'Daniela Estrada', 'Valle Industrial 567, León'),
('Exportadora Campo', 'Exportador', 'ECA875185DE5', 'Armando Quiroz', 'Campo Portuario 890, Altamira'),
('Mercado del Valle', 'Minorista', 'MVA915296FG6', 'Carla Solís', 'Mercado del Valle Local 23, Toluca'),
('Distribuidora Valle', 'Distribuidor', 'DVA885307HI7', 'Gerardo Arellano', 'Valle 345, Pachuca'),
('Procesadora Alimentos', 'Procesador', 'PAL905418JK8', 'Leticia Mora', 'Alimentos Industrial 678, Celaya'),
('Exportadora Alimentos', 'Exportador', 'EAL875529LM9', 'Salvador Cordero', 'Alimentos Portuario 901, Ciudad del Carmen'),
('Mercado Alimentos', 'Minorista', 'MAL915630NO0', 'Margarita Villegas', 'Mercado Alimentos Local 67, Irapuato'),
('Distribuidora Productores', 'Distribuidor', 'DPR885741PQ1', 'Ernesto Aguayo', 'Productores 234, Tlaxcala'),
('Procesadora Productores', 'Procesador', 'PPR905852RS2', 'Aurora Zamora', 'Productores Industrial 567, Salamanca'),
('Exportadora Productores', 'Exportador', 'EPR875963TU3', 'Rafael Carrillo', 'Productores Portuario 890, Dos Bocas'),
('Mercado Productores', 'Minorista', 'MPR916074VW4', 'Cecilia Montes', 'Mercado Productores Local 89, Uruapan'),
('Distribuidora Ganaderos', 'Distribuidor', 'DGA886185XY5', 'Antonio Benítez', 'Ganaderos 345, Ciudad Victoria'),
('Procesadora Ganaderos', 'Procesador', 'PGA906296ZA6', 'Alicia Reyes', 'Ganaderos Industrial 678, Los Mochis');

-- inserciones Ventas

INSERT INTO Ventas (cliente_id, fecha, total, estado, tipo_pago) VALUES
(1, '2024-01-01', 1250.00, 'Completado', 'Tarjeta de crédito'),
(2, '2024-01-02', 890.50, 'Completado', 'Efectivo'),
(3, '2024-01-02', 2100.75, 'Completado', 'Transferencia'),
(4, '2024-01-03', 450.25, 'Cancelado', 'Tarjeta de débito'),
(5, '2024-01-03', 1875.00, 'Completado', 'Tarjeta de crédito'),
(1, '2024-01-04', 925.50, 'Completado', 'PayPal'),
(2, '2024-01-04', 1450.75, 'Pendiente', 'Transferencia'),
(3, '2024-01-05', 675.25, 'Completado', 'Efectivo'),
(4, '2024-01-05', 2250.00, 'Completado', 'Tarjeta de crédito'),
(5, '2024-01-06', 1100.50, 'Completado', 'Tarjeta de débito'),
(1, '2024-01-06', 1950.75, 'Cancelado', 'PayPal'),
(2, '2024-01-07', 825.25, 'Completado', 'Efectivo'),
(3, '2024-01-07', 2450.00, 'Completado', 'Tarjeta de crédito'),
(4, '2024-01-08', 1275.50, 'Pendiente', 'Transferencia'),
(5, '2024-01-08', 1650.75, 'Completado', 'Tarjeta de débito'),
(1, '2024-01-09', 975.25, 'Completado', 'PayPal'),
(2, '2024-01-09', 2850.00, 'Completado', 'Tarjeta de crédito'),
(3, '2024-01-10', 1425.50, 'Cancelado', 'Efectivo'),
(4, '2024-01-10', 1750.75, 'Completado', 'Transferencia'),
(5, '2024-01-11', 1125.25, 'Completado', 'Tarjeta de débito'),
(1, '2024-01-11', 3250.00, 'Completado', 'Tarjeta de crédito'),
(2, '2024-01-12', 1575.50, 'Pendiente', 'PayPal'),
(3, '2024-01-12', 1850.75, 'Completado', 'Efectivo'),
(4, '2024-01-13', 1275.25, 'Completado', 'Transferencia'),
(5, '2024-01-13', 3650.00, 'Completado', 'Tarjeta de crédito'),
(1, '2024-01-14', 1725.50, 'Cancelado', 'Tarjeta de débito'),
(2, '2024-01-14', 1950.75, 'Completado', 'PayPal'),
(3, '2024-01-15', 1425.25, 'Completado', 'Efectivo'),
(4, '2024-01-15', 4050.00, 'Completado', 'Tarjeta de crédito'),
(5, '2024-01-16', 1875.50, 'Pendiente', 'Transferencia'),
(1, '2024-01-16', 2050.75, 'Completado', 'Tarjeta de débito'),
(2, '2024-01-17', 1575.25, 'Completado', 'PayPal'),
(3, '2024-01-17', 4450.00, 'Completado', 'Tarjeta de crédito'),
(4, '2024-01-18', 2025.50, 'Cancelado', 'Efectivo'),
(5, '2024-01-18', 2150.75, 'Completado', 'Transferencia'),
(1, '2024-01-19', 1725.25, 'Completado', 'Tarjeta de débito'),
(2, '2024-01-19', 4850.00, 'Completado', 'Tarjeta de crédito'),
(3, '2024-01-20', 2175.50, 'Pendiente', 'PayPal'),
(4, '2024-01-20', 2250.75, 'Completado', 'Efectivo'),
(5, '2024-01-21', 1875.25, 'Completado', 'Transferencia'),
(1, '2024-01-21', 5250.00, 'Completado', 'Tarjeta de crédito'),
(2, '2024-01-22', 2325.50, 'Cancelado', 'Tarjeta de débito'),
(3, '2024-01-22', 2350.75, 'Completado', 'PayPal'),
(4, '2024-01-23', 2025.25, 'Completado', 'Efectivo'),
(5, '2024-01-23', 5650.00, 'Completado', 'Tarjeta de crédito'),
(1, '2024-01-24', 2475.50, 'Pendiente', 'Transferencia'),
(2, '2024-01-24', 2450.75, 'Completado', 'Tarjeta de débito'),
(3, '2024-01-25', 2175.25, 'Completado', 'PayPal'),
(4, '2024-01-25', 6050.00, 'Completado', 'Tarjeta de crédito'),
(5, '2024-01-26', 2625.50, 'Cancelado', 'Efectivo'),
(1, '2024-01-26', 2550.75, 'Completado', 'Transferencia'),
(2, '2024-01-27', 2325.25, 'Completado', 'Tarjeta de débito'),
(3, '2024-01-27', 6450.00, 'Completado', 'Tarjeta de crédito'),
(4, '2024-01-28', 2775.50, 'Pendiente', 'PayPal'),
(5, '2024-01-28', 2650.75, 'Completado', 'Efectivo'),
(1, '2024-01-29', 2475.25, 'Completado', 'Transferencia'),
(2, '2024-01-29', 6850.00, 'Completado', 'Tarjeta de crédito'),
(3, '2024-01-30', 2925.50, 'Cancelado', 'Tarjeta de débito'),
(4, '2024-01-30', 2750.75, 'Completado', 'PayPal'),
(5, '2024-01-31', 2625.25, 'Completado', 'Efectivo'),
(1, '2024-01-31', 7250.00, 'Completado', 'Tarjeta de crédito'),
(2, '2024-02-01', 3075.50, 'Pendiente', 'Transferencia'),
(3, '2024-02-01', 2850.75, 'Completado', 'Tarjeta de débito'),
(4, '2024-02-02', 2775.25, 'Completado', 'PayPal'),
(5, '2024-02-02', 7650.00, 'Completado', 'Tarjeta de crédito'),
(1, '2024-02-03', 3225.50, 'Cancelado', 'Efectivo'),
(2, '2024-02-03', 2950.75, 'Completado', 'Transferencia'),
(3, '2024-02-04', 2925.25, 'Completado', 'Tarjeta de débito'),
(4, '2024-02-04', 8050.00, 'Completado', 'Tarjeta de crédito'),
(5, '2024-02-05', 3375.50, 'Pendiente', 'PayPal'),
(1, '2024-02-05', 3050.75, 'Completado', 'Efectivo'),
(2, '2024-02-06', 3075.25, 'Completado', 'Transferencia'),
(3, '2024-02-06', 8450.00, 'Completado', 'Tarjeta de crédito');

-- inserciones Detalle_Ventas

INSERT INTO Detalle_Ventas (venta_id, producto_id, cantidad, precio_unitario) VALUES
(1, 1, 2.00, 625.00),
(1, 2, 1.00, 450.00),
(2, 3, 3.00, 296.83),
(2, 4, 2.00, 350.25),
(3, 5, 4.00, 525.19),
(3, 1, 2.00, 625.00),
(4, 2, 1.00, 450.25),
(4, 3, 2.00, 296.83),
(5, 4, 5.00, 375.00),
(5, 5, 3.00, 525.19),
(6, 1, 1.00, 925.50),
(7, 2, 2.00, 725.38),
(8, 3, 3.00, 225.08),
(9, 4, 6.00, 375.00),
(10, 5, 2.00, 550.25),
(11, 1, 3.00, 650.25),
(12, 2, 1.00, 825.25),
(13, 3, 7.00, 350.00),
(14, 4, 3.00, 425.17),
(15, 5, 2.00, 825.38),
(16, 1, 1.00, 975.25),
(17, 2, 4.00, 712.50),
(18, 3, 5.00, 285.10),
(19, 4, 4.00, 437.69),
(20, 5, 3.00, 375.08),
(21, 1, 8.00, 406.25),
(22, 2, 3.00, 525.17),
(23, 3, 4.00, 462.69),
(24, 4, 2.00, 637.63),
(25, 5, 5.00, 730.00),
(26, 1, 3.00, 575.17),
(27, 2, 4.00, 487.69),
(28, 3, 5.00, 285.05),
(29, 4, 9.00, 450.00),
(30, 5, 4.00, 468.88),
(31, 1, 2.00, 1025.38),
(32, 2, 3.00, 525.08),
(33, 3, 10.00, 445.00),
(34, 4, 4.00, 506.38),
(35, 5, 5.00, 430.15),
(36, 1, 3.00, 575.08),
(37, 2, 11.00, 440.91),
(38, 3, 4.00, 537.69),
(39, 4, 5.00, 450.15),
(40, 5, 3.00, 625.08),
(41, 1, 12.00, 437.50),
(42, 2, 4.00, 581.38),
(43, 3, 5.00, 470.15),
(44, 4, 3.00, 675.08),
(45, 5, 4.00, 468.81),
(46, 1, 13.00, 190.42),
(47, 2, 5.00, 470.15),
(48, 3, 3.00, 725.08),
(49, 4, 4.00, 506.31),
(50, 5, 6.00, 437.58),
(51, 1, 2.00, 1275.63),
(52, 2, 3.00, 775.08),
(53, 3, 14.00, 155.38),
(54, 4, 4.00, 687.69),
(55, 5, 5.00, 530.15),
(56, 1, 3.00, 850.25),
(57, 2, 15.00, 155.02),
(58, 3, 4.00, 812.50),
(59, 4, 5.00, 550.15),
(60, 5, 3.00, 875.25),
(61, 1, 16.00, 453.13),
(62, 2, 4.00, 712.69),
(63, 3, 5.00, 585.05),
(64, 4, 3.00, 925.08),
(65, 5, 4.00, 843.88),
(66, 1, 3.00, 1075.17),
(67, 2, 17.00, 167.69),
(68, 3, 5.00, 615.05),
(69, 4, 3.00, 1025.08),
(70, 5, 4.00, 762.69);

-- inserciones Proveedores

INSERT INTO Proveedores (nombre, rfc, tipo, contacto, especialidad, created_at, updated_at) VALUES
('Proveedor Uno', 'RFC001', 'Fertilizante', 'contacto1@mail.com', 'Fertilizantes químicos', NOW(), NOW()),
('Proveedor Dos', 'RFC002', 'Semilla', 'contacto2@mail.com', 'Semillas certificadas', NOW(), NOW()),
('Proveedor Tres', 'RFC003', 'Agroquímicos', 'contacto3@mail.com', 'Plaguicidas', NOW(), NOW()),
('Proveedor Cuatro', 'RFC004', 'Maquinaria', 'contacto4@mail.com', 'Tractores y arados', NOW(), NOW()),
('Proveedor Cinco', 'RFC005', 'Irrigación', 'contacto5@mail.com', 'Sistemas de riego', NOW(), NOW()),
('Proveedor Seis', 'RFC006', 'Servicios', 'contacto6@mail.com', 'Asesoría agronómica', NOW(), NOW()),
('Proveedor Siete', 'RFC007', 'Fertilizante', 'contacto7@mail.com', 'Fertilizantes orgánicos', NOW(), NOW()),
('Proveedor Ocho', 'RFC008', 'Semilla', 'contacto8@mail.com', 'Semillas de hortalizas', NOW(), NOW()),
('Proveedor Nueve', 'RFC009', 'Agroquímicos', 'contacto9@mail.com', 'Herbicidas', NOW(), NOW()),
('Proveedor Diez', 'RFC010', 'Maquinaria', 'contacto10@mail.com', 'Cultivadoras', NOW(), NOW()),
('Proveedor Once', 'RFC011', 'Irrigación', 'contacto11@mail.com', 'Bombas de agua', NOW(), NOW()),
('Proveedor Doce', 'RFC012', 'Servicios', 'contacto12@mail.com', 'Mantenimiento de maquinaria', NOW(), NOW()),
('Proveedor Trece', 'RFC013', 'Fertilizante', 'contacto13@mail.com', 'Fertilizantes líquidos', NOW(), NOW()),
('Proveedor Catorce', 'RFC014', 'Semilla', 'contacto14@mail.com', 'Semillas de maíz', NOW(), NOW()),
('Proveedor Quince', 'RFC015', 'Agroquímicos', 'contacto15@mail.com', 'Insecticidas', NOW(), NOW()),
('Proveedor Dieciséis', 'RFC016', 'Maquinaria', 'contacto16@mail.com', 'Cepillos agrícolas', NOW(), NOW()),
('Proveedor Diecisiete', 'RFC017', 'Irrigación', 'contacto17@mail.com', 'Tubos de riego', NOW(), NOW()),
('Proveedor Dieciocho', 'RFC018', 'Servicios', 'contacto18@mail.com', 'Consultora en cultivos', NOW(), NOW()),
('Proveedor Diecinueve', 'RFC019', 'Fertilizante', 'contacto19@mail.com', 'Fertilizantes de liberación controlada', NOW(), NOW()),
('Proveedor Veinte', 'RFC020', 'Semilla', 'contacto20@mail.com', 'Semillas de girasol', NOW(), NOW()),
('Proveedor Veintiuno', 'RFC021', 'Agroquímicos', 'contacto21@mail.com', 'Fitosanitarios', NOW(), NOW()),
('Proveedor Veintidós', 'RFC022', 'Maquinaria', 'contacto22@mail.com', 'Herramientas manuales', NOW(), NOW()),
('Proveedor Veintitres', 'RFC023', 'Irrigación', 'contacto23@mail.com', 'Cisternas', NOW(), NOW()),
('Proveedor Veinticuatro', 'RFC024', 'Servicios', 'contacto24@mail.com', 'Instalación de sistemas de riego', NOW(), NOW()),
('Proveedor Veinticinco', 'RFC025', 'Fertilizante', 'contacto25@mail.com', 'Fertilizantes de pasto', NOW(), NOW()),
('Proveedor Veintiseis', 'RFC026', 'Semilla', 'contacto26@mail.com', 'Semillas de tomate', NOW(), NOW()),
('Proveedor Veintisiete', 'RFC027', 'Agroquímicos', 'contacto27@mail.com', 'Fumigantes', NOW(), NOW()),
( 'Proveedor Veintiocho', 'RFC028', 'Maquinaria', 'contacto28@mail.com', 'Cosechadoras', NOW(), NOW()),
('Proveedor Veintinueve', 'RFC029', 'Irrigación', 'contacto29@mail.com', 'Filtros de riego', NOW(), NOW()),
('Proveedor Treinta', 'RFC030', 'Servicios', 'contacto30@mail.com', 'Capacitación en cultivos', NOW(), NOW()),
('Proveedor Treinta y Uno', 'RFC031', 'Fertilizante', 'contacto31@mail.com', 'Fertilizantes foliares', NOW(), NOW()),
('Proveedor Treinta y Dos', 'RFC032', 'Semilla', 'contacto32@mail.com', 'Semillas de papa', NOW(), NOW()),
('Proveedor Treinta y Tres', 'RFC033', 'Agroquímicos', 'contacto33@mail.com', 'Acaricidas', NOW(), NOW()),
('Proveedor Treinta y Cuatro', 'RFC034', 'Maquinaria', 'contacto34@mail.com', 'Remolques agrícolas', NOW(), NOW()),
('Proveedor Treinta y Cinco', 'RFC035', 'Irrigación', 'contacto35@mail.com', 'Sistemas de goteo', NOW(), NOW()),
('Proveedor Treinta y Seis', 'RFC036', 'Servicios', 'contacto36@mail.com', 'Cultivo hidropónico', NOW(), NOW()),
('Proveedor Treinta y Siete', 'RFC037', 'Fertilizante', 'contacto37@mail.com', 'Fertilizantes nitrogenados', NOW(), NOW()),
('Proveedor Treinta y Ocho', 'RFC038', 'Semilla', 'contacto38@mail.com', 'Semillas de cebolla', NOW(), NOW()),
('Proveedor Treinta y Nueve', 'RFC039', 'Agroquímicos', 'contacto39@mail.com', 'Fungicidas', NOW(), NOW()),
('Proveedor Cuarenta', 'RFC040', 'Maquinaria', 'contacto40@mail.com', 'Tractores de arrastre', NOW(), NOW()),
('Proveedor Cuarenta y Uno', 'RFC041', 'Irrigación', 'contacto41@mail.com', 'Aspersores', NOW(), NOW()),
('Proveedor Cuarenta y Dos', 'RFC042', 'Servicios', 'contacto42@mail.com', 'Cosecha de frutas', NOW(), NOW()),
('Proveedor Cuarenta y Tres', 'RFC043', 'Fertilizante', 'contacto43@mail.com', 'Abonos orgánicos', NOW(), NOW()),
('Proveedor Cuarenta y Cuatro', 'RFC044', 'Semilla', 'contacto44@mail.com', 'Semillas de chícharo', NOW(), NOW()),
('Proveedor Cuarenta y Cinco', 'RFC045', 'Agroquímicos', 'contacto45@mail.com', 'Rodenticidas', NOW(), NOW()),
('Proveedor Cuarenta y Seis', 'RFC046', 'Maquinaria', 'contacto46@mail.com', 'Líneas de riego', NOW(), NOW()),
('Proveedor Cuarenta y Siete', 'RFC047', 'Irrigación', 'contacto47@mail.com', 'Tuberías de pvc', NOW(), NOW()),
('Proveedor Cuarenta y Ocho', 'RFC048', 'Servicios', 'contacto48@mail.com', 'Asesoramiento técnico', NOW(), NOW()),
('Proveedor Cuarenta y Nueve', 'RFC049', 'Fertilizante', 'contacto49@mail.com', 'Fertilizantes líquidos', NOW(), NOW()),
('Proveedor Cincuenta', 'RFC050', 'Semilla', 'contacto50@mail.com', 'Semillas de chiles', NOW(), NOW()),
('Proveedor Cincuenta y Uno', 'RFC051', 'Agroquímicos', 'contacto51@mail.com', 'Abonos de liberación controlada', NOW(), NOW()),
('Proveedor Cincuenta y Dos', 'RFC052', 'Maquinaria', 'contacto52@mail.com', 'Equipos de cultivo', NOW(), NOW()),
('Proveedor Cincuenta y Tres', 'RFC053', 'Irrigación', 'contacto53@mail.com', 'Mangueras de riego', NOW(), NOW()),
('Proveedor Cincuenta y Cuatro', 'RFC054', 'Servicios', 'contacto54@mail.com', 'Operación de maquinaria', NOW(), NOW()),
('Proveedor Cincuenta y Cinco', 'RFC055', 'Fertilizante', 'contacto55@mail.com', 'Fertilizantes para hortalizas', NOW(), NOW()),
('Proveedor Cincuenta y Seis', 'RFC056', 'Semilla', 'contacto56@mail.com', 'Semillas de frutas', NOW(), NOW()),
('Proveedor Cincuenta y Siete', 'RFC057', 'Agroquímicos', 'contacto57@mail.com', 'Reguladores de crecimiento', NOW(), NOW()),
('Proveedor Cincuenta y Ocho', 'RFC058', 'Maquinaria', 'contacto58@mail.com', 'Equipos de fumigación', NOW(), NOW()),
('Proveedor Cincuenta y Nueve', 'RFC059', 'Irrigación', 'contacto59@mail.com', 'Sistemas de automatización', NOW(), NOW()),
('Proveedor Sesenta', 'RFC060', 'Servicios', 'contacto60@mail.com', 'Transporte agrícola', NOW(), NOW()),
('Proveedor Sesenta y Uno', 'RFC061', 'Fertilizante', 'contacto61@mail.com', 'Fertilizantes granulados', NOW(), NOW()),
('Proveedor Sesenta y Dos', 'RFC062', 'Semilla', 'contacto62@mail.com', 'Semillas de gramíneas', NOW(), NOW()),
('Proveedor Sesenta y Tres', 'RFC063', 'Agroquímicos', 'contacto63@mail.com', 'Antibacterianos', NOW(), NOW()),
('Proveedor Sesenta y Cuatro', 'RFC064', 'Maquinaria', 'contacto64@mail.com', 'Sistemas de siembra', NOW(), NOW()),
('Proveedor Sesenta y Cinco', 'RFC065', 'Irrigación', 'contacto65@mail.com', 'Drenajes', NOW(), NOW()),
('Proveedor Sesenta y Seis', 'RFC066', 'Servicios', 'contacto66@mail.com', 'Cultivos de floración', NOW(), NOW()),
('Proveedor Sesenta y Siete', 'RFC067', 'Fertilizante', 'contacto67@mail.com', 'Compuestos NPK', NOW(), NOW()),
('Proveedor Sesenta y Ocho', 'RFC068', 'Semilla', 'contacto68@mail.com', 'Semillas de especies nativas', NOW(), NOW()),
('Proveedor Sesenta y Nueve', 'RFC069', 'Agroquímicos', 'contacto69@mail.com', 'Desinfectantes', NOW(), NOW()),
('Proveedor Setenta', 'RFC070', 'Maquinaria', 'contacto70@mail.com', 'Máquinas de recolección', NOW(), NOW());

-- inserciones Insumos

INSERT INTO Insumos (nombre, categoria, unidad_medida, stock_minimo)
VALUES
('Semilla de Maíz', 'Semillas', 'kilogramos', 50.00),
('Fertilizante NPK', 'Fertilizantes', 'sacos', 30.00),
('Herbicida Glifosato', 'Herbicidas', 'litros', 10.00),
('Insecticida Clorpirifos', 'Insecticidas', 'litros', 5.00),
('Fertilizante Orgánico', 'Fertilizantes', 'kilogramos', 40.00),
('Semilla de Trigo', 'Semillas', 'kilogramos', 60.00),
('Plaguicida Biológico', 'Plaguicidas', 'litros', 8.00),
('Malla Agrícola', 'Equipos', 'rollos', 15.00),
('Sistema de Riego', 'Equipos', 'unidades', 3.00),
('Compost Orgánico', 'Fertilizantes', 'kilogramos', 70.00),
('Semilla de Sorgo', 'Semillas', 'kilogramos', 50.00),
('Fertilizante Urea', 'Fertilizantes', 'sacos', 25.00),
('Fungicida de Azufre', 'Fungicidas', 'litros', 12.00),
('Semilla de Cebada', 'Semillas', 'kilogramos', 55.00),
('Regadera de Mano', 'Herramientas', 'unidades', 20.00),
('Fertilizante Fosfato', 'Fertilizantes', 'sacos', 30.00),
('Herbicida Selectivo', 'Herbicidas', 'litros', 7.00),
('Insecticida Imidacloprid', 'Insecticidas', 'litros', 6.00),
('Tractor Compacto', 'Maquinaria', 'unidades', 1.00),
('Semilla de Girasol', 'Semillas', 'kilogramos', 40.00),
('Fertilizante Potásico', 'Fertilizantes', 'sacos', 20.00),
('Herbicida Preemergente', 'Herbicidas', 'litros', 10.00),
('Manguera para Riego', 'Equipos', 'metros', 100.00),
('Semilla de Soja', 'Semillas', 'kilogramos', 60.00),
('Abono Orgánico', 'Fertilizantes', 'kilogramos', 80.00),
('Fertilizante Complejo', 'Fertilizantes', 'sacos', 35.00),
('Semilla de Arroz', 'Semillas', 'kilogramos', 50.00),
('Fungicida Cúprico', 'Fungicidas', 'litros', 10.00),
('Pala para Cultivo', 'Herramientas', 'unidades', 15.00),
('Semilla de Avena', 'Semillas', 'kilogramos', 70.00),
('Herbicida Sistémico', 'Herbicidas', 'litros', 5.00),
('Insecticida Biológico', 'Insecticidas', 'litros', 8.00),
('Pulverizador Manual', 'Herramientas', 'unidades', 10.00),
('Fertilizante Foliar', 'Fertilizantes', 'litros', 20.00),
('Semilla de Frijol', 'Semillas', 'kilogramos', 40.00),
('Carretilla Agrícola', 'Herramientas', 'unidades', 5.00),
('Tractor Agrícola', 'Maquinaria', 'unidades', 1.00),
('Semilla de Papa', 'Semillas', 'kilogramos', 30.00),
('Fertilizante de Calcio', 'Fertilizantes', 'kilogramos', 50.00),
('Herbicida de Contacto', 'Herbicidas', 'litros', 7.00),
('Cortadora de Césped', 'Equipos', 'unidades', 2.00),
('Semilla de Tomate', 'Semillas', 'kilogramos', 25.00),
('Abono Foliar', 'Fertilizantes', 'litros', 15.00),
('Machete', 'Herramientas', 'unidades', 20.00),
('Semilla de Sandía', 'Semillas', 'kilogramos', 35.00),
('Insecticida Orgánico', 'Insecticidas', 'litros', 6.00),
('Semilla de Calabaza', 'Semillas', 'kilogramos', 30.00),
('Fertilizante de Magnesio', 'Fertilizantes', 'kilogramos', 40.00),
('Pulverizador a Motor', 'Equipos', 'unidades', 4.00),
('Semilla de Melón', 'Semillas', 'kilogramos', 25.00),
('Insecticida de Amplio Espectro', 'Insecticidas', 'litros', 10.00),
('Semilla de Lechuga', 'Semillas', 'kilogramos', 15.00),
('Fertilizante Nitrogenado', 'Fertilizantes', 'sacos', 20.00),
('Semilla de Espinaca', 'Semillas', 'kilogramos', 10.00),
('Semilla de Pepino', 'Semillas', 'kilogramos', 15.00),
('Fertilizante Soluble', 'Fertilizantes', 'kilogramos', 10.00),
('Herbicida No Selectivo', 'Herbicidas', 'litros', 12.00),
('Semilla de Zanahoria', 'Semillas', 'kilogramos', 15.00),
('Fertilizante Líquido', 'Fertilizantes', 'litros', 25.00),
('Semilla de Rábano', 'Semillas', 'kilogramos', 10.00),
('Fertilizante para Frutales', 'Fertilizantes', 'kilogramos', 30.00),
('Semilla de Cebolla', 'Semillas', 'kilogramos', 20.00),
('Pulverizador de Presión', 'Equipos', 'unidades', 6.00),
('Semilla de Coliflor', 'Semillas', 'kilogramos', 12.00),
('Abono Verde', 'Fertilizantes', 'kilogramos', 50.00),
('Semilla de Brocoli', 'Semillas', 'kilogramos', 10.00),
('Semilla de Maíz Dulce', 'Semillas', 'kilogramos', 30.00);

-- inserciones Compra_Insumos

INSERT INTO Compra_Insumos (proveedor_id, insumo_id, fecha, cantidad, precio_unitario, created_at, updated_at) VALUES
(1, 1, '2023-01-05', 100.00, 200.50, NOW(), NOW()),
(1, 2, '2023-01-10', 50.00, 150.75, NOW(), NOW()),
(2, 3, '2023-01-15', 30.00, 120.10, NOW(), NOW()),
(2, 4, '2023-01-20', 20.00, 210.00, NOW(), NOW()),
(3, 5, '2023-01-25', 25.00, 100.25, NOW(), NOW()),
(3, 6, '2023-01-30', 75.00, 50.40, NOW(), NOW()),
(4, 7, '2023-02-01', 10.00, 90.00, NOW(), NOW()),
(4, 8, '2023-02-05', 80.00, 120.00, NOW(), NOW()),
(5, 9, '2023-02-10', 45.00, 180.50, NOW(), NOW()),
(5, 10, '2023-02-15', 60.00, 75.00, NOW(), NOW()),
(1, 1, '2023-02-20', 110.00, 210.00, NOW(), NOW()),
(2, 2, '2023-02-25', 55.00, 155.00, NOW(), NOW()),
(3, 3, '2023-03-01', 33.00, 125.00, NOW(), NOW()),
(4, 4, '2023-03-05', 22.00, 205.00, NOW(), NOW()),
(5, 5, '2023-03-10', 28.00, 95.00, NOW(), NOW()),
(6, 6, '2023-03-15', 77.00, 55.00, NOW(), NOW()),
(7, 7, '2023-03-20', 12.00, 85.00, NOW(), NOW()),
(8, 8, '2023-03-25', 90.00, 125.00, NOW(), NOW()),
(9, 9, '2023-03-30', 48.00, 195.00, NOW(), NOW()),
(10, 10, '2023-04-01', 65.00, 70.00, NOW(), NOW()),
(1, 1, '2023-04-05', 115.00, 220.00, NOW(), NOW()),
(2, 2, '2023-04-10', 58.00, 159.00, NOW(), NOW()),
(3, 3, '2023-04-15', 34.00, 130.00, NOW(), NOW()),
(4, 4, '2023-04-20', 23.00, 210.00, NOW(), NOW()),
(5, 5, '2023-04-25', 29.00, 100.00, NOW(), NOW()),
(6, 6, '2023-05-01', 80.00, 50.00, NOW(), NOW()),
(7, 7, '2023-05-05', 14.00, 95.00, NOW(), NOW()),
(8, 8, '2023-05-10', 88.00, 145.00, NOW(), NOW()),
(9, 9, '2023-05-15', 40.00, 165.00, NOW(), NOW()),
(10, 10, '2023-05-20', 63.00, 85.00, NOW(), NOW()),
(1, 1, '2023-05-25', 120.00, 215.00, NOW(), NOW()),
(2, 2, '2023-05-30', 60.00, 157.00, NOW(), NOW()),
(3, 3, '2023-06-01', 35.00, 132.00, NOW(), NOW()),
(4, 4, '2023-06-05', 25.00, 212.00, NOW(), NOW()),
(5, 5, '2023-06-10', 30.00, 97.00, NOW(), NOW()),
(6, 6, '2023-06-15', 70.00, 53.00, NOW(), NOW()),
(7, 7, '2023-06-20', 16.00, 82.00, NOW(), NOW()),
(8, 8, '2023-06-25', 95.00, 127.00, NOW(), NOW()),
(9, 9, '2023-06-30', 44.00, 190.00, NOW(), NOW()),
(10, 10, '2023-07-01', 68.00, 78.00, NOW(), NOW()),
(1, 1, '2023-07-05', 125.00, 225.00, NOW(), NOW()),
(2, 2, '2023-07-10', 62.00, 160.00, NOW(), NOW()),
(3, 3, '2023-07-15', 36.00, 135.00, NOW(), NOW()),
(4, 4, '2023-07-20', 27.00, 215.00, NOW(), NOW()),
(5, 5, '2023-07-25', 32.00, 100.00, NOW(), NOW()),
(6, 6, '2023-08-01', 75.00, 54.00, NOW(), NOW()),
(7, 7, '2023-08-05', 18.00, 85.00, NOW(), NOW()),
(8, 8, '2023-08-10', 90.00, 130.00, NOW(), NOW()),
(9, 9, '2023-08-15', 45.00, 180.00, NOW(), NOW()),
(10, 10, '2023-08-20', 66.00, 80.00, NOW(), NOW()),
(1, 1, '2023-08-25', 130.00, 230.00, NOW(), NOW()),
(2, 2, '2023-08-30', 64.00, 165.00, NOW(), NOW()),
(3, 3, '2023-09-01', 37.00, 135.00, NOW(), NOW()),
(4, 4, '2023-09-05', 28.00, 212.00, NOW(), NOW()),
(5, 5, '2023-09-10', 33.00, 99.00, NOW(), NOW()),
(6, 6, '2023-09-15', 76.00, 55.00, NOW(), NOW()),
(7, 7, '2023-09-20', 20.00, 88.00, NOW(), NOW()),
(8, 8, '2023-09-25', 96.00, 129.00, NOW(), NOW()),
(9, 9, '2023-09-30', 42.00, 175.00, NOW(), NOW()),
(10, 10, '2023-10-01', 70.00, 83.00, NOW(), NOW()),
(1, 1, '2023-10-05', 135.00, 240.00, NOW(), NOW()),
(2, 2, '2023-10-10', 66.00, 168.00, NOW(), NOW()),
(3, 3, '2023-10-15', 38.00, 130.00, NOW(), NOW()),
(4, 4, '2023-10-20', 29.00, 213.00, NOW(), NOW()),
(5, 5, '2023-10-25', 35.00, 98.00, NOW(), NOW()),
(6, 6, '2023-11-01', 78.00, 56.00, NOW(), NOW()),
(7, 7, '2023-11-05', 22.00, 87.00, NOW(), NOW()),
(8, 8, '2023-11-10', 92.00, 132.00, NOW(), NOW()),
(9, 9, '2023-11-15', 41.00, 180.00, NOW(), NOW()),
(10, 10, '2023-11-20', 69.00, 82.00, NOW(), NOW()),
(1, 1, '2023-11-25', 140.00, 250.00, NOW(), NOW()),
(2, 2, '2023-12-01', 68.00, 170.00, NOW(), NOW());


-- inserciones Almacenes

INSERT INTO Almacenes (nombre, tipo, capacidad, ubicacion, created_at, updated_at) VALUES
('Almacén Central', 'Vegetales', 500.00, 'Zona 1', NOW(), NOW()),
('Almacén Norte', 'Insumos', 300.00, 'Zona 2', NOW(), NOW()),
('Almacén Sur', 'Productos', 400.00, 'Zona 3', NOW(), NOW()),
('Almacén Este', 'Maquinaria', 200.00, 'Zona 4', NOW(), NOW()),
('Almacén Oeste', 'Fertilizantes', 100.00, 'Zona 5', NOW(), NOW()),
('Almacén Frutas', 'Frutas', 250.00, 'Zona 6', NOW(), NOW()),
('Almacén Hortalizas', 'Vegetales', 350.00, 'Zona 7', NOW(), NOW()),
('Almacén Plaguicidas', 'Agroquímicos', 150.00, 'Zona 8', NOW(), NOW()),
('Almacén Semillas', 'Semillas', 80.00, 'Zona 9', NOW(), NOW()),
('Almacén Accesorios', 'Maquinaria', 600.00, 'Zona 10', NOW(), NOW()),
('Almacén Especial', 'Suministros', 300.00, 'Zona 11', NOW(), NOW()),
('Almacén Proveedores', 'Insumos', 400.00, 'Zona 12', NOW(), NOW()),
('Almacén Secundario', 'Vegetales', 350.00, 'Zona 13', NOW(), NOW()),
('Almacén Principal', 'Maquinaria', 500.00, 'Zona 14', NOW(), NOW()),
('Almacén Temporal', 'Productos', 200.00, 'Zona 15', NOW(), NOW()),
('Almacén Principal 2', 'Semillas', 250.00, 'Zona 1', NOW(), NOW()),
('Almacén Frutos Secos', 'Frutos', 300.00, 'Zona 2', NOW(), NOW()),
('Almacén Fertilizantes', 'Fertilizantes', 400.00, 'Zona 3', NOW(), NOW()),
('Almacén Emergente', 'Otros', 350.00, 'Zona 4', NOW(), NOW()),
('Almacén Seco', 'Insumos', 200.00, 'Zona 5', NOW(), NOW()),
('Almacén Norte 2', 'Proveedores', 150.00, 'Zona 6', NOW(), NOW()),
('Almacén de Emergencia', 'Agroquímicos', 300.00, 'Zona 7', NOW(), NOW()),
('Almacén para Insumos', 'Insumos', 450.00, 'Zona 8', NOW(), NOW()),
('Almacén Vegetal', 'Vegetales', 600.00, 'Zona 9', NOW(), NOW()),
('Almacén de Cosechas', 'Frutas', 300.00, 'Zona 10', NOW(), NOW()),
('Almacén Especializado', 'Insumos Especiales', 200.00, 'Zona 11', NOW(), NOW()),
('Almacén de Cultivo', 'Maquinaria', 500.00, 'Zona 12', NOW(), NOW()),
('Almacén Frigorífico', 'Vegetales', 150.00, 'Zona 13', NOW(), NOW()),
('Almacén Hidropónico', 'Semillas', 600.00, 'Zona 14', NOW(), NOW()),
('Almacén de Fertilizantes Orgánicos', 'Orgánicos', 400.00, 'Zona 1', NOW(), NOW()),
('Almacén Sostenible', 'Productos Ecológicos', 300.00, 'Zona 2', NOW(), NOW()),
('Almacén de Riego', 'Equipos de Riego', 200.00, 'Zona 3', NOW(), NOW()),
('Almacén de Bioinsumos', 'Seanetis', 150.00, 'Zona 4', NOW(), NOW()),
('Almacén de Productos Químicos', 'Agroquímicos', 250.00, 'Zona 5', NOW(), NOW()),
('Almacén Seco 2', 'Suministros Secos', 400.00, 'Zona 6', NOW(), NOW()),
('Almacén de Hortalizas', 'Vegetales', 350.00, 'Zona 7', NOW(), NOW()),
('Almacén de Productos Compuestos', 'Productos Químicos', 300.00, 'Zona 8', NOW(), NOW()),
('Almacén de Envases', 'Suministros', 300.00, 'Zona 9', NOW(), NOW()),
('Almacén de Residuos', 'Basura', 100.00, 'Zona 10', NOW(), NOW()),
('Almacén Plástico', 'Envases Plásticos', 200.00, 'Zona 11', NOW(), NOW()),
('Almacén Especial de Fitosanitarios', 'Fitosanitarios', 500.00, 'Zona 12', NOW(), NOW()),
('Almacén de Pesticidas', 'Pesticidas', 400.00, 'Zona 13', NOW(), NOW()),
('Almacén de Herramientas', 'Herramientas', 300.00, 'Zona 14', NOW(), NOW()),
('Almacén de Alimentos', 'Alimentos', 600.00, 'Zona 15', NOW(), NOW()),
('Almacén Vegetal 2', 'Vegetales', 650.00, 'Zona 1', NOW(), NOW()),
('Almacén Ecológico', 'Biológicos', 300.00, 'Zona 2', NOW(), NOW()),
('Almacén Norte 3', 'Insumos', 200.00, 'Zona 3', NOW(), NOW()),
('Almacén Sur 3', 'Maquinaria', 500.00, 'Zona 4', NOW(), NOW()),
('Almacén Sera', 'Semenes', 200.00, 'Zona 5', NOW(), NOW()),
('Almacén Temporal 2', 'Proveedores', 100.00, 'Zona 6', NOW(), NOW()),
('Almacén Principal 3', 'Insumos', 450.00, 'Zona 7', NOW(), NOW()),
('Almacén Semanas', 'Mejoras', 600.00, 'Zona 8', NOW(), NOW()),
('Almacén de Preparación', 'Cosechas', 350.00, 'Zona 9', NOW(), NOW()),
('Almacén Rápido', 'Frutos', 200.00, 'Zona 10', NOW(), NOW()),
('Almacén de Seguridad', 'Químicos', 500.00, 'Zona 11', NOW(), NOW()),
('Almacén de Higiene', 'Desinfectantes', 300.00, 'Zona 12', NOW(), NOW());

-- inserciones Inventario

INSERT INTO Inventario (almacen_id, producto_id, insumo_id, cantidad, fecha_actualizacion, created_at, updated_at) VALUES
(1, 1, NULL, 150.00, '2023-01-01', NOW(), NOW()),
(1, 2, NULL, 200.00, '2023-01-05', NOW(), NOW()),
(1, NULL, 1, 100.00, '2023-01-10', NOW(), NOW()),
(1, NULL, 2, 300.00, '2023-01-15', NOW(), NOW()),
(2, 3, NULL, 250.00, '2023-01-20', NOW(), NOW()),
(2, 4, NULL, 180.00, '2023-01-25', NOW(), NOW()),
(2, NULL, 3, 220.00, '2023-01-30', NOW(), NOW()),
(2, NULL, 4, 150.00, '2023-02-01', NOW(), NOW()),
(3, 5, NULL, 300.00, '2023-02-05', NOW(), NOW()),
(3, 6, NULL, 50.00, '2023-02-10', NOW(), NOW()),
(3, NULL, 5, 80.00, '2023-02-15', NOW(), NOW()),
(3, NULL, 6, 120.00, '2023-02-20', NOW(), NOW()),
(4, 7, NULL, 400.00, '2023-02-25', NOW(), NOW()),
(4, 8, NULL, 90.00, '2023-03-01', NOW(), NOW()),
(4, NULL, 7, 200.00, '2023-03-05', NOW(), NOW()),
(4, NULL, 8, 160.00, '2023-03-10', NOW(), NOW()),
(5, 9, NULL, 100.00, '2023-03-15', NOW(), NOW()),
(5, 10, NULL, 250.00, '2023-03-20', NOW(), NOW()),
(5, NULL, 9, 300.00, '2023-03-25', NOW(), NOW()),
(5, NULL, 10, 150.00, '2023-03-30', NOW(), NOW()),
(1, 1, NULL, 450.00, '2023-04-01', NOW(), NOW()),
(1, 2, NULL, 350.00, '2023-04-05', NOW(), NOW()),
(1, NULL, 1, 200.00, '2023-04-10', NOW(), NOW()),
(1, NULL, 2, 180.00, '2023-04-15', NOW(), NOW()),
(2, 3, NULL, 320.00, '2023-04-20', NOW(), NOW()),
(2, 4, NULL, 270.00, '2023-04-25', NOW(), NOW()),
(2, NULL, 3, 200.00, '2023-05-01', NOW(), NOW()),
(2, NULL, 4, 160.00, '2023-05-05', NOW(), NOW()),
(3, 5, NULL, 300.00, '2023-05-10', NOW(), NOW()),
(3, 6, NULL, 150.00, '2023-05-15', NOW(), NOW()),
(3, NULL, 5, 90.00, '2023-05-20', NOW(), NOW()),
(3, NULL, 6, 75.00, '2023-05-25', NOW(), NOW()),
(4, 7, NULL, 400.00, '2023-06-01', NOW(), NOW()),
(4, 8, NULL, 200.00, '2023-06-05', NOW(), NOW()),
(4, NULL, 7, 110.00, '2023-06-10', NOW(), NOW()),
(4, NULL, 8, 85.00, '2023-06-15', NOW(), NOW()),
(5, 9, NULL, 300.00, '2023-06-20', NOW(), NOW()),
(5, 10, NULL, 250.00, '2023-06-25', NOW(), NOW()),
(5, NULL, 9, 150.00, '2023-06-30', NOW(), NOW()),
(5, NULL, 10, 120.00, '2023-07-01', NOW(), NOW()),
(1, 1, NULL, 400.00, '2023-07-05', NOW(), NOW()),
(1, 2, NULL, 380.00, '2023-07-10', NOW(), NOW()),
(1, NULL, 1, 160.00, '2023-07-15', NOW(), NOW()),
(1, NULL, 2, 140.00, '2023-07-20', NOW(), NOW()),
(2, 3, NULL, 320.00, '2023-07-25', NOW(), NOW()),
(2, 4, NULL, 270.00, '2023-07-30', NOW(), NOW()),
(2, NULL, 3, 280.00, '2023-08-01', NOW(), NOW()),
(2, NULL, 4, 250.00, '2023-08-05', NOW(), NOW()),
(3, 5, NULL, 200.00, '2023-08-10', NOW(), NOW()),
(3, 6, NULL, 110.00, '2023-08-15', NOW(), NOW()),
(3, NULL, 5, 90.00, '2023-08-20', NOW(), NOW()),
(3, NULL, 6, 70.00, '2023-08-25', NOW(), NOW()),
(4, 7, NULL, 300.00, '2023-09-01', NOW(), NOW()),
(4, 8, NULL, 90.00, '2023-09-06', NOW(), NOW()),
(4, NULL, 7, 220.00, '2023-09-15', NOW(), NOW()),
(4, NULL, 8, 85.00, '2023-09-20', NOW(), NOW()),
(5, 9, NULL, 310.00, '2023-09-30', NOW(), NOW()),
(5, 10, NULL, 260.00, '2023-10-05', NOW(), NOW()),
(5, NULL, 9, 175.00, '2023-10-10', NOW(), NOW()),
(5, NULL, 10, 130.00, '2023-10-15', NOW(), NOW());

```
## 100 consultas :

```sql
Estado actual del inventario de insumos en cada almacén :
SELECT a.nombre AS Almacen, i.nombre AS Insumo, inv.cantidad AS Cantidad, inv.fecha_actualizacion 
FROM Inventario inv
JOIN Almacenes a ON inv.almacen_id = a.almacen_id
JOIN Insumos i ON inv.insumo_id = i.insumo_id;

Estado actual del inventario de productos en cada almacén 
SELECT a.nombre AS Almacen, p.nombre AS Producto, inv.cantidad AS Cantidad, inv.fecha_actualizacion 
FROM Inventario inv
JOIN Almacenes a ON inv.almacen_id = a.almacen_id
JOIN Productos p ON inv.producto_id = p.producto_id;

 Insumos con stock por debajo del mínimo requerido
SELECT 
    i.nombre, 
    i.stock_minimo, 
    COALESCE(SUM(inv.cantidad), 0) AS Stock_Actual 
FROM 
    Insumos i
LEFT JOIN 
    Inventario inv ON i.insumo_id = inv.insumo_id
GROUP BY 
    i.nombre, i.stock_minimo
ORDER BY 
    Stock_Actual ASC;

Productos disponibles en un almacén específico
SELECT p.nombre AS Producto, inv.cantidad AS Cantidad
FROM Inventario inv
JOIN Productos p ON inv.producto_id = p.producto_id
WHERE inv.almacen_id = 1; -- Cambiar ID del almacén según sea necesario

Top 5 insumos con mayor cantidad en inventario
SELECT i.nombre, SUM(inv.cantidad) AS Cantidad_Total 
FROM Inventario inv
JOIN Insumos i ON inv.insumo_id = i.insumo_id
GROUP BY i.nombre
ORDER BY Cantidad_Total DESC
LIMIT 5;

Producción total por cultivo en el último mes
SELECT COUNT(*) AS TotalRecursos
FROM Produccion_Animales
WHERE fecha >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);


Producción promedio por lote y cultivo
SELECT 
    lc.lote_id, 
    c.variedad, 
    AVG(l.area) AS Area_Promedio 
FROM 
    Lote_Cultivos lc
JOIN 
    Cultivos c ON lc.cultivo_id = c.cultivo_id
JOIN 
    Lotes l ON lc.lote_id = l.lote_id  -- Asegúrate de unirte a la tabla Lotes para acceder al área
GROUP BY 
    lc.lote_id, c.variedad;



SELECT DISTINCT fecha
FROM Produccion_Animales
ORDER BY fecha DESC;



Producción por lote y tipo de riego
SELECT l.tipo_riego, lc.lote_id, SUM(l.area) AS Area_Total 
FROM Lote_Cultivos lc
JOIN Lotes l ON lc.lote_id = l.lote_id
GROUP BY l.tipo_riego, lc.lote_id;

Variedades de cultivos en producción actualmente
SELECT 
    c.variedad, 
    COALESCE(lc.fecha_fin, 'Activo') AS Estado 
FROM 
    Cultivos c 
LEFT JOIN 
    Lote_Cultivos lc ON c.cultivo_id = lc.cultivo_id;


Ventas totales del último mes por cliente
SELECT 
    c.nombre AS Cliente, 
    SUM(v.total) AS Ventas_Totales 
FROM 
    Ventas v
JOIN 
    Clientes c ON v.cliente_id = c.cliente_id 
WHERE 
    v.fecha < CURDATE()  -- O puedes omitir la cláusula WHERE para ver todas las ventas
GROUP BY 
    c.nombre;


Top 5 productos más vendidos por cantidad
SELECT p.nombre, SUM(dv.cantidad) AS Total_Vendido 
FROM Detalle_Ventas dv
JOIN Productos p ON dv.producto_id = p.producto_id
GROUP BY p.nombre
ORDER BY Total_Vendido DESC
LIMIT 5;

Ingresos diarios promedio del mes actual
SELECT AVG(v.total) AS Promedio_Diario
FROM Ventas v
WHERE MONTH(v.fecha) = MONTH(CURDATE()) AND YEAR(v.fecha) = YEAR(CURDATE());

Ventas por tipo de pago y estado
SELECT v.tipo_pago, v.estado, SUM(v.total) AS Total_Ventas
FROM Ventas v
GROUP BY v.tipo_pago, v.estado;

Clientes con más compras en el último trimestre
SELECT 
    v.venta_id, 
    v.cliente_id, 
    v.fecha 
FROM 
    Ventas v
ORDER BY 
    v.fecha DESC;


4. Consultas sobre compras
16
Insumos más comprados en cantidad :
SELECT i.nombre AS Insumo, SUM(ci.cantidad) AS Cantidad_Comprada
FROM Compra_Insumos ci
JOIN Insumos i ON ci.insumo_id = i.insumo_id
GROUP BY i.nombre
ORDER BY Cantidad_Comprada DESC;
17. 
Proveedores con más transacciones en el último año :

SELECT p.nombre AS Proveedor, COUNT(ci.compra_insumo_id) AS Transacciones 
FROM Compra_Insumos ci
JOIN Proveedores p ON ci.proveedor_id = p.proveedor_id
WHERE ci.fecha >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY p.nombre
ORDER BY Transacciones DESC;
18.
Costo total de insumos comprados en el último mes :
SELECT SUM(ci.cantidad * ci.precio_unitario) AS Costo_Total 
FROM Compra_Insumos ci
WHERE ci.fecha >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);
19.
Promedio de precios por insumo comprado :
SELECT i.nombre, AVG(ci.precio_unitario) AS Precio_Promedio
FROM Compra_Insumos ci
JOIN Insumos i ON ci.insumo_id = i.insumo_id
GROUP BY i.nombre;
20.
Proveedores de un insumo específico :

SELECT DISTINCT p.nombre AS Proveedor
FROM Compra_Insumos ci
JOIN Proveedores p ON ci.proveedor_id = p.proveedor_id
JOIN Insumos i ON ci.insumo_id = i.insumo_id
WHERE i.nombre = 'Semilla de Maíz';


5. Consultas sobre Costos Operativos
Costo total de empleados en el último mes :

SELECT SUM(e.salario) AS Costo_Total
FROM Empleados e;

Costos operativos por tipo de contrato :
SELECT tipo_contrato, SUM(salario) AS Costo_Total
FROM Empleados

GRO
GROUP BY tipo_contrato;

Costo promedio por hora de trabajo realizado :
SELECT AVG(tt.costo_hora) AS Costo_Promedio_Hora
FROM Tipo_Trabajo tt;

``

Costo total de las actividades agrícolas en el último mes :
SELECT SUM(tt.costo_hora * aa.horas_trabajadas) AS Costo_Total
FROM Actividades_Agricolas aa
JOIN Tipo_Trabajo tt ON aa.tipo_trabajo_id = tt.tipo_trabajo_id
WHERE aa.fecha >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);

Proporción de costos entre diferentes tipos de trabajos realizados :
SELECT tt.nombre, SUM(tt.costo_hora * aa.horas_trabajadas) AS Costo_Total
FROM Actividades_Agricolas aa
JOIN Tipo_Trabajo tt ON aa.tipo_trabajo_id = tt.tipo_trabajo_id
GROUP BY tt.nombre;


6. Consultas sobre Desempeño de Empleados
Empleados con más horas trabajadas en el último mes :
SELECT COUNT(*) AS TotalActividades
FROM Actividades_Agricolas
WHERE fecha >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH);


Promedio de horas trabajadas por empleado :
SELECT e.nombre, e.apellidos, AVG(aa.horas_trabajadas) AS Promedio_Horas
FROM Actividades_Agricolas aa
JOIN Empleados e ON aa.empleado_id = e.empleado_id
GROUP BY e.nombre, e.apellidos;

Cantidad de actividades agrícolas realizadas por empleado :
SELECT e.nombre, e.apellidos, COUNT(aa.actividad_id) AS Total_Actividades
FROM Actividades_Agricolas aa
JOIN Empleados e ON aa.empleado_id = e.empleado_id
GROUP BY e.nombre, e.apellidos;

``

Desempeño de empleados en un tipo de trabajo específico :
SELECT e.nombre, e.apellidos, COALESCE(SUM(aa.horas_trabajadas), 0) AS Horas_Trabajadas
FROM Empleados e
LEFT JOIN Actividades_Agricolas aa ON e.empleado_id = aa.empleado_id AND aa.tipo_trabajo_id IN (SELECT tipo_trabajo_id FROM Tipo_Trabajo WHERE nombre = 'Siembra')
GROUP BY e.nombre, e.apellidos;


Empleados con más especialidades registradas:
SELECT e.nombre, e.apellidos, e.especialidad
FROM Empleados e
WHERE e.especialidad IS NOT NULL
ORDER BY e.nombre;


7. Consultas sobre Cultivos
Variedad de cultivos más sembrados por hectárea:
SELECT c.variedad, COUNT(lc.lote_id) AS Numero_de_Lotes
FROM Lote_Cultivos lc
JOIN Cultivos c ON lc.cultivo_id = c.cultivo_id
GROUP BY c.variedad
ORDER BY Numero_de_Lotes DESC;


``

Producción esperada por variedad de cultivo para el próximo trimestre :
SELECT c.variedad, COALESCE(SUM(pa.produccion_esperada), 0) AS Produccion_Esperada
FROM Cultivos c
LEFT JOIN Planificacion_Agricola pa ON pa.cultivo_id = c.cultivo_id AND pa.fecha_planificada BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 3 MONTH)
GROUP BY c.variedad;


Lotes con más de un cultivo en producción simultánea :
SELECT COUNT(*) AS TotalLotes
FROM Lote_Cultivos
WHERE fecha_fin IS NULL OR fecha_fin > CURDATE();



Promedio de días de maduración por tipo de cultivo :
SELECT c.variedad, AVG(c.dias_maduracion) AS Dias_Maduracion_Promedio
FROM Cultivos c
GROUP BY c.variedad;

Lotes con cultivos que terminan este mes :
SELECT lc.lote_id, c.variedad, lc.fecha_fin
FROM Lote_Cultivos lc
JOIN Cultivos c ON lc.cultivo_id = c.cultivo_id
WHERE MONTH(lc.fecha_fin) = MONTH(CURDATE()) AND YEAR(lc.fecha_fin) = YEAR(CURDATE());


8. Consultas sobre Plagas y Control
Lotes afectados por plagas en el último mes :
SELECT COUNT(*) AS TotalDetecciones
FROM Registro_Plagas
WHERE fecha_deteccion >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR);



Tratamientos más aplicados contra plagas :
SELECT COUNT(*) AS TotalRegistros
FROM Registro_Plagas;


Plagas recurrentes en un lote específico :
SELECT COUNT(*) AS TotalUnicos
FROM Registro_Plagas rp
LEFT JOIN Plagas p ON rp.plaga_id = p.plaga_id
WHERE rp.lote_cultivo_id = 1;


Porcentaje de lotes afectados por plagas activas:
SELECT (COUNT(DISTINCT rp.lote_cultivo_id) * 100.0 / COUNT(DISTINCT lc.lote_id)) AS Porcentaje_Afectado
FROM Lote_Cultivos lc
LEFT JOIN Registro_Plagas rp ON lc.lote_cultivo_id = rp.lote_cultivo_id;


Costos estimados por tratamientos aplicados a plagas:
SELECT 
    (SELECT COUNT(*) FROM Registro_Plagas) AS TotalRegistroPlagas,
    (SELECT COUNT(*) FROM Plagas) AS TotalPlagas,
    (SELECT COUNT(*) FROM Actividades_Agricolas) AS TotalActividadesAgricolas,
    (SELECT COUNT(*) FROM Tipo_Trabajo) AS TotalTipoTrabajo;




9. Consultas sobre Ventas
Ventas totales por mes en el último año:
SELECT MONTH(v.fecha) AS Mes, YEAR(v.fecha) AS Año, SUM(v.total) AS Ventas_Totales
FROM Ventas v
WHERE v.fecha >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY Año, Mes
ORDER BY Año, Mes;

``

Clientes con mayores compras realizadas :
SELECT c.nombre AS Cliente, SUM(v.total) AS Total_Compras
FROM Ventas v
JOIN Clientes c ON v.cliente_id = c.cliente_id
GROUP BY c.nombre
ORDER BY Total_Compras DESC
LIMIT 5;

Productos más vendidos en el último trimestre :
SELECT DATE_FORMAT(v.fecha, '%Y-%m') AS Mes, 
       SUM(dv.cantidad * dv.precio_unitario) AS Total_Ventas
FROM Ventas v
JOIN Detalle_Ventas dv ON v.venta_id = dv.venta_id
WHERE v.fecha >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY Mes
ORDER BY Mes;


Ingresos por tipo de pago en el último semestre:
SELECT p.nombre AS Producto, 
       COUNT(v.venta_id) AS Numero_Ventas, 
       SUM(dv.cantidad) AS Total_Productos_Vendidos
FROM Productos p
LEFT JOIN Detalle_Ventas dv ON p.producto_id = dv.producto_id
LEFT JOIN Ventas v ON dv.venta_id = v.venta_id
WHERE v.fecha >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY p.nombre
ORDER BY Total_Productos_Vendidos DESC;


Margen promedio de venta por producto :
SELECT p.nombre AS Producto, AVG(dv.precio_unitario) AS Precio_Promedio
FROM Detalle_Ventas dv
JOIN Productos p ON dv.producto_id = p.producto_id
GROUP BY p.nombre;


``


10. Consultas sobre Inventarios
Stock actual en cada almacén por producto:
SELECT a.nombre AS Almacen, p.nombre AS Producto, SUM(i.cantidad) AS Stock_Actual
FROM Inventario i
JOIN Almacenes a ON i.almacen_id = a.almacen_id
JOIN Productos p ON i.producto_id = p.producto_id
GROUP BY a.nombre, p.nombre;

``

Insumos con stock por debajo del mínimo :
SELECT i.nombre AS Nombre_Insumo
FROM Insumos i;

Almacenes con mayor capacidad disponible :
SELECT a.nombre AS Almacen, a.capacidad - SUM(i.cantidad) AS Capacidad_Disponible
FROM Almacenes a
LEFT JOIN Inventario i ON a.almacen_id = i.almacen_id
GROUP BY a.nombre, a.capacidad
ORDER BY Capacidad_Disponible DESC;

Productos con mayor rotación en el último año :
SELECT p.nombre AS Producto, SUM(dv.cantidad) AS Total_Salida
FROM Detalle_Ventas dv
JOIN Productos p ON dv.producto_id = p.producto_id
JOIN Ventas v ON dv.venta_id = v.venta_id
WHERE v.fecha >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY p.nombre
ORDER BY Total_Salida DESC;


``

Resumen de entradas y salidas por insumo en un mes específico:
SELECT i.nombre AS Insumo
FROM Insumos i;


``


11. Consultas sobre el clima
Promedio de temperatura, precipitación y humedad en el último trimestre :
SELECT AVG(temperatura) AS Temperatura_Promedio, 
       AVG(precipitacion) AS Precipitacion_Promedio, 
       AVG(humedad) AS Humedad_Promedio
FROM Clima
WHERE fecha >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH);

Días con condiciones específicas ('lluvia' o 'nublado') :
SELECT condiciones, COUNT(*) AS Dias
FROM Clima
WHERE condiciones IN ('lluvia', 'nublado')
GROUP BY condiciones;

Temperatura máxima y mínima registrada por meses en el último año :
SELECT MONTH(fecha) AS Mes, MAX(temperatura) AS Max_Temp, MIN(temperatura) AS Min_Temp
FROM Clima
WHERE fecha >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY Mes;

Días con recepción mayor a 50 mm :
SELECT fecha, precipitacion
FROM Clima
WHERE precipitacion >= 10
ORDER BY fecha ASC;


Comparación de condiciones climáticas entre dos meses consecutivos :
SELECT 
    AVG(CASE WHEN MONTH(fecha) = MONTH(CURDATE()) AND YEAR(fecha) = YEAR(CURDATE()) THEN condiciones END) AS Promedio_Mes_Actual,
    AVG(CASE WHEN MONTH(fecha) = MONTH(DATE_SUB(CURDATE(), INTERVAL 1 MONTH)) AND YEAR(fecha) = YEAR(CURDATE()) THEN condiciones END) AS Promedio_Mes_Anterior
FROM Clima
WHERE MONTH(fecha) IN (MONTH(CURDATE()), MONTH(DATE_SUB(CURDATE(), INTERVAL 1 MONTH)))
  AND YEAR(fecha) = YEAR(CURDATE());


12. Consultas sobre Compras y Proveedores
Proveedores más frecuentes en el último año :
SELECT p.nombre AS Proveedor, COUNT(ci.compra_insumo_id) AS Frecuencia
FROM Compra_Insumos ci
JOIN Proveedores p ON ci.proveedor_id = p.proveedor_id
WHERE ci.fecha >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY p.nombre
ORDER BY Frecuencia DESC;

Total gastado por categoría de insumos:
SELECT i.categoria, SUM(ci.cantidad * ci.precio_unitario) AS Total_Gastado
FROM Compra_Insumos ci
JOIN Insumos i ON ci.insumo_id = i.insumo_id
GROUP BY i.categoria;


Proveedores especializados en una categoría específica :
SELECT p.nombre, p.especialidad
FROM Proveedores p
WHERE p.especialidad LIKE '%fertilizantes%';

``

Compras realizadas en un rango de fechas específicas :
SELECT 
    i.nombre AS Insumo, 
    ci.cantidad
FROM Compra_Insumos ci
JOIN Insumos i ON ci.insumo_id = i.insumo_id;


Comparación de costos entre proveedores para un mismo insumo 
SELECT 
    ci.insumo_id AS ID_Insumo, 
    ci.cantidad AS Cantidad_Comprada, 
    ci.precio_unitario AS Precio_Unitario
FROM Compra_Insumos ci;


``

13. Consultas sobre Empleados y Desempeño
Total de horas trabajadas por empleado en el último mes:
SELECT 
    e.nombre AS Nombre_Empleado, 
    e.apellidos AS Apellidos_Empleado
FROM Empleados e;


``

Empleado con mayor tiempo trabajado en actividades específicas:
SELECT 
    empleado_id AS ID_Empleado, 
    nombre 
FROM Empleados;


Promedio de salario por tipo de contrato :
SELECT tipo_contrato, AVG(salario) AS Salario_Promedio
FROM Empleados
GROUP BY tipo_contrato;

``

Especialidades más comunes entre los empleados:
SELECT especialidad, COUNT(*) AS Total
FROM Empleados
GROUP BY especialidad
ORDER BY Total DESC;

``

Empleados contratados en el último año:
SELECT 
    nombre, 
    apellidos, 
    salario
FROM Empleados
ORDER BY nombre, apellidos;





14. Consultas sobre Cultivos
Cultivos activos por lote :
SELECT 
    lote_cultivo_id, 
    lote_id, 
    cultivo_id, 
    fecha_inicio, 
    estado
FROM Lote_Cultivos
WHERE estado = 'Activo';


Tiempo promedio de maduración por variedad de cultivo:
SELECT c.variedad, AVG(c.dias_maduracion) AS Dias_Promedio
FROM Cultivos c
GROUP BY c.variedad
ORDER BY Dias_Promedio ASC;

``

Producción esperada por cultivo en un rango de fechas:
SELECT COUNT(*) AS TotalPlanificaciones
FROM Planificacion_Agricola
WHERE fecha_planificada BETWEEN '2024-01-01' AND '2024-12-31';



``

Lotes con cultivos que requieren más de 100 días para madurar:
SELECT DISTINCT lc.cultivo_id
FROM Lote_Cultivos lc
LEFT JOIN Cultivos c ON lc.cultivo_id = c.cultivo_id
WHERE c.dias_maduracion IS NOT NULL;



Lotes con cultivos finalizados en el último mes:
SELECT 
    lc.lote_id,               -- Columna de identificación del lote
    c.variedad AS Cultivo,    -- Nombre de la variedad del cultivo
    lc.fecha_fin               -- Fecha de finalización del cultivo
FROM Lote_Cultivos lc
JOIN Cultivos c ON lc.cultivo_id = c.cultivo_id
WHERE lc.fecha_fin BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE();


``


15. Consultas sobre Plagas
Lotes con mayores afectaciones por plagas :
SELECT 
    COUNT(*) AS CountNullLote 
FROM Registro_Plagas 
WHERE lote_cultivo_id IS NULL;

SELECT 
    COUNT(*) AS CountNullPlaga 
FROM Registro_Plagas 
WHERE plaga_id IS NULL;



Tratamientos más utilizados contra plagas :
SELECT COUNT(*) AS TotalUnicos
FROM Registro_Plagas rp
LEFT JOIN Plagas p ON rp.plaga_id = p.plaga_id;


``

Plagas detectadas en un rango de fechas específicas:
SELECT COUNT(*) AS TotalDetecciones
FROM Registro_Plagas
WHERE fecha_deteccion BETWEEN '2024-01-01' AND '2024-03-31';


``

Plagas más recurrentes en cultivos de una variedad específica :

SELECT COUNT(*) AS TotalMaizAmarillo
FROM Cultivos
WHERE variedad = 'Maíz Amarillo';


``

Nivel de afectación promedio por plaga:
SELECT COUNT(*) AS CountNullAfectacion
FROM Registro_Plagas
WHERE nivel_afectacion IS NULL;


16. Consultas sobre animales
Produccion promedio de cada tipo de animal:
SELECT a.especie, pa.tipo_produccion, AVG(pa.cantidad) AS Produccion_Promedio
FROM Produccion_Animales pa
JOIN Animales a ON pa.animal_id = a.animal_id
GROUP BY a.especie, pa.tipo_produccion;

``

Animales más productivos por tipo de producción.:
SELECT a.especie, pa.tipo_produccion, SUM(pa.cantidad) AS Produccion_Total
FROM Produccion_Animales pa
JOIN Animales a ON pa.animal_id = a.animal_id
GROUP BY a.especie, pa.tipo_produccion
ORDER BY Produccion_Total DESC
LIMIT 5;

``

Número de animales por estado (salud, propósito, etc.) :
SELECT estado, COUNT(*) AS Total
FROM Animales
GROUP BY estado;

``

Producción mensual por tipo de animal :
SELECT MONTH(pa.fecha) AS Mes, a.especie, SUM(pa.cantidad) AS Produccion_Total
FROM Produccion_Animales pa
JOIN Animales a ON pa.animal_id = a.animal_id
WHERE YEAR(pa.fecha) = YEAR(CURDATE())
GROUP BY Mes, a.especie;

``

Razas de animales con mayor producción acumulada:
SELECT 
    a.raza, 
    SUM(pa.cantidad) AS Produccion_Total
FROM Produccion_Animales pa
JOIN Animales a ON pa.animal_id = a.animal_id
GROUP BY a.raza
ORDER BY Produccion_Total DESC
LIMIT 3;

17. Consultas sobre Inventarios
Stock actual de insumos en cada almacén :
SELECT a.nombre AS Almacen, i.nombre AS Insumo, inv.cantidad AS Cantidad
FROM Inventario inv
JOIN Almacenes a ON inv.almacen_id = a.almacen_id
JOIN Insumos i ON inv.insumo_id = i.insumo_id
ORDER BY a.nombre, i.nombre;

``

Almacenes con menor capacidad disponible (ocupados al menos al 80%):
SELECT 
    a.nombre, 
    a.capacidad - SUM(inv.cantidad) AS Capacidad_Disponible
FROM Almacenes a
JOIN Inventario inv ON a.almacen_id = inv.almacen_id
GROUP BY a.almacen_id, a.nombre, a.capacidad
HAVING (a.capacidad - SUM(inv.cantidad)) / a.capacidad < 0.2;


Productos más almacenados en inventarios:
SELECT p.nombre AS Producto, SUM(inv.cantidad) AS Total
FROM Inventario inv
JOIN Productos p ON inv.producto_id = p.producto_id
GROUP BY p.producto_id
ORDER BY Total DESC;

Alertas de insumos con stock por debajo del mínimo :
SELECT 
    i.insumo_id, 
    i.nombre AS Insumo, 
    inv.cantidad AS Stock_Actual, 
    i.stock_minimo AS Stock_Minimo
FROM Inventario inv
JOIN Insumos i ON inv.insumo_id = i.insumo_id;


Valor estimado del inventario por almacén :
SELECT 
    a.nombre AS Almacen,
    SUM(inv.cantidad) AS Cantidad_Total
FROM Inventario inv
JOIN Almacenes a ON inv.almacen_id = a.almacen_id
GROUP BY a.nombre;



18. Consultas sobre Proveedores
Proveedores más frecuentes en los últimos 6 meses :

SELECT proveedor_id, COUNT(*) 
FROM Compra_Insumos 
GROUP BY proveedor_id;


Insumos más comprados a cada proveedor :
SELECT pr.nombre AS Proveedor, i.nombre AS Insumo, SUM(ci.cantidad) AS Total_Comprado
FROM Compra_Insumos ci
JOIN Proveedores pr ON ci.proveedor_id = pr.proveedor_id
JOIN Insumos i ON ci.insumo_id = i.insumo_id
GROUP BY pr.proveedor_id, i.insumo_id
ORDER BY Total_Comprado DESC;

``

Gasto promedio mensual por proveedor :

SELECT 
    pr.nombre AS Proveedor, 
    AVG(total_gasto) AS Gasto_Promedio
FROM (
    SELECT 
        ci.proveedor_id,
        SUM(ci.cantidad * ci.precio_unitario) AS total_gasto
    FROM Compra_Insumos ci
    GROUP BY ci.proveedor_id, MONTH(ci.fecha)
) AS gastos
JOIN Proveedores pr ON gastos.proveedor_id = pr.proveedor_id
GROUP BY pr.proveedor_id;


Proveedores con especialidad en un tipo específico de insumos:

SELECT 
    nombre AS Proveedor, 
    especialidad 
FROM Proveedores
WHERE especialidad LIKE '%Fertilizantes%';


``

```
## 20 Procedimientos almacenados

```sql
1. Actualizar Inventario tras Ventas
DELIMITER //

CREATE PROCEDURE sp_actualizar_inventario_tras_venta(
    IN venta_id INT
)
BEGIN
    DECLARE prod_id INT;
    DECLARE cantidad DECIMAL(10,2);
    DECLARE done INT DEFAULT FALSE;  -- Declare the done variable to handle cursor termination.

    -- Declare the cursor
    DECLARE venta_cursor CURSOR FOR
        SELECT producto_id, cantidad
        FROM Detalle_Ventas
        WHERE venta_id = venta_id;

    -- Declare the handler for not found
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    -- Open the cursor
    OPEN venta_cursor;

    -- Read loop
    read_loop: LOOP
        FETCH venta_cursor INTO prod_id, cantidad;
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- Update the inventory
        UPDATE Inventario
        SET cantidad = cantidad - cantidad
        WHERE producto_id = prod_id;
    END LOOP;

    -- Close the cursor
    CLOSE venta_cursor;
END //

DELIMITER ;



2. Registrar Nuevo Proveedor
DELIMITER //

CREATE PROCEDURE sp_registrar_proveedor(
    IN nombre VARCHAR(100),
    IN rfc VARCHAR(20),
    IN tipo VARCHAR(50),
    IN contacto VARCHAR(100),
    IN especialidad VARCHAR(100)
)
BEGIN
    INSERT INTO Proveedores (nombre, rfc, tipo, contacto, especialidad) 
    VALUES (nombre, rfc, tipo, contacto, especialidad);
END //

DELIMITER ;


3. Registrar Nuevo Empleado
DELIMITER //

CREATE PROCEDURE sp_registrar_empleado(
    IN nombre VARCHAR(50),
    IN apellidos VARCHAR(100),
    IN tipo_contrato VARCHAR(50),
    IN salario DECIMAL(10,2),
    IN especialidad VARCHAR(100),
    IN contacto VARCHAR(100),
    IN fecha_ingreso DATE
)
BEGIN
    INSERT INTO Empleados (nombre, apellidos, tipo_contrato, salario, especialidad, contacto, fecha_ingreso) 
    VALUES (nombre, apellidos, tipo_contrato, salario, especialidad, contacto, fecha_ingreso);
END //

DELIMITER ;


4. Actualizar Estado de Empleado
DELIMITER //

CREATE PROCEDURE sp_actualizar_estado_empleado(
    IN empleado_id INT,
    IN nuevo_estado VARCHAR(50)
)
BEGIN
    UPDATE Empleados 
    SET estado = nuevo_estado 
    WHERE empleado_id = empleado_id;
END //

DELIMITER ;


5. Registrar Tratamiento para Plaga
DELIMITER //

CREATE PROCEDURE sp_registrar_tratamiento_plaga(
    IN lote_cultivo_id INT,
    IN plaga_id INT,
    IN fecha_deteccion DATE,
    IN nivel_afectacion VARCHAR(50),
    IN tratamiento_aplicado TEXT
)
BEGIN
    INSERT INTO Registro_Plagas (lote_cultivo_id, plaga_id, fecha_deteccion, nivel_afectacion, tratamiento_aplicado) 
    VALUES (lote_cultivo_id, plaga_id, fecha_deteccion, nivel_afectacion, tratamiento_aplicado);
END //

DELIMITER ;


6. Registrar una Nueva Actividad Agrícola
DELIMITER //

CREATE PROCEDURE sp_registrar_actividad_agricola(
    IN empleado_id INT,
    IN tipo_trabajo_id INT,
    IN lote_id INT,
    IN fecha DATE,
    IN horas_trabajadas DECIMAL(5,2),
    IN observaciones TEXT
)
BEGIN
    INSERT INTO Actividades_Agricolas (empleado_id, tipo_trabajo_id, lote_id, fecha, horas_trabajadas, observaciones) 
    VALUES (empleado_id, tipo_trabajo_id, lote_id, fecha, horas_trabajadas, observaciones);
END //

DELIMITER ;


7. Actualizar Estado de Lote
DELIMITER //

CREATE PROCEDURE sp_actualizar_estado_lote(
    IN lote_id INT,
    IN nuevo_estado VARCHAR(50)
)
BEGIN
    UPDATE Lotes 
    SET estado = nuevo_estado 
    WHERE lote_id = lote_id;
END //

DELIMITER ;


8. Registrar Compra de Insumos
DELIMITER //

CREATE PROCEDURE sp_registrar_compra_insumos(
    IN proveedor_id INT,
    IN insumo_id INT,
    IN fecha DATE,
    IN cantidad DECIMAL(10,2),
    IN precio_unitario DECIMAL(10,2)
)
BEGIN
    INSERT INTO Compra_Insumos (proveedor_id, insumo_id, fecha, cantidad, precio_unitario) 
    VALUES (proveedor_id, insumo_id, fecha, cantidad, precio_unitario);
    
    -- Actualizar inventario de insumos
    UPDATE Inventario 
    SET cantidad = cantidad + cantidad 
    WHERE insumo_id = insumo_id;
END //

DELIMITER ;


9. Actualizar Precios de Productos
DELIMITER //

CREATE PROCEDURE sp_actualizar_precio_producto(
    IN producto_id INT,
    IN nuevo_precio DECIMAL(10,2)
)
BEGIN
    UPDATE Productos 
    SET precio_referencia = nuevo_precio 
    WHERE producto_id = producto_id;
END //

DELIMITER ;


10. Registrar Producción Animal
DELIMITER //

CREATE PROCEDURE sp_registrar_produccion_animal(
    IN animal_id INT,
    IN fecha DATE,
    IN tipo_produccion VARCHAR(50),
    IN cantidad DECIMAL(10,2),
    IN unidad_medida VARCHAR(20)
)
BEGIN
    INSERT INTO Produccion_Animales (animal_id, fecha, tipo_produccion, cantidad, unidad_medida) 
    VALUES (animal_id, fecha, tipo_produccion, cantidad, unidad_medida);
END //

DELIMITER ;


11. Registrar Nueva Venta
DELIMITER //

CREATE PROCEDURE sp_registrar_nueva_venta(
    IN cliente_id INT,
    IN fecha DATE,
    IN total DECIMAL(12,2),
    IN estado VARCHAR(50),
    IN tipo_pago VARCHAR(50)
)
BEGIN
    INSERT INTO Ventas (cliente_id, fecha, total, estado, tipo_pago) 
    VALUES (cliente_id, fecha, total, estado, tipo_pago);
END //

DELIMITER ;


12. Actualizar Registro de Clima
DELIMITER //

CREATE PROCEDURE sp_registrar_clima(
    IN fecha DATE,
    IN temperatura DECIMAL(5,2),
    IN precipitacion DECIMAL(6,2),
    IN humedad DECIMAL(5,2),
    IN condiciones VARCHAR(100)
)
BEGIN
    INSERT INTO Clima (fecha, temperatura, precipitacion, humedad, condiciones) 
    VALUES (fecha, temperatura, precipitacion, humedad, condiciones);
END //

DELIMITER ;


13. Actualizar Lote y Cultivo
DELIMITER //

CREATE PROCEDURE sp_actualizar_lote_cultivo(
    IN lote_cultivo_id INT,
    IN nuevo_estado VARCHAR(50)
)
BEGIN
    UPDATE Lote_Cultivos 
    SET estado = nuevo_estado 
    WHERE lote_cultivo_id = lote_cultivo_id;
END //

DELIMITER ;


14. Consultar Producción por Animal
DELIMITER //

CREATE PROCEDURE sp_consultar_produccion_animal(
    IN animal_id INT,
    OUT total DECIMAL(10,2)
)
BEGIN
    SELECT SUM(cantidad) INTO total 
    FROM Produccion_Animales 
    WHERE animal_id = animal_id;
END //

DELIMITER ;


15. Consultar Ventas por Cliente
DELIMITER //

CREATE PROCEDURE sp_consultar_ventas_por_cliente(
    IN cliente_id INT,
    OUT total_ventas INT
)
BEGIN
    SELECT COUNT(*) INTO total_ventas 
    FROM Ventas 
    WHERE cliente_id = cliente_id;
END //

DELIMITER ;


16. Actualizar Datos de Insumo
DELIMITER //

CREATE PROCEDURE sp_actualizar_datos_insumo(
    IN insumo_id INT,
    IN nombre VARCHAR(100),
    IN categoria VARCHAR(50),
    IN unidad_medida VARCHAR(20),
    IN stock_minimo DECIMAL(10,2)
)
BEGIN
    UPDATE Insumos 
    SET nombre = nombre, categoria = categoria, unidad_medida = unidad_medida, stock_minimo = stock_minimo 
    WHERE insumo_id = insumo_id;
END //

DELIMITER ;


17. Registrar Nuevos Cultivos
DELIMITER //

CREATE PROCEDURE sp_registrar_nuevo_cultivo(
    IN producto_id INT,
    IN variedad VARCHAR(100),
    IN dias_maduracion INT,
    IN temporada_siembra VARCHAR(50)
)
BEGIN
    INSERT INTO Cultivos (producto_id, variedad, dias_maduracion, temporada_siembra) 
    VALUES (producto_id, variedad, dias_maduracion, temporada_siembra);
END //

DELIMITER ;


18. Actualizar Estado de Animales
DELIMITER //

CREATE PROCEDURE sp_actualizar_estado_animal(
    IN animal_id INT,
    IN nuevo_estado VARCHAR(50)
)
BEGIN
    UPDATE Animales 
    SET estado = nuevo_estado 
    WHERE animal_id = animal_id;
END //

DELIMITER ;


19. Registrar Nuevo Almacén
DELIMITER //

CREATE PROCEDURE sp_registrar_nuevo_almacen(
    IN nombre VARCHAR(100),
    IN tipo VARCHAR(50),
    IN capacidad DECIMAL(10,2),
    IN ubicacion VARCHAR(200)
)
BEGIN
    INSERT INTO Almacenes (nombre, tipo, capacidad, ubicacion) 
    VALUES (nombre, tipo, capacidad, ubicacion);
END //

DELIMITER ;


20. Consultar Total de Ventas por Fecha
DELIMITER //

CREATE PROCEDURE sp_consultar_total_ventas_por_fecha(
    IN fecha DATE,
    OUT total DECIMAL(12,2)
)
BEGIN
    SELECT SUM(total) INTO total 
    FROM Ventas 
    WHERE fecha = fecha;
END //

DELIMITER ;

```
## 20 Funciones :

```sql
-- 1. Calcular rendimiento promedio por hectárea de un cultivo
DELIMITER //
CREATE FUNCTION fn_rendimiento_por_hectarea(p_cultivo_id INT, p_anno INT) 
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE v_rendimiento DECIMAL(10,2);
    
    SELECT AVG(pa.cantidad / lc.area) INTO v_rendimiento
    FROM Lote_Cultivos lc
    JOIN Cultivos c ON lc.cultivo_id = c.cultivo_id
    JOIN Productos p ON c.producto_id = p.producto_id
    JOIN Detalle_Ventas dv ON dv.producto_id = p.producto_id
    JOIN Ventas v ON dv.venta_id = v.venta_id
    WHERE c.cultivo_id = p_cultivo_id AND YEAR(v.fecha) = p_anno;
    
    RETURN COALESCE(v_rendimiento, 0);
END //
DELIMITER ;

-- 2. Calcular costo operativo total de la finca en un período
DELIMITER //
CREATE FUNCTION fn_costo_operativo_total(p_fecha_inicio DATE, p_fecha_fin DATE) 
RETURNS DECIMAL(12,2) DETERMINISTIC
BEGIN
    DECLARE v_costo_total DECIMAL(12,2);
    
    -- Costos de empleados
    SELECT 
        COALESCE(
            SUM(aa.horas_trabajadas * tt.costo_hora) +  -- Costo de actividades agrícolas
            SUM(e.salario * DATEDIFF(p_fecha_fin, p_fecha_inicio) / 365),  -- Costo de salarios
            0
        ) INTO v_costo_total
    FROM Empleados e
    LEFT JOIN Actividades_Agricolas aa ON e.empleado_id = aa.empleado_id
    LEFT JOIN Tipo_Trabajo tt ON aa.tipo_trabajo_id = tt.tipo_trabajo_id
    WHERE aa.fecha BETWEEN p_fecha_inicio AND p_fecha_fin OR aa.fecha IS NULL;
    
    RETURN v_costo_total;
END //
DELIMITER ;

-- 3. Calcular valor total de un tipo de producción animal
DELIMITER //
CREATE FUNCTION fn_valor_produccion_animal(p_especie VARCHAR(50), p_anno INT) 
RETURNS DECIMAL(12,2) DETERMINISTIC
BEGIN
    DECLARE v_valor_total DECIMAL(12,2);
    
    SELECT COALESCE(
        SUM(pa.cantidad * p.precio_referencia), 
        0
    ) INTO v_valor_total
    FROM Produccion_Animales pa
    JOIN Animales a ON pa.animal_id = a.animal_id
    JOIN Productos p ON p.nombre = pa.tipo_produccion
    WHERE a.especie = p_especie AND YEAR(pa.fecha) = p_anno;
    
    RETURN v_valor_total;
END //
DELIMITER ;

-- 4. Calcular edad promedio de los animales por especie
DELIMITER //
CREATE FUNCTION fn_edad_promedio_animales(p_especie VARCHAR(50)) 
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE v_edad_promedio INT;
    
    SELECT COALESCE(
        ROUND(AVG(DATEDIFF(CURRENT_DATE, fecha_nacimiento) / 365.25)), 
        0
    ) INTO v_edad_promedio
    FROM Animales
    WHERE especie = p_especie;
    
    RETURN v_edad_promedio;
END //
DELIMITER ;

-- 5. Calcular superficie total cultivada por producto
DELIMITER //
CREATE FUNCTION fn_superficie_cultivada(p_producto_id INT, p_anno INT) 
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE v_superficie DECIMAL(10,2);
    
    SELECT COALESCE(
        SUM(l.area), 
        0
    ) INTO v_superficie
    FROM Lotes l
    JOIN Lote_Cultivos lc ON l.lote_id = lc.lote_id
    JOIN Cultivos c ON lc.cultivo_id = c.cultivo_id
    WHERE c.producto_id = p_producto_id 
    AND YEAR(lc.fecha_inicio) = p_anno;
    
    RETURN v_superficie;
END //
DELIMITER ;

-- 6. Calcular ingresos totales por producto
DELIMITER //
CREATE FUNCTION fn_ingresos_producto(p_producto_id INT, p_anno INT) 
RETURNS DECIMAL(12,2) DETERMINISTIC
BEGIN
    DECLARE v_ingresos DECIMAL(12,2);
    
    SELECT COALESCE(
        SUM(dv.cantidad * dv.precio_unitario), 
        0
    ) INTO v_ingresos
    FROM Detalle_Ventas dv
    JOIN Ventas v ON dv.venta_id = v.venta_id
    WHERE dv.producto_id = p_producto_id AND YEAR(v.fecha) = p_anno;
    
    RETURN v_ingresos;
END //
DELIMITER ;

-- 7. Calcular días de retraso en tratamiento de plagas
DELIMITER //
CREATE FUNCTION fn_dias_retraso_tratamiento_plagas(p_lote_cultivo_id INT) 
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE v_dias_retraso INT;
    
    SELECT COALESCE(
        DATEDIFF(rp.tratamiento_aplicado, rp.fecha_deteccion), 
        0
    ) INTO v_dias_retraso
    FROM Registro_Plagas rp
    WHERE rp.lote_cultivo_id = p_lote_cultivo_id 
    AND rp.tratamiento_aplicado IS NOT NULL
    LIMIT 1;
    
    RETURN v_dias_retraso;
END //
DELIMITER ;

-- 8. Calcular stock promedio de insumos
DELIMITER //
CREATE FUNCTION fn_stock_promedio_insumos(p_categoria VARCHAR(50)) 
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE v_stock_promedio DECIMAL(10,2);
    
    SELECT COALESCE(
        AVG(i.stock_minimo), 
        0
    ) INTO v_stock_promedio
    FROM Insumos i
    WHERE i.categoria = p_categoria;
    
    RETURN v_stock_promedio;
END //
DELIMITER ;

-- 9. Calcular productividad de empleados
DELIMITER //
CREATE FUNCTION fn_productividad_empleado(p_empleado_id INT, p_anno INT) 
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE v_productividad DECIMAL(10,2);
    
    SELECT COALESCE(
        SUM(aa.horas_trabajadas) / 
        (DATEDIFF(CONCAT(p_anno, '-12-31'), CONCAT(p_anno, '-01-01')) / 365.25), 
        0
    ) INTO v_productividad
    FROM Actividades_Agricolas aa
    WHERE aa.empleado_id = p_empleado_id AND YEAR(aa.fecha) = p_anno;
    
    RETURN v_productividad;
END //
DELIMITER ;

-- 10. Calcular margen de contribución por venta
DELIMITER //
CREATE FUNCTION fn_margen_contribucion_venta(p_venta_id INT) 
RETURNS DECIMAL(12,2) DETERMINISTIC
BEGIN
    DECLARE v_margen DECIMAL(12,2);
    
    SELECT 
        v.total - 
        COALESCE(
            (SELECT SUM(ci.cantidad * ci.precio_unitario)
             FROM Compra_Insumos ci
             JOIN Insumos i ON ci.insumo_id = i.insumo_id
             JOIN Inventario inv ON inv.insumo_id = i.insumo_id
             JOIN Detalle_Ventas dv ON dv.producto_id = inv.producto_id
             WHERE dv.venta_id = p_venta_id
            ), 
            0
        ) INTO v_margen
    FROM Ventas v
    WHERE v.venta_id = p_venta_id;
    
    RETURN v_margen;
END //
DELIMITER ;

-- 11. Calcular días de maduración restantes para un cultivo
DELIMITER //
CREATE FUNCTION fn_dias_maduracion_restantes(p_lote_cultivo_id INT) 
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE v_dias_restantes INT;
    
    SELECT COALESCE(
        c.dias_maduracion - DATEDIFF(CURRENT_DATE, lc.fecha_inicio), 
        0
    ) INTO v_dias_restantes
    FROM Lote_Cultivos lc
    JOIN Cultivos c ON lc.cultivo_id = c.cultivo_id
    WHERE lc.lote_cultivo_id = p_lote_cultivo_id;
    
    RETURN v_dias_restantes;
END //
DELIMITER ;

-- 12. Calcular densidad de siembra
DELIMITER //
CREATE FUNCTION fn_densidad_siembra(p_lote_id INT) 
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE v_densidad DECIMAL(10,2);
    
    SELECT COALESCE(
        COUNT(lc.lote_cultivo_id) / l.area, 
        0
    ) INTO v_densidad
    FROM Lotes l
    LEFT JOIN Lote_Cultivos lc ON l.lote_id = lc.lote_id
    WHERE l.lote_id = p_lote_id
    GROUP BY l.lote_id, l.area;
    
    RETURN v_densidad;
END //
DELIMITER ;

-- 13. Calcular rotación de inventario de productos
DELIMITER //
CREATE FUNCTION fn_rotacion_inventario_producto(p_producto_id INT, p_anno INT) 
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE v_rotacion DECIMAL(10,2);
    
    SELECT COALESCE(
        SUM(dv.cantidad) / 
        AVG(inv.cantidad), 
        0
    ) INTO v_rotacion
    FROM Inventario inv
    JOIN Ventas v ON v.fecha BETWEEN DATE_SUB(CURRENT_DATE, INTERVAL 1 YEAR) AND CURRENT_DATE
    JOIN Detalle_Ventas dv ON dv.venta_id = v.venta_id
    WHERE inv.producto_id = p_producto_id AND YEAR(v.fecha) = p_anno;
    
    RETURN v_rotacion;
END //
DELIMITER ;

-- 14. Calcular costo promedio de tratamiento de plagas
DELIMITER //
CREATE FUNCTION fn_costo_tratamiento_plagas(p_plaga_id INT) 
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE v_costo_promedio DECIMAL(10,2);
    
    -- Simular costo estimado basado en registros de tratamientos
    SELECT COALESCE(
        AVG(LENGTH(tratamiento_aplicado) * 0.1),  -- Simple cost estimation
        0
    ) INTO v_costo_promedio
    FROM Registro_Plagas
    WHERE plaga_id = p_plaga_id;
    
    RETURN v_costo_promedio;
END //
DELIMITER ;

-- 15. Calcular porcentaje de ocupación de almacenes
DELIMITER //
CREATE FUNCTION fn_ocupacion_almacen(p_almacen_id INT) 
RETURNS DECIMAL(5,2) DETERMINISTIC
BEGIN
    DECLARE v_porcentaje_ocupacion DECIMAL(5,2);
    
    SELECT COALESCE(
        (SUM(inv.cantidad) / a.capacidad) * 100, 
        0
    ) INTO v_porcentaje_ocupacion
    FROM Almacenes a
    LEFT JOIN Inventario inv ON a.almacen_id = inv.almacen_id
    WHERE a.almacen_id = p_almacen_id
    GROUP BY a.almacen_id, a.capacidad;
    
    RETURN v_porcentaje_ocupacion;
END //
DELIMITER ;

-- 16. Calcular ingreso promedio por cliente
DELIMITER //
CREATE FUNCTION fn_ingreso_promedio_cliente(p_cliente_id INT) 
RETURNS DECIMAL(12,2) DETERMINISTIC
BEGIN
    DECLARE v_ingreso_promedio DECIMAL(12,2);
    
    SELECT COALESCE(
        AVG(v.total), 
        0
    ) INTO v_ingreso_promedio
    FROM Ventas v
    WHERE v.cliente_id = p_cliente_id;
    
    RETURN v_ingreso_promedio;
END //
DELIMITER ;

-- 17. Calcular volumen de ventas por tipo de cliente
DELIMITER //
CREATE FUNCTION fn_volumen_ventas_tipo_cliente(p_tipo_cliente VARCHAR(50)) 
RETURNS DECIMAL(12,2) DETERMINISTIC
BEGIN
    DECLARE v_volumen_ventas DECIMAL(12,2);
    
    SELECT COALESCE(
        SUM(v.total), 
        0
    ) INTO v_volumen_ventas
    FROM Ventas v
    JOIN Clientes c ON v.cliente_id = c.cliente_id
    WHERE c.tipo = p_tipo_cliente;
    
    RETURN v_volumen_ventas;
END //
DELIMITER ;

-- 18. Calcular tiempo promedio de maduracion de cultivos
DELIMITER //
CREATE FUNCTION fn_tiempo_promedio_maduracion(p_producto_id INT) 
RETURNS DECIMAL(10,2) DETERMINISTIC
BEGIN
    DECLARE v_tiempo_promedio DECIMAL(10,2);
    
    SELECT COALESCE(
        AVG(c.dias_maduracion), 
        0
    ) INTO v_tiempo_promedio
    FROM Cultivos c
    WHERE c.producto_id = p_producto_id;
    
    RETURN v_tiempo_promedio;
END //
DELIMITER ;

-- 19. Calcular valor total de inventario por almacén
DELIMITER //
CREATE FUNCTION fn_valor_inventario_almacen(p_almacen_id INT) 
RETURNS DECIMAL(12,2) DETERMINISTIC
BEGIN
    DECLARE v_valor_total DECIMAL(12,2);
    
    SELECT COALESCE(
        SUM(inv.cantidad * COALESCE(p.precio_referencia, i.stock_minimo)), 
        0
    ) INTO v_valor_total
    FROM Inventario inv
    LEFT JOIN Productos p ON inv.producto_id = p.producto_id
    LEFT JOIN Insumos i ON inv.insumo_id = i.insumo_id
    WHERE inv.almacen_id = p_almacen_id;
    
    RETURN v_valor_total;
END //
DELIMITER ;

-- 20. Calcular eficiencia de tratamiento de plagas
DELIMITER //
CREATE FUNCTION fn_eficiencia_tratamiento_plagas(p_lote_cultivo_id INT) 
RETURNS DECIMAL(5,2) DETERMINISTIC
BEGIN
    DECLARE

```
## 20 Triggers

```sql
-- Crear tabla de historial para triggers
CREATE TABLE Historial_Cambios (
    historial_id INT PRIMARY KEY AUTO_INCREMENT,
    tabla VARCHAR(50),
    registro_id INT,
    accion VARCHAR(50),
    usuario VARCHAR(100),
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Historial_Cambios (tabla, registro_id, accion, usuario)
VALUES 
('Clientes', 1, 'INSERT', 'Juan Perez'),
('Clientes', 2, 'UPDATE', 'Ana Gomez'),
('Clientes', 3, 'DELETE', 'Carlos Ruiz'),
('Ordenes', 1, 'INSERT', 'Maria Lopez'),
('Ordenes', 2, 'UPDATE', 'Pedro Martinez'),
('Ordenes', 3, 'DELETE', 'Sofia Jimenez'),
('Productos', 1, 'INSERT', 'Julio Santos'),
('Productos', 2, 'UPDATE', 'Laura Vega'),
('Productos', 3, 'DELETE', 'Miguel Torres'),
('Inventario', 1, 'INSERT', 'Claudia Rios'),
('Inventario', 2, 'UPDATE', 'Luis Alvarado'),
('Inventario', 3, 'DELETE', 'Eva Castro'),
('Proveedores', 1, 'INSERT', 'Richard Viera'),
('Proveedores', 2, 'UPDATE', 'Natalia Pinto'),
('Proveedores', 3, 'DELETE', 'Fernando Silva'),
('Clientes', 4, 'INSERT', 'Raul Ortega'),
('Clientes', 5, 'UPDATE', 'Gabriela Morera'),
('Ordenes', 4, 'INSERT', 'Victor Soto'),
('Ordenes', 5, 'UPDATE', 'Isabel Cordero'),
('Productos', 4, 'INSERT', 'Guillermo Pablo'),
('Productos', 5, 'UPDATE', 'Juliana Bravo'),
('Inventario', 4, 'INSERT', 'Braulio Reyes'),
('Inventario', 5, 'UPDATE', 'Cecilia Guerrero'),
('Proveedores', 4, 'INSERT', 'Hugo Ramirez'),
('Proveedores', 5, 'UPDATE', 'Veronica Salas'),
('Clientes', 6, 'INSERT', 'Jose Martinez'),
('Clientes', 7, 'DELETE', 'Lorena Molina'),
('Ordenes', 6, 'INSERT', 'Esteban Castro'),
('Ordenes', 7, 'UPDATE', 'Raquel Serrano'),
('Productos', 6, 'INSERT', 'Barbosa Rivas'),
('Productos', 7, 'DELETE', 'Carmen Salinas'),
('Inventario', 6, 'INSERT', 'Diego Mendez'),
('Inventario', 7, 'UPDATE', 'Alina Ramos'),
('Proveedores', 6, 'INSERT', 'Ignacio Suarez'),
('Proveedores', 7, 'DELETE', 'Santiago Olivares'),
('Clientes', 8, 'INSERT', 'Carla Aguirre'),
('Clientes', 9, 'UPDATE', 'Fernando Espinoza'),
('Ordenes', 8, 'INSERT', 'Rita Barrera'),
('Ordenes', 9, 'DELETE', 'Pablo Quintero'),
('Productos', 8, 'INSERT', 'Sandra Pacheco'),
('Productos', 9, 'UPDATE', 'Alfredo Jaramillo'),
('Inventario', 8, 'DELETE', 'Estefania Aguado'),
('Inventario', 9, 'INSERT', 'Omar Medina'),
('Proveedores', 8, 'UPDATE', 'Daniela Méndez'),
('Proveedores', 9, 'DELETE', 'Javier Carrasco'),
('Clientes', 10, 'INSERT', 'Fernando Montoya'),
('Clientes', 11, 'UPDATE', 'Nora Quintana'),
('Ordenes', 10, 'INSERT', 'Susana Calderón'),
('Ordenes', 11, 'DELETE', 'Karl Pizarro'),
('Productos', 10, 'INSERT', 'Patricia Cifuentes'),
('Productos', 11, 'UPDATE', 'Felipe Romero'),
('Inventario', 10, 'INSERT', 'Clara Cruz'),
('Inventario', 11, 'UPDATE', 'Susana Villanueva'),
('Proveedores', 10, 'INSERT', 'Nicolas Paredes'),
('Proveedores', 11, 'DELETE', 'Gloria de La Vega'),
('Clientes', 12, 'INSERT', 'Lina Espitia'),
('Clientes', 13, 'UPDATE', 'Horacio Archila'),
('Ordenes', 12, 'DELETE', 'Francisco Londoño'),
('Ordenes', 13, 'INSERT', 'Valeria Vargas'),
('Productos', 12, 'UPDATE', 'Yasmin Pavia'),
('Productos', 13, 'DELETE', 'Tania Aponte');




-- Crear tabla de historial de salarios
CREATE TABLE Historial_Salarios (
    historial_salario_id INT PRIMARY KEY AUTO_INCREMENT,
    empleado_id INT,
    salario_anterior DECIMAL(10,2),
    salario_nuevo DECIMAL(10,2),
    fecha_cambio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    usuario VARCHAR(100)
);

INSERT INTO Historial_Salarios (empleado_id, salario_anterior, salario_nuevo, usuario)
VALUES 
(1, 1500.00, 1600.00, 'Juan Perez'),
(2, 1800.00, 1900.00, 'Ana Gomez'),
(3, 2000.00, 2100.00, 'Carlos Ruiz'),
(4, 2200.00, 2300.00, 'Maria Lopez'),
(5, 2500.00, 2600.00, 'Pedro Martinez'),
(6, 1700.00, 1750.00, 'Sofia Jimenez'),
(7, 2300.00, 2400.00, 'Julio Santos'),
(8, 1400.00, 1450.00, 'Laura Vega'),
(9, 1600.00, 1650.00, 'Miguel Torres'),
(10, 2100.00, 2200.00, 'Claudia Rios'),
(11, 1900.00, 1950.00, 'Luis Alvarado'),
(12, 2400.00, 2500.00, 'Eva Castro'),
(13, 1300.00, 1350.00, 'Richard Viera'),
(14, 1600.00, 1700.00, 'Natalia Pinto'),
(15, 2000.00, 2050.00, 'Fernando Silva'),
(16, 1800.00, 1850.00, 'Raul Ortega'),
(17, 2100.00, 2200.00, 'Gabriela Morera'),
(18, 1750.00, 1800.00, 'Victor Soto'),
(19, 1550.00, 1580.00, 'Isabel Cordero'),
(20, 2400.00, 2500.00, 'Guillermo Pablo'),
(21, 1450.00, 1500.00, 'Juliana Bravo'),
(22, 1650.00, 1700.00, 'Braulio Reyes'),
(23, 1550.00, 1600.00, 'Cecilia Guerrero'),
(24, 1300.00, 1350.00, 'Hugo Ramirez'),
(25, 1750.00, 1800.00, 'Veronica Salas'),
(26, 1800.00, 1850.00, 'Jose Martinez'),
(27, 1900.00, 1950.00, 'Lorena Molina'),
(28, 2200.00, 2300.00, 'Esteban Castro'),
(29, 2000.00, 2050.00, 'Raquel Serrano'),
(30, 2400.00, 2450.00, 'Barbosa Rivas'),
(31, 1500.00, 1550.00, 'Carmen Salinas'),
(32, 1700.00, 1750.00, 'Diego Mendez'),
(33, 2250.00, 2300.00, 'Alina Ramos'),
(34, 1850.00, 1900.00, 'Ignacio Suarez'),
(35, 1700.00, 1750.00, 'Santiago Olivares'),
(36, 1500.00, 1550.00, 'Carla Aguirre'),
(37, 1600.00, 1650.00, 'Fernando Espinoza'),
(38, 2200.00, 2250.00, 'Rita Barrera'),
(39, 2300.00, 2350.00, 'Pablo Quintero'),
(40, 2500.00, 2550.00, 'Sandra Pacheco'),
(41, 1700.00, 1750.00, 'Alfredo Jaramillo'),
(42, 1400.00, 1450.00, 'Estefania Aguado'),
(43, 1800.00, 1900.00, 'Omar Medina'),
(44, 1650.00, 1700.00, 'Daniela Méndez'),
(45, 2000.00, 2050.00, 'Javier Carrasco'),
(46, 1750.00, 1800.00, 'Lina Espitia'),
(47, 2100.00, 2150.00, 'Horacio Archila'),
(48, 1850.00, 1900.00, 'Francisco Londoño'),
(49, 2250.00, 2300.00, 'Valeria Vargas'),
(50, 2400.00, 2450.00, 'Yasmin Pavia'),
(51, 1500.00, 1550.00, 'Tania Aponte'),
(52, 1600.00, 1650.00, 'Fernando Montoya'),
(53, 1700.00, 1800.00, 'Nora Quintana'),
(54, 1750.00, 1800.00, 'Susana Calderón'),
(55, 1850.00, 1900.00, 'Karl Pizarro'),
(56, 1900.00, 1950.00, 'Patricia Cifuentes'),
(57, 2000.00, 2050.00, 'Felipe Romero'),
(58, 2100.00, 2150.00, 'Clara Cruz'),
(59, 2200.00, 2250.00, 'Susana Villanueva'),
(60, 2500.00, 2600.00, 'Nicolas Paredes'),
(61, 2300.00, 2400.00, 'Gloria de La Vega'),
(62, 1800.00, 1850.00, 'Lina Espitia'),
(63, 1900.00, 1950.00, 'Horacio Archila'),
(64, 2000.00, 2050.00, 'Francisco Londoño'),
(65, 2200.00, 2250.00, 'Valeria Vargas'),
(66, 2400.00, 2500.00, 'Yasmin Pavia'),
(67, 1500.00, 1550.00, 'Tania Aponte'),
(68, 1600.00, 1650.00, 'Fernando Montoya'),
(69, 1700.00, 1750.00, 'Nora Quintana'),
(70, 1800.00, 1850.00, 'Susana Calderón');




-- 1. Trigger para actualizar inventario al insertar una venta
DELIMITER //
CREATE TRIGGER trg_actualizar_inventario_venta 
AFTER INSERT ON Detalle_Ventas
FOR EACH ROW
BEGIN
    -- Reducir stock de productos vendidos
    UPDATE Inventario 
    SET cantidad = cantidad - NEW.cantidad,
        fecha_actualizacion = CURRENT_DATE
    WHERE producto_id = NEW.producto_id;
END //

-- 2. Trigger para registrar cambios de salario de empleados
CREATE TRIGGER trg_registro_cambio_salario
BEFORE UPDATE ON Empleados
FOR EACH ROW
BEGIN
    IF OLD.salario <> NEW.salario THEN
        INSERT INTO Historial_Salarios 
        (empleado_id, salario_anterior, salario_nuevo, usuario) 
        VALUES 
        (NEW.empleado_id, OLD.salario, NEW.salario, USER());
    END IF;
END //

-- 3. Trigger para validar inserción de nuevos cultivos
CREATE TRIGGER trg_validar_cultivo
BEFORE INSERT ON Cultivos
FOR EACH ROW
BEGIN
    IF NEW.dias_maduracion <= 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Los días de maduración deben ser positivos';
    END IF;
END //

-- 4. Trigger para actualizar estado de lote de cultivo
CREATE TRIGGER trg_actualizar_estado_lote_cultivo
BEFORE INSERT ON Lote_Cultivos
FOR EACH ROW
BEGIN
    -- Marcar lote como ocupado
    UPDATE Lotes 
    SET estado = 'Ocupado' 
    WHERE lote_id = NEW.lote_id;
END //

-- 5. Trigger para registro de cambios en tablas principales
DELIMITER // CREATE TRIGGER trg_registrar_cambios_empleados 
AFTER INSERT ON Empleados 
FOR EACH ROW
 BEGIN 
INSERT INTO Historial_Cambios (tabla, registro_id, accion, usuario)
 VALUES ('Empleados', NEW.empleado_id, 'Inserción', USER()); 
END; //
 CREATE TRIGGER trg_registrar_actualizacion_empleados 
AFTER UPDATE ON Empleados 
FOR EACH ROW
 BEGIN
 INSERT INTO Historial_Cambios (tabla, registro_id, accion, usuario) 
VALUES ('Empleados', NEW.empleado_id, 'Actualización', USER());
 END; //

-- 6. Trigger para validar compra de insumos
CREATE TRIGGER trg_validar_compra_insumos
BEFORE INSERT ON Compra_Insumos
FOR EACH ROW
BEGIN
    IF NEW.cantidad <= 0 OR NEW.precio_unitario <= 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Cantidad y precio deben ser positivos';
    END IF;
END //

-- 7. Trigger para actualizar stock de insumos
CREATE TRIGGER trg_actualizar_stock_insumos
AFTER INSERT ON Compra_Insumos
FOR EACH ROW
BEGIN
    -- Actualizar inventario de insumos
    INSERT INTO Inventario 
    (almacen_id, insumo_id, cantidad, fecha_actualizacion)
    SELECT 
        a.almacen_id, 
        NEW.insumo_id, 
        NEW.cantidad, 
        CURRENT_DATE
    FROM Almacenes a
    WHERE a.tipo = 'Insumos'
    LIMIT 1
    ON DUPLICATE KEY UPDATE 
        cantidad = cantidad + NEW.cantidad,
        fecha_actualizacion = CURRENT_DATE;
END //

-- 8. Trigger para control de plagas
CREATE TRIGGER trg_alerta_plagas
AFTER INSERT ON Registro_Plagas
FOR EACH ROW
BEGIN
    IF NEW.nivel_afectacion = 'Alto' THEN
        -- Simular una alerta (en un sistema real, esto podría enviar un correo o notificación)
        INSERT INTO Historial_Cambios 
        (tabla, registro_id, accion, usuario) 
        VALUES 
        ('Registro_Plagas', NEW.registro_plaga_id, 'Alerta de Plaga', USER());
    END IF;
END //

-- 9. Trigger para validar ventas
CREATE TRIGGER trg_validar_venta
BEFORE INSERT ON Ventas
FOR EACH ROW
BEGIN
    IF NEW.total <= 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El total de venta debe ser mayor a cero';
    END IF;
END //

-- 10. Trigger para actualizar estado de animales
CREATE TRIGGER trg_actualizar_estado_animal
BEFORE UPDATE ON Animales
FOR EACH ROW
BEGIN
    -- Cambiar estado si no está produciendo
    IF NEW.estado = 'Activo' AND 
       NOT EXISTS (
           SELECT 1 FROM Produccion_Animales 
           WHERE animal_id = NEW.animal_id 
           AND fecha >= DATE_SUB(CURRENT_DATE, INTERVAL 6 MONTH)
       ) THEN
        SET NEW.estado = 'Inactivo';
    END IF;
END //

-- 11. Trigger para control de capacidad de almacén
CREATE TRIGGER trg_control_capacidad_almacen
BEFORE INSERT ON Inventario
FOR EACH ROW
BEGIN
    DECLARE capacidad_actual DECIMAL(10,2);
    DECLARE ocupacion_total DECIMAL(10,2);

    SELECT capacidad INTO capacidad_actual 
    FROM Almacenes 
    WHERE almacen_id = NEW.almacen_id;

    SELECT COALESCE(SUM(cantidad), 0) INTO ocupacion_total
    FROM Inventario
    WHERE almacen_id = NEW.almacen_id;

    IF (ocupacion_total + NEW.cantidad) > capacidad_actual THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Capacidad de almacén excedida';
    END IF;
END //

-- 12. Trigger para seguimiento de actividades agrícolas
CREATE TRIGGER trg_registro_actividades
AFTER INSERT ON Actividades_Agricolas
FOR EACH ROW
BEGIN
    -- Actualizar última actividad en el lote
    UPDATE Lotes 
    SET updated_at = CURRENT_TIMESTAMP 
    WHERE lote_id = NEW.lote_id;
END //

-- 13. Trigger para validar planificación agrícola
CREATE TRIGGER trg_validar_planificacion
BEFORE INSERT ON Planificacion_Agricola
FOR EACH ROW
BEGIN
    DECLARE area_total DECIMAL(10,2);
    
    SELECT area INTO area_total 
    FROM Lotes 
    WHERE lote_id = NEW.lote_id;
    
    IF NEW.area_planificada > area_total THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Área planificada excede el área total del lote';
    END IF;
END //

-- 14. Trigger para manejo de producción animal
CREATE TRIGGER trg_registrar_produccion_animal
AFTER INSERT ON Produccion_Animales
FOR EACH ROW
BEGIN
    -- Actualizar estado del animal si tiene producción
    UPDATE Animales 
    SET estado = 'Productivo' 
    WHERE animal_id = NEW.animal_id;
END //

-- 15. Trigger para control de tipos de contrato
CREATE TRIGGER trg_validar_tipo_contrato
BEFORE INSERT ON Empleados
FOR EACH ROW
BEGIN
    IF NEW.tipo_contrato NOT IN ('Tiempo Completo', 'Medio Tiempo', 'Temporal', 'Eventual') THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Tipo de contrato no válido';
    END IF;
END //

-- 16. Trigger para actualización de estado de cultivos
CREATE TRIGGER trg_actualizar_estado_cultivo
BEFORE UPDATE ON Lote_Cultivos
FOR EACH ROW
BEGIN
    -- Cambiar estado según días de maduración
    DECLARE dias_transcurridos INT;
    DECLARE dias_maduracion INT;
    
    SELECT c.dias_maduracion INTO dias_maduracion
    FROM Cultivos c
    WHERE c.cultivo_id = NEW.cultivo_id;
    
    SET dias_transcurridos = DATEDIFF(CURRENT_DATE, NEW.fecha_inicio);
    
    IF dias_transcurridos >= dias_maduracion THEN
        SET NEW.estado = 'Maduro';
    ELSEIF dias_transcurridos > (dias_maduracion / 2) THEN
        SET NEW.estado = 'Desarrollo';
    ELSE
        SET NEW.estado = 'Inicial';
    END IF;
END //

-- 17. Trigger para auditar cambios en clientes
CREATE TRIGGER trg_auditar_clientes
AFTER UPDATE ON Clientes
FOR EACH ROW
BEGIN
    INSERT INTO Historial_Cambios 
    (tabla, registro_id, accion, usuario) 
    VALUES 
    ('Clientes', NEW.cliente_id, 'Actualización', USER());
END //

-- 18. Trigger para prevenir eliminación de registros críticos
CREATE TRIGGER trg_prevenir_eliminacion_ventas
BEFORE DELETE ON Ventas
FOR EACH ROW
BEGIN
    SIGNAL SQLSTATE '45000' 
    SET MESSAGE_TEXT = 'No se pueden eliminar registros de ventas';
END //

-- 19. Trigger para gestión de stock mínimo de insumos
CREATE TRIGGER trg_alerta_stock_minimo
AFTER UPDATE ON Inventario
FOR EACH ROW
BEGIN
    DECLARE stock_minimo DECIMAL(10,2);
    
    -- Verificar stock mínimo para insumos
    SELECT stock_minimo INTO stock_minimo
    FROM Insumos
    WHERE insumo_id = NEW.insumo_id;
    
    IF NEW.cantidad <= stock_minimo THEN
        INSERT INTO Historial_Cambios 
        (tabla, registro_id, accion, usuario) 
        VALUES 
        ('Inventario', NEW.inventario_id, 'Alerta de Stock Bajo', USER());
    END IF;
END //

-- 20. Trigger para registro de condiciones climáticas críticas
CREATE TRIGGER trg_registro_clima_critico
AFTER INSERT ON Clima
FOR EACH ROW
BEGIN
    IF NEW.temperatura > 35 OR NEW.temperatura < -5 OR 
       NEW.precipitacion > 100 OR NEW.humedad > 90 THEN
        INSERT INTO Historial_Cambios 
        (tabla, registro_id, accion, usuario) 
        VALUES 
        ('Clima', NEW.clima_id, 'Condición Climática Crítica', USER());
    END IF;
END //

DELIMITER ;




CREATE TABLE Roles (
    rol_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    descripcion TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE Usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_usuario VARCHAR(50) NOT NULL UNIQUE,
    contrasena VARCHAR(255) NOT NULL,  -- almacenar la contraseña hash
    rol_id INT,
    estado VARCHAR(20) DEFAULT 'activo',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (rol_id) REFERENCES Roles(rol_id)
);


CREATE TABLE Permisos (
    permiso_id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    descripcion TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE Rol_Permiso (
    rol_id INT,
    permiso_id INT,
    PRIMARY KEY (rol_id, permiso_id),
    FOREIGN KEY (rol_id) REFERENCES Roles(rol_id),
    FOREIGN KEY (permiso_id) REFERENCES Permisos(permiso_id)
);


INSERT INTO Roles (nombre, descripcion) VALUES
('Administrador', 'Acceso total al sistema'),
('Vendedor', 'Manejo de ventas e inventario'),
('Contador', 'Manejo de reportes financieros'),
('Agro-Técnico', 'Control de actividades agrícolas y plagas'),
('Almacenista', 'Control sobre insumos y almacenes'),
('Supervisor', 'Supervisión de actividades en finca'),
('Técnico Agrícola', 'Asesoramiento sobre cultivos y plagas'),
('Jefe de Operaciones', 'Gestión de operaciones diarias'),
('Coordinador de Ventas', 'Planificación de ventas y promociones'),
('Auxiliar Contable', 'Apoyo en tareas contables'),
('Responsable de Recursos Humanos', 'Gestión del personal'),
('Analista de Finanzas', 'Análisis de datos financieros'),
('Asistente de Ventas', 'Apoyo a las ventas diarias'),
('Gestor de Compras', 'Manejo de compras y proveedores'),
('Técnico de Almacén', 'Manejo de inventario en almacen'),
('Gestor de Proyectos', 'Planificación y seguimiento de proyectos'),
('Investigador Agrícola', 'Investigación en nuevas prácticas agrícolas'),
('Técnico de Riego', 'Especialista en sistemas de riego'),
('Asistente Administrativo', 'Apoyo administrativo general'),
('Gerente de Planta', 'Supervisión de procesos de producción'),
('Coordinador de Logística', 'Manejo de la logística y distribución'),
('Operador de Maquinaria', 'Operación de maquinaria agrícola'),
('Asesor de Cultivos', 'Asesoramiento en variedades de cultivos'),
('Controlador de Calidad', 'Verificación de calidad de productos'),
('Encargado de Fertilizantes', 'Gestión de fertilizantes y productos químicos'),
('Cajero', 'Manejo de caja y atención al cliente'),
('Encargado de Seguridad', 'Supervisión de seguridad en la finca'),
('Responsable de Mantenimiento', 'Mantenimiento de instalaciones'),
('Atención al Cliente', 'Gestión de relaciones con clientes'),
('Actuario', 'Estadísticas y auditoría de procesos'),
('Investigador de Plagas', 'Investigación sobre plagas y control'),
('Analista de Datos', 'Análisis de información y métricas'),
('Asistente en Campo', 'Apoyo en actividades de campo'),
('Coordinador de Capacitación', 'Gestión de capacitación de personal'),
('Asesor en Sustentabilidad', 'Asesoría en prácticas agrícolas sustentables'),
('Encargado de Inversiones', 'Gestión de inversiones agrícolas'),
('Responsable de Calidad', 'Mantenimiento de estándares de calidad'),
('Auxiliar de Oficina', 'Apoyo en tareas administrativas'),
('Gestor de Relaciones Públicas', 'Manejo de relaciones públicas'),
('Coordinador de Benificios', 'Gestión de beneficios para empleados'),
('Ingeniero Agrónomo', 'Diseño de procesos agrícolas'),
('Encargado de Demostración', 'Demostración de productos'),
('Gestor de Experiencia del Cliente', 'Optimización de la experiencia del cliente'),
('Conserje', 'Mantenimiento y limpieza general'),
('Promotor de Ventas', 'Promoción de productos y ventas'),
('Operador de Camiones', 'Manejo de transporte y logística');



INSERT INTO Permisos (nombre, descripcion) VALUES
('crear_venta', 'Permite crear ventas'),
('leer_venta', 'Permite leer ventas'),
('actualizar_venta', 'Permite actualizar ventas'),
('eliminar_venta', 'Permite eliminar ventas'),
('acceso_inventario', 'Acceso a inventario'),
('crear_cliente', 'Permite crear clientes'),
('leer_cliente', 'Permite leer clientes'),
('actualizar_cliente', 'Permite actualizar clientes'),
('eliminar_cliente', 'Permite eliminar clientes'),
('consultar_reportes', 'Permite consultar reportes'),
('crear_actividad', 'Permite crear actividades agrícolas'),
('actualizar_actividad', 'Permite actualizar actividades agrícolas'),
('eliminar_actividad', 'Permite eliminar actividades agrícolas'),
('consultar_inventario', 'Permite consultar inventario'),
('crear_producto', 'Permite crear nuevos productos'),
('actualizar_producto', 'Permite actualizar productos existentes'),
('eliminar_producto', 'Permite eliminar productos'),
('consultar_proveedores', 'Permite consultar proveedores'),
('crear_proveedor', 'Permite crear nuevos proveedores'),
('actualizar_proveedor', 'Permite actualizar información de proveedores'),
('eliminar_proveedor', 'Permite eliminar proveedores'),
('acceso_plagas', 'Acceso a gestión de plagas'),
('crear_insumo', 'Permite crear insumos'),
('actualizar_insumo', 'Permite actualizar insumos'),
('eliminar_insumo', 'Permite eliminar insumos'),
('consultar_insumos', 'Permite consultar insumos'),
('crear_compra', 'Permite registrar compras de insumos'),
('consultar_compra', 'Permite consultar compras');




INSERT INTO Usuarios (nombre_usuario, contrasena, rol_id, estado) VALUES
('admin', 'hash_de_contraseña1', 1, 'activo'),
('vendedor1', 'hash_de_contraseña2', 2, 'activo'),
('contador1', 'hash_de_contraseña3', 3, 'activo'),
('tecnico1', 'hash_de_contraseña4', 4, 'activo'),
('almacenista1', 'hash_de_contraseña5', 5, 'activo'),
('supervisor1', 'hash_de_contraseña6', 6, 'activo'),
('tecnicoagr1', 'hash_de_contraseña7', 7, 'activo'),
('jefe_operaciones', 'hash_de_contraseña8', 8, 'activo'),
('coordinador_ventas', 'hash_de_contraseña9', 9, 'activo'),
('auxiliar_contable', 'hash_de_contraseña10', 10, 'activo'),
('rrhh1', 'hash_de_contraseña11', 11, 'activo'),
('analista_finanzas', 'hash_de_contraseña12', 12, 'activo'),
('asistente_ventas', 'hash_de_contraseña13', 13, 'activo'),
('gestor_compras', 'hash_de_contraseña14', 14, 'activo'),
('tecnico_almacen', 'hash_de_contraseña15', 15, 'activo'),
('gestor_proyectos', 'hash_de_contraseña16', 16, 'activo'),
('investigador_agr', 'hash_de_contraseña17', 17, 'activo'),
('tecnico_riego', 'hash_de_contraseña18', 18, 'activo'),
('asistente_admin', 'hash_de_contraseña19', 19, 'activo'),
('gerente_planta', 'hash_de_contraseña20', 20, 'activo'),
('coordinador_logistica', 'hash_de_contraseña21', 21, 'activo'),
('operador_maquinaria', 'hash_de_contraseña22', 22, 'activo'),
('asesor_cultivos', 'hash_de_contraseña23', 23, 'activo'),
('controlador_calidad', 'hash_de_contraseña24', 24, 'activo'),
('encargado_fertilizantes', 'hash_de_contraseña25', 25, 'activo'),
('cajero1', 'hash_de_contraseña26', 26, 'activo'),
('encargado_seguridad', 'hash_de_contraseña27', 27, 'activo'),
('responsable_mantenimiento', 'hash_de_contraseña28', 28, 'activo'),
('atencion_cliente', 'hash_de_contraseña29', 29, 'activo'),
('actuario1', 'hash_de_contraseña30', 30, 'activo'),
('investigador_plagas', 'hash_de_contraseña31', 31, 'activo'),
('analista_datos', 'hash_de_contraseña32', 32, 'activo'),
('asistente_campo', 'hash_de_contraseña33', 33, 'activo'),
('coordinador_capacitacion', 'hash_de_contraseña34', 34, 'activo'),
('asesor_sustentabilidad', 'hash_de_contraseña35', 35, 'activo'),
('encargado_inversiones', 'hash_de_contraseña36', 36, 'activo'),
('responsable_calidad', 'hash_de_contraseña37', 37, 'activo'),
('auxiliar_oficina', 'hash_de_contraseña38', 38, 'activo'),
('gestor_relaciones_publicas', 'hash_de_contraseña39', 39, 'activo'),
('coordinador_beneficios', 'hash_de_contraseña40', 40, 'activo'),
('ingeniero_agronomo', 'hash_de_contraseña41', 41, 'activo'),
('encargado_demostracion', 'hash_de_contraseña42', 42, 'activo'),
('gestor_experiencia_cliente', 'hash_de_contraseña43', 43, 'activo'),
('conserje1', 'hash_de_contraseña44', 44, 'activo'),
('promotor_ventas', 'hash_de_contraseña45', 45, 'activo'),
('operador_camiones', 'hash_de_contraseña46', 46, 'activo'),
('tecnico_riego2', 'hash_de_contraseña47', 47, 'activo'),
('analista_calidad', 'hash_de_contraseña48', 48, 'activo'),
('coordinador_fertilizantes', 'hash_de_contraseña49', 49, 'activo'),
('tecnico_almacen2', 'hash_de_contraseña50', 50, 'activo');
                 

INSERT INTO Permisos (permiso_id, nombre, descripcion) VALUES
(1, 'Gestionar usuarios', 'Crear, editar y eliminar usuarios en el sistema'),
(2, 'Gestionar roles', 'Crear, editar y eliminar roles de usuarios'),
(3, 'Asignar permisos', 'Asignar permisos específicos a roles'),
(4, 'Ver auditorías', 'Consultar logs de auditoría del sistema'),
(5, 'Configurar sistema', 'Modificar configuraciones generales del sistema'),
(6, 'Crear ventas', 'Registrar nuevas ventas en el sistema'),
(7, 'Editar ventas', 'Modificar ventas existentes'),
(8, 'Eliminar ventas', 'Eliminar ventas registradas'),
(9, 'Consultar ventas', 'Ver listado y detalles de ventas'),
(10, 'Generar reportes de ventas', 'Crear reportes analíticos de ventas'),
(11, 'Registrar actividades agrícolas', 'Registrar labores realizadas en los campos o lotes'),
(12, 'Consultar actividades agrícolas', 'Ver las actividades registradas'),
(13, 'Planificar cultivos', 'Planificar fechas, lotes y recursos para cultivos'),
(14, 'Gestionar lotes', 'Crear, editar y consultar lotes agrícolas'),
(15, 'Consultar estadísticas de cultivos', 'Analizar datos de cultivos históricos'),
(16, 'Registrar insumos', 'Agregar nuevos insumos al inventario'),
(17, 'Registrar productos', 'Registrar productos agrícolas en el sistema'),
(18, 'Consultar inventario', 'Consultar niveles actuales de insumos y productos'),
(19, 'Actualizar inventario', 'Modificar las cantidades de insumos y productos'),
(20, 'Generar reportes de inventario', 'Crear reportes analíticos del estado del inventario'),
(21, 'Registrar compras', 'Registrar compras realizadas a proveedores'),
(22, 'Consultar compras', 'Ver el historial de compras registradas'),
(23, 'Generar reportes financieros', 'Crear reportes financieros generales'),
(24, 'Configurar precios de productos', 'Asignar o modificar precios de venta de productos'),
(25, 'Gestionar cuentas por cobrar', 'Registrar y consultar cuentas pendientes de cobro'),
(26, 'Registrar plagas', 'Documentar la aparición de plagas en lotes o cultivos'),
(27, 'Consultar registros de plagas', 'Consultar información de plagas registradas'),
(28, 'Registrar condiciones climáticas', 'Registrar información climática en el sistema'),
(29, 'Consultar reportes climáticos', 'Consultar datos históricos del clima'),
(30, 'Generar alertas de plagas', 'Configurar alertas para riesgos de plagas'),
(31, 'Generar reportes generales', 'Crear reportes sobre diferentes áreas del sistema'),
(32, 'Consultar histórico de lotes', 'Ver el historial de uso y producción de lotes'),
(33, 'Consultar datos de clientes', 'Acceder a la información de clientes registrados'),
(34, 'Consultar datos de proveedores', 'Acceder a la información de proveedores registrados'),
(35, 'Consultar datos de empleados', 'Acceder a la información del personal'),
(36, 'Realizar copias de seguridad', 'Generar copias de seguridad del sistema'),
(37, 'Restaurar sistema', 'Restaurar el sistema a partir de una copia de seguridad'),
(38, 'Consultar logs de acceso', 'Ver registros de acceso al sistema'),
(39, 'Gestionar contraseñas', 'Restablecer o cambiar contraseñas de usuarios'),
(40, 'Desactivar usuarios', 'Suspender el acceso de usuarios al sistema'),
(41, 'Registrar producción animal', 'Registrar datos de producción de animales'),
(42, 'Consultar producción animal', 'Acceder al historial de producción de animales'),
(43, 'Registrar eventos sanitarios', 'Registrar enfermedades y tratamientos en animales'),
(44, 'Consultar eventos sanitarios', 'Ver información de salud animal registrada'),
(45, 'Planificar rotación de cultivos', 'Planificar la rotación de cultivos en los lotes'),
(46, 'Registrar maquinaria agrícola', 'Registrar equipos y maquinaria disponibles'),
(47, 'Consultar estado de maquinaria', 'Ver el estado y mantenimiento de equipos agrícolas'),
(48, 'Registrar costos operativos', 'Registrar costos asociados a las operaciones agrícolas'),
(49, 'Consultar costos operativos', 'Consultar datos financieros de costos agrícolas'),
(50, 'Registrar datos de exportación', 'Registrar y consultar productos destinados a exportación');

```
## Modelo de base de datos

![image](https://github.com/user-attachments/assets/8785320d-c49a-4ff7-b013-cbb944a53b0c)

## DESAROLLADO :

Nilson Eduardo Carvajal Parada y jeisson Stiven Perez Gonzales

