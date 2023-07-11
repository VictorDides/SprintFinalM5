CREATE TABLE `Operarios`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL,
    `apellido` VARCHAR(255) NOT NULL,
    `edad` INT NOT NULL,
    `correo` VARCHAR(255) NOT NULL,
    `veces_soporte` INT NOT NULL DEFAULT '1'
);
CREATE TABLE `Operaciones`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `id_operario` INT NOT NULL,
    `id_usuario` INT NOT NULL,
    `fecha` DATE NOT NULL,
    `evaluacion` INT NOT NULL
);
CREATE TABLE `Usuarios`(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nombre` VARCHAR(255) NOT NULL,
    `apellido` VARCHAR(255) NOT NULL,
    `edad` INT NOT NULL,
    `correo` VARCHAR(255) NOT NULL,
    `veces_utilizado` INT NOT NULL DEFAULT '1'
);
ALTER TABLE
    `Operaciones` ADD CONSTRAINT `operaciones_id_operario_foreign` FOREIGN KEY(`id_operario`) REFERENCES `Operarios`(`id`);
ALTER TABLE
    `Operaciones` ADD CONSTRAINT `operaciones_id_usuario_foreign` FOREIGN KEY(`id_usuario`) REFERENCES `Usuarios`(`id`);