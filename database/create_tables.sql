CREATE TABLE IF NOT EXISTS autorizaciones_radiodifusion (
    id              INTEGER NOT NULL,
    razon_social    VARCHAR(150) NOT NULL,
    finalidad       VARCHAR(30) NOT NULL,
    banda           VARCHAR(10) NOT NULL,
    frecuencia      NUMERIC(10,3) NOT NULL,
    und             VARCHAR(10) NOT NULL,
    indicativo      VARCHAR(20) NOT NULL,
    departamento    VARCHAR(50) NOT NULL,
    provincia       VARCHAR(60) NOT NULL,
    distrito        VARCHAR(80) NOT NULL,
    ubigeo          VARCHAR(10) NOT NULL,
    fecha_corte     DATE NOT NULL,

    CONSTRAINT pk_autorizaciones
        PRIMARY KEY (id, fecha_corte)
);

CREATE INDEX idx_autorizaciones_departamento
    ON autorizaciones_radiodifusion(departamento);

CREATE INDEX idx_autorizaciones_finalidad
    ON autorizaciones_radiodifusion(finalidad);

CREATE INDEX idx_autorizaciones_banda
    ON autorizaciones_radiodifusion(banda);

CREATE INDEX idx_autorizaciones_fecha
    ON autorizaciones_radiodifusion(fecha_corte);