INSERT INTO information_schema.ROUTINES (SPECIFIC_NAME, ROUTINE_CATALOG, ROUTINE_SCHEMA, ROUTINE_NAME, ROUTINE_TYPE, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, CHARACTER_OCTET_LENGTH, NUMERIC_PRECISION, NUMERIC_SCALE, DATETIME_PRECISION, CHARACTER_SET_NAME, COLLATION_NAME, DTD_IDENTIFIER, ROUTINE_BODY, ROUTINE_DEFINITION, EXTERNAL_NAME, EXTERNAL_LANGUAGE, PARAMETER_STYLE, IS_DETERMINISTIC, SQL_DATA_ACCESS, SQL_PATH, SECURITY_TYPE, CREATED, LAST_ALTERED, SQL_MODE, ROUTINE_COMMENT, DEFINER, CHARACTER_SET_CLIENT, COLLATION_CONNECTION, DATABASE_COLLATION) VALUES ('AddGeometryColumn', 'def', 'mysql', 'AddGeometryColumn', 'PROCEDURE', '', null, null, null, null, null, null, null, null, 'SQL', 'begin
  set @qwe= concat(''ALTER TABLE '', t_schema, ''.'', t_name, '' ADD '', geometry_column,'' GEOMETRY REF_SYSTEM_ID='', t_srid); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end', null, null, 'SQL', 'NO', 'CONTAINS SQL', null, 'INVOKER', '2019-07-27 12:06:26', '2019-07-27 12:06:26', '', '', 'root@localhost', 'utf8', 'utf8_general_ci', 'utf8mb4_unicode_ci');
INSERT INTO information_schema.ROUTINES (SPECIFIC_NAME, ROUTINE_CATALOG, ROUTINE_SCHEMA, ROUTINE_NAME, ROUTINE_TYPE, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH, CHARACTER_OCTET_LENGTH, NUMERIC_PRECISION, NUMERIC_SCALE, DATETIME_PRECISION, CHARACTER_SET_NAME, COLLATION_NAME, DTD_IDENTIFIER, ROUTINE_BODY, ROUTINE_DEFINITION, EXTERNAL_NAME, EXTERNAL_LANGUAGE, PARAMETER_STYLE, IS_DETERMINISTIC, SQL_DATA_ACCESS, SQL_PATH, SECURITY_TYPE, CREATED, LAST_ALTERED, SQL_MODE, ROUTINE_COMMENT, DEFINER, CHARACTER_SET_CLIENT, COLLATION_CONNECTION, DATABASE_COLLATION) VALUES ('DropGeometryColumn', 'def', 'mysql', 'DropGeometryColumn', 'PROCEDURE', '', null, null, null, null, null, null, null, null, 'SQL', 'begin
  set @qwe= concat(''ALTER TABLE '', t_schema, ''.'', t_name, '' DROP '', geometry_column); PREPARE ls from @qwe; execute ls; deallocate prepare ls; end', null, null, 'SQL', 'NO', 'CONTAINS SQL', null, 'INVOKER', '2019-07-27 12:06:26', '2019-07-27 12:06:26', '', '', 'root@localhost', 'utf8', 'utf8_general_ci', 'utf8mb4_unicode_ci');