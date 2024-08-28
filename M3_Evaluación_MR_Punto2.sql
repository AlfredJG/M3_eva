CREATE TABLE "Libros" (
	"id_titular" INTEGER NOT NULL UNIQUE,
	"titulo_libro" VARCHAR NOT NULL,
	"categoria_libro" CHAR NOT NULL CHECK('A', 'B', 'C', 'D', 'E', 'F'),
	"id_tema" INTEGER NOT NULL,
	"autor" INTEGER NOT NULL,
	"id_editorial" INTEGER NOT NULL,
	"año_publicacion" DATE NOT NULL,
	PRIMARY KEY("id_titular")
);


CREATE TABLE "Control_Prestamos" (
	"id_prestamo" INTEGER NOT NULL UNIQUE,
	"fecha_prestamo" DATE NOT NULL,
	"fecha_devolución" DATE NOT NULL,
	"estado_prestamo" VARCHAR NOT NULL,
	"id_ejemplar" INTEGER NOT NULL,
	"id_socio" INTEGER NOT NULL,
	"id_historico_prestamo" INTEGER NOT NULL,
	PRIMARY KEY("id_prestamo")
);


CREATE TABLE "Socios" (
	"id_Socio" INTEGER NOT NULL UNIQUE,
	"nombre" VARCHAR NOT NULL,
	"categoria_socio" CHAR NOT NULL CHECK('B', 'C', 'D', 'E', 'F'),
	"telefono" INTEGER NOT NULL,
	"mail" VARCHAR NOT NULL,
	"apellido" VARCHAR NOT NULL,
	PRIMARY KEY("id_Socio")
);


CREATE TABLE "Editoriales" (
	"id_editorial" INTEGER NOT NULL UNIQUE,
	"nombre_editorial" VARCHAR NOT NULL,
	"telefono" INTEGER NOT NULL,
	"mail" VARCHAR NOT NULL,
	"direccion" VARCHAR,
	PRIMARY KEY("id_editorial")
);


CREATE TABLE "Historico_Prestamos" (
	"id_historico_prestamo" INTEGER NOT NULL UNIQUE,
	"fecha_emision" DATE,
	PRIMARY KEY("id_historico_prestamo")
);


CREATE TABLE "Estado_Libros" (
	"id_estado" INTEGER NOT NULL UNIQUE,
	"nombre_estado" VARCHAR NOT NULL,
	PRIMARY KEY("id_estado")
);


CREATE TABLE "Generos" (
	"id_genero" INTEGER NOT NULL UNIQUE,
	"genero" VARCHAR,
	PRIMARY KEY("id_genero")
);


CREATE TABLE "Autores" (
	"id_autor" INTEGER NOT NULL UNIQUE,
	"nombre_autor" VARCHAR NOT NULL,
	PRIMARY KEY("id_autor")
);


CREATE TABLE "Ejemplares" (
	"id_ejemplar" INTEGER NOT NULL UNIQUE,
	"id_titulo" INTEGER NOT NULL,
	"ubicacion" VARCHAR NOT NULL,
	"estado" INTEGER NOT NULL,
	PRIMARY KEY("id_ejemplar")
);


ALTER TABLE "Generos"
ADD FOREIGN KEY("id_genero") REFERENCES "Libros"("id_tema")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Autores"
ADD FOREIGN KEY("id_autor") REFERENCES "Libros"("autor")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Editoriales"
ADD FOREIGN KEY("id_editorial") REFERENCES "Libros"("id_editorial")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Control_Prestamos"
ADD FOREIGN KEY("id_socio") REFERENCES "Socios"("id_Socio")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Historico_Prestamos"
ADD FOREIGN KEY("id_historico_prestamo") REFERENCES "Control_Prestamos"("id_historico_prestamo")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Libros"
ADD FOREIGN KEY("id_titular") REFERENCES "Ejemplares"("id_titulo")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Estado_Libros"
ADD FOREIGN KEY("id_estado") REFERENCES "Ejemplares"("estado")
ON UPDATE NO ACTION ON DELETE NO ACTION;
ALTER TABLE "Control_Prestamos"
ADD FOREIGN KEY("id_ejemplar") REFERENCES "Ejemplares"("id_ejemplar")
ON UPDATE NO ACTION ON DELETE NO ACTION;