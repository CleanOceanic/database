DROP TABLE T_USUARIO CASCADE CONSTRAINTS; 
DROP TABLE T_EMPRESA CASCADE CONSTRAINTS; 
DROP TABLE T_PONTO_COLETA CASCADE CONSTRAINTS; 
DROP TABLE T_ENDERECO CASCADE CONSTRAINTS;
DROP TABLE T_RESIDUO_COLETADO CASCADE CONSTRAINTS; 
DROP TABLE T_DESTINO_RESIDUO CASCADE CONSTRAINTS;
DROP TABLE T_USUARIO_ENDERECO CASCADE CONSTRAINTS; 
DROP TABLE T_EMPRESA_ENDERECO CASCADE CONSTRAINTS;
DROP TABLE T_PONTO_COLETA_ENDERECO CASCADE CONSTRAINTS;
DROP TABLE T_DESTINO_RESIDUO_PONTO_COLETA CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_T_USUARIO;
DROP SEQUENCE SEQ_T_EMPRESA;
DROP SEQUENCE SEQ_T_PONTO_COLETA;
DROP SEQUENCE SEQ_T_ENDERECO;
DROP SEQUENCE SEQ_T_RESIDUO_COLETADO;
DROP SEQUENCE SEQ_T_DESTINO_RESIDUO;
DROP SEQUENCE SEQ_T_USUARIO_ENDERECO;
DROP SEQUENCE SEQ_T_EMPRESA_ENDERECO;
DROP SEQUENCE SEQ_T_PONTO_COLETA_ENDERECO;
DROP SEQUENCE SEQ_T_DESTINO_RESIDUO_PONTO_COLETA;

CREATE TABLE T_USUARIO ( 
    id_usuario          INTEGER PRIMARY KEY,
    ds_nome             VARCHAR2(100),
    dt_data_nascimento  VARCHAR2(10),
    ds_genero           VARCHAR2(20),
    ds_email            VARCHAR2(100),
    ds_senha            VARCHAR2(100),
    ds_telefone         VARCHAR2(20),
    dt_created_at       DATE DEFAULT SYSTIMESTAMP NOT NULL
);

CREATE TABLE T_EMPRESA (
    id_empresa                 INTEGER PRIMARY KEY,
    ds_razao_social            VARCHAR2(100),
    ds_cnpj                    VARCHAR2(20),
    ds_telefone                VARCHAR2(20),
    ds_email                   VARCHAR2(100),
    ds_setor                   VARCHAR2(100),
    vl_quantidade_funcionario  NUMBER(10),
    dt_created_at              DATE DEFAULT SYSTIMESTAMP NOT NULL
);

CREATE TABLE T_PONTO_COLETA (
    id_ponto_coleta       INTEGER PRIMARY KEY,
    ds_nome               VARCHAR2(100),
    ds_telefone           VARCHAR2(20),
    ds_email              VARCHAR2(100),
    dt_horario_funcionamento VARCHAR2(20),
    vl_capacidade_maxima  NUMBER,
    dt_created_at         DATE DEFAULT SYSTIMESTAMP NOT NULL
);

CREATE TABLE T_ENDERECO (
    id_endereco       INTEGER PRIMARY KEY,
    ds_logradouro     VARCHAR2(100),
    ds_numero         VARCHAR2(10),
    ds_bairro         VARCHAR2(100),
    ds_cidade         VARCHAR2(100),
    ds_sigla          VARCHAR2(20),
    ds_cep            VARCHAR2(20),
    dt_created_at     DATE DEFAULT SYSTIMESTAMP NOT NULL
);

CREATE TABLE T_RESIDUO_COLETADO (
    id_residuo_coletado INTEGER PRIMARY KEY,
    ds_tipo             VARCHAR2(100),
    vl_peso             NUMBER,
    dt_data_coleta         VARCHAR2(20),
    ds_local_coleta        VARCHAR2(100),
    ds_origem_residuo   VARCHAR2(100),
    ds_observacao_coleta   VARCHAR2(100),
    id_usuario          INTEGER,
    dt_created_at       DATE DEFAULT SYSTIMESTAMP NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES T_USUARIO(id_usuario)
);

CREATE TABLE T_DESTINO_RESIDUO (
    id_destino_residuo  INTEGER PRIMARY KEY,
    ds_nome_local       VARCHAR2(100),
    ds_tipo_destino     VARCHAR2(100),
    vl_quantidade_enviado NUMBER,
    id_residuo_coletado INTEGER,
    dt_created_at       DATE DEFAULT SYSTIMESTAMP NOT NULL,
    FOREIGN KEY (id_residuo_coletado) REFERENCES T_RESIDUO_COLETADO(id_residuo_coletado)
);

CREATE TABLE T_USUARIO_ENDERECO (
    id_usuario_endereco INTEGER PRIMARY KEY,
    id_usuario          INTEGER,
    id_endereco         INTEGER,
    FOREIGN KEY (id_usuario) REFERENCES T_USUARIO(id_usuario),
    FOREIGN KEY (id_endereco) REFERENCES T_ENDERECO(id_endereco)
);

CREATE TABLE T_EMPRESA_ENDERECO (
    id_empresa_endereco INTEGER PRIMARY KEY,
    id_empresa          INTEGER,
    id_endereco         INTEGER,
    FOREIGN KEY (id_empresa) REFERENCES T_EMPRESA(id_empresa),
    FOREIGN KEY (id_endereco) REFERENCES T_ENDERECO(id_endereco)
);

CREATE TABLE T_PONTO_COLETA_ENDERECO (
    id_ponto_coleta_endereco INTEGER PRIMARY KEY,
    id_ponto_coleta          INTEGER,
    id_endereco              INTEGER,
    FOREIGN KEY (id_ponto_coleta) REFERENCES T_PONTO_COLETA(id_ponto_coleta),
    FOREIGN KEY (id_endereco) REFERENCES T_ENDERECO(id_endereco)
);

CREATE TABLE T_DESTINO_RESIDUO_PONTO_COLETA (
    id_destino_residuo_ponto_coleta INTEGER PRIMARY KEY,
    id_destino_residuo              INTEGER,
    id_ponto_coleta                 INTEGER,
    FOREIGN KEY (id_destino_residuo) REFERENCES T_DESTINO_RESIDUO(id_destino_residuo),
    FOREIGN KEY (id_ponto_coleta) REFERENCES T_PONTO_COLETA(id_ponto_coleta)
);

CREATE SEQUENCE SEQ_T_USUARIO
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 999999
    CYCLE;
    
CREATE SEQUENCE SEQ_T_EMPRESA
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 999999
    CYCLE; 
    
CREATE SEQUENCE SEQ_T_PONTO_COLETA
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 999999
    CYCLE;     
    
CREATE SEQUENCE SEQ_T_RESIDUO_COLETADO
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 999999
    CYCLE;     
    
CREATE SEQUENCE SEQ_T_DESTINO_RESIDUO
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 999999
    CYCLE;     
    
CREATE SEQUENCE SEQ_T_ENDERECO
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 999999
    CYCLE;

CREATE SEQUENCE SEQ_T_USUARIO_ENDERECO
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 999999
    CYCLE;

CREATE SEQUENCE SEQ_T_EMPRESA_ENDERECO
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 999999
    CYCLE;

CREATE SEQUENCE SEQ_T_PONTO_COLETA_ENDERECO
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 999999
    CYCLE;

CREATE SEQUENCE SEQ_T_DESTINO_RESIDUO_PONTO_COLETA
    START WITH 1
    INCREMENT BY 1
    MINVALUE 1
    MAXVALUE 999999
    CYCLE;


SELECT * FROM T_USUARIO;
SELECT * FROM T_EMPRESA;
SELECT * FROM T_PONTO_COLETA;
SELECT * FROM T_ENDERECO;
SELECT * FROM T_RESIDUO_COLETADO;
SELECT * FROM T_DESTINO_RESIDUO;
SELECT * FROM T_USUARIO_ENDERECO;
SELECT * FROM T_EMPRESA_ENDERECO;
SELECT * FROM T_PONTO_COLETA_ENDERECO;
SELECT * FROM T_DESTINO_RESIDUO_PONTO_COLETA;
