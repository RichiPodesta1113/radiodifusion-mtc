CREATE TEMP TABLE tmp_autorizaciones (
    id              INTEGER,
    razon_social    VARCHAR(150),
    finalidad       VARCHAR(30),
    banda           VARCHAR(10),
    frecuencia      NUMERIC(10,3),
    und             VARCHAR(10),
    indicativo      VARCHAR(20),
    departamento    VARCHAR(50),
    provincia       VARCHAR(60),
    distrito        VARCHAR(80),
    ubigeo          VARCHAR(10),
    fecha_corte     VARCHAR(8)
);

\copy tmp_autorizaciones
FROM 'data/autorizaciones_radiodifusion.csv'
WITH (
    FORMAT CSV,
    HEADER TRUE,
    DELIMITER ',',
    ENCODING 'LATIN1'
);

INSERT INTO autorizaciones_radiodifusion (
    id,
    razon_social,
    finalidad,
    banda,
    frecuencia,
    und,
    indicativo,
    departamento,
    provincia,
    distrito,
    ubigeo,
    fecha_corte
)
SELECT
    id,
    razon_social,
    finalidad,
    banda,
    frecuencia,
    und,
    indicativo,
    departamento,
    provincia,
    distrito,
    ubigeo,
    TO_DATE(fecha_corte, 'YYYYMMDD')
FROM tmp_autorizaciones
ON CONFLICT (id, fecha_corte) DO NOTHING;