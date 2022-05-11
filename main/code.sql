CREATE TABLE INSTRUMENTO ( 
 COD NUMBER(3) NOT NULL CONSTRAINT INSTRUMENTO_PK PRIMARY KEY,
 nombre VARCHAR2(25) NOT NULL,
 edad_recomendada NUMBER(2) NOT NULL CONSTRAINT INSTRU_EDAD_CK CHECK ( edad_recomendada BETWEEN 5 AND 30 )
);

--Creamos la Tabla fuerte

CREATE TABLE ALUMNO(
 RUT  NUMBER(8) CONSTRAINT ALUMNO_PK  PRIMARY KEY, 
 DV   CHAR(1)   NOT NULL   CONSTRAINT  ALUMNO_DV_CK CHECK (DV  IN ( '0','1','2','3','4','5','6','7','8','9','K' )  ),
 nombre         VARCHAR2(25) NOT NULL, 
 pri_apellido   VARCHAR2(25) NOT NULL, 
 seg_apellido   VARCHAR2(25) NOT NULL, 
 fecha_nac      DATE,
 mail           VARCHAR2(50) NOT NULL,
 cod_instrumento  NUMBER(3)  NOT NULL CONSTRAINT ALUMNO_INSTRUMENTO_FK REFERENCES INSTRUMENTO ( cod ) 
);

--Creamos la Tabla alumno, que tiene como referencia el codigo de instrumento y rut como primary key y sus restricciones

CREATE TABLE PROFESOR(
 RUT  NUMBER(8) CONSTRAINT PROFESOR_PK  PRIMARY KEY, 
 DV   CHAR(1)   NOT NULL   CONSTRAINT  PROFESOR_DV_CK CHECK (DV  IN ( '0','1','2','3','4','5','6','7','8','9','K' )  ),
 nombre         VARCHAR2(25) NOT NULL,
 pri_apellido   VARCHAR2(25) NOT NULL,
 seg_apellido   VARCHAR2(25) NOT NULL,
 mail           VARCHAR2(50) CONSTRAINT MAIL_UK UNIQUE
);

--Creamos la Tabla profesor, con codigo de instrumento y rut primary key y sus restricciones

CREATE TABLE DETALLE_DOMINIO (
  COD_INSTRUM NUMBER(3) NOT NULL,
  RUT_PROFE NUMBER(8) NOT NULL,
  PCT_DOMINIO NUMBER(4,1) NOT NULL,
  CONSTRAINT INSTRUMENTO_PK PRIMARY KEY (COD_INSTRUM, RUT_PROFE ),
  FOREIGN KEY(COD_INSTRUM) REFERENCES INSTRUMENTO(cod),
  FOREIGN KEY(RUT_PROFE) REFERENCES PROFESOR(rut)
);

--Creamos la tabla detalle_dominio con referencia de 2 primary key de codigo instrumento y de profesor
