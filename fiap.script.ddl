-- Gerado por Oracle SQL Developer Data Modeler 21.4.2.059.0838
--   em:        2022-05-23 19:06:55 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_cliente (
    nm_cliente                 VARCHAR2(29) NOT NULL,
    nr_cpf                     NUMBER NOT NULL,
    nr_rg                      NUMBER(2) NOT NULL,
    nm_sexo                    VARCHAR2(30) NOT NULL,
    dt_nascimento              DATE NOT NULL,
    t_endereço_nr_cep          NUMBER(3) NOT NULL,
    t_contas_t_endereço_nr_cep NUMBER(4) NOT NULL
);

ALTER TABLE t_cliente
    ADD CONSTRAINT t_cliente_pk PRIMARY KEY ( nm_cliente,
                                              t_endereço_nr_cep,
                                              t_contas_t_endereço_nr_cep );

CREATE TABLE t_contas (
    nr_conta                     NUMBER(7) NOT NULL,
    nr_agencia                   NUMBER(8) NOT NULL,
    nr_senha                     NUMBER(9) NOT NULL,
    t_endereço_nr_cep            NUMBER(5) NOT NULL,
    t_tipo_conta_t_tipo_conta_id NUMBER NOT NULL
);

ALTER TABLE t_contas ADD CONSTRAINT t_contas_pk PRIMARY KEY ( t_endereço_nr_cep );

CREATE TABLE t_despesas (
    t_despesas_id NUMBER NOT NULL,
    vl_limite     FLOAT(1) NOT NULL,
    vl_fatura     FLOAT(2) NOT NULL,
    vl_pago       FLOAT(3) NOT NULL
);

ALTER TABLE t_despesas ADD CONSTRAINT t_despesas_pk PRIMARY KEY ( t_despesas_id );

CREATE TABLE t_endereço (
    nr_cep                  NUMBER(5) NOT NULL,
    nm_endereço             VARCHAR2(3) NOT NULL,
    nr_endereço             NUMBER(6) NOT NULL,
    nm_complemento_endereço VARCHAR2(4)
);

ALTER TABLE t_endereço ADD CONSTRAINT t_endereço_pk PRIMARY KEY ( nr_cep );

CREATE TABLE t_tipo_conta (
    t_tipo_conta_id          NUMBER NOT NULL,
    cd_conta_corrente        NUMBER(10) NOT NULL,
    cd_conta_poupança        NUMBER(11) NOT NULL,
    cd_tipo_conta            NUMBER NOT NULL,
    t_despesas_t_despesas_id NUMBER NOT NULL
);

ALTER TABLE t_tipo_conta ADD CONSTRAINT t_tipo_conta_pk PRIMARY KEY ( t_tipo_conta_id );

ALTER TABLE t_cliente
    ADD CONSTRAINT t_cliente_t_contas_fk FOREIGN KEY ( t_contas_t_endereço_nr_cep )
        REFERENCES t_contas ( t_endereço_nr_cep );

ALTER TABLE t_cliente
    ADD CONSTRAINT t_cliente_t_endereço_fk FOREIGN KEY ( t_endereço_nr_cep )
        REFERENCES t_endereço ( nr_cep );

ALTER TABLE t_contas
    ADD CONSTRAINT t_contas_t_endereço_fk FOREIGN KEY ( t_endereço_nr_cep )
        REFERENCES t_endereço ( nr_cep );

ALTER TABLE t_contas
    ADD CONSTRAINT t_contas_t_tipo_conta_fk FOREIGN KEY ( t_tipo_conta_t_tipo_conta_id )
        REFERENCES t_tipo_conta ( t_tipo_conta_id );

ALTER TABLE t_tipo_conta
    ADD CONSTRAINT t_tipo_conta_t_despesas_fk FOREIGN KEY ( t_despesas_t_despesas_id )
        REFERENCES t_despesas ( t_despesas_id );

CREATE SEQUENCE T_DESPESAS_T_DESPESAS_ID_SEQ 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER T_DESPESAS_T_DESPESAS_ID_TRG 
BEFORE INSERT ON T_DESPESAS 
FOR EACH ROW 
WHEN (NEW.T_DESPESAS_ID IS NULL) 
BEGIN
:new.t_despesas_id := t_despesas_t_despesas_id_seq.nextval;

end;
/

CREATE SEQUENCE T_TIPO_CONTA_T_TIPO_CONTA_ID 
START WITH 1 
    NOCACHE 
    ORDER ;

CREATE OR REPLACE TRIGGER T_TIPO_CONTA_T_TIPO_CONTA_ID 
BEFORE INSERT ON T_TIPO_CONTA 
FOR EACH ROW 
WHEN (NEW.T_TIPO_CONTA_ID IS NULL) 
BEGIN
:new.t_tipo_conta_id := t_tipo_conta_t_tipo_conta_id.nextval;

end;
/



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             5
-- CREATE INDEX                             0
-- ALTER TABLE                             10
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           2
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          2
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
