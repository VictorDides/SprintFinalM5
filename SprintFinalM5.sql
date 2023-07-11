SET AUTOCOMMIT = FALSE;
COMMIT;

CREATE TABLE usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  edad INT NOT NULL,
  correo VARCHAR(50) NOT NULL,
  veces_utilizado INT DEFAULT 1
);

CREATE TABLE operarios (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  edad INT NOT NULL,
  correo VARCHAR(50) NOT NULL,
  veces_soporte INT DEFAULT 1
);

CREATE TABLE operaciones (
  id INT AUTO_INCREMENT PRIMARY KEY,
  id_operario INT,
  id_usuario INT,
  fecha DATE,
  evaluacion INT,
  FOREIGN KEY (id_operario) REFERENCES operarios(id),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id)
);

INSERT INTO usuarios (nombre, apellido, edad, correo, veces_utilizado) VALUES
  ('Juan', 'Pérez', 25, 'juan@gmail.com', 3),
  ('María', 'Gómez', 30, 'maria@gmail.com', 5),
  ('Pedro', 'López', 35, 'pedro@gmail.com', 2),
  ('Laura', 'Hernández', 28, 'laura@gmail.com', 4),
  ('Carlos', 'Rodríguez', 40, 'carlos@gmail.com', 6);

INSERT INTO operarios (nombre, apellido, edad, correo, veces_soporte) VALUES
  ('Ana', 'Martínez', 27, 'ana@gmail.com', 2),
  ('Luis', 'García', 32, 'luis@gmail.com', 1),
  ('Sofía', 'López', 29, 'sofia@gmail.com', 3),
  ('Javier', 'Hernández', 35, 'javier@gmail.com', 4),
  ('Lucía', 'Ramírez', 31, 'lucia@gmail.com', 2);

INSERT INTO operaciones (id_operario, id_usuario, fecha, evaluacion) VALUES
  (1, 1, '2023-07-01', 4),
  (2, 2, '2023-07-02', 3),
  (3, 3, '2023-07-03', 5),
  (4, 4, '2023-07-04', 2),
  (5, 5, '2023-07-05', 4),
  (1, 2, '2023-07-06', 5),
  (2, 3, '2023-07-07', 3),
  (3, 4, '2023-07-08', 4),
  (4, 5, '2023-07-09', 2),
  (5, 1, '2023-07-10', 3);
  
  # PREGUTAS
#Seleccione las 3 operaciones con mejor evaluación.
SELECT *
FROM operaciones
ORDER BY evaluacion DESC
LIMIT 3;

#Seleccione las 3 operaciones con menos evaluación.
SELECT *
FROM operaciones
ORDER BY evaluacion ASC
LIMIT 3;

#Seleccione al operario que más soportes ha realizado.
-- Dentro de la tabla operaciones
SELECT id_operario, COUNT(*) AS total_soportes
FROM operaciones
GROUP BY id_operario
ORDER BY total_soportes DESC
LIMIT 1;

-- Dentro de la tabla operarios
SELECT *
FROM operarios
ORDER BY veces_soporte DESC
LIMIT 1;

#Seleccione al cliente que menos veces ha utilizado la aplicación.
-- Dentro de la tabla operaciones
SELECT id_usuario, COUNT(*) AS total_requerimientos
FROM operaciones
GROUP BY id_usuario
ORDER BY total_requerimientos ASC
LIMIT 1;

-- Dentro de la tabla operarios
SELECT *
FROM usuarios
ORDER BY veces_utilizado ASC
LIMIT 1;


#Agregue 10 años a los tres primeros usuarios registrados.
UPDATE usuarios
SET edad = edad + 10
ORDER BY id
LIMIT 3;

#Renombre todas las columnas ‘correo electrónico’. El nuevo nombre debe ser email.
ALTER TABLE usuarios
CHANGE correo email VARCHAR(50);

ALTER TABLE operarios
CHANGE correo email VARCHAR(50);

#Seleccione solo los operarios mayores de 20 años.
SELECT *
FROM operarios
WHERE edad > 20;
