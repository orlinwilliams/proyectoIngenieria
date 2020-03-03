
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Table tipoUsuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS tipoUsuario (
  `idtipoUsuario` INT NOT NULL AUTO_INCREMENT,
  `tipoUsuario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtipoUsuario`),
  UNIQUE INDEX `idtipoUsuario_UNIQUE` (`idtipoUsuario` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table departamentos
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS departamentos (
  `idDepartamentos` INT NOT NULL,
  `nombreDepartamento` VARCHAR(45) NULL,
  PRIMARY KEY (`idDepartamentos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table municipios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS municipios (
  `idMunicipios` INT NOT NULL,
  `idDepartamentos` INT NOT NULL,
  PRIMARY KEY (`idMunicipios`),
  CONSTRAINT `fk_municipios_departamentos1` FOREIGN KEY (`idDepartamentos`) REFERENCES departamentos (`idDepartamentos`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Usuario
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Usuario (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `idtipoUsuario` INT NOT NULL,
  `idMunicipios` INT NOT NULL,
  `pNombre` VARCHAR(45) NOT NULL,
  `pApellido` VARCHAR(45) NULL,
  `correoElectronico` VARCHAR(45) NOT NULL,
  `numTelefono` VARCHAR(45) NOT NULL,
  `fechaRegistro` DATE NOT NULL,
  `fechaNacimiento` DATE NOT NULL,
  `RTN` VARCHAR(45) NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE INDEX `idPersona_UNIQUE` (`idUsuario` ASC),
  CONSTRAINT `fk_Usuario_tipoUsuario1` FOREIGN KEY (`idtipoUsuario`) REFERENCES tipoUsuario (`idtipoUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_municipios1` FOREIGN KEY (`idMunicipios`) REFERENCES municipios (`idMunicipios`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table calificacionesVendedor
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS calificacionesVendedor (
  `idCalificacionVendedor` VARCHAR(45) NOT NULL,
  `cantidadEstrellas` INT,
  `comentarios` VARCHAR(500) NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idCalificacionVendedor`),
  CONSTRAINT `fk_calificacionesVendedor_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES Usuario (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table calificacionesComprador
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS calificacionesComprador (
  `idcalificacionesComprador` INT NOT NULL,
  `cantidadEstrellas` INT NULL,
  `comentarios` VARCHAR(500) NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idcalificacionesComprador`),
  CONSTRAINT `fk_calificacionesComprador_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES Usuario (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table categoria
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS categoria (
  `idcategoria` INT NOT NULL,
  `nombreCategoria` VARCHAR(80) NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table anuncios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS anuncios (
  `idAnuncios` INT NOT NULL AUTO_INCREMENT,
  `idUsuario` INT NOT NULL,
  `idcategoria` INT NOT NULL,
  `idMunicipios` INT NOT NULL,
  `precio` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `descripcion` VARCHAR(45) NULL,
  `fechaPublicacion` DATE NOT NULL,
  `estadoArticulo` VARCHAR(20) NULL,
  `estadoAnuncio` VARCHAR(1) NOT NULL,
  `fechaLimite` DATE NULL,
  PRIMARY KEY (`idAnuncios`),
  CONSTRAINT `fk_anuncios_categoria1` FOREIGN KEY (`idcategoria`) REFERENCES categoria (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anuncios_municipios1` FOREIGN KEY (`idMunicipios`) REFERENCES municipios (`idMunicipios`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_anuncios_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES Usuario (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table razonDenuncia
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS razonDenuncia (
  `idrazonDenuncia` INT NOT NULL,
  `descripcion` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idrazonDenuncia`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table Denuncias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS Denuncias (
  `idDenuncias` INT NOT NULL AUTO_INCREMENT,
  `idrazonDenuncia` INT NOT NULL,
  `idUsuario` INT NOT NULL,
  PRIMARY KEY (`idDenuncias`),
  CONSTRAINT `fk_Denuncias_razonDenuncia1` FOREIGN KEY (`idrazonDenuncia`) REFERENCES razonDenuncia (`idrazonDenuncia`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Denuncias_Usuario1` FOREIGN KEY (`idUsuario`) REFERENCES Usuario (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
