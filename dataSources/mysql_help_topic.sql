INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (0, 'MIN', 16, 'Syntax:
MIN([DISTINCT] expr)

Returns the minimum value of expr. MIN() may take a string argument; in
such cases, it returns the minimum string value.
The DISTINCT keyword can be used to find the minimum of the distinct values
of expr, however, this produces the same result as omitting DISTINCT.

MIN() returns NULL if there were no matching rows.

URL: https://mariadb.com/kb/en/min/

', 'MariaDB> SELECT student_name, MIN(test_score), MAX(test_score)
    ->        FROM student
    ->        GROUP BY student_name;
', 'https://mariadb.com/kb/en/min/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (1, 'JOIN', 27, 'MySQL supports the following JOIN syntaxes for the table_references
part of SELECT statements and multiple-table DELETE and UPDATE
statements:

table_references:
    table_reference [, table_reference] ...

table_reference:
    table_factor
  | join_table

table_factor:
    tbl_name [[AS] alias] [index_hint_list]
  | table_subquery [AS] alias
  | ( table_references )
  | { OJ table_reference LEFT OUTER JOIN table_reference
        ON conditional_expr }

join_table:
    table_reference [INNER | CROSS] JOIN table_factor [join_condition]
  | table_reference STRAIGHT_JOIN table_factor
  | table_reference STRAIGHT_JOIN table_factor ON conditional_expr
  | table_reference {LEFT|RIGHT} [OUTER] JOIN table_reference join_condition
  | table_reference NATURAL [{LEFT|RIGHT} [OUTER]] JOIN table_factor

join_condition:
    ON conditional_expr
  | USING (column_list)

index_hint_list:
    index_hint [, index_hint] ...

index_hint:
    USE {INDEX|KEY}
      [FOR {JOIN|ORDER BY|GROUP BY}] ([index_list])
  | IGNORE {INDEX|KEY}
      [FOR {JOIN|ORDER BY|GROUP BY}] (index_list)
  | FORCE {INDEX|KEY}
      [FOR {JOIN|ORDER BY|GROUP BY}] (index_list)

index_list:
    index_name [, index_name] ...

A table reference is also known as a join expression.

The syntax of table_factor is extended in comparison with the SQL
Standard. The latter accepts only table_reference, not a list of them
inside a pair of parentheses.

This is a conservative extension if we consider each comma in a list of
table_reference items as equivalent to an inner join. For example:

SELECT * FROM t1 LEFT JOIN (t2, t3, t4)
                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)

is equivalent to:

SELECT * FROM t1 LEFT JOIN (t2 CROSS JOIN t3 CROSS JOIN t4)
                 ON (t2.a=t1.a AND t3.b=t1.b AND t4.c=t1.c)

In MySQL, JOIN, CROSS JOIN, and INNER JOIN are syntactic equivalents
(they can replace each other). In standard SQL, they are not
equivalent. INNER JOIN is used with an ON clause, CROSS JOIN is used
otherwise.

In general, parentheses can be ignored in join expressions containing
only inner join operations.

Index hints can be specified to affect how the MySQL optimizer makes
use of indexes. For more information, see
https://mariadb.com/kb/en/how-to-force-query-plans/.

URL: https://mariadb.com/kb/en/join-syntax/

', 'SELECT left_tbl.*
  FROM left_tbl LEFT JOIN right_tbl ON left_tbl.id = right_tbl.id
  WHERE right_tbl.id IS NULL;
', 'https://mariadb.com/kb/en/join-syntax/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (2, 'HEX', 37, 'Syntax:
HEX(str), HEX(N)

For a string argument str, HEX() returns a hexadecimal string
representation of str where each character in str is converted to two
hexadecimal digits. The inverse of this operation is performed by the
UNHEX() function.

For a numeric argument N, HEX() returns a hexadecimal string
representation of the value of N treated as a longlong (BIGINT) number.
This is equivalent to CONV(N,10,16). The inverse of this operation is
performed by CONV(HEX(N),16,10).

URL: https://mariadb.com/kb/en/hex/

', 'MariaDB> SELECT 0x616263, HEX(''abc''), UNHEX(HEX(''abc''));
        -> ''abc'', 616263, ''abc''
MariaDB> SELECT HEX(255), CONV(HEX(255),16,10);
        -> ''FF'', 255
', 'https://mariadb.com/kb/en/hex/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (3, 'REPLACE', 27, 'Syntax:
REPLACE [LOW_PRIORITY | DELAYED]
    [INTO] tbl_name [(col_name,...)]
    {VALUES | VALUE} ({expr | DEFAULT},...),(...),...

Or:

REPLACE [LOW_PRIORITY | DELAYED]
    [INTO] tbl_name
    SET col_name={expr | DEFAULT}, ...

Or:

REPLACE [LOW_PRIORITY | DELAYED]
    [INTO] tbl_name [(col_name,...)]
    SELECT ...

REPLACE works exactly like INSERT, except that if an old row in the
table has the same value as a new row for a PRIMARY KEY or a UNIQUE
index, the old row is deleted before the new row is inserted. See [HELP
INSERT].

REPLACE is a MySQL extension to the SQL standard. It either inserts, or
deletes and inserts. For another MySQL extension to standard SQL---that
either inserts or updates---see
https://mariadb.com/kb/en/insert-on-duplicate-key-update/.

Note that unless the table has a PRIMARY KEY or UNIQUE index, using a
REPLACE statement makes no sense. It becomes equivalent to INSERT,
because there is no index to be used to determine whether a new row
duplicates another.

Values for all columns are taken from the values specified in the
REPLACE statement. Any missing columns are set to their default values,
just as happens for INSERT. You cannot refer to values from the current
row and use them in the new row. If you use an assignment such as SET
col_name = col_name + 1, the reference to the column name on the right
hand side is treated as DEFAULT(col_name), so the assignment is
equivalent to SET col_name = DEFAULT(col_name) + 1.

To use REPLACE, you must have both the INSERT and DELETE privileges for
the table.

URL: https://mariadb.com/kb/en/replace/

', '', 'https://mariadb.com/kb/en/replace/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (4, 'CONTAINS', 30, 'Contains(g1,g2)

Returns 1 or 0 to indicate whether g1 completely contains g2. This
tests the opposite relationship as Within().

URL: https://mariadb.com/kb/en/contains/

', '', 'https://mariadb.com/kb/en/contains/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (5, 'SRID', 36, 'SRID(g)

Returns an integer indicating the Spatial Reference System ID for the
geometry value g.

In MySQL, the SRID value is just an integer associated with the
geometry value. All calculations are done assuming Euclidean (planar)
geometry.

URL: https://mariadb.com/kb/en/srid/

', 'MariaDB> SELECT SRID(GeomFromText(''LineString(1 1,2 2)'',101));
+-----------------------------------------------+
| SRID(GeomFromText(''LineString(1 1,2 2)'',101)) |
+-----------------------------------------------+
|                                           101 |
+-----------------------------------------------+
', 'https://mariadb.com/kb/en/srid/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (6, 'CURRENT_TIMESTAMP', 31, 'Syntax:
CURRENT_TIMESTAMP, CURRENT_TIMESTAMP()

CURRENT_TIMESTAMP and CURRENT_TIMESTAMP() are synonyms for NOW().

URL: https://mariadb.com/kb/en/current_timestamp/

', '', 'https://mariadb.com/kb/en/current_timestamp/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (7, 'SHOW CONTRIBUTORS', 26, 'Syntax:
SHOW CONTRIBUTORS

The SHOW CONTRIBUTORS statement displays information about the people
who contribute to MySQL source or to causes that we support. For each
contributor, it displays Name, Location, and Comment values.

URL: https://mariadb.com/kb/en/show-contributors/

', '', 'https://mariadb.com/kb/en/show-contributors/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (8, 'VARIANCE', 16, 'Syntax:
VARIANCE(expr)

Returns the population standard variance of expr. This is an extension
to standard SQL. The standard SQL function VAR_POP() can be used
instead.

VARIANCE() returns NULL if there were no matching rows.

URL: https://mariadb.com/kb/en/variance/

', '', 'https://mariadb.com/kb/en/variance/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (9, 'DROP SERVER', 39, 'Syntax:
DROP SERVER [ IF EXISTS ] server_name

Drops the server definition for the server named server_name. The
corresponding row within the mysql.servers table will be deleted. This
statement requires the SUPER privilege.

Dropping a server for a table does not affect any FEDERATED tables that
used this connection information when they were created. See [HELP
CREATE SERVER].

URL: https://mariadb.com/kb/en/drop-server/

', '', 'https://mariadb.com/kb/en/drop-server/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (10, 'SHOW AUTHORS', 26, 'Syntax:
SHOW AUTHORS

The SHOW AUTHORS statement displays information about the people who
work on MySQL. For each author, it displays Name, Location, and Comment
values.

URL: https://mariadb.com/kb/en/show-authors/

', '', 'https://mariadb.com/kb/en/show-authors/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (11, 'VAR_SAMP', 16, 'Syntax:
VAR_SAMP(expr)

Returns the sample variance of expr. That is, the denominator is the
number of rows minus one.

VAR_SAMP() returns NULL if there were no matching rows.

URL: https://mariadb.com/kb/en/var_samp/

', '', 'https://mariadb.com/kb/en/var_samp/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (12, 'CONCAT', 37, 'Syntax:
CONCAT(str1,str2,...)

Returns the string that results from concatenating the arguments. May
have one or more arguments. If all arguments are nonbinary strings, the
result is a nonbinary string. If the arguments include any binary
strings, the result is a binary string. A numeric argument is converted
to its equivalent string form. This is a nonbinary string as of MySQL
5.5.3. Before 5.5.3, it is a binary string; to to avoid that and
produce a nonbinary string, you can use an explicit type cast, as in
this example:

SELECT CONCAT(CAST(int_col AS CHAR), char_col);

CONCAT() returns NULL if any argument is NULL.

URL: https://mariadb.com/kb/en/concat/

', 'MariaDB> SELECT CONCAT(''My'', ''S'', ''QL'');
        -> ''MySQL''
MariaDB> SELECT CONCAT(''My'', NULL, ''QL'');
        -> NULL
MariaDB> SELECT CONCAT(14.3);
        -> ''14.3''
', 'https://mariadb.com/kb/en/concat/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (13, 'GEOMETRY HIERARCHY', 34, 'Geometry is the base class. It is an abstract class. The instantiable
subclasses of Geometry are restricted to zero-, one-, and
two-dimensional geometric objects that exist in two-dimensional
coordinate space. All instantiable geometry classes are defined so that
valid instances of a geometry class are topologically closed (that is,
all defined geometries include their boundary).

The base Geometry class has subclasses for Point, Curve, Surface, and
GeometryCollection:

o Point represents zero-dimensional objects.

o Curve represents one-dimensional objects, and has subclass
  LineString, with sub-subclasses Line and LinearRing.

o Surface is designed for two-dimensional objects and has subclass
  Polygon.

o GeometryCollection has specialized zero-, one-, and two-dimensional
  collection classes named MultiPoint, MultiLineString, and
  MultiPolygon for modeling geometries corresponding to collections of
  Points, LineStrings, and Polygons, respectively. MultiCurve and
  MultiSurface are introduced as abstract superclasses that generalize
  the collection interfaces to handle Curves and Surfaces.

Geometry, Curve, Surface, MultiCurve, and MultiSurface are defined as
noninstantiable classes. They define a common set of methods for their
subclasses and are included for extensibility.

Point, LineString, Polygon, GeometryCollection, MultiPoint,
MultiLineString, and MultiPolygon are instantiable classes.

URL: https://mariadb.com/kb/en/geometry-hierarchy/

', '', 'https://mariadb.com/kb/en/geometry-hierarchy/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (14, 'CHAR FUNCTION', 37, 'Syntax:
CHAR(N,... [USING charset_name])

CHAR() interprets each argument N as an integer and returns a string
consisting of the characters given by the code values of those
integers. NULL values are skipped.
By default, CHAR() returns a binary string. To produce a string in a
given character set, use the optional USING clause:

MariaDB> SELECT CHARSET(CHAR(0x65)), CHARSET(CHAR(0x65 USING utf8));
+---------------------+--------------------------------+
| CHARSET(CHAR(0x65)) | CHARSET(CHAR(0x65 USING utf8)) |
+---------------------+--------------------------------+
| binary              | utf8                           |
+---------------------+--------------------------------+

If USING is given and the result string is illegal for the given
character set, a warning is issued. Also, if strict SQL mode is
enabled, the result from CHAR() becomes NULL.

URL: https://mariadb.com/kb/en/char-function/

', 'MariaDB> SELECT CHAR(77,121,83,81,''76'');
        -> ''MySQL''
MariaDB> SELECT CHAR(77,77.3,''77.3'');
        -> ''MMM''
', 'https://mariadb.com/kb/en/char-function/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (15, 'DATETIME', 22, 'DATETIME

A date and time combination. The supported range is ''1000-01-01
00:00:00'' to ''9999-12-31 23:59:59''. MySQL displays DATETIME values in
''YYYY-MM-DD HH:MM:SS'' format, but permits assignment of values to
DATETIME columns using either strings or numbers.

URL: https://mariadb.com/kb/en/datetime/

', '', 'https://mariadb.com/kb/en/datetime/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (16, 'SHOW CREATE TRIGGER', 26, 'Syntax:
SHOW CREATE TRIGGER trigger_name

This statement shows a CREATE TRIGGER statement that creates the given
trigger.

URL: https://mariadb.com/kb/en/show-create-trigger/

', '', 'https://mariadb.com/kb/en/show-create-trigger/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (17, 'SHOW CREATE PROCEDURE', 26, 'Syntax:
SHOW CREATE PROCEDURE proc_name

This statement is a MySQL extension. It returns the exact string that
can be used to re-create the named stored procedure. A similar
statement, SHOW CREATE FUNCTION, displays information about stored
functions (see [HELP SHOW CREATE FUNCTION]).

Both statements require that you be the owner of the routine or have
SELECT access to the mysql.proc table. If you do not have privileges
for the routine itself, the value displayed for the Create Procedure or
Create Function field will be NULL.

URL: https://mariadb.com/kb/en/show-create-procedure/

', 'MariaDB> SHOW CREATE PROCEDURE test.simpleproc\\G
*************************** 1. row ***************************
           Procedure: simpleproc
            sql_mode:
    Create Procedure: CREATE PROCEDURE `simpleproc`(OUT param1 INT)
                      BEGIN
                      SELECT COUNT(*) INTO param1 FROM t;
                      END
character_set_client: latin1
collation_connection: latin1_swedish_ci
  Database Collation: latin1_swedish_ci

MariaDB> SHOW CREATE FUNCTION test.hello\\G
*************************** 1. row ***************************
            Function: hello
            sql_mode:
     Create Function: CREATE FUNCTION `hello`(s CHAR(20))
                      RETURNS CHAR(50)
                      RETURN CONCAT(''Hello, '',s,''!'')
character_set_client: latin1
collation_connection: latin1_swedish_ci
  Database Collation: latin1_swedish_ci
', 'https://mariadb.com/kb/en/show-create-procedure/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (18, 'OPEN', 23, 'Syntax:
OPEN cursor_name

This statement opens a previously declared cursor. For an example, see
https://mariadb.com/kb/en/cursor-overview/.

URL: https://mariadb.com/kb/en/open/

', '', 'https://mariadb.com/kb/en/open/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (19, 'INTEGER', 22, 'INTEGER[(M)] [UNSIGNED] [ZEROFILL]

This type is a synonym for INT.

URL: https://mariadb.com/kb/en/sql_language-data_types-int

', '', 'https://mariadb.com/kb/en/sql_language-data_types-int');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (23, 'MONTH', 31, 'Syntax:
MONTH(date)

Returns the month for date, in the range 1 to 12 for January to
December, or 0 for dates such as ''0000-00-00'' or ''2008-00-00'' that have
a zero month part.

URL: https://mariadb.com/kb/en/month/

', 'MariaDB> SELECT MONTH(''2008-02-03'');
        -> 2
', 'https://mariadb.com/kb/en/month/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (24, 'TINYINT', 22, 'TINYINT[(M)] [UNSIGNED] [ZEROFILL]

A very small integer. The signed range is -128 to 127. The unsigned
range is 0 to 255.

URL: https://mariadb.com/kb/en/tinyint/

', '', 'https://mariadb.com/kb/en/tinyint/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (29, '^', 19, 'Syntax:
^

Bitwise XOR:

URL: https://mariadb.com/kb/en/bitwise-xor/

', 'MariaDB> SELECT 1 ^ 1;
        -> 0
MariaDB> SELECT 1 ^ 0;
        -> 1
MariaDB> SELECT 11 ^ 3;
        -> 8
', 'https://mariadb.com/kb/en/bitwise-xor/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (20, 'LOWER', 37, 'Syntax:
LOWER(str)

Returns the string str with all characters changed to lowercase
according to the current character set mapping. The default is latin1
(cp1252 West European).

MariaDB> SELECT LOWER(''QUADRATICALLY'');
        -> ''quadratically''

LOWER() (and UPPER()) are ineffective when applied to binary strings
(BINARY, VARBINARY, BLOB). To perform lettercase conversion, convert
the string to a nonbinary string:

MariaDB> SET @str = BINARY ''New York'';
MariaDB> SELECT LOWER(@str), LOWER(CONVERT(@str USING latin1));
+-------------+-----------------------------------+
| LOWER(@str) | LOWER(CONVERT(@str USING latin1)) |
+-------------+-----------------------------------+
| New York    | new york                          |
+-------------+-----------------------------------+

URL: https://mariadb.com/kb/en/lower/

', '', 'https://mariadb.com/kb/en/lower/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (21, 'SHOW COLUMNS', 26, 'Syntax:
SHOW [FULL] COLUMNS {FROM | IN} tbl_name [{FROM | IN} db_name]
    [LIKE ''pattern'' | WHERE expr]

SHOW COLUMNS displays information about the columns in a given table.
It also works for views. The LIKE clause, if present, indicates which
column names to match. The WHERE clause can be given to select rows
using more general conditions, as discussed in
https://mariadb.com/kb/en/extended-show/.

SHOW COLUMNS displays information only for those columns for which you
have some privilege.

MariaDB> SHOW COLUMNS FROM City;
+------------+----------+------+-----+---------+----------------+
| Field      | Type     | Null | Key | Default | Extra          |
+------------+----------+------+-----+---------+----------------+
| Id         | int(11)  | NO   | PRI | NULL    | auto_increment |
| Name       | char(35) | NO   |     |         |                |
| Country    | char(3)  | NO   | UNI |         |                |
| District   | char(20) | YES  | MUL |         |                |
| Population | int(11)  | NO   |     | 0       |                |
+------------+----------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

If the data types differ from what you expect them to be based on a
CREATE TABLE statement, note that MySQL sometimes changes data types
when you create or alter a table. The conditions under which this
occurs are described in
https://mariadb.com/kb/en/silent-column-changes/.

The FULL keyword causes the output to include the column collation and
comments, as well as the privileges you have for each column.

You can use db_name.tbl_name as an alternative to the tbl_name FROM
db_name syntax. In other words, these two statements are equivalent:

MariaDB> SHOW COLUMNS FROM mytable FROM mydb;
MariaDB> SHOW COLUMNS FROM mydb.mytable;

SHOW COLUMNS displays the following values for each table column:

Field indicates the column name.

Type indicates the column data type.

Collation indicates the collation for nonbinary string columns, or NULL
for other columns. This value is displayed only if you use the FULL
keyword.

The Null field contains YES if NULL values can be stored in the column,
NO if not.

The Key field indicates whether the column is indexed:

o If Key is empty, the column either is not indexed or is indexed only
  as a secondary column in a multiple-column, nonunique index.

o If Key is PRI, the column is a PRIMARY KEY or is one of the columns
  in a multiple-column PRIMARY KEY.

o If Key is UNI, the column is the first column of a UNIQUE index. (A
  UNIQUE index permits multiple NULL values, but you can tell whether
  the column permits NULL by checking the Null field.)

o If Key is MUL, the column is the first column of a nonunique index in
  which multiple occurrences of a given value are permitted within the
  column.

If more than one of the Key values applies to a given column of a
table, Key displays the one with the highest priority, in the order
PRI, UNI, MUL.

A UNIQUE index may be displayed as PRI if it cannot contain NULL values
and there is no PRIMARY KEY in the table. A UNIQUE index may display as
MUL if several columns form a composite UNIQUE index; although the
combination of the columns is unique, each column can still hold
multiple occurrences of a given value.

The Default field indicates the default value that is assigned to the
column. This is NULL if the column has an explicit default of NULL, or
if the column definition has no DEFAULT clause.

The Extra field contains any additional information that is available
about a given column. The value is nonempty in these cases:
auto_increment for columns that have the AUTO_INCREMENT attribute; on
update CURRENT_TIMESTAMP for TIMESTAMP columns that have the ON UPDATE
CURRENT_TIMESTAMP attribute.

Privileges indicates the privileges you have for the column. This value
is displayed only if you use the FULL keyword.

Comment indicates any comment the column has. This value is displayed
only if you use the FULL keyword.

SHOW FIELDS is a synonym for SHOW COLUMNS. You can also list a table''s
columns with the mysqlshow db_name tbl_name command.

The DESCRIBE statement provides information similar to SHOW COLUMNS.
See [HELP DESCRIBE].

The SHOW CREATE TABLE, SHOW TABLE STATUS, and SHOW INDEX statements
also provide information about tables. See [HELP SHOW].

URL: https://mariadb.com/kb/en/show-columns/

', '', 'https://mariadb.com/kb/en/show-columns/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (30, 'DROP VIEW', 39, 'Syntax:
DROP VIEW [IF EXISTS]
    view_name [, view_name] ...
    [RESTRICT | CASCADE]

DROP VIEW removes one or more views. You must have the DROP privilege
for each view. If any of the views named in the argument list do not
exist, MySQL returns an error indicating by name which nonexisting
views it was unable to drop, but it also drops all of the views in the
list that do exist.

The IF EXISTS clause prevents an error from occurring for views that
don''t exist. When this clause is given, a NOTE is generated for each
nonexistent view. See [HELP SHOW WARNINGS].

RESTRICT and CASCADE, if given, are parsed and ignored.

URL: https://mariadb.com/kb/en/drop-view/

', '', 'https://mariadb.com/kb/en/drop-view/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (31, 'WITHIN', 30, 'Within(g1,g2)

Returns 1 or 0 to indicate whether g1 is spatially within g2. This
tests the opposite relationship as Contains().

URL: https://mariadb.com/kb/en/within/

', '', 'https://mariadb.com/kb/en/within/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (32, 'WEEK', 31, 'Syntax:
WEEK(date[,mode])

This function returns the week number for date. The two-argument form
of WEEK() enables you to specify whether the week starts on Sunday or
Monday and whether the return value should be in the range from 0 to 53
or from 1 to 53. If the mode argument is omitted, the value of the
default_week_format system variable is used. See
https://mariadb.com/kb/en/server-system-variables/.

URL: https://mariadb.com/kb/en/week/

', 'MariaDB> SELECT WEEK(''2008-02-20'');
        -> 7
MariaDB> SELECT WEEK(''2008-02-20'',0);
        -> 7
MariaDB> SELECT WEEK(''2008-02-20'',1);
        -> 8
MariaDB> SELECT WEEK(''2008-12-31'',1);
        -> 53
', 'https://mariadb.com/kb/en/week/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (34, 'DROP FUNCTION UDF', 21, 'Syntax:
DROP FUNCTION function_name

This statement drops the user-defined function (UDF) named
function_name.

To drop a function, you must have the DELETE privilege for the mysql
database. This is because DROP FUNCTION removes a row from the
mysql.func system table that records the function''s name, type, and
shared library name.

URL: https://mariadb.com/kb/en/drop-function-udf/

', '', 'https://mariadb.com/kb/en/drop-function-udf/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (22, 'CREATE TRIGGER', 39, 'Syntax:
CREATE
    [DEFINER = { user | CURRENT_USER }]
    TRIGGER trigger_name trigger_time trigger_event
    ON tbl_name FOR EACH ROW trigger_body

This statement creates a new trigger. A trigger is a named database
object that is associated with a table, and that activates when a
particular event occurs for the table. The trigger becomes associated
with the table named tbl_name, which must refer to a permanent table.
You cannot associate a trigger with a TEMPORARY table or a view.

CREATE TRIGGER requires the TRIGGER privilege for the table associated
with the trigger. The statement might also require the SUPER privilege,
depending on the DEFINER value, as described later in this section. If
binary logging is enabled, CREATE TRIGGER might require the SUPER
privilege, as described in
https://mariadb.com/kb/en/binary-logging-of-stored-routines/.

The DEFINER clause determines the security context to be used when
checking access privileges at trigger activation time. See later in
this section for more information.

trigger_time is the trigger action time. It can be BEFORE or AFTER to
indicate that the trigger activates before or after each row to be
modified.

trigger_event indicates the kind of statement that activates the
trigger. The trigger_event can be one of the following:

o INSERT: The trigger is activated whenever a new row is inserted into
  the table; for example, through INSERT, LOAD DATA, and REPLACE
  statements.

o UPDATE: The trigger is activated whenever a row is modified; for
  example, through UPDATE statements.

o DELETE: The trigger is activated whenever a row is deleted from the
  table; for example, through DELETE and REPLACE statements. However,
  DROP TABLE and TRUNCATE TABLE statements on the table do not activate
  this trigger, because they do not use DELETE. Dropping a partition
  does not activate DELETE triggers, either. See [HELP TRUNCATE TABLE].

URL: https://mariadb.com/kb/en/create-trigger/

', '', 'https://mariadb.com/kb/en/create-trigger/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (25, 'SHOW TRIGGERS', 26, 'Syntax:
SHOW TRIGGERS [{FROM | IN} db_name]
    [LIKE ''pattern'' | WHERE expr]

SHOW TRIGGERS lists the triggers currently defined for tables in a
database (the default database unless a FROM clause is given). This
statement returns results only for databases and tables for which you
have the TRIGGER privilege. The LIKE clause, if present, indicates
which table names to match and causes the statement to display triggers
for those tables. The WHERE clause can be given to select rows using
more general conditions, as discussed in
https://mariadb.com/kb/en/extended-show/.

For the trigger ins_sum as defined in
https://mariadb.com/kb/en/triggers/, the output of
this statement is as shown here:

MariaDB> SHOW TRIGGERS LIKE ''acc%''\\G
*************************** 1. row ***************************
             Trigger: ins_sum
               Event: INSERT
               Table: account
           Statement: SET @sum = @sum + NEW.amount
              Timing: BEFORE
             Created: NULL
            sql_mode:
             Definer: myname@localhost
character_set_client: latin1
collation_connection: latin1_swedish_ci
  Database Collation: latin1_swedish_ci

character_set_client is the session value of the character_set_client
system variable when the trigger was created. collation_connection is
the session value of the collation_connection system variable when the
trigger was created. Database Collation is the collation of the
database with which the trigger is associated.

URL: https://mariadb.com/kb/en/show-triggers/

', '', 'https://mariadb.com/kb/en/show-triggers/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (26, 'MASTER_POS_WAIT', 14, 'Syntax:
MASTER_POS_WAIT(log_name,log_pos[,timeout])

This function is useful for control of master/slave synchronization. It
blocks until the slave has read and applied all updates up to the
specified position in the master log. The return value is the number of
log events the slave had to wait for to advance to the specified
position. The function returns NULL if the slave SQL thread is not
started, the slave''s master information is not initialized, the
arguments are incorrect, or an error occurs. It returns -1 if the
timeout has been exceeded. If the slave SQL thread stops while
MASTER_POS_WAIT() is waiting, the function returns NULL. If the slave
is past the specified position, the function returns immediately.

If a timeout value is specified, MASTER_POS_WAIT() stops waiting when
timeout seconds have elapsed. timeout must be greater than 0; a zero or
negative timeout means no timeout.

URL: https://mariadb.com/kb/en/master_pos_wait/

', '', 'https://mariadb.com/kb/en/master_pos_wait/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (27, 'REGEXP', 37, 'Syntax:
expr REGEXP pat, expr RLIKE pat

Performs a pattern match of a string expression expr against a pattern
pat. The pattern can be an extended regular expression. The syntax for
regular expressions is discussed in
https://mariadb.com/kb/en/regexp/. Returns 1 if expr
matches pat; otherwise it returns 0. If either expr or pat is NULL, the
result is NULL. RLIKE is a synonym for REGEXP, provided for mSQL
compatibility.

The pattern need not be a literal string. For example, it can be
specified as a string expression or table column.

*Note*: Because MySQL uses the C escape syntax in strings (for example,
"\\n" to represent the newline character), you must double any "\\" that
you use in your REGEXP strings.

REGEXP is not case sensitive, except when used with binary strings.

URL: https://mariadb.com/kb/en/regexp/

', 'MariaDB> SELECT ''Monty!'' REGEXP ''.*'';
        -> 1
MariaDB> SELECT ''new*\\n*line'' REGEXP ''new\\\\*.\\\\*line'';
        -> 1
MariaDB> SELECT ''a'' REGEXP ''A'', ''a'' REGEXP BINARY ''A'';
        -> 1  0
MariaDB> SELECT ''a'' REGEXP ''^[a-d]'';
        -> 1
', 'https://mariadb.com/kb/en/regexp/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (39, 'SHOW BINARY LOGS', 26, 'Syntax:
SHOW BINARY LOGS
SHOW MASTER LOGS

Lists the binary log files on the server. This statement is used as
part of the procedure described in [HELP PURGE BINARY LOGS], that shows
how to determine which logs can be purged.

MariaDB> SHOW BINARY LOGS;
+---------------+-----------+
| Log_name      | File_size |
+---------------+-----------+
| binlog.000015 |    724935 |
| binlog.000016 |    733481 |
+---------------+-----------+

URL: https://mariadb.com/kb/en/show-binary-logs/

', '', 'https://mariadb.com/kb/en/show-binary-logs/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (40, 'POLYGON', 24, 'Polygon(ls1,ls2,...)

Constructs a Polygon value from a number of LineString or WKB
LineString arguments. If any argument does not represent a LinearRing
(that is, not a closed and simple LineString), the return value is
NULL.

URL: https://mariadb.com/kb/en/polygon/

', '', 'https://mariadb.com/kb/en/polygon/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (41, 'MINUTE', 31, 'Syntax:
MINUTE(time)

Returns the minute for time, in the range 0 to 59.

URL: https://mariadb.com/kb/en/minute/

', 'MariaDB> SELECT MINUTE(''2008-02-03 10:05:03'');
        -> 5
', 'https://mariadb.com/kb/en/minute/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (42, 'DAY', 31, 'Syntax:
DAY(date)

DAY() is a synonym for DAYOFMONTH().

URL: https://mariadb.com/kb/en/day/

', '', 'https://mariadb.com/kb/en/day/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (43, 'MID', 37, 'Syntax:
MID(str,pos,len)

MID(str,pos,len) is a synonym for SUBSTRING(str,pos,len).

URL: https://mariadb.com/kb/en/mid/

', '', 'https://mariadb.com/kb/en/mid/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (45, 'LINESTRING', 24, 'LineString(pt1,pt2,...)

Constructs a LineString value from a number of Point or WKB Point
arguments. If the number of arguments is less than two, the return
value is NULL.

URL: https://mariadb.com/kb/en/linestring/

', '', 'https://mariadb.com/kb/en/linestring/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (28, 'IF STATEMENT', 23, 'Syntax:
IF search_condition THEN statement_list
    [ELSEIF search_condition THEN statement_list] ...
    [ELSE statement_list]
END IF

The IF statement for stored programs implements a basic conditional
construct.

*Note*: There is also an IF() function, which differs from the IF
statement described here. See
https://mariadb.com/kb/en/if-function/. The
IF statement can have THEN, ELSE, and ELSEIF clauses, and it is
terminated with END IF.

If the search_condition evaluates to true, the corresponding THEN or
ELSEIF clause statement_list executes. If no search_condition matches,
the ELSE clause statement_list executes.

Each statement_list consists of one or more SQL statements; an empty
statement_list is not permitted.

URL: https://mariadb.com/kb/en/if-statement/

', '', 'https://mariadb.com/kb/en/if-statement/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (33, 'SHOW PLUGINS', 26, 'Syntax:
SHOW PLUGINS

SHOW PLUGINS displays information about server plugins. Plugin
information is also available in the INFORMATION_SCHEMA.PLUGINS table.
See https://mariadb.com/kb/en/information_schemaplugins-table/.

Example of SHOW PLUGINS output:

MariaDB> SHOW PLUGINS\\G
*************************** 1. row ***************************
   Name: binlog
 Status: ACTIVE
   Type: STORAGE ENGINE
Library: NULL
License: GPL
*************************** 2. row ***************************
   Name: CSV
 Status: ACTIVE
   Type: STORAGE ENGINE
Library: NULL
License: GPL
*************************** 3. row ***************************
   Name: MEMORY
 Status: ACTIVE
   Type: STORAGE ENGINE
Library: NULL
License: GPL
*************************** 4. row ***************************
   Name: MyISAM
 Status: ACTIVE
   Type: STORAGE ENGINE
Library: NULL
License: GPL
...

URL: https://mariadb.com/kb/en/show-plugins/

', '', 'https://mariadb.com/kb/en/show-plugins/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (35, 'PREPARE', 8, 'Syntax:
PREPARE stmt_name FROM preparable_stmt

The PREPARE statement prepares a statement and assigns it a name,
stmt_name, by which to refer to the statement later. Statement names
are not case sensitive. preparable_stmt is either a string literal or a
user variable that contains the text of the statement. The text must
represent a single SQL statement, not multiple statements. Within the
statement, "?" characters can be used as parameter markers to indicate
where data values are to be bound to the query later when you execute
it. The "?" characters should not be enclosed within quotation marks,
even if you intend to bind them to string values. Parameter markers can
be used only where data values should appear, not for SQL keywords,
identifiers, and so forth.

If a prepared statement with the given name already exists, it is
deallocated implicitly before the new statement is prepared. This means
that if the new statement contains an error and cannot be prepared, an
error is returned and no statement with the given name exists.

A prepared statement is executed with EXECUTE and released with
DEALLOCATE PREPARE.

The scope of a prepared statement is the session within which it is
created. Other sessions cannot see it.

URL: https://mariadb.com/kb/en/prepare-statement/

', '', 'https://mariadb.com/kb/en/prepare-statement/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (36, 'LOCK', 8, 'Syntax:
LOCK TABLES
    tbl_name [[AS] alias] lock_type
    [, tbl_name [[AS] alias] lock_type] ...

lock_type:
    READ [LOCAL]
  | [LOW_PRIORITY] WRITE

UNLOCK TABLES

MySQL enables client sessions to acquire table locks explicitly for the
purpose of cooperating with other sessions for access to tables, or to
prevent other sessions from modifying tables during periods when a
session requires exclusive access to them. A session can acquire or
release locks only for itself. One session cannot acquire locks for
another session or release locks held by another session.

Locks may be used to emulate transactions or to get more speed when
updating tables. This is explained in more detail later in this
section.

LOCK TABLES explicitly acquires table locks for the current client
session. Table locks can be acquired for base tables or views. You must
have the LOCK TABLES privilege, and the SELECT privilege for each
object to be locked.

For view locking, LOCK TABLES adds all base tables used in the view to
the set of tables to be locked and locks them automatically. If you
lock a table explicitly with LOCK TABLES, any tables used in triggers
are also locked implicitly, as described in
https://mariadb.com/kb/en/triggers-and-implicit-locks/.

UNLOCK TABLES explicitly releases any table locks held by the current
session. LOCK TABLES implicitly releases any table locks held by the
current session before acquiring new locks.

Another use for UNLOCK TABLES is to release the global read lock
acquired with the FLUSH TABLES WITH READ LOCK statement, which enables
you to lock all tables in all databases. See [HELP FLUSH]. (This is a
very convenient way to get backups if you have a file system such as
Veritas that can take snapshots in time.)

URL: https://mariadb.com/kb/en/transactions-lock/

', '', 'https://mariadb.com/kb/en/transactions-lock/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (46, 'SLEEP', 14, 'Syntax:
SLEEP(duration)

Sleeps (pauses) for the number of seconds given by the duration
argument, then returns 0. If SLEEP() is interrupted, it returns 1. The
duration may have a fractional part given in microseconds.

URL: https://mariadb.com/kb/en/sleep/

', '', 'https://mariadb.com/kb/en/sleep/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (47, 'CONNECTION_ID', 17, 'Syntax:
CONNECTION_ID()

Returns the connection ID (thread ID) for the connection. Every
connection has an ID that is unique among the set of currently
connected clients.

URL: https://mariadb.com/kb/en/connection_id/

', 'MariaDB> SELECT CONNECTION_ID();
        -> 23786
', 'https://mariadb.com/kb/en/connection_id/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (49, 'ROUND', 4, 'Syntax:
ROUND(X), ROUND(X,D)

Rounds the argument X to D decimal places. The rounding algorithm
depends on the data type of X. D defaults to 0 if not specified. D can
be negative to cause D digits left of the decimal point of the value X
to become zero.

URL: https://mariadb.com/kb/en/round/

', 'MariaDB> SELECT ROUND(-1.23);
        -> -1
MariaDB> SELECT ROUND(-1.58);
        -> -2
MariaDB> SELECT ROUND(1.58);
        -> 2
MariaDB> SELECT ROUND(1.298, 1);
        -> 1.3
MariaDB> SELECT ROUND(1.298, 0);
        -> 1
MariaDB> SELECT ROUND(23.298, -1);
        -> 20
', 'https://mariadb.com/kb/en/round/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (50, 'NULLIF', 7, 'Syntax:
NULLIF(expr1,expr2)

Returns NULL if expr1 = expr2 is true, otherwise returns expr1. This is
the same as CASE WHEN expr1 = expr2 THEN NULL ELSE expr1 END.

URL: https://mariadb.com/kb/en/nullif/

', 'MariaDB> SELECT NULLIF(1,1);
        -> NULL
MariaDB> SELECT NULLIF(1,2);
        -> 1
', 'https://mariadb.com/kb/en/nullif/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (51, 'CLOSE', 23, 'Syntax:
CLOSE cursor_name

This statement closes a previously opened cursor. For an example, see
https://mariadb.com/kb/en/cursor-overview/.

An error occurs if the cursor is not open.

If not closed explicitly, a cursor is closed at the end of the BEGIN
... END block in which it was declared.

URL: https://mariadb.com/kb/en/close/

', '', 'https://mariadb.com/kb/en/close/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (53, 'TIMEDIFF', 31, 'Syntax:
TIMEDIFF(expr1,expr2)

TIMEDIFF() returns expr1 - expr2 expressed as a time value. expr1 and
expr2 are time or date-and-time expressions, but both must be of the
same type.

The result returned by TIMEDIFF() is limited to the range allowed for
TIME values. Alternatively, you can use either of the functions
TIMESTAMPDIFF() and UNIX_TIMESTAMP(), both of which return integers.

URL: https://mariadb.com/kb/en/timediff/

', 'MariaDB> SELECT TIMEDIFF(''2000:01:01 00:00:00'',
    ->                 ''2000:01:01 00:00:00.000001'');
        -> ''-00:00:00.000001''
MariaDB> SELECT TIMEDIFF(''2008-12-31 23:59:59.000001'',
    ->                 ''2008-12-30 01:01:01.000002'');
        -> ''46:58:57.999999''
', 'https://mariadb.com/kb/en/timediff/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (37, 'UPDATEXML', 37, 'Syntax:
UpdateXML(xml_target, xpath_expr, new_xml)

This function replaces a single portion of a given fragment of XML
markup xml_target with a new XML fragment new_xml, and then returns the
changed XML. The portion of xml_target that is replaced matches an
XPath expression xpath_expr supplied by the user. In MySQL 5.5, the
XPath expression can contain at most 127 characters. (This limitation
is lifted in MySQL 5.6.)

If no expression matching xpath_expr is found, or if multiple matches
are found, the function returns the original xml_target XML fragment.
All three arguments should be strings.

URL: https://mariadb.com/kb/en/updatexml/

', 'MariaDB> SELECT
    ->   UpdateXML(''<a><b>ccc</b><d></d></a>'', ''/a'', ''<e>fff</e>'') AS val1,
    ->   UpdateXML(''<a><b>ccc</b><d></d></a>'', ''/b'', ''<e>fff</e>'') AS val2,
    ->   UpdateXML(''<a><b>ccc</b><d></d></a>'', ''//b'', ''<e>fff</e>'') AS val3,
    ->   UpdateXML(''<a><b>ccc</b><d></d></a>'', ''/a/d'', ''<e>fff</e>'') AS val4,
    ->   UpdateXML(''<a><d></d><b>ccc</b><d></d></a>'', ''/a/d'', ''<e>fff</e>'') AS val5
    -> \\G

*************************** 1. row ***************************
val1: <e>fff</e>
val2: <a><b>ccc</b><d></d></a>
val3: <a><e>fff</e><d></d></a>
val4: <a><b>ccc</b><e>fff</e></a>
val5: <a><d></d><b>ccc</b><d></d></a>
', 'https://mariadb.com/kb/en/updatexml/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (38, 'RESET SLAVE', 8, 'Syntax:
RESET SLAVE [ALL]

RESET SLAVE makes the slave forget its replication position in the
master''s binary log. This statement is meant to be used for a clean
start: It deletes the master.info and relay-log.info files, all the
relay log files, and starts a new relay log file. To use RESET SLAVE,
the slave replication threads must be stopped (use STOP SLAVE if
necessary).

*Note*: All relay log files are deleted, even if they have not been
completely executed by the slave SQL thread. (This is a condition
likely to exist on a replication slave if you have issued a STOP SLAVE
statement or if the slave is highly loaded.)

In MySQL 5.5 (unlike the case in MySQL 5.1 and earlier), RESET SLAVE
does not change any replication connection parameters such as master
host, master port, master user, or master password, which are retained
in memory. This means that START SLAVE can be issued without requiring
a CHANGE MASTER TO statement following RESET SLAVE.

In MySQL 5.5.16 and later, you can use RESET SLAVE ALL to reset these
connection parameters (Bug #11809016). Connection parameters are also
reset if the slave mysqld is shut down.

If the slave SQL thread was in the middle of replicating temporary
tables when it was stopped, and RESET SLAVE is issued, these replicated
temporary tables are deleted on the slave.

URL: https://mariadb.com/kb/en/reset-slave-connection_name/

', '', 'https://mariadb.com/kb/en/reset-slave-connection_name/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (44, 'UUID', 14, 'Syntax:
UUID()

Returns a Universal Unique Identifier (UUID) generated according to
"DCE 1.1: Remote Procedure Call" (Appendix A) CAE (Common Applications
Environment) Specifications published by The Open Group in October 1997
(Document Number C706,
http://www.opengroup.org/public/pubs/catalog/c706.htm).

A UUID is designed as a number that is globally unique in space and
time. Two calls to UUID() are expected to generate two different
values, even if these calls are performed on two separate computers
that are not connected to each other.

A UUID is a 128-bit number represented by a utf8 string of five
hexadecimal numbers in aaaaaaaa-bbbb-cccc-dddd-eeeeeeeeeeee format:

o The first three numbers are generated from a timestamp.

o The fourth number preserves temporal uniqueness in case the timestamp
  value loses monotonicity (for example, due to daylight saving time).

o The fifth number is an IEEE 802 node number that provides spatial
  uniqueness. A random number is substituted if the latter is not
  available (for example, because the host computer has no Ethernet
  card, or we do not know how to find the hardware address of an
  interface on your operating system). In this case, spatial uniqueness
  cannot be guaranteed. Nevertheless, a collision should have very low
  probability.

  Currently, the MAC address of an interface is taken into account only
  on FreeBSD and Linux. On other operating systems, MySQL uses a
  randomly generated 48-bit number.

URL: https://mariadb.com/kb/en/uuid/

', 'MariaDB> SELECT UUID();
        -> ''6ccd780c-baba-1026-9564-0040f4311e29''
', 'https://mariadb.com/kb/en/uuid/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (48, 'DELETE', 27, 'Syntax:
Single-table syntax:

DELETE [LOW_PRIORITY] [QUICK] [IGNORE] FROM tbl_name
    [WHERE where_condition]
    [ORDER BY ...]
    [LIMIT row_count]

Multiple-table syntax:

DELETE [LOW_PRIORITY] [QUICK] [IGNORE]
    tbl_name[.*] [, tbl_name[.*]] ...
    FROM table_references
    [WHERE where_condition]

Or:

DELETE [LOW_PRIORITY] [QUICK] [IGNORE]
    FROM tbl_name[.*] [, tbl_name[.*]] ...
    USING table_references
    [WHERE where_condition]

For the single-table syntax, the DELETE statement deletes rows from
tbl_name and returns a count of the number of deleted rows. This count
can be obtained by calling the ROW_COUNT() function (see
https://mariadb.com/kb/en/information-functions-row_count/). The
WHERE clause, if given, specifies the conditions that identify which
rows to delete. With no WHERE clause, all rows are deleted. If the
ORDER BY clause is specified, the rows are deleted in the order that is
specified. The LIMIT clause places a limit on the number of rows that
can be deleted.

For the multiple-table syntax, DELETE deletes from each tbl_name the
rows that satisfy the conditions. In this case, ORDER BY and LIMIT
cannot be used.

where_condition is an expression that evaluates to true for each row to
be deleted. It is specified as described in
https://mariadb.com/kb/en/select/.

Currently, you cannot delete from a table and select from the same
table in a subquery.

You need the DELETE privilege on a table to delete rows from it. You
need only the SELECT privilege for any columns that are only read, such
as those named in the WHERE clause.

As stated, a DELETE statement with no WHERE clause deletes all rows. A
faster way to do this, when you do not need to know the number of
deleted rows, is to use TRUNCATE TABLE. However, within a transaction
or if you have a lock on the table, TRUNCATE TABLE cannot be used
whereas DELETE can. See [HELP TRUNCATE TABLE], and [HELP LOCK].

URL: https://mariadb.com/kb/en/delete/

', '', 'https://mariadb.com/kb/en/delete/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (54, 'REPLACE FUNCTION', 37, 'Syntax:
REPLACE(str,from_str,to_str)

Returns the string str with all occurrences of the string from_str
replaced by the string to_str. REPLACE() performs a case-sensitive
match when searching for from_str.

URL: https://mariadb.com/kb/en/replace-function/

', 'MariaDB> SELECT REPLACE(''www.mariadb.org'', ''w'', ''Ww'');
        -> ''WwWwWw.mariadb.org''
', 'https://mariadb.com/kb/en/replace-function/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (55, 'USE', 28, 'Syntax:
USE db_name

The USE db_name statement tells MySQL to use the db_name database as
the default (current) database for subsequent statements. The database
remains the default until the end of the session or another USE
statement is issued:

USE db1;
SELECT COUNT(*) FROM mytable;   # selects from db1.mytable
USE db2;
SELECT COUNT(*) FROM mytable;   # selects from db2.mytable

URL: https://mariadb.com/kb/en/use/

', '', 'https://mariadb.com/kb/en/use/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (52, 'STOP SLAVE', 8, 'Syntax:
STOP SLAVE [thread_types]

thread_types:
    [thread_type [, thread_type] ... ]

thread_type: IO_THREAD | SQL_THREAD

Stops the slave threads. STOP SLAVE requires the SUPER privilege.
Recommended best practice is to execute STOP SLAVE on the slave before
stopping the slave server (see
http://dev.mysql.com/doc/refman/5.5/en/server-shutdown.html, for more
information).

When using the row-based logging format: You should execute STOP SLAVE
on the slave prior to shutting down the slave server if you are
replicating any tables that use a nontransactional storage engine (see
the Note later in this section). In MySQL 5.5.9 and later, you can also
use STOP SLAVE SQL_THREAD for this purpose.

Like START SLAVE, this statement may be used with the IO_THREAD and
SQL_THREAD options to name the thread or threads to be stopped.

*Note*: In MySQL 5.5, STOP SLAVE waits until the current replication
event group affecting one or more non-transactional tables has finished
executing (if there is any such replication group), or until the user
issues a KILL QUERY or KILL CONNECTION statement. (Bug #319, Bug
#38205)

URL: https://mariadb.com/kb/en/stop-slave/

', '', 'https://mariadb.com/kb/en/stop-slave/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (56, 'LINEFROMTEXT', 3, 'LineFromText(wkt[,srid]), LineStringFromText(wkt[,srid])

Constructs a LINESTRING value using its WKT representation and SRID.

URL: https://mariadb.com/kb/en/linefromtext/

', '', 'https://mariadb.com/kb/en/linefromtext/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (57, 'CASE OPERATOR', 7, 'Syntax:
CASE value WHEN [compare_value] THEN result [WHEN [compare_value] THEN
result ...] [ELSE result] END

CASE WHEN [condition] THEN result [WHEN [condition] THEN result ...]
[ELSE result] END

The first version returns the result where value=compare_value. The
second version returns the result for the first condition that is true.
If there was no matching result value, the result after ELSE is
returned, or NULL if there is no ELSE part.

URL: https://mariadb.com/kb/en/case-operator/

', 'MariaDB> SELECT CASE 1 WHEN 1 THEN ''one''
    ->     WHEN 2 THEN ''two'' ELSE ''more'' END;
        -> ''one''
MariaDB> SELECT CASE WHEN 1>0 THEN ''true'' ELSE ''false'' END;
        -> ''true''
MariaDB> SELECT CASE BINARY ''B''
    ->     WHEN ''a'' THEN 1 WHEN ''b'' THEN 2 END;
        -> NULL
', 'https://mariadb.com/kb/en/case-operator/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (58, 'SHOW MASTER STATUS', 26, 'Syntax:
SHOW MASTER STATUS

This statement provides status information about the binary log files
of the master. It requires either the SUPER or REPLICATION CLIENT
privilege.

Example:

MariaDB> SHOW MASTER STATUS;
+---------------+----------+--------------+------------------+
| File          | Position | Binlog_Do_DB | Binlog_Ignore_DB |
+---------------+----------+--------------+------------------+
| mysql-bin.003 | 73       | test         | manual,mysql     |
+---------------+----------+--------------+------------------+

URL: https://mariadb.com/kb/en/show-master-status/

', '', 'https://mariadb.com/kb/en/show-master-status/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (59, 'ADDTIME', 31, 'Syntax:
ADDTIME(expr1,expr2)

ADDTIME() adds expr2 to expr1 and returns the result. expr1 is a time
or datetime expression, and expr2 is a time expression.

URL: https://mariadb.com/kb/en/addtime/

', 'MariaDB> SELECT ADDTIME(''2007-12-31 23:59:59.999999'', ''1 1:1:1.000002'');
        -> ''2008-01-02 01:01:01.000001''
MariaDB> SELECT ADDTIME(''01:00:00.999999'', ''02:00:00.999998'');
        -> ''03:00:01.999997''
', 'https://mariadb.com/kb/en/addtime/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (60, 'SPATIAL', 34, 'For MyISAM tables, MySQL can create spatial indexes using syntax
similar to that for creating regular indexes, but extended with the
SPATIAL keyword. Currently, columns in spatial indexes must be declared
NOT NULL. The following examples demonstrate how to create spatial
indexes:

o With CREATE TABLE:

CREATE TABLE geom (g GEOMETRY NOT NULL, SPATIAL INDEX(g)) ENGINE=MyISAM;

o With ALTER TABLE:

ALTER TABLE geom ADD SPATIAL INDEX(g);

o With CREATE INDEX:

CREATE SPATIAL INDEX sp_index ON geom (g);

For MyISAM tables, SPATIAL INDEX creates an R-tree index. For storage
engines that support nonspatial indexing of spatial columns, the engine
creates a B-tree index. A B-tree index on spatial values will be useful
for exact-value lookups, but not for range scans.

For more information on indexing spatial columns, see [HELP CREATE
INDEX].

To drop spatial indexes, use ALTER TABLE or DROP INDEX:

o With ALTER TABLE:

ALTER TABLE geom DROP INDEX g;

o With DROP INDEX:

DROP INDEX sp_index ON geom;

Example: Suppose that a table geom contains more than 32,000
geometries, which are stored in the column g of type GEOMETRY. The
table also has an AUTO_INCREMENT column fid for storing object ID
values.

URL: https://mariadb.com/kb/en/spatial/

', '', 'https://mariadb.com/kb/en/spatial/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (61, 'TO_SECONDS', 31, 'Syntax:
TO_SECONDS(expr)

Given a date or datetime expr, returns a the number of seconds since
the year 0. If expr is not a valid date or datetime value, returns
NULL.

URL: https://mariadb.com/kb/en/to_seconds/

', 'MariaDB> SELECT TO_SECONDS(950501);
        -> 62966505600
MariaDB> SELECT TO_SECONDS(''2009-11-29'');
        -> 63426672000
MariaDB> SELECT TO_SECONDS(''2009-11-29 13:43:32'');
        -> 63426721412
MariaDB> SELECT TO_SECONDS( NOW() );
        -> 63426721458
', 'https://mariadb.com/kb/en/to_seconds/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (63, 'UPPER', 37, 'Syntax:
UPPER(str)

Returns the string str with all characters changed to uppercase
according to the current character set mapping. The default is latin1
(cp1252 West European).

MariaDB> SELECT UPPER(''Hej'');
        -> ''HEJ''

See the description of LOWER() for information that also applies to
UPPER(), such as information about how to perform lettercase conversion
of binary strings (BINARY, VARBINARY, BLOB) for which these functions
are ineffective.

URL: https://mariadb.com/kb/en/upper/

', '', 'https://mariadb.com/kb/en/upper/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (65, 'MEDIUMBLOB', 22, 'MEDIUMBLOB

A BLOB column with a maximum length of 16,777,215 (224 - 1) bytes. Each
MEDIUMBLOB value is stored using a 3-byte length prefix that indicates
the number of bytes in the value.

URL: https://mariadb.com/kb/en/mediumblob/

', '', 'https://mariadb.com/kb/en/mediumblob/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (67, 'IFNULL', 7, 'Syntax:
IFNULL(expr1,expr2)

If expr1 is not NULL, IFNULL() returns expr1; otherwise it returns
expr2. IFNULL() returns a numeric or string value, depending on the
context in which it is used.

URL: https://mariadb.com/kb/en/ifnull/

', 'MariaDB> SELECT IFNULL(1,0);
        -> 1
MariaDB> SELECT IFNULL(NULL,10);
        -> 10
MariaDB> SELECT IFNULL(1/0,10);
        -> 10
MariaDB> SELECT IFNULL(1/0,''yes'');
        -> ''yes''
', 'https://mariadb.com/kb/en/ifnull/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (68, 'SHOW FUNCTION CODE', 26, 'Syntax:
SHOW FUNCTION CODE func_name

This statement is similar to SHOW PROCEDURE CODE but for stored
functions. See [HELP SHOW PROCEDURE CODE].

URL: https://mariadb.com/kb/en/show-function-code/

', '', 'https://mariadb.com/kb/en/show-function-code/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (71, '=', 18, '=

Equal:

URL: https://mariadb.com/kb/en/equal/

', 'MariaDB> SELECT 1 = 0;
        -> 0
MariaDB> SELECT ''0'' = 0;
        -> 1
MariaDB> SELECT ''0.0'' = 0;
        -> 1
MariaDB> SELECT ''0.01'' = 0;
        -> 0
MariaDB> SELECT ''.01'' = 0.01;
        -> 1
', 'https://mariadb.com/kb/en/equal/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (72, 'REVERSE', 37, 'Syntax:
REVERSE(str)

Returns the string str with the order of the characters reversed.

URL: https://mariadb.com/kb/en/reverse/

', 'MariaDB> SELECT REVERSE(''abc'');
        -> ''cba''
', 'https://mariadb.com/kb/en/reverse/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (62, 'TIMESTAMPDIFF', 31, 'Syntax:
TIMESTAMPDIFF(unit,datetime_expr1,datetime_expr2)

Returns datetime_expr2 - datetime_expr1, where datetime_expr1 and
datetime_expr2 are date or datetime expressions. One expression may be
a date and the other a datetime; a date value is treated as a datetime
having the time part ''00:00:00'' where necessary. The unit for the
result (an integer) is given by the unit argument. The legal values for
unit are the same as those listed in the description of the
TIMESTAMPADD() function.

URL: https://mariadb.com/kb/en/timestampdiff/

', 'MariaDB> SELECT TIMESTAMPDIFF(MONTH,''2003-02-01'',''2003-05-01'');
        -> 3
MariaDB> SELECT TIMESTAMPDIFF(YEAR,''2002-05-01'',''2001-01-01'');
        -> -1
MariaDB> SELECT TIMESTAMPDIFF(MINUTE,''2003-02-01'',''2003-05-01 12:05:55'');
        -> 128885
', 'https://mariadb.com/kb/en/timestampdiff/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (64, 'FROM_UNIXTIME', 31, 'Syntax:
FROM_UNIXTIME(unix_timestamp), FROM_UNIXTIME(unix_timestamp,format)

Returns a representation of the unix_timestamp argument as a value in
''YYYY-MM-DD HH:MM:SS'' or YYYYMMDDHHMMSS.uuuuuu format, depending on
whether the function is used in a string or numeric context. The value
is expressed in the current time zone. unix_timestamp is an internal
timestamp value such as is produced by the UNIX_TIMESTAMP() function.

If format is given, the result is formatted according to the format
string, which is used the same way as listed in the entry for the
DATE_FORMAT() function.

URL: https://mariadb.com/kb/en/from_unixtime/

', 'MariaDB> SELECT FROM_UNIXTIME(1196440219);
        -> ''2007-11-30 10:30:19''
MariaDB> SELECT FROM_UNIXTIME(1196440219) + 0;
        -> 20071130103019.000000
MariaDB> SELECT FROM_UNIXTIME(UNIX_TIMESTAMP(),
    ->                      ''%Y %D %M %h:%i:%s %x'');
        -> ''2007 30th November 10:30:59 2007''
', 'https://mariadb.com/kb/en/from_unixtime/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (66, 'SHA2', 12, 'Syntax:
SHA2(str, hash_length)

Calculates the SHA-2 family of hash functions (SHA-224, SHA-256,
SHA-384, and SHA-512). The first argument is the cleartext string to be
hashed. The second argument indicates the desired bit length of the
result, which must have a value of 224, 256, 384, 512, or 0 (which is
equivalent to 256). If either argument is NULL or the hash length is
not one of the permitted values, the return value is NULL. Otherwise,
the function result is a hash value containing the desired number of
bits. See the notes at the beginning of this section about storing hash
values efficiently.

As of MySQL 5.5.6, the return value is a nonbinary string in the
connection character set. Before 5.5.6, the return value is a binary
string; see the notes at the beginning of this section about using the
value as a nonbinary string.

URL: https://mariadb.com/kb/en/sha2/

', 'MariaDB> SELECT SHA2(''abc'', 224);
        -> ''23097d223405d8228642a477bda255b32aadbce4bda0b3f7e36c9da7''
', 'https://mariadb.com/kb/en/sha2/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (69, 'SHOW ERRORS', 26, 'Syntax:
SHOW ERRORS [LIMIT [offset,] row_count]
SHOW COUNT(*) ERRORS

This statement is similar to SHOW WARNINGS, except that it displays
information only for errors, rather than for errors, warnings, and
notes.

The LIMIT clause has the same syntax as for the SELECT statement. See
https://mariadb.com/kb/en/select/.

The SHOW COUNT(*) ERRORS statement displays the number of errors. You
can also retrieve this number from the error_count variable:

SHOW COUNT(*) ERRORS;
SELECT @@error_count;

SHOW ERRORS and error_count apply only to errors, not warnings or
notes. In other respects, they are similar to SHOW WARNINGS and
warning_count. In particular, SHOW ERRORS cannot display information
for more than max_error_count messages, and error_count can exceed the
value of max_error_count if the number of errors exceeds
max_error_count.

URL: https://mariadb.com/kb/en/show-errors/

', '', 'https://mariadb.com/kb/en/show-errors/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (70, 'LEAST', 18, 'Syntax:
LEAST(value1,value2,...)

With two or more arguments, returns the smallest (minimum-valued)
argument. The arguments are compared using the following rules:

o If any argument is NULL, the result is NULL. No comparison is needed.

o If the return value is used in an INTEGER context or all arguments
  are integer-valued, they are compared as integers.

o If the return value is used in a REAL context or all arguments are
  real-valued, they are compared as reals.

o If the arguments comprise a mix of numbers and strings, they are
  compared as numbers.

o If any argument is a nonbinary (character) string, the arguments are
  compared as nonbinary strings.

o In all other cases, the arguments are compared as binary strings.

URL: https://mariadb.com/kb/en/least/

', 'MariaDB> SELECT LEAST(2,0);
        -> 0
MariaDB> SELECT LEAST(34.0,3.0,5.0,767.0);
        -> 3.0
MariaDB> SELECT LEAST(''B'',''A'',''C'');
        -> ''A''
', 'https://mariadb.com/kb/en/least/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (73, 'ISNULL', 18, 'Syntax:
ISNULL(expr)

If expr is NULL, ISNULL() returns 1, otherwise it returns 0.

URL: https://mariadb.com/kb/en/isnull/

', 'MariaDB> SELECT ISNULL(1+1);
        -> 0
MariaDB> SELECT ISNULL(1/0);
        -> 1
', 'https://mariadb.com/kb/en/isnull/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (74, 'BINARY', 22, 'BINARY(M)

The BINARY type is similar to the CHAR type, but stores binary byte
strings rather than nonbinary character strings. M represents the
column length in bytes.

URL: https://mariadb.com/kb/en/binary/

', '', 'https://mariadb.com/kb/en/binary/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (75, 'BLOB DATA TYPE', 22, 'A BLOB is a binary large object that can hold a variable amount of
data. The four BLOB types are TINYBLOB, BLOB, MEDIUMBLOB, and LONGBLOB.
These differ only in the maximum length of the values they can hold.
The four TEXT types are TINYTEXT, TEXT, MEDIUMTEXT, and LONGTEXT. These
correspond to the four BLOB types and have the same maximum lengths and
storage requirements. See
https://mariadb.com/kb/en/data-type-storage-requirements/.

URL: https://mariadb.com/kb/en/sql_language-data_types-blob/

', '', 'https://mariadb.com/kb/en/sql_language-data_types-blob/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (76, 'BOUNDARY', 36, 'Boundary(g)

Returns a geometry that is the closure of the combinatorial boundary of
the geometry value g.

URL: https://mariadb.com/kb/en/boundary/

', '', 'https://mariadb.com/kb/en/boundary/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (78, 'POINT', 24, 'Point(x,y)

Constructs a Point using its coordinates.

URL: https://mariadb.com/kb/en/point/

', '', 'https://mariadb.com/kb/en/point/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (79, 'CURRENT_USER', 17, 'Syntax:
CURRENT_USER, CURRENT_USER()

Returns the user name and host name combination for the MySQL account
that the server used to authenticate the current client. This account
determines your access privileges. The return value is a string in the
utf8 character set.

The value of CURRENT_USER() can differ from the value of USER().

URL: https://mariadb.com/kb/en/current_user/

', 'MariaDB> SELECT USER();
        -> ''davida@localhost''
MariaDB> SELECT * FROM mysql.user;
ERROR 1044: Access denied for user ''''@''localhost'' to
database ''mysql''
MariaDB> SELECT CURRENT_USER();
        -> ''@localhost''
', 'https://mariadb.com/kb/en/current_user/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (80, 'LCASE', 37, 'Syntax:
LCASE(str)

LCASE() is a synonym for LOWER().

URL: https://mariadb.com/kb/en/lcase/

', '', 'https://mariadb.com/kb/en/lcase/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (81, '<=', 18, 'Syntax:
<=

Less than or equal:

URL: https://mariadb.com/kb/en/less-than-or-equal/

', 'MariaDB> SELECT 0.1 <= 2;
        -> 1
', 'https://mariadb.com/kb/en/less-than-or-equal/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (82, 'SHOW PROFILES', 26, 'Syntax:
SHOW PROFILES

The SHOW PROFILES statement, together with SHOW PROFILE, displays
profiling information that indicates resource usage for statements
executed during the course of the current session. For more
information, see [HELP SHOW PROFILE].

URL: https://mariadb.com/kb/en/show-profiles/

', '', 'https://mariadb.com/kb/en/show-profiles/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (77, 'CREATE USER', 10, 'Syntax:
CREATE USER user_specification
    [, user_specification] ...

user_specification:
    user
    [
        IDENTIFIED BY [PASSWORD] ''password''
      | IDENTIFIED WITH auth_plugin [AS ''auth_string'']
    ]

The CREATE USER statement creates new MySQL accounts. To use it, you
must have the global CREATE USER privilege or the INSERT privilege for
the mysql database. For each account, CREATE USER creates a new row in
the mysql.user table and assigns the account no privileges. An error
occurs if the account already exists.

Each account name uses the format described in
https://mariadb.com/kb/en/create-user#account-names. For example:

CREATE USER ''jeffrey''@''localhost'' IDENTIFIED BY ''mypass'';

If you specify only the user name part of the account name, a host name
part of ''%'' is used.

The user specification may indicate how the user should authenticate
when connecting to the server:

o To enable the user to connect with no password (which is insecure),
  include no IDENTIFIED BY clause:

CREATE USER ''jeffrey''@''localhost'';

  In this case, the account uses built-in authentication and clients
  must provide no password.

o To assign a password, use IDENTIFIED BY with the literal plaintext
  password value:

CREATE USER ''jeffrey''@''localhost'' IDENTIFIED BY ''mypass'';

  The account uses built-in authentication and clients must match the
  given password.

o To avoid specifying the plaintext password if you know its hash value
  (the value that PASSWORD() would return for the password), specify
  the hash value preceded by the keyword PASSWORD:

CREATE USER ''jeffrey''@''localhost''
IDENTIFIED BY PASSWORD ''*90E462C37378CED12064BB3388827D2BA3A9B689'';

  The account uses built-in authentication and clients must match the
  given password.

o To authenticate the account using a specific authentication plugin,
  use IDENTIFIED WITH, where auth_plugin is the plugin name. It can be
  an unquoted name or a quoted string literal. ''auth_string'' is an
  optional quoted string literal to pass to the plugin. The plugin
  interprets the meaning of the string, so its format is plugin
  specific. Consult the documentation for a given plugin for
  information about the authentication string values it accepts.

CREATE USER ''jeffrey''@''localhost''
IDENTIFIED WITH my_auth_plugin;

  For connections that use this account, the server invokes the named
  plugin and clients must provide credentials as required for the
  authentication method that the plugin implements. If the server
  cannot find the plugin, either at account-creation time or connect
  time, an error occurs. IDENTIFIED WITH can be used as of MySQL 5.5.7.

The IDENTIFIED BY and IDENTIFIED WITH clauses are mutually exclusive,
so at most one of them can be specified for a given user.

For additional information about setting passwords, see
https://mariadb.com/kb/en/create-user/.

URL: https://mariadb.com/kb/en/create-user/

', '', 'https://mariadb.com/kb/en/create-user/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (83, 'UPDATE', 27, 'Syntax:
Single-table syntax:

UPDATE [LOW_PRIORITY] [IGNORE] table_reference
    SET col_name1={expr1|DEFAULT} [, col_name2={expr2|DEFAULT}] ...
    [WHERE where_condition]
    [ORDER BY ...]
    [LIMIT row_count]

Multiple-table syntax:

UPDATE [LOW_PRIORITY] [IGNORE] table_references
    SET col_name1={expr1|DEFAULT} [, col_name2={expr2|DEFAULT}] ...
    [WHERE where_condition]

For the single-table syntax, the UPDATE statement updates columns of
existing rows in the named table with new values. The SET clause
indicates which columns to modify and the values they should be given.
Each value can be given as an expression, or the keyword DEFAULT to set
a column explicitly to its default value. The WHERE clause, if given,
specifies the conditions that identify which rows to update. With no
WHERE clause, all rows are updated. If the ORDER BY clause is
specified, the rows are updated in the order that is specified. The
LIMIT clause places a limit on the number of rows that can be updated.

For the multiple-table syntax, UPDATE updates rows in each table named
in table_references that satisfy the conditions. In this case, ORDER BY
and LIMIT cannot be used.

where_condition is an expression that evaluates to true for each row to
be updated. For expression syntax, see
http://dev.mysql.com/doc/refman/5.5/en/expressions.html.

table_references and where_condition are is specified as described in
https://mariadb.com/kb/en/select/.

You need the UPDATE privilege only for columns referenced in an UPDATE
that are actually updated. You need only the SELECT privilege for any
columns that are read but not modified.

The UPDATE statement supports the following modifiers:

o With the LOW_PRIORITY keyword, execution of the UPDATE is delayed
  until no other clients are reading from the table. This affects only
  storage engines that use only table-level locking (such as MyISAM,
  MEMORY, and MERGE).

o With the IGNORE keyword, the update statement does not abort even if
  errors occur during the update. Rows for which duplicate-key
  conflicts occur are not updated. Rows for which columns are updated
  to values that would cause data conversion errors are updated to the
  closest valid values instead.

URL: https://mariadb.com/kb/en/update/

', '', 'https://mariadb.com/kb/en/update/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (84, 'IS NOT NULL', 18, 'Syntax:
IS NOT NULL

Tests whether a value is not NULL.

URL: https://mariadb.com/kb/en/is-not-null/

', 'MariaDB> SELECT 1 IS NOT NULL, 0 IS NOT NULL, NULL IS NOT NULL;
        -> 1, 1, 0
', 'https://mariadb.com/kb/en/is-not-null/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (87, 'DROP INDEX', 39, 'Syntax:
DROP [ONLINE|OFFLINE] INDEX index_name ON tbl_name

DROP INDEX drops the index named index_name from the table tbl_name.
This statement is mapped to an ALTER TABLE statement to drop the index.
See [HELP ALTER TABLE].

To drop a primary key, the index name is always PRIMARY, which must be
specified as a quoted identifier because PRIMARY is a reserved word:

DROP INDEX `PRIMARY` ON t;

URL: https://mariadb.com/kb/en/drop-index/

', '', 'https://mariadb.com/kb/en/drop-index/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (90, 'ABS', 4, 'Syntax:
ABS(X)

Returns the absolute value of X.

URL: https://mariadb.com/kb/en/abs/

', 'MariaDB> SELECT ABS(2);
        -> 2
MariaDB> SELECT ABS(-32);
        -> 32
', 'https://mariadb.com/kb/en/abs/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (91, 'POLYFROMWKB', 32, 'PolyFromWKB(wkb[,srid]), PolygonFromWKB(wkb[,srid])

Constructs a POLYGON value using its WKB representation and SRID.

URL: https://mariadb.com/kb/en/polyfromwkb/

', '', 'https://mariadb.com/kb/en/polyfromwkb/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (92, 'NOT LIKE', 37, 'Syntax:
expr NOT LIKE pat [ESCAPE ''escape_char'']

This is the same as NOT (expr LIKE pat [ESCAPE ''escape_char'']).

URL: https://mariadb.com/kb/en/not-like/

', '', 'https://mariadb.com/kb/en/not-like/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (93, 'SPACE', 37, 'Syntax:
SPACE(N)

Returns a string consisting of N space characters.

URL: https://mariadb.com/kb/en/space/

', 'MariaDB> SELECT SPACE(6);
        -> ''      ''
', 'https://mariadb.com/kb/en/space/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (94, 'MBR DEFINITION', 6, 'Its MBR (Minimum Bounding Rectangle), or Envelope. This is the bounding
geometry, formed by the minimum and maximum (X,Y) coordinates:

URL: https://mariadb.com/kb/en/mbr-definition/

', '((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))
', 'https://mariadb.com/kb/en/mbr-definition/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (95, 'GEOMETRYCOLLECTION', 24, 'GeometryCollection(g1,g2,...)

Constructs a GeometryCollection.

URL: https://mariadb.com/kb/en/geometrycollection/

', '', 'https://mariadb.com/kb/en/geometrycollection/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (85, 'CASE STATEMENT', 23, 'Syntax:
CASE case_value
    WHEN when_value THEN statement_list
    [WHEN when_value THEN statement_list] ...
    [ELSE statement_list]
END CASE

Or:

CASE
    WHEN search_condition THEN statement_list
    [WHEN search_condition THEN statement_list] ...
    [ELSE statement_list]
END CASE

The CASE statement for stored programs implements a complex conditional
construct.

*Note*: There is also a CASE expression, which differs from the CASE
statement described here. See
https://mariadb.com/kb/en/case-operator/. The
CASE statement cannot have an ELSE NULL clause, and it is terminated
with END CASE instead of END.

For the first syntax, case_value is an expression. This value is
compared to the when_value expression in each WHEN clause until one of
them is equal. When an equal when_value is found, the corresponding
THEN clause statement_list executes. If no when_value is equal, the
ELSE clause statement_list executes, if there is one.

This syntax cannot be used to test for equality with NULL because NULL
= NULL is false. See
https://mariadb.com/kb/en/null-values/.

For the second syntax, each WHEN clause search_condition expression is
evaluated until one is true, at which point its corresponding THEN
clause statement_list executes. If no search_condition is equal, the
ELSE clause statement_list executes, if there is one.

If no when_value or search_condition matches the value tested and the
CASE statement contains no ELSE clause, a Case not found for CASE
statement error results.

Each statement_list consists of one or more SQL statements; an empty
statement_list is not permitted.

To handle situations where no value is matched by any WHEN clause, use
an ELSE containing an empty BEGIN ... END block, as shown in this
example. (The indentation used here in the ELSE clause is for purposes
of clarity only, and is not otherwise significant.)

DELIMITER |

CREATE PROCEDURE p()
  BEGIN
    DECLARE v INT DEFAULT 1;

    CASE v
      WHEN 2 THEN SELECT v;
      WHEN 3 THEN SELECT 0;
      ELSE
        BEGIN
        END;
    END CASE;
  END;
  |

URL: https://mariadb.com/kb/en/case-statement/

', '', 'https://mariadb.com/kb/en/case-statement/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (86, 'EXECUTE STATEMENT', 8, 'Syntax:
EXECUTE stmt_name
    [USING @var_name [, @var_name] ...]

After preparing a statement with PREPARE, you execute it with an
EXECUTE statement that refers to the prepared statement name. If the
prepared statement contains any parameter markers, you must supply a
USING clause that lists user variables containing the values to be
bound to the parameters. Parameter values can be supplied only by user
variables, and the USING clause must name exactly as many variables as
the number of parameter markers in the statement.

You can execute a given prepared statement multiple times, passing
different variables to it or setting the variables to different values
before each execution.

URL: https://mariadb.com/kb/en/execute-statement/

', '', 'https://mariadb.com/kb/en/execute-statement/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (89, 'CREATE EVENT', 39, 'Syntax:
CREATE
    [DEFINER = { user | CURRENT_USER }]
    EVENT
    [IF NOT EXISTS]
    event_name
    ON SCHEDULE schedule
    [ON COMPLETION [NOT] PRESERVE]
    [ENABLE | DISABLE | DISABLE ON SLAVE]
    [COMMENT ''comment'']
    DO event_body;

schedule:
    AT timestamp [+ INTERVAL interval] ...
  | EVERY interval
    [STARTS timestamp [+ INTERVAL interval] ...]
    [ENDS timestamp [+ INTERVAL interval] ...]

interval:
    quantity {YEAR | QUARTER | MONTH | DAY | HOUR | MINUTE |
              WEEK | SECOND | YEAR_MONTH | DAY_HOUR | DAY_MINUTE |
              DAY_SECOND | HOUR_MINUTE | HOUR_SECOND | MINUTE_SECOND}

This statement creates and schedules a new event. The event will not
run unless the Event Scheduler is enabled. For information about
checking Event Scheduler status and enabling it if necessary, see
https://mariadb.com/kb/en/events/.

CREATE EVENT requires the EVENT privilege for the schema in which the
event is to be created. It might also require the SUPER privilege,
depending on the DEFINER value, as described later in this section.

The minimum requirements for a valid CREATE EVENT statement are as
follows:

o The keywords CREATE EVENT plus an event name, which uniquely
  identifies the event in a database schema.

o An ON SCHEDULE clause, which determines when and how often the event
  executes.

o A DO clause, which contains the SQL statement to be executed by an
  event.

This is an example of a minimal CREATE EVENT statement:

CREATE EVENT myevent
    ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 HOUR
    DO
      UPDATE myschema.mytable SET mycol = mycol + 1;

The previous statement creates an event named myevent. This event
executes once---one hour following its creation---by running an SQL
statement that increments the value of the myschema.mytable table''s
mycol column by 1.

The event_name must be a valid MySQL identifier with a maximum length
of 64 characters. Event names are not case sensitive, so you cannot
have two events named myevent and MyEvent in the same schema. In
general, the rules governing event names are the same as those for
names of stored routines. See
https://mariadb.com/kb/en/identifier-names/.

An event is associated with a schema. If no schema is indicated as part
of event_name, the default (current) schema is assumed. To create an
event in a specific schema, qualify the event name with a schema using
schema_name.event_name syntax.

URL: https://mariadb.com/kb/en/create-event/

', '', 'https://mariadb.com/kb/en/create-event/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (96, 'MAX', 16, 'Syntax:
MAX([DISTINCT] expr)

Returns the maximum value of expr. MAX() may take a string argument; in
such cases, it returns the maximum string value. See
https://mariadb.com/kb/en/max/. The DISTINCT
keyword can be used to find the maximum of the distinct values of expr,
however, this produces the same result as omitting DISTINCT.

MAX() returns NULL if there were no matching rows.

URL: https://mariadb.com/kb/en/max/

', 'MariaDB> SELECT student_name, MIN(test_score), MAX(test_score)
    ->        FROM student
    ->        GROUP BY student_name;
', 'https://mariadb.com/kb/en/max/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (98, '*', 4, 'Syntax:
*

Multiplication:

URL: https://mariadb.com/kb/en/multiplication-operator/

', 'MariaDB> SELECT 3*5;
        -> 15
MariaDB> SELECT 18014398509481984*18014398509481984.0;
        -> 324518553658426726783156020576256.0
MariaDB> SELECT 18014398509481984*18014398509481984;
        -> 0
', 'https://mariadb.com/kb/en/multiplication-operator/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (102, 'ENDPOINT', 13, 'EndPoint(ls)

Returns the Point that is the endpoint of the LineString value ls.

URL: https://mariadb.com/kb/en/endpoint/

', 'MariaDB> SET @ls = ''LineString(1 1,2 2,3 3)'';
MariaDB> SELECT AsText(EndPoint(GeomFromText(@ls)));
+-------------------------------------+
| AsText(EndPoint(GeomFromText(@ls))) |
+-------------------------------------+
| POINT(3 3)                          |
+-------------------------------------+
', 'https://mariadb.com/kb/en/endpoint/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (103, 'COMPRESS', 12, 'Syntax:
COMPRESS(string_to_compress)

Compresses a string and returns the result as a binary string. This
function requires MySQL to have been compiled with a compression
library such as zlib. Otherwise, the return value is always NULL. The
compressed string can be uncompressed with UNCOMPRESS().

URL: https://mariadb.com/kb/en/compress/

', 'MariaDB> SELECT LENGTH(COMPRESS(REPEAT(''a'',1000)));
        -> 21
MariaDB> SELECT LENGTH(COMPRESS(''''));
        -> 0
MariaDB> SELECT LENGTH(COMPRESS(''a''));
        -> 13
MariaDB> SELECT LENGTH(COMPRESS(REPEAT(''a'',16)));
        -> 15
', 'https://mariadb.com/kb/en/compress/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (88, 'MATCH AGAINST', 37, 'Syntax:
MATCH (col1,col2,...) AGAINST (expr [search_modifier])

MySQL has support for full-text indexing and searching:

o A full-text index in MySQL is an index of type FULLTEXT.

o Full-text indexes can be used only with MyISAM tables, and can be
  created only for CHAR, VARCHAR, or TEXT columns.

o A FULLTEXT index definition can be given in the CREATE TABLE
  statement when a table is created, or added later using ALTER TABLE
  or CREATE INDEX.

o For large data sets, it is much faster to load your data into a table
  that has no FULLTEXT index and then create the index after that, than
  to load data into a table that has an existing FULLTEXT index.

Full-text searching is performed using MATCH() ... AGAINST syntax.
MATCH() takes a comma-separated list that names the columns to be
searched. AGAINST takes a string to search for, and an optional
modifier that indicates what type of search to perform. The search
string must be a literal string, not a variable or a column name. There
are three types of full-text searches:

o A natural language search interprets the search string as a phrase in
  natural human language (a phrase in free text). There are no special
  operators. The stopword list applies. In addition, words that are
  present in 50% or more of the rows are considered common and do not
  match.

  Full-text searches are natural language searches if the IN NATURAL
  LANGUAGE MODE modifier is given or if no modifier is given. For more
  information, see
  https://mariadb.com/kb/en/fulltext-index-overview#in-natural-language-mode
  .

o A boolean search interprets the search string using the rules of a
  special query language. The string contains the words to search for.
  It can also contain operators that specify requirements such that a
  word must be present or absent in matching rows, or that it should be
  weighted higher or lower than usual. Common words such as "some" or
  "then" are stopwords and do not match if present in the search
  string. The IN BOOLEAN MODE modifier specifies a boolean search. For
  more information, see
  https://mariadb.com/kb/en/fulltext-index-overview#in-boolean-mode.

o A query expansion search is a modification of a natural language
  search. The search string is used to perform a natural language
  search. Then words from the most relevant rows returned by the search
  are added to the search string and the search is done again. The
  query returns the rows from the second search. The IN NATURAL
  LANGUAGE MODE WITH QUERY EXPANSION or WITH QUERY EXPANSION modifier
  specifies a query expansion search. For more information, see
  https://mariadb.com/kb/en/fulltext-index-overview#with-query-expansion.

URL: https://mariadb.com/kb/en/match-against/

', 'MariaDB> SELECT id, body, MATCH (title,body) AGAINST
    -> (''Security implications of running MySQL as root''
    -> IN NATURAL LANGUAGE MODE) AS score
    -> FROM articles WHERE MATCH (title,body) AGAINST
    -> (''Security implications of running MySQL as root''
    -> IN NATURAL LANGUAGE MODE);
+----+-------------------------------------+-----------------+
| id | body                                | score           |
+----+-------------------------------------+-----------------+
|  4 | 1. Never run mysqld as root. 2. ... | 1.5219271183014 |
|  6 | When configured properly, MySQL ... | 1.3114095926285 |
+----+-------------------------------------+-----------------+
2 rows in set (0.00 sec)
', 'https://mariadb.com/kb/en/match-against/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (97, 'CREATE FUNCTION UDF', 21, 'Syntax:
CREATE [AGGREGATE] FUNCTION function_name RETURNS {STRING|INTEGER|REAL|DECIMAL}
    SONAME shared_library_name

A user-defined function (UDF) is a way to extend MySQL with a new
function that works like a native (built-in) MySQL function such as
ABS() or CONCAT().

function_name is the name that should be used in SQL statements to
invoke the function. The RETURNS clause indicates the type of the
function''s return value. DECIMAL is a legal value after RETURNS, but
currently DECIMAL functions return string values and should be written
like STRING functions.

shared_library_name is the basename of the shared object file that
contains the code that implements the function. The file must be
located in the plugin directory. This directory is given by the value
of the plugin_dir system variable. For more information, see
http://dev.mysql.com/doc/refman/5.5/en/udf-compiling.html.

To create a function, you must have the INSERT privilege for the mysql
database. This is necessary because CREATE FUNCTION adds a row to the
mysql.func system table that records the function''s name, type, and
shared library name. If you do not have this table, you should run the
mysql_upgrade command to create it. See
https://mariadb.com/kb/en/mysql_upgrade/.

URL: https://mariadb.com/kb/en/create-function-udf/

', '', 'https://mariadb.com/kb/en/create-function-udf/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (105, 'COUNT', 16, 'Syntax:
COUNT(expr)

Returns a count of the number of non-NULL values of expr in the rows
retrieved by a SELECT statement. The result is a BIGINT value.

COUNT() returns 0 if there were no matching rows.

URL: https://mariadb.com/kb/en/count/

', 'MariaDB> SELECT student.student_name,COUNT(*)
    ->        FROM student,course
    ->        WHERE student.student_id=course.student_id
    ->        GROUP BY student_name;
', 'https://mariadb.com/kb/en/count/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (106, 'HANDLER', 27, 'Syntax:
HANDLER tbl_name OPEN [ [AS] alias]

HANDLER tbl_name READ index_name { = | <= | >= | < | > } (value1,value2,...)
    [ WHERE where_condition ] [LIMIT ... ]
HANDLER tbl_name READ index_name { FIRST | NEXT | PREV | LAST }
    [ WHERE where_condition ] [LIMIT ... ]
HANDLER tbl_name READ { FIRST | NEXT }
    [ WHERE where_condition ] [LIMIT ... ]

HANDLER tbl_name CLOSE

The HANDLER statement provides direct access to table storage engine
interfaces. It is available for MyISAM and InnoDB tables.

URL: https://mariadb.com/kb/en/handler-commands/

', '', 'https://mariadb.com/kb/en/handler-commands/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (107, 'MLINEFROMTEXT', 3, 'MLineFromText(wkt[,srid]), MultiLineStringFromText(wkt[,srid])

Constructs a MULTILINESTRING value using its WKT representation and
SRID.

URL: https://mariadb.com/kb/en/mlinefromtext/

', '', 'https://mariadb.com/kb/en/mlinefromtext/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (108, 'GEOMCOLLFROMWKB', 32, 'GeomCollFromWKB(wkb[,srid]), GeometryCollectionFromWKB(wkb[,srid])

Constructs a GEOMETRYCOLLECTION value using its WKB representation and
SRID.

URL: https://mariadb.com/kb/en/geomcollfromwkb/

', '', 'https://mariadb.com/kb/en/geomcollfromwkb/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (109, 'HELP_DATE', 9, 'This help information was generated from the MySQL 5.5 Reference Manual
on: 2012-08-25
', '', '');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (110, 'RENAME TABLE', 39, 'Syntax:
RENAME TABLE tbl_name TO new_tbl_name
    [, tbl_name2 TO new_tbl_name2] ...

This statement renames one or more tables.

The rename operation is done atomically, which means that no other
session can access any of the tables while the rename is running. For
example, if you have an existing table old_table, you can create
another table new_table that has the same structure but is empty, and
then replace the existing table with the empty one as follows (assuming
that backup_table does not already exist):

URL: https://mariadb.com/kb/en/rename-table/

', 'CREATE TABLE new_table (...);
RENAME TABLE old_table TO backup_table, new_table TO old_table;
', 'https://mariadb.com/kb/en/rename-table/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (99, 'TIMESTAMP', 22, 'TIMESTAMP

A timestamp. The range is ''1970-01-01 00:00:01'' UTC to ''2038-01-19
03:14:07'' UTC. TIMESTAMP values are stored as the number of seconds
since the epoch (''1970-01-01 00:00:00'' UTC). A TIMESTAMP cannot
represent the value ''1970-01-01 00:00:00'' because that is equivalent to
0 seconds from the epoch and the value 0 is reserved for representing
''0000-00-00 00:00:00'', the "zero" TIMESTAMP value.

Unless specified otherwise, the first TIMESTAMP column in a table is
defined to be automatically set to the date and time of the most recent
modification if not explicitly assigned a value. This makes TIMESTAMP
useful for recording the timestamp of an INSERT or UPDATE operation.
You can also set any TIMESTAMP column to the current date and time by
assigning it a NULL value, unless it has been defined with the NULL
attribute to permit NULL values. The automatic initialization and
updating to the current date and time can be specified using DEFAULT
CURRENT_TIMESTAMP and ON UPDATE CURRENT_TIMESTAMP clauses, as described
in
https://mariadb.com/kb/en/timestamp/.

*Note*: The TIMESTAMP format that was used prior to MySQL 4.1 is not
supported in MySQL 5.5; see MySQL 3.23, 4.0, 4.1 Reference Manual for
information regarding the old format.

URL: https://mariadb.com/kb/en/timestamp/

', '', 'https://mariadb.com/kb/en/timestamp/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (100, 'DES_DECRYPT', 12, 'Syntax:
DES_DECRYPT(crypt_str[,key_str])

Decrypts a string encrypted with DES_ENCRYPT(). If an error occurs,
this function returns NULL.

This function works only if MySQL has been configured with SSL support.
See https://mariadb.com/kb/en/ssl-connections/.

If no key_str argument is given, DES_DECRYPT() examines the first byte
of the encrypted string to determine the DES key number that was used
to encrypt the original string, and then reads the key from the DES key
file to decrypt the message. For this to work, the user must have the
SUPER privilege. The key file can be specified with the --des-key-file
server option.

If you pass this function a key_str argument, that string is used as
the key for decrypting the message.

If the crypt_str argument does not appear to be an encrypted string,
MySQL returns the given crypt_str.

URL: https://mariadb.com/kb/en/des_decrypt/

', '', 'https://mariadb.com/kb/en/des_decrypt/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (101, 'CACHE INDEX', 26, 'Syntax:
CACHE INDEX
  tbl_index_list [, tbl_index_list] ...
  [PARTITION (partition_list | ALL)]
  IN key_cache_name

tbl_index_list:
  tbl_name [[INDEX|KEY] (index_name[, index_name] ...)]

partition_list:
  partition_name[, partition_name][, ...]

The CACHE INDEX statement assigns table indexes to a specific key
cache. It is used only for MyISAM tables. After the indexes have been
assigned, they can be preloaded into the cache if desired with LOAD
INDEX INTO CACHE.

The following statement assigns indexes from the tables t1, t2, and t3
to the key cache named hot_cache:

MariaDB> CACHE INDEX t1, t2, t3 IN hot_cache;
+---------+--------------------+----------+----------+
| Table   | Op                 | Msg_type | Msg_text |
+---------+--------------------+----------+----------+
| test.t1 | assign_to_keycache | status   | OK       |
| test.t2 | assign_to_keycache | status   | OK       |
| test.t3 | assign_to_keycache | status   | OK       |
+---------+--------------------+----------+----------+

URL: https://mariadb.com/kb/en/cache-index/

', '', 'https://mariadb.com/kb/en/cache-index/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (104, 'INSERT', 27, 'Syntax:
INSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name [(col_name,...)]
    {VALUES | VALUE} ({expr | DEFAULT},...),(...),...
    [ ON DUPLICATE KEY UPDATE
      col_name=expr
        [, col_name=expr] ... ]

Or:

INSERT [LOW_PRIORITY | DELAYED | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name
    SET col_name={expr | DEFAULT}, ...
    [ ON DUPLICATE KEY UPDATE
      col_name=expr
        [, col_name=expr] ... ]

Or:

INSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name [(col_name,...)]
    SELECT ...
    [ ON DUPLICATE KEY UPDATE
      col_name=expr
        [, col_name=expr] ... ]

INSERT inserts new rows into an existing table. The INSERT ... VALUES
and INSERT ... SET forms of the statement insert rows based on
explicitly specified values. The INSERT ... SELECT form inserts rows
selected from another table or tables. INSERT ... SELECT is discussed
further in [HELP INSERT SELECT].

URL: https://mariadb.com/kb/en/insert/

', '', 'https://mariadb.com/kb/en/insert/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (111, 'BOOLEAN', 22, 'BOOL, BOOLEAN

These types are synonyms for TINYINT(1). A value of zero is considered
false. Nonzero values are considered true:

MariaDB> SELECT IF(0, ''true'', ''false'');
+------------------------+
| IF(0, ''true'', ''false'') |
+------------------------+
| false                  |
+------------------------+

MariaDB> SELECT IF(1, ''true'', ''false'');
+------------------------+
| IF(1, ''true'', ''false'') |
+------------------------+
| true                   |
+------------------------+

MariaDB> SELECT IF(2, ''true'', ''false'');
+------------------------+
| IF(2, ''true'', ''false'') |
+------------------------+
| true                   |
+------------------------+

However, the values TRUE and FALSE are merely aliases for 1 and 0,
respectively, as shown here:

MariaDB> SELECT IF(0 = FALSE, ''true'', ''false'');
+--------------------------------+
| IF(0 = FALSE, ''true'', ''false'') |
+--------------------------------+
| true                           |
+--------------------------------+

MariaDB> SELECT IF(1 = TRUE, ''true'', ''false'');
+-------------------------------+
| IF(1 = TRUE, ''true'', ''false'') |
+-------------------------------+
| true                          |
+-------------------------------+

MariaDB> SELECT IF(2 = TRUE, ''true'', ''false'');
+-------------------------------+
| IF(2 = TRUE, ''true'', ''false'') |
+-------------------------------+
| false                         |
+-------------------------------+

MariaDB> SELECT IF(2 = FALSE, ''true'', ''false'');
+--------------------------------+
| IF(2 = FALSE, ''true'', ''false'') |
+--------------------------------+
| false                          |
+--------------------------------+

The last two statements display the results shown because 2 is equal to
neither 1 nor 0.

URL: https://mariadb.com/kb/en/boolean/

', '', 'https://mariadb.com/kb/en/boolean/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (112, 'DEFAULT', 14, 'Syntax:
DEFAULT(col_name)

Returns the default value for a table column. An error results if the
column has no default value.

URL: https://mariadb.com/kb/en/default/

', 'MariaDB> UPDATE t SET i = DEFAULT(i)+1 WHERE id < 100;
', 'https://mariadb.com/kb/en/default/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (113, 'MOD', 4, 'Syntax:
MOD(N,M), N % M, N MOD M

Modulo operation. Returns the remainder of N divided by M.

URL: https://mariadb.com/kb/en/mod/

', 'MariaDB> SELECT MOD(234, 10);
        -> 4
MariaDB> SELECT 253 % 7;
        -> 1
MariaDB> SELECT MOD(29,9);
        -> 2
MariaDB> SELECT 29 MOD 9;
        -> 2
', 'https://mariadb.com/kb/en/mod/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (114, 'TINYTEXT', 22, 'TINYTEXT [CHARACTER SET charset_name] [COLLATE collation_name]

A TEXT column with a maximum length of 255 (28 - 1) characters. The
effective maximum length is less if the value contains multi-byte
characters. Each TINYTEXT value is stored using a 1-byte length prefix
that indicates the number of bytes in the value.

URL: https://mariadb.com/kb/en/tinytext/

', '', 'https://mariadb.com/kb/en/tinytext/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (116, 'DECODE', 12, 'Syntax:
DECODE(crypt_str,pass_str)

Decrypts the encrypted string crypt_str using pass_str as the password.
crypt_str should be a string returned from ENCODE().

URL: https://mariadb.com/kb/en/decode/

', '', 'https://mariadb.com/kb/en/decode/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (115, 'OPTIMIZE TABLE', 20, 'Syntax:
OPTIMIZE [NO_WRITE_TO_BINLOG | LOCAL] TABLE
    tbl_name [, tbl_name] ...

OPTIMIZE TABLE should be used if you have deleted a large part of a
table or if you have made many changes to a table with variable-length
rows (tables that have VARCHAR, VARBINARY, BLOB, or TEXT columns).
Deleted rows are maintained in a linked list and subsequent INSERT
operations reuse old row positions. You can use OPTIMIZE TABLE to
reclaim the unused space and to defragment the data file. After
extensive changes to a table, this statement may also improve
performance of statements that use the table, sometimes significantly.

This statement requires SELECT and INSERT privileges for the table.

OPTIMIZE TABLE is supported for partitioned tables, and you can use
ALTER TABLE ... OPTIMIZE PARTITION to optimize one or more partitions;
for more information, see [HELP ALTER TABLE], and
http://dev.mysql.com/doc/refman/5.5/en/partitioning-maintenance.html.

URL: https://mariadb.com/kb/en/optimize-table/

', '', 'https://mariadb.com/kb/en/optimize-table/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (117, '<=>', 18, 'Syntax:
<=>

NULL-safe equal. This operator performs an equality comparison like the
= operator, but returns 1 rather than NULL if both operands are NULL,
and 0 rather than NULL if one operand is NULL.

URL: https://mariadb.com/kb/en/null-safe-equal/

', 'MariaDB> SELECT 1 <=> 1, NULL <=> NULL, 1 <=> NULL;
        -> 1, 1, 0
MariaDB> SELECT 1 = 1, NULL = NULL, 1 = NULL;
        -> 1, NULL, NULL
', 'https://mariadb.com/kb/en/null-safe-equal/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (118, 'HELP STATEMENT', 28, 'Syntax:
HELP ''search_string''

The HELP statement returns online information from the MySQL Reference
manual. Its proper operation requires that the help tables in the mysql
database be initialized with help topic information.

The HELP statement searches the help tables for the given search string
and displays the result of the search. The search string is not case
sensitive.

URL: https://mariadb.com/kb/en/help-command/

', '', 'https://mariadb.com/kb/en/help-command/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (119, 'RESET', 26, 'Syntax:
RESET reset_option [, reset_option] ...

The RESET statement is used to clear the state of various server
operations. You must have the RELOAD privilege to execute RESET.

RESET acts as a stronger version of the FLUSH statement. See [HELP
FLUSH].

The RESET statement causes an implicit commit. See
https://mariadb.com/kb/en/sql-statements-that-cause-an-implicit-commit/.

URL: https://mariadb.com/kb/en/reset/

', '', 'https://mariadb.com/kb/en/reset/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (120, 'GET_LOCK', 14, 'Syntax:
GET_LOCK(str,timeout)

Tries to obtain a lock with a name given by the string str, using a
timeout of timeout seconds. Returns 1 if the lock was obtained
successfully, 0 if the attempt timed out (for example, because another
client has previously locked the name), or NULL if an error occurred
(such as running out of memory or the thread was killed with mysqladmin
kill). If you have a lock obtained with GET_LOCK(), it is released when
you execute RELEASE_LOCK(), execute a new GET_LOCK(), or your
connection terminates (either normally or abnormally). Locks obtained
with GET_LOCK() do not interact with transactions. That is, committing
a transaction does not release any such locks obtained during the
transaction.

This function can be used to implement application locks or to simulate
record locks. Names are locked on a server-wide basis. If a name has
been locked by one client, GET_LOCK() blocks any request by another
client for a lock with the same name. This enables clients that agree
on a given lock name to use the name to perform cooperative advisory
locking. But be aware that it also enables a client that is not among
the set of cooperating clients to lock a name, either inadvertently or
deliberately, and thus prevent any of the cooperating clients from
locking that name. One way to reduce the likelihood of this is to use
lock names that are database-specific or application-specific. For
example, use lock names of the form db_name.str or app_name.str.

URL: https://mariadb.com/kb/en/get_lock/

', 'MariaDB> SELECT GET_LOCK(''lock1'',10);
        -> 1
MariaDB> SELECT IS_FREE_LOCK(''lock2'');
        -> 1
MariaDB> SELECT GET_LOCK(''lock2'',10);
        -> 1
MariaDB> SELECT RELEASE_LOCK(''lock2'');
        -> 1
MariaDB> SELECT RELEASE_LOCK(''lock1'');
        -> NULL
', 'https://mariadb.com/kb/en/get_lock/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (121, 'UCASE', 37, 'Syntax:
UCASE(str)

UCASE() is a synonym for UPPER().

URL: https://mariadb.com/kb/en/ucase/

', '', 'https://mariadb.com/kb/en/ucase/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (122, 'SHOW BINLOG EVENTS', 26, 'Syntax:
SHOW BINLOG EVENTS
   [IN ''log_name''] [FROM pos] [LIMIT [offset,] row_count]

Shows the events in the binary log. If you do not specify ''log_name'',
the first binary log is displayed.

URL: https://mariadb.com/kb/en/show-binlog-events/

', '', 'https://mariadb.com/kb/en/show-binlog-events/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (123, 'MPOLYFROMWKB', 32, 'MPolyFromWKB(wkb[,srid]), MultiPolygonFromWKB(wkb[,srid])

Constructs a MULTIPOLYGON value using its WKB representation and SRID.

URL: https://mariadb.com/kb/en/mpolyfromwkb/

', '', 'https://mariadb.com/kb/en/mpolyfromwkb/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (124, 'ITERATE', 23, 'Syntax:
ITERATE label

ITERATE can appear only within LOOP, REPEAT, and WHILE statements.
ITERATE means "start the loop again."

URL: https://mariadb.com/kb/en/iterate/

', '', 'https://mariadb.com/kb/en/iterate/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (125, 'DO', 27, 'Syntax:
DO expr [, expr] ...

DO executes the expressions but does not return any results. In most
respects, DO is shorthand for SELECT expr, ..., but has the advantage
that it is slightly faster when you do not care about the result.

DO is useful primarily with functions that have side effects, such as
RELEASE_LOCK().

URL: https://mariadb.com/kb/en/do/

', '', 'https://mariadb.com/kb/en/do/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (126, 'CURTIME', 31, 'Syntax:
CURTIME()

Returns the current time as a value in ''HH:MM:SS'' or HHMMSS.uuuuuu
format, depending on whether the function is used in a string or
numeric context. The value is expressed in the current time zone.

URL: https://mariadb.com/kb/en/curtime/

', 'MariaDB> SELECT CURTIME();
        -> ''23:50:26''
MariaDB> SELECT CURTIME() + 0;
        -> 235026.000000
', 'https://mariadb.com/kb/en/curtime/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (127, 'CHAR_LENGTH', 37, 'Syntax:
CHAR_LENGTH(str)

Returns the length of the string str, measured in characters. A
multi-byte character counts as a single character. This means that for
a string containing five 2-byte characters, LENGTH() returns 10,
whereas CHAR_LENGTH() returns 5.

URL: https://mariadb.com/kb/en/char_length/

', '', 'https://mariadb.com/kb/en/char_length/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (128, 'BIGINT', 22, 'BIGINT[(M)] [UNSIGNED] [ZEROFILL]

A large integer. The signed range is -9223372036854775808 to
9223372036854775807. The unsigned range is 0 to 18446744073709551615.

SERIAL is an alias for BIGINT UNSIGNED NOT NULL AUTO_INCREMENT UNIQUE.

URL: https://mariadb.com/kb/en/bigint/

', '', 'https://mariadb.com/kb/en/bigint/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (129, 'SET', 26, 'Syntax:
SET variable_assignment [, variable_assignment] ...

variable_assignment:
      user_var_name = expr
    | [GLOBAL | SESSION] system_var_name = expr
    | [@@global. | @@session. | @@]system_var_name = expr

The SET statement assigns values to different types of variables that
affect the operation of the server or your client. Older versions of
MySQL employed SET OPTION, but this syntax is deprecated in favor of
SET without OPTION.

URL: https://mariadb.com/kb/en/set/

', '', 'https://mariadb.com/kb/en/set/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (130, 'LOAD XML', 27, 'Syntax:
LOAD XML [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE ''file_name''
    [REPLACE | IGNORE]
    INTO TABLE [db_name.]tbl_name
    [CHARACTER SET charset_name]
    [ROWS IDENTIFIED BY ''<tagname>'']
    [IGNORE number {LINES | ROWS}]
    [(column_or_user_var,...)]
    [SET col_name = expr,...]

The LOAD XML statement reads data from an XML file into a table. The
file_name must be given as a literal string. The tagname in the
optional ROWS IDENTIFIED BY clause must also be given as a literal
string, and must be surrounded by angle brackets (< and >).

LOAD XML acts as the complement of running the mysql client in XML
output mode (that is, starting the client with the --xml option). To
write data from a table to an XML file, use a command such as the
following one from the system shell:

shell> mysql --xml -e ''SELECT * FROM mytable'' > file.xml

To read the file back into a table, use LOAD XML INFILE. By default,
the <row> element is considered to be the equivalent of a database
table row; this can be changed using the ROWS IDENTIFIED BY clause.

This statement supports three different XML formats:

o Column names as attributes and column values as attribute values:

<row column1="value1" column2="value2" .../>

o Column names as tags and column values as the content of these tags:

<row>
  <column1>value1</column1>
  <column2>value2</column2>
</row>

o Column names are the name attributes of <field> tags, and values are
  the contents of these tags:

<row>
  <field name=''column1''>value1</field>
  <field name=''column2''>value2</field>
</row>

  This is the format used by other MySQL tools, such as mysqldump.

All 3 formats can be used in the same XML file; the import routine
automatically detects the format for each row and interprets it
correctly. Tags are matched based on the tag or attribute name and the
column name.

The following clauses work essentially the same way for LOAD XML as
they do for LOAD DATA:

o LOW_PRIORITY or CONCURRENT

o LOCAL

o REPLACE or IGNORE

o CHARACTER SET

o (column_or_user_var,...)

o SET

See [HELP LOAD DATA], for more information about these clauses.

The IGNORE number LINES or IGNORE number ROWS clause causes the first
number rows in the XML file to be skipped. It is analogous to the LOAD
DATA statement''s IGNORE ... LINES clause.

URL: https://mariadb.com/kb/en/load-xml/

', '', 'https://mariadb.com/kb/en/load-xml/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (131, 'CONV', 4, 'Syntax:
CONV(N,from_base,to_base)

Converts numbers between different number bases. Returns a string
representation of the number N, converted from base from_base to base
to_base. Returns NULL if any argument is NULL. The argument N is
interpreted as an integer, but may be specified as an integer or a
string. The minimum base is 2 and the maximum base is 36. If to_base is
a negative number, N is regarded as a signed number. Otherwise, N is
treated as unsigned. CONV() works with 64-bit precision.

URL: https://mariadb.com/kb/en/conv/

', 'MariaDB> SELECT CONV(''a'',16,2);
        -> ''1010''
MariaDB> SELECT CONV(''6E'',18,8);
        -> ''172''
MariaDB> SELECT CONV(-17,10,-18);
        -> ''-H''
MariaDB> SELECT CONV(10+''10''+''10''+0xa,10,10);
        -> ''40''
', 'https://mariadb.com/kb/en/conv/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (132, 'DATE', 22, 'DATE

A date. The supported range is ''1000-01-01'' to ''9999-12-31''. MySQL
displays DATE values in ''YYYY-MM-DD'' format, but permits assignment of
values to DATE columns using either strings or numbers.

URL: https://mariadb.com/kb/en/date/

', '', 'https://mariadb.com/kb/en/date/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (133, 'ASSIGN-VALUE', 15, 'Syntax:
:=

Assignment operator. Causes the user variable on the left hand side of
the operator to take on the value to its right. The value on the right
hand side may be a literal value, another variable storing a value, or
any legal expression that yields a scalar value, including the result
of a query (provided that this value is a scalar value). You can
perform multiple assignments in the same SET statement. You can perform
multiple assignments in the same statement-

Unlike =, the := operator is never interpreted as a comparison
operator. This means you can use := in any valid SQL statement (not
just in SET statements) to assign a value to a variable.

URL: https://mariadb.com/kb/en/assignment-operator/

', 'MariaDB> SELECT @var1, @var2;
        -> NULL, NULL
MariaDB> SELECT @var1 := 1, @var2;
        -> 1, NULL
MariaDB> SELECT @var1, @var2;
        -> 1, NULL
MariaDB> SELECT @var1, @var2 := @var1;
        -> 1, 1
MariaDB> SELECT @var1, @var2;
        -> 1, 1

MariaDB> SELECT @var1:=COUNT(*) FROM t1;
        -> 4
MariaDB> SELECT @var1;
        -> 4
', 'https://mariadb.com/kb/en/assignment-operator/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (134, 'SHOW OPEN TABLES', 26, 'Syntax:
SHOW OPEN TABLES [{FROM | IN} db_name]
    [LIKE ''pattern'' | WHERE expr]

SHOW OPEN TABLES lists the non-TEMPORARY tables that are currently open
in the table cache. See
http://dev.mysql.com/doc/refman/5.5/en/table-cache.html. The FROM
clause, if present, restricts the tables shown to those present in the
db_name database. The LIKE clause, if present, indicates which table
names to match. The WHERE clause can be given to select rows using more
general conditions, as discussed in
https://mariadb.com/kb/en/extended-show/.

URL: https://mariadb.com/kb/en/show-open-tables/

', '', 'https://mariadb.com/kb/en/show-open-tables/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (135, 'EXTRACT', 31, 'Syntax:
EXTRACT(unit FROM date)

The EXTRACT() function uses the same kinds of unit specifiers as
DATE_ADD() or DATE_SUB(), but extracts parts from the date rather than
performing date arithmetic.

URL: https://mariadb.com/kb/en/extract/

', 'MariaDB> SELECT EXTRACT(YEAR FROM ''2009-07-02'');
       -> 2009
MariaDB> SELECT EXTRACT(YEAR_MONTH FROM ''2009-07-02 01:02:03'');
       -> 200907
MariaDB> SELECT EXTRACT(DAY_MINUTE FROM ''2009-07-02 01:02:03'');
       -> 20102
MariaDB> SELECT EXTRACT(MICROSECOND
    ->                FROM ''2003-01-02 10:30:00.000123'');
        -> 123
', 'https://mariadb.com/kb/en/extract/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (136, 'ENCRYPT', 12, 'Syntax:
ENCRYPT(str[,salt])

Encrypts str using the Unix crypt() system call and returns a binary
string. The salt argument must be a string with at least two characters
or the result will be NULL. If no salt argument is given, a random
value is used.

URL: https://mariadb.com/kb/en/encrypt/

', 'MariaDB> SELECT ENCRYPT(''hello'');
        -> ''VxuFAJXVARROc''
', 'https://mariadb.com/kb/en/encrypt/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (139, 'OLD_PASSWORD', 12, 'Syntax:
OLD_PASSWORD(str)

OLD_PASSWORD() was added when the implementation of PASSWORD() was
changed in MySQL 4.1 to improve security. OLD_PASSWORD() returns the
value of the pre-4.1 implementation of PASSWORD() as a string, and is
intended to permit you to reset passwords for any pre-4.1 clients that
need to connect to your version 5.5 MySQL server without locking them
out. See http://dev.mysql.com/doc/refman/5.1/en/password-hashing.html.

As of MySQL 5.5.3, the return value is a nonbinary string in the
connection character set. Before 5.5.3, the return value is a binary
string.

URL: https://mariadb.com/kb/en/old_password/

', '', 'https://mariadb.com/kb/en/old_password/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (141, '||', 15, 'Syntax:
OR, ||

Logical OR. When both operands are non-NULL, the result is 1 if any
operand is nonzero, and 0 otherwise. With a NULL operand, the result is
1 if the other operand is nonzero, and NULL otherwise. If both operands
are NULL, the result is NULL.

URL: https://mariadb.com/kb/en/or/

', 'MariaDB> SELECT 1 || 1;
        -> 1
MariaDB> SELECT 1 || 0;
        -> 1
MariaDB> SELECT 0 || 0;
        -> 0
MariaDB> SELECT 0 || NULL;
        -> NULL
MariaDB> SELECT 1 || NULL;
        -> 1
', 'https://mariadb.com/kb/en/or/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (137, 'SHOW STATUS', 26, 'Syntax:
SHOW [GLOBAL | SESSION] STATUS
    [LIKE ''pattern'' | WHERE expr]

SHOW STATUS provides server status information. This information also
can be obtained using the mysqladmin extended-status command. The LIKE
clause, if present, indicates which variable names to match. The WHERE
clause can be given to select rows using more general conditions, as
discussed in https://mariadb.com/kb/en/extended-show/.
This statement does not require any privilege. It requires only the
ability to connect to the server.
With a LIKE clause, the statement displays only rows for those
variables with names that match the pattern:

MariaDB> SHOW STATUS LIKE ''Key%'';
+--------------------+----------+
| Variable_name      | Value    |
+--------------------+----------+
| Key_blocks_used    | 14955    |
| Key_read_requests  | 96854827 |
| Key_reads          | 162040   |
| Key_write_requests | 7589728  |
| Key_writes         | 3813196  |
+--------------------+----------+

With the GLOBAL modifier, SHOW STATUS displays the status values for
all connections to MySQL. With SESSION, it displays the status values
for the current connection. If no modifier is present, the default is
SESSION. LOCAL is a synonym for SESSION.

Some status variables have only a global value. For these, you get the
same value for both GLOBAL and SESSION. The scope for each status
variable is listed at
https://mariadb.com/kb/en/server-status-variables/.

Each invocation of the SHOW STATUS statement uses an internal temporary
table and increments the global Created_tmp_tables value.

URL: https://mariadb.com/kb/en/show-status/

', '', 'https://mariadb.com/kb/en/show-status/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (138, 'EXTRACTVALUE', 37, 'Syntax:
ExtractValue(xml_frag, xpath_expr)

ExtractValue() takes two string arguments, a fragment of XML markup
xml_frag and an XPath expression xpath_expr (also known as a locator);
it returns the text (CDATA) of the first text node which is a child of
the elements or elements matched by the XPath expression. In MySQL 5.5,
the XPath expression can contain at most 127 characters. (This
limitation is lifted in MySQL 5.6.)

Using this function is the equivalent of performing a match using the
xpath_expr after appending /text(). In other words,
ExtractValue(''<a><b>Sakila</b></a>'', ''/a/b'') and
ExtractValue(''<a><b>Sakila</b></a>'', ''/a/b/text()'') produce the same
result.

If multiple matches are found, the content of the first child text node
of each matching element is returned (in the order matched) as a
single, space-delimited string.

If no matching text node is found for the expression (including the
implicit /text())---for whatever reason, as long as xpath_expr is
valid, and xml_frag consists of elements which are properly nested and
closed---an empty string is returned. No distinction is made between a
match on an empty element and no match at all. This is by design.

If you need to determine whether no matching element was found in
xml_frag or such an element was found but contained no child text
nodes, you should test the result of an expression that uses the XPath
count() function. For example, both of these statements return an empty
string, as shown here:

MariaDB> SELECT ExtractValue(''<a><b/></a>'', ''/a/b'');
+-------------------------------------+
| ExtractValue(''<a><b/></a>'', ''/a/b'') |
+-------------------------------------+
|                                     |
+-------------------------------------+
1 row in set (0.00 sec)

MariaDB> SELECT ExtractValue(''<a><c/></a>'', ''/a/b'');
+-------------------------------------+
| ExtractValue(''<a><c/></a>'', ''/a/b'') |
+-------------------------------------+
|                                     |
+-------------------------------------+
1 row in set (0.00 sec)

However, you can determine whether there was actually a matching
element using the following:

MariaDB> SELECT ExtractValue(''<a><b/></a>'', ''count(/a/b)'');
+-------------------------------------+
| ExtractValue(''<a><b/></a>'', ''count(/a/b)'') |
+-------------------------------------+
| 1                                   |
+-------------------------------------+
1 row in set (0.00 sec)

MariaDB> SELECT ExtractValue(''<a><c/></a>'', ''count(/a/b)'');
+-------------------------------------+
| ExtractValue(''<a><c/></a>'', ''count(/a/b)'') |
+-------------------------------------+
| 0                                   |
+-------------------------------------+
1 row in set (0.01 sec)

*Important*: ExtractValue() returns only CDATA, and does not return any
tags that might be contained within a matching tag, nor any of their
content (see the result returned as val1 in the following example).

URL: https://mariadb.com/kb/en/extractvalue/

', 'MariaDB> SELECT
    ->   ExtractValue(''<a>ccc<b>ddd</b></a>'', ''/a'') AS val1,
    ->   ExtractValue(''<a>ccc<b>ddd</b></a>'', ''/a/b'') AS val2,
    ->   ExtractValue(''<a>ccc<b>ddd</b></a>'', ''//b'') AS val3,
    ->   ExtractValue(''<a>ccc<b>ddd</b></a>'', ''/b'') AS val4,
    ->   ExtractValue(''<a>ccc<b>ddd</b><b>eee</b></a>'', ''//b'') AS val5;

+------+------+------+------+---------+
| val1 | val2 | val3 | val4 | val5    |
+------+------+------+------+---------+
| ccc  | ddd  | ddd  |      | ddd eee |
+------+------+------+------+---------+
', 'https://mariadb.com/kb/en/extractvalue/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (142, 'BIT_LENGTH', 37, 'Syntax:
BIT_LENGTH(str)

Returns the length of the string str in bits.

URL: https://mariadb.com/kb/en/bit_length/

', 'MariaDB> SELECT BIT_LENGTH(''text'');
        -> 32
', 'https://mariadb.com/kb/en/bit_length/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (143, 'EXTERIORRING', 2, 'ExteriorRing(poly)

Returns the exterior ring of the Polygon value poly as a LineString.

URL: https://mariadb.com/kb/en/exteriorring/

', 'MariaDB> SET @poly =
    -> ''Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))'';
MariaDB> SELECT AsText(ExteriorRing(GeomFromText(@poly)));
+-------------------------------------------+
| AsText(ExteriorRing(GeomFromText(@poly))) |
+-------------------------------------------+
| LINESTRING(0 0,0 3,3 3,3 0,0 0)           |
+-------------------------------------------+
', 'https://mariadb.com/kb/en/exteriorring/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (144, 'GEOMFROMWKB', 32, 'GeomFromWKB(wkb[,srid]), GeometryFromWKB(wkb[,srid])

Constructs a geometry value of any type using its WKB representation
and SRID.

URL: https://mariadb.com/kb/en/geomfromwkb/

', '', 'https://mariadb.com/kb/en/geomfromwkb/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (147, 'BETWEEN AND', 18, 'Syntax:
expr BETWEEN min AND max

If expr is greater than or equal to min and expr is less than or equal
to max, BETWEEN returns 1, otherwise it returns 0. This is equivalent
to the expression (min <= expr AND expr <= max) if all the arguments
are of the same type. Otherwise type conversion takes place according
to the rules described in
https://mariadb.com/kb/en/type-conversion/, but
applied to all the three arguments.

URL: https://mariadb.com/kb/en/between-and/

', 'MariaDB> SELECT 2 BETWEEN 1 AND 3, 2 BETWEEN 3 and 1;
        -> 1, 0
MariaDB> SELECT 1 BETWEEN 2 AND 3;
        -> 0
MariaDB> SELECT ''b'' BETWEEN ''a'' AND ''c'';
        -> 1
MariaDB> SELECT 2 BETWEEN 2 AND ''3'';
        -> 1
MariaDB> SELECT 2 BETWEEN 2 AND ''x-3'';
        -> 0
', 'https://mariadb.com/kb/en/between-and/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (148, 'MULTIPOLYGON', 24, 'MultiPolygon(poly1,poly2,...)

Constructs a MultiPolygon value from a set of Polygon or WKB Polygon
arguments.

URL: https://mariadb.com/kb/en/multipolygon/

', '', 'https://mariadb.com/kb/en/multipolygon/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (149, 'TIME_FORMAT', 31, 'Syntax:
TIME_FORMAT(time,format)

This is used like the DATE_FORMAT() function, but the format string may
contain format specifiers only for hours, minutes, seconds, and
microseconds. Other specifiers produce a NULL value or 0.

URL: https://mariadb.com/kb/en/time_format/

', 'MariaDB> SELECT TIME_FORMAT(''100:00:00'', ''%H %k %h %I %l'');
        -> ''100 100 04 04 4''
', 'https://mariadb.com/kb/en/time_format/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (140, 'FORMAT', 37, 'Syntax:
FORMAT(X,D[,locale])

Formats the number X to a format like ''#,###,###.##'', rounded to D
decimal places, and returns the result as a string. If D is 0, the
result has no decimal point or fractional part.

The optional third parameter enables a locale to be specified to be
used for the result number''s decimal point, thousands separator, and
grouping between separators. Permissible locale values are the same as
the legal values for the lc_time_names system variable (see
https://mariadb.com/kb/en/server-locale/). If no
locale is specified, the default is ''en_US''.

URL: https://mariadb.com/kb/en/format/

', 'MariaDB> SELECT FORMAT(12332.123456, 4);
        -> ''12,332.1235''
MariaDB> SELECT FORMAT(12332.1,4);
        -> ''12,332.1000''
MariaDB> SELECT FORMAT(12332.2,0);
        -> ''12,332''
MariaDB> SELECT FORMAT(12332.2,2,''de_DE'');
        -> ''12.332,20''
', 'https://mariadb.com/kb/en/format/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (145, 'SHOW SLAVE HOSTS', 26, 'Syntax:
SHOW SLAVE HOSTS

Displays a list of replication slaves currently registered with the
master. (Before MySQL 5.5.3, only slaves started with the
--report-host=host_name option are visible in this list.)

The list is displayed on any server (not just the master server). The
output looks like this:

MariaDB> SHOW SLAVE HOSTS;
+------------+-----------+------+-----------+
| Server_id  | Host      | Port | Master_id |
+------------+-----------+------+-----------+
|  192168010 | iconnect2 | 3306 | 192168011 |
| 1921680101 | athena    | 3306 | 192168011 |
+------------+-----------+------+-----------+

o Server_id: The unique server ID of the slave server, as configured in
  the server''s option file, or on the command line with
  --server-id=value.

o Host: The host name of the slave server, as configured in the
  server''s option file, or on the command line with
  --report-host=host_name. Note that this can differ from the machine
  name as configured in the operating system.

o Port: The port the slave server is listening on.

  In MySQL 5.5.23 and later, a zero in this column means that the slave
  port (--report-port) was not set. Prior to MySQL 5.5.23, 3306 was
  used as the default in such cases (Bug #13333431).

o Master_id: The unique server ID of the master server that the slave
  server is replicating from.

Some MySQL versions report another variable, Rpl_recovery_rank. This
variable was never used, and was removed in MySQL 5.5.3. (Bug #13963)

URL: https://mariadb.com/kb/en/show-slave-hosts/

', '', 'https://mariadb.com/kb/en/show-slave-hosts/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (150, 'LEFT', 37, 'Syntax:
LEFT(str,len)

Returns the leftmost len characters from the string str, or NULL if any
argument is NULL.

URL: https://mariadb.com/kb/en/left/

', 'MariaDB> SELECT LEFT(''foobarbar'', 5);
        -> ''fooba''
', 'https://mariadb.com/kb/en/left/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (151, 'FLUSH QUERY CACHE', 26, 'You can defragment the query cache to better utilize its memory with
the FLUSH QUERY CACHE statement. The statement does not remove any
queries from the cache.

The RESET QUERY CACHE statement removes all query results from the
query cache. The FLUSH TABLES statement also does this.

URL: https://mariadb.com/kb/en/flush-query-cache/

', '', 'https://mariadb.com/kb/en/flush-query-cache/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (152, 'SET DATA TYPE', 22, 'SET(''value1'',''value2'',...) [CHARACTER SET charset_name] [COLLATE
collation_name]

A set. A string object that can have zero or more values, each of which
must be chosen from the list of values ''value1'', ''value2'', ... A SET
column can have a maximum of 64 members. SET values are represented
internally as integers.

URL: https://mariadb.com/kb/en/set-data-type/

', '', 'https://mariadb.com/kb/en/set-data-type/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (153, 'RAND', 4, 'Syntax:
RAND(), RAND(N)

Returns a random floating-point value v in the range 0 <= v < 1.0. If a
constant integer argument N is specified, it is used as the seed value,
which produces a repeatable sequence of column values. In the following
example, note that the sequences of values produced by RAND(3) is the
same both places where it occurs.

URL: https://mariadb.com/kb/en/rand/

', 'MariaDB> CREATE TABLE t (i INT);
Query OK, 0 rows affected (0.42 sec)

MariaDB> INSERT INTO t VALUES(1),(2),(3);
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB> SELECT i, RAND() FROM t;
+------+------------------+
| i    | RAND()           |
+------+------------------+
|    1 | 0.61914388706828 |
|    2 | 0.93845168309142 |
|    3 | 0.83482678498591 |
+------+------------------+
3 rows in set (0.00 sec)

MariaDB> SELECT i, RAND(3) FROM t;
+------+------------------+
| i    | RAND(3)          |
+------+------------------+
|    1 | 0.90576975597606 |
|    2 | 0.37307905813035 |
|    3 | 0.14808605345719 |
+------+------------------+
3 rows in set (0.00 sec)

MariaDB> SELECT i, RAND() FROM t;
+------+------------------+
| i    | RAND()           |
+------+------------------+
|    1 | 0.35877890638893 |
|    2 | 0.28941420772058 |
|    3 | 0.37073435016976 |
+------+------------------+
3 rows in set (0.00 sec)

MariaDB> SELECT i, RAND(3) FROM t;
+------+------------------+
| i    | RAND(3)          |
+------+------------------+
|    1 | 0.90576975597606 |
|    2 | 0.37307905813035 |
|    3 | 0.14808605345719 |
+------+------------------+
3 rows in set (0.01 sec)
', 'https://mariadb.com/kb/en/rand/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (154, 'RPAD', 37, 'Syntax:
RPAD(str,len,padstr)

Returns the string str, right-padded with the string padstr to a length
of len characters. If str is longer than len, the return value is
shortened to len characters.

URL: https://mariadb.com/kb/en/rpad/

', 'MariaDB> SELECT RPAD(''hi'',5,''?'');
        -> ''hi???''
MariaDB> SELECT RPAD(''hi'',1,''?'');
        -> ''h''
', 'https://mariadb.com/kb/en/rpad/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (155, 'CREATE DATABASE', 39, 'Syntax:
CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name
    [create_specification] ...

create_specification:
    [DEFAULT] CHARACTER SET [=] charset_name
  | [DEFAULT] COLLATE [=] collation_name

CREATE DATABASE creates a database with the given name. To use this
statement, you need the CREATE privilege for the database. CREATE
SCHEMA is a synonym for CREATE DATABASE.

URL: https://mariadb.com/kb/en/create-database/

', '', 'https://mariadb.com/kb/en/create-database/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (156, 'DEC', 22, 'DEC[(M[,D])] [UNSIGNED] [ZEROFILL], NUMERIC[(M[,D])] [UNSIGNED]
[ZEROFILL], FIXED[(M[,D])] [UNSIGNED] [ZEROFILL]

These types are synonyms for DECIMAL. The FIXED synonym is available
for compatibility with other database systems.

URL: https://mariadb.com/kb/en/dec-numeric-fixed/

', '', 'https://mariadb.com/kb/en/dec-numeric-fixed/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (157, 'VAR_POP', 16, 'Syntax:
VAR_POP(expr)

Returns the population standard variance of expr. It considers rows as
the whole population, not as a sample, so it has the number of rows as
the denominator. You can also use VARIANCE(), which is equivalent but
is not standard SQL.

VAR_POP() returns NULL if there were no matching rows.

URL: https://mariadb.com/kb/en/var_pop/

', '', 'https://mariadb.com/kb/en/var_pop/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (158, 'ELT', 37, 'Syntax:
ELT(N,str1,str2,str3,...)

Returns str1 if N = 1, str2 if N = 2, and so on. Returns NULL if N is
less than 1 or greater than the number of arguments. ELT() is the
complement of FIELD().

URL: https://mariadb.com/kb/en/elt/.html

', 'MariaDB> SELECT ELT(1, ''ej'', ''Heja'', ''hej'', ''foo'');
        -> ''ej''
MariaDB> SELECT ELT(4, ''ej'', ''Heja'', ''hej'', ''foo'');
        -> ''foo''
', 'https://mariadb.com/kb/en/elt/.html');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (146, 'START TRANSACTION', 8, 'Syntax:
START TRANSACTION [WITH CONSISTENT SNAPSHOT]
BEGIN [WORK]
COMMIT [WORK] [AND [NO] CHAIN] [[NO] RELEASE]
ROLLBACK [WORK] [AND [NO] CHAIN] [[NO] RELEASE]
SET autocommit = {0 | 1}

These statements provide control over use of transactions:

o START TRANSACTION or BEGIN start a new transaction.

o COMMIT commits the current transaction, making its changes permanent.

o ROLLBACK rolls back the current transaction, canceling its changes.

o SET autocommit disables or enables the default autocommit mode for
  the current session.

By default, MySQL runs with autocommit mode enabled. This means that as
soon as you execute a statement that updates (modifies) a table, MySQL
stores the update on disk to make it permanent. The change cannot be
rolled back.

To disable autocommit mode implicitly for a single series of
statements, use the START TRANSACTION statement:

START TRANSACTION;
SELECT @A:=SUM(salary) FROM table1 WHERE type=1;
UPDATE table2 SET summary=@A WHERE type=1;
COMMIT;

With START TRANSACTION, autocommit remains disabled until you end the
transaction with COMMIT or ROLLBACK. The autocommit mode then reverts
to its previous state.

You can also begin a transaction like this:

START TRANSACTION WITH CONSISTENT SNAPSHOT;

The WITH CONSISTENT SNAPSHOT option starts a consistent read for
storage engines that are capable of it. This applies only to InnoDB.
The effect is the same as issuing a START TRANSACTION followed by a
SELECT from any InnoDB table. See
http://dev.mysql.com/doc/refman/5.5/en/innodb-consistent-read.html. The
WITH CONSISTENT SNAPSHOT option does not change the current transaction
isolation level, so it provides a consistent snapshot only if the
current isolation level is one that permits consistent read (REPEATABLE
READ or SERIALIZABLE).

*Important*: Many APIs used for writing MySQL client applications (such
as JDBC) provide their own methods for starting transactions that can
(and sometimes should) be used instead of sending a START TRANSACTION
statement from the client. See
http://dev.mysql.com/doc/refman/5.5/en/connectors-apis.html, or the
documentation for your API, for more information.

To disable autocommit mode explicitly, use the following statement:

SET autocommit=0;

After disabling autocommit mode by setting the autocommit variable to
zero, changes to transaction-safe tables (such as those for InnoDB) are not made permanent immediately. You must use COMMIT to
store your changes to disk or ROLLBACK to ignore the changes.

autocommit is a session variable and must be set for each session. To
disable autocommit mode for each new connection, see the description of
the autocommit system variable at
https://mariadb.com/kb/en/server-system-variables/.

BEGIN and BEGIN WORK are supported as aliases of START TRANSACTION for
initiating a transaction. START TRANSACTION is standard SQL syntax and
is the recommended way to start an ad-hoc transaction.

The BEGIN statement differs from the use of the BEGIN keyword that
starts a BEGIN ... END compound statement. The latter does not begin a
transaction. See [HELP BEGIN END].

*Note*: Within all stored programs (stored procedures and functions,
triggers, and events), the parser treats BEGIN [WORK] as the beginning
of a BEGIN ... END block. Begin a transaction in this context with
START TRANSACTION instead.

The optional WORK keyword is supported for COMMIT and ROLLBACK, as are
the CHAIN and RELEASE clauses. CHAIN and RELEASE can be used for
additional control over transaction completion. The value of the
completion_type system variable determines the default completion
behavior. See
https://mariadb.com/kb/en/server-system-variables/.

The AND CHAIN clause causes a new transaction to begin as soon as the
current one ends, and the new transaction has the same isolation level
as the just-terminated transaction. The RELEASE clause causes the
server to disconnect the current client session after terminating the
current transaction. Including the NO keyword suppresses CHAIN or
RELEASE completion, which can be useful if the completion_type system
variable is set to cause chaining or release completion by default.

URL: https://mariadb.com/kb/en/start-transaction/

', '', 'https://mariadb.com/kb/en/start-transaction/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (159, 'ALTER VIEW', 39, 'Syntax:
ALTER
    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
    [DEFINER = { user | CURRENT_USER }]
    [SQL SECURITY { DEFINER | INVOKER }]
    VIEW view_name [(column_list)]
    AS select_statement
    [WITH [CASCADED | LOCAL] CHECK OPTION]

This statement changes the definition of a view, which must exist. The
syntax is similar to that for CREATE VIEW and the effect is the same as
for CREATE OR REPLACE VIEW. See [HELP CREATE VIEW]. This statement
requires the CREATE VIEW and DROP privileges for the view, and some
privilege for each column referred to in the SELECT statement. ALTER
VIEW is permitted only to the definer or users with the SUPER
privilege.

URL: https://mariadb.com/kb/en/alter-view/

', '', 'https://mariadb.com/kb/en/alter-view/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (161, '~', 19, 'Syntax:
~

Invert all bits.

URL: https://mariadb.com/kb/en/3489/

', 'MariaDB> SELECT 5 & ~1;
        -> 4
', 'https://mariadb.com/kb/en/3489/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (162, 'TEXT', 22, 'TEXT[(M)] [CHARACTER SET charset_name] [COLLATE collation_name]

A TEXT column with a maximum length of 65,535 (216 - 1) characters. The
effective maximum length is less if the value contains multi-byte
characters. Each TEXT value is stored using a 2-byte length prefix that
indicates the number of bytes in the value.

An optional length M can be given for this type. If this is done, MySQL
creates the column as the smallest TEXT type large enough to hold
values M characters long.

URL: https://mariadb.com/kb/en/text/

', '', 'https://mariadb.com/kb/en/text/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (163, 'CONCAT_WS', 37, 'Syntax:
CONCAT_WS(separator,str1,str2,...)

CONCAT_WS() stands for Concatenate With Separator and is a special form
of CONCAT(). The first argument is the separator for the rest of the
arguments. The separator is added between the strings to be
concatenated. The separator can be a string, as can the rest of the
arguments. If the separator is NULL, the result is NULL.

URL: https://mariadb.com/kb/en/concat_ws/

', 'MariaDB> SELECT CONCAT_WS('','',''First name'',''Second name'',''Last Name'');
        -> ''First name,Second name,Last Name''
MariaDB> SELECT CONCAT_WS('','',''First name'',NULL,''Last Name'');
        -> ''First name,Last Name''
', 'https://mariadb.com/kb/en/concat_ws/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (165, 'ASIN', 4, 'Syntax:
ASIN(X)

Returns the arc sine of X, that is, the value whose sine is X. Returns
NULL if X is not in the range -1 to 1.

URL: https://mariadb.com/kb/en/asin/

', 'MariaDB> SELECT ASIN(0.2);
        -> 0.20135792079033
MariaDB> SELECT ASIN(''foo'');

+-------------+
| ASIN(''foo'') |
+-------------+
|           0 |
+-------------+
1 row in set, 1 warning (0.00 sec)

MariaDB> SHOW WARNINGS;
+---------+------+-----------------------------------------+
| Level   | Code | Message                                 |
+---------+------+-----------------------------------------+
| Warning | 1292 | Truncated incorrect DOUBLE value: ''foo'' |
+---------+------+-----------------------------------------+
', 'https://mariadb.com/kb/en/asin/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (166, 'SIGN', 4, 'Syntax:
SIGN(X)

Returns the sign of the argument as -1, 0, or 1, depending on whether X
is negative, zero, or positive.

URL: https://mariadb.com/kb/en/sign/

', 'MariaDB> SELECT SIGN(-32);
        -> -1
MariaDB> SELECT SIGN(0);
        -> 0
MariaDB> SELECT SIGN(234);
        -> 1
', 'https://mariadb.com/kb/en/sign/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (160, 'SHOW DATABASES', 26, 'Syntax:
SHOW {DATABASES | SCHEMAS}
    [LIKE ''pattern'' | WHERE expr]

SHOW DATABASES lists the databases on the MySQL server host. SHOW
SCHEMAS is a synonym for SHOW DATABASES. The LIKE clause, if present,
indicates which database names to match. The WHERE clause can be given
to select rows using more general conditions, as discussed in
https://mariadb.com/kb/en/extended-show/.

You see only those databases for which you have some kind of privilege,
unless you have the global SHOW DATABASES privilege. You can also get
this list using the mysqlshow command.

If the server was started with the --skip-show-database option, you
cannot use this statement at all unless you have the SHOW DATABASES
privilege.

URL: https://mariadb.com/kb/en/show-databases/

', '', 'https://mariadb.com/kb/en/show-databases/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (164, 'ROW_COUNT', 17, 'Syntax:
ROW_COUNT()

Before MySQL 5.5.5, ROW_COUNT() returns the number of rows changed,
deleted, or inserted by the last statement if it was an UPDATE, DELETE,
or INSERT. For other statements, the value may not be meaningful.

As of MySQL 5.5.5, ROW_COUNT() returns a value as follows:

o DDL statements: 0. This applies to statements such as CREATE TABLE or
  DROP TABLE.

o DML statements other than SELECT: The number of affected rows. This
  applies to statements such as UPDATE, INSERT, or DELETE (as before),
  but now also to statements such as ALTER TABLE and LOAD DATA INFILE.

o SELECT: -1 if the statement returns a result set, or the number of
  rows "affected" if it does not. For example, for SELECT * FROM t1,
  ROW_COUNT() returns -1. For SELECT * FROM t1 INTO OUTFILE
  ''file_name'', ROW_COUNT() returns the number of rows written to the
  file.

o SIGNAL statements: 0.

For UPDATE statements, the affected-rows value by default is the number
of rows actually changed. If you specify the CLIENT_FOUND_ROWS flag to
mysql_real_connect() when connecting to mysqld, the affected-rows value
is the number of rows "found"; that is, matched by the WHERE clause.

For REPLACE statements, the affected-rows value is 2 if the new row
replaced an old row, because in this case, one row was inserted after
the duplicate was deleted.

For INSERT ... ON DUPLICATE KEY UPDATE statements, the affected-rows
value is 1 if the row is inserted as a new row and 2 if an existing row
is updated.

The ROW_COUNT() value is similar to the value from the
mysql_affected_rows() C API function and the row count that the mysql
client displays following statement execution.

URL: https://mariadb.com/kb/en/information-functions-row_count/

', 'MariaDB> INSERT INTO t VALUES(1),(2),(3);
Query OK, 3 rows affected (0.00 sec)
Records: 3  Duplicates: 0  Warnings: 0

MariaDB> SELECT ROW_COUNT();
+-------------+
| ROW_COUNT() |
+-------------+
|           3 |
+-------------+
1 row in set (0.00 sec)

MariaDB> DELETE FROM t WHERE i IN(1,2);
Query OK, 2 rows affected (0.00 sec)

MariaDB> SELECT ROW_COUNT();
+-------------+
| ROW_COUNT() |
+-------------+
|           2 |
+-------------+
1 row in set (0.00 sec)
', 'https://mariadb.com/kb/en/information-functions-row_count/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (167, 'SEC_TO_TIME', 31, 'Syntax:
SEC_TO_TIME(seconds)

Returns the seconds argument, converted to hours, minutes, and seconds,
as a TIME value. The range of the result is constrained to that of the
TIME data type. A warning occurs if the argument corresponds to a value
outside that range.

URL: https://mariadb.com/kb/en/sec_to_time/

', 'MariaDB> SELECT SEC_TO_TIME(2378);
        -> ''00:39:38''
MariaDB> SELECT SEC_TO_TIME(2378) + 0;
        -> 3938
', 'https://mariadb.com/kb/en/sec_to_time/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (168, 'FLOAT', 22, 'FLOAT[(M,D)] [UNSIGNED] [ZEROFILL]

A small (single-precision) floating-point number. Permissible values
are -3.402823466E+38 to -1.175494351E-38, 0, and 1.175494351E-38 to
3.402823466E+38. These are the theoretical limits, based on the IEEE
standard. The actual range might be slightly smaller depending on your
hardware or operating system.

M is the total number of digits and D is the number of digits following
the decimal point. If M and D are omitted, values are stored to the
limits permitted by the hardware. A single-precision floating-point
number is accurate to approximately 7 decimal places.

UNSIGNED, if specified, disallows negative values.

Using FLOAT might give you some unexpected problems because all
calculations in MySQL are done with double precision. See
https://mariadb.com/kb/en/floating-point-accuracy/.

URL: https://mariadb.com/kb/en/float/

', '', 'https://mariadb.com/kb/en/float/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (169, 'LOCATE', 37, 'Syntax:
LOCATE(substr,str), LOCATE(substr,str,pos)

The first syntax returns the position of the first occurrence of
substring substr in string str. The second syntax returns the position
of the first occurrence of substring substr in string str, starting at
position pos. Returns 0 if substr is not in str.

URL: https://mariadb.com/kb/en/locate/

', 'MariaDB> SELECT LOCATE(''bar'', ''foobarbar'');
        -> 4
MariaDB> SELECT LOCATE(''xbar'', ''foobar'');
        -> 0
MariaDB> SELECT LOCATE(''bar'', ''foobarbar'', 5);
        -> 7
', 'https://mariadb.com/kb/en/locate/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (171, 'CHARSET', 17, 'Syntax:
CHARSET(str)

Returns the character set of the string argument.

URL: https://mariadb.com/kb/en/charset/

', 'MariaDB> SELECT CHARSET(''abc'');
        -> ''latin1''
MariaDB> SELECT CHARSET(CONVERT(''abc'' USING utf8));
        -> ''utf8''
MariaDB> SELECT CHARSET(USER());
        -> ''utf8''
', 'https://mariadb.com/kb/en/charset/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (172, 'SUBDATE', 31, 'Syntax:
SUBDATE(date,INTERVAL expr unit), SUBDATE(expr,days)

When invoked with the INTERVAL form of the second argument, SUBDATE()
is a synonym for DATE_SUB(). For information on the INTERVAL unit
argument, see the discussion for DATE_ADD().

MariaDB> SELECT DATE_SUB(''2008-01-02'', INTERVAL 31 DAY);
        -> ''2007-12-02''
MariaDB> SELECT SUBDATE(''2008-01-02'', INTERVAL 31 DAY);
        -> ''2007-12-02''

The second form enables the use of an integer value for days. In such
cases, it is interpreted as the number of days to be subtracted from
the date or datetime expression expr.

MariaDB> SELECT SUBDATE(''2008-01-02 12:00:00'', 31);
        -> ''2007-12-02 12:00:00''

URL: https://mariadb.com/kb/en/subdate/

', '', 'https://mariadb.com/kb/en/subdate/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (173, 'DAYOFYEAR', 31, 'Syntax:
DAYOFYEAR(date)

Returns the day of the year for date, in the range 1 to 366.

URL: https://mariadb.com/kb/en/dayofyear/

', 'MariaDB> SELECT DAYOFYEAR(''2007-02-03'');
        -> 34
', 'https://mariadb.com/kb/en/dayofyear/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (174, '%', 4, 'Syntax:
N % M, N MOD M

Modulo operation. Returns the remainder of N divided by M. For more
information, see the description for the MOD() function in
https://mariadb.com/kb/en/mod/.

URL: https://mariadb.com/kb/en/modulo-operator/

', '', 'https://mariadb.com/kb/en/modulo-operator/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (175, 'LONGTEXT', 22, 'LONGTEXT [CHARACTER SET charset_name] [COLLATE collation_name]

A TEXT column with a maximum length of 4,294,967,295 or 4GB (232 - 1)
characters. The effective maximum length is less if the value contains
multi-byte characters. The effective maximum length of LONGTEXT columns
also depends on the configured maximum packet size in the client/server
protocol and available memory. Each LONGTEXT value is stored using a
4-byte length prefix that indicates the number of bytes in the value.

URL: https://mariadb.com/kb/en/longtext/

', '', 'https://mariadb.com/kb/en/longtext/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (170, 'SHOW EVENTS', 26, 'Syntax:
SHOW EVENTS [{FROM | IN} schema_name]
    [LIKE ''pattern'' | WHERE expr]

This statement displays information about Event Manager events. It
requires the EVENT privilege for the database from which the events are
to be shown.

In its simplest form, SHOW EVENTS lists all of the events in the
current schema:

MariaDB> SELECT CURRENT_USER(), SCHEMA();
+----------------+----------+
| CURRENT_USER() | SCHEMA() |
+----------------+----------+
| jon@ghidora    | myschema |
+----------------+----------+
1 row in set (0.00 sec)

MariaDB> SHOW EVENTS\\G
*************************** 1. row ***************************
                  Db: myschema
                Name: e_daily
             Definer: jon@ghidora
           Time zone: SYSTEM
                Type: RECURRING
          Execute at: NULL
      Interval value: 10
      Interval field: SECOND
              Starts: 2006-02-09 10:41:23
                Ends: NULL
              Status: ENABLED
          Originator: 0
character_set_client: latin1
collation_connection: latin1_swedish_ci
  Database Collation: latin1_swedish_ci

To see events for a specific schema, use the FROM clause. For example,
to see events for the test schema, use the following statement:

SHOW EVENTS FROM test;

The LIKE clause, if present, indicates which event names to match. The
WHERE clause can be given to select rows using more general conditions,
as discussed in
https://mariadb.com/kb/en/extended-show/.

URL: https://mariadb.com/kb/en/show-events/

', '', 'https://mariadb.com/kb/en/show-events/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (176, 'KILL', 26, 'Syntax:
KILL [CONNECTION | QUERY] thread_id

Each connection to mysqld runs in a separate thread. You can see which
threads are running with the SHOW PROCESSLIST statement and kill a
thread with the KILL thread_id statement.

KILL permits an optional CONNECTION or QUERY modifier:

o KILL CONNECTION is the same as KILL with no modifier: It terminates
  the connection associated with the given thread_id.

o KILL QUERY terminates the statement that the connection is currently
  executing, but leaves the connection itself intact.

If you have the PROCESS privilege, you can see all threads. If you have
the SUPER privilege, you can kill all threads and statements.
Otherwise, you can see and kill only your own threads and statements.

You can also use the mysqladmin processlist and mysqladmin kill
commands to examine and kill threads.

*Note*: You cannot use KILL with the Embedded MySQL Server library
because the embedded server merely runs inside the threads of the host
application. It does not create any connection threads of its own.

URL: https://mariadb.com/kb/en/data-manipulation-kill-connection-query/

', '', 'https://mariadb.com/kb/en/data-manipulation-kill-connection-query/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (177, 'DISJOINT', 30, 'Disjoint(g1,g2)

Returns 1 or 0 to indicate whether g1 is spatially disjoint from (does
not intersect) g2.

URL: https://mariadb.com/kb/en/disjoint/

', '', 'https://mariadb.com/kb/en/disjoint/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (178, 'ASTEXT', 3, 'AsText(g), AsWKT(g)

Converts a value in internal geometry format to its WKT representation
and returns the string result.

URL: https://mariadb.com/kb/en/astext/

', 'MariaDB> SET @g = ''LineString(1 1,2 2,3 3)'';
MariaDB> SELECT AsText(GeomFromText(@g));
+--------------------------+
| AsText(GeomFromText(@g)) |
+--------------------------+
| LINESTRING(1 1,2 2,3 3)  |
+--------------------------+
', 'https://mariadb.com/kb/en/astext/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (179, 'LPAD', 37, 'Syntax:
LPAD(str,len,padstr)

Returns the string str, left-padded with the string padstr to a length
of len characters. If str is longer than len, the return value is
shortened to len characters.


URL: https://mariadb.com/kb/en/lpad/

', 'MariaDB> SELECT LPAD(''hi'',4,''??'');
        -> ''??hi''
MariaDB> SELECT LPAD(''hi'',1,''??'');
        -> ''h''
', 'https://mariadb.com/kb/en/lpad/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (180, 'DECLARE CONDITION', 23, 'Syntax:
DECLARE condition_name CONDITION FOR condition_value

condition_value:
    mysql_error_code
  | SQLSTATE [VALUE] sqlstate_value

The DECLARE ... CONDITION statement declares a named error condition,
associating a name with a condition that needs specific handling. The
name can be referred to in a subsequent DECLARE ... HANDLER statement
(see [HELP DECLARE HANDLER]).

Condition declarations must appear before cursor or handler
declarations.

The condition_value for DECLARE ... CONDITION can be a MySQL error code
(a number) or an SQLSTATE value (a 5-character string literal). You
should not use MySQL error code 0 or SQLSTATE values that begin with
''00'', because those indicate success rather than an error condition.
For a list of MySQL error codes and SQLSTATE values, see
https://mariadb.com/kb/en/mariadb-error-codes/.

URL: https://mariadb.com/kb/en/declare-condition/

', '', 'https://mariadb.com/kb/en/declare-condition/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (181, 'OVERLAPS', 30, 'Overlaps(g1,g2)

Returns 1 or 0 to indicate whether g1 spatially overlaps g2. The term
spatially overlaps is used if two geometries intersect and their
intersection results in a geometry of the same dimension but not equal
to either of the given geometries.

URL: https://mariadb.com/kb/en/overlaps/

', '', 'https://mariadb.com/kb/en/overlaps/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (182, 'SET GLOBAL SQL_SLAVE_SKIP_COUNTER', 8, 'Syntax:
SET GLOBAL sql_slave_skip_counter = N

This statement skips the next N events from the master. This is useful
for recovering from replication stops caused by a statement.

This statement is valid only when the slave threads are not running.
Otherwise, it produces an error.

URL: https://mariadb.com/kb/en/set-global-sql_slave_skip_counter/

', '', 'https://mariadb.com/kb/en/set-global-sql_slave_skip_counter/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (183, 'NUMGEOMETRIES', 25, 'NumGeometries(gc)

Returns the number of geometries in the GeometryCollection value gc.

URL: https://mariadb.com/kb/en/numgeometries/

', 'MariaDB> SET @gc = ''GeometryCollection(Point(1 1),LineString(2 2, 3 3))'';
MariaDB> SELECT NumGeometries(GeomFromText(@gc));
+----------------------------------+
| NumGeometries(GeomFromText(@gc)) |
+----------------------------------+
|                                2 |
+----------------------------------+
', 'https://mariadb.com/kb/en/numgeometries/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (184, 'MONTHNAME', 31, 'Syntax:
MONTHNAME(date)

Returns the full name of the month for date. The language used for the
name is controlled by the value of the lc_time_names system variable
(https://mariadb.com/kb/en/server-locale/).

URL: https://mariadb.com/kb/en/monthname/

', 'MariaDB> SELECT MONTHNAME(''2008-02-03'');
        -> ''February''
', 'https://mariadb.com/kb/en/monthname/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (185, 'CHANGE MASTER TO', 8, 'Syntax:
CHANGE MASTER TO option [, option] ...

option:
    MASTER_BIND = ''interface_name''
  | MASTER_HOST = ''host_name''
  | MASTER_USER = ''user_name''
  | MASTER_PASSWORD = ''password''
  | MASTER_PORT = port_num
  | MASTER_CONNECT_RETRY = interval
  | MASTER_HEARTBEAT_PERIOD = interval
  | MASTER_LOG_FILE = ''master_log_name''
  | MASTER_LOG_POS = master_log_pos
  | RELAY_LOG_FILE = ''relay_log_name''
  | RELAY_LOG_POS = relay_log_pos
  | MASTER_SSL = {0|1}
  | MASTER_SSL_CA = ''ca_file_name''
  | MASTER_SSL_CAPATH = ''ca_directory_name''
  | MASTER_SSL_CERT = ''cert_file_name''
  | MASTER_SSL_KEY = ''key_file_name''
  | MASTER_SSL_CIPHER = ''cipher_list''
  | MASTER_SSL_VERIFY_SERVER_CERT = {0|1}
  | IGNORE_SERVER_IDS = (server_id_list)

server_id_list:
    [server_id [, server_id] ... ]

CHANGE MASTER TO changes the parameters that the slave server uses for
connecting to the master server, for reading the master binary log, and
reading the slave relay log. It also updates the contents of the
master.info and relay-log.info files. To use CHANGE MASTER TO, the
slave replication threads must be stopped (use STOP SLAVE if
necessary).

Options not specified retain their value, except as indicated in the
following discussion. Thus, in most cases, there is no need to specify
options that do not change. For example, if the password to connect to
your MySQL master has changed, you just need to issue these statements
to tell the slave about the new password:

STOP SLAVE; -- if replication was running
CHANGE MASTER TO MASTER_PASSWORD=''new3cret'';
START SLAVE; -- if you want to restart replication

MASTER_HOST, MASTER_USER, MASTER_PASSWORD, and MASTER_PORT provide
information to the slave about how to connect to its master:

o MASTER_HOST and MASTER_PORT are the host name (or IP address) of the
  master host and its TCP/IP port.

  *Note*: Replication cannot use Unix socket files. You must be able to
  connect to the master MySQL server using TCP/IP.

  If you specify the MASTER_HOST or MASTER_PORT option, the slave
  assumes that the master server is different from before (even if the
  option value is the same as its current value.) In this case, the old
  values for the master binary log file name and position are
  considered no longer applicable, so if you do not specify
  MASTER_LOG_FILE and MASTER_LOG_POS in the statement,
  MASTER_LOG_FILE='''' and MASTER_LOG_POS=4 are silently appended to it.

  Setting MASTER_HOST='''' (that is, setting its value explicitly to an
  empty string) is not the same as not setting MASTER_HOST at all.
  Beginning with MySQL 5.5, trying to set MASTER_HOST to an empty
  string fails with an error. Previously, setting MASTER_HOST to an
  empty string caused START SLAVE subsequently to fail. (Bug #28796)

o MASTER_USER and MASTER_PASSWORD are the user name and password of the
  account to use for connecting to the master.

  In MySQL 5.5.20 and later, MASTER_USER cannot be made empty; setting
  MASTER_USER = '''' or leaving it unset when setting a value for for
  MASTER_PASSWORD causes an error (Bug #13427949).

  Currently, a password used for a replication slave account is
  effectively limited to 32 characters in length; the password can be
  longer, but any excess characters are truncated. This is not due to
  any limit imposed by the MySQL Server generally, but rather is an
  issue specific to MySQL Replication. (For more information, see Bug
  #43439.)

  The text of a running CHANGE MASTER TO statement, including values
  for MASTER_USER and MASTER_PASSWORD, can be seen in the output of a
  concurrent SHOW PROCESSLIST statement.

The MASTER_SSL_xxx options provide information about using SSL for the
connection. They correspond to the --ssl-xxx options described in
https://mariadb.com/kb/en/ssl-server-system-variables/, and
http://dev.mysql.com/doc/refman/5.5/en/replication-solutions-ssl.html.
These options can be changed even on slaves that are compiled without
SSL support. They are saved to the master.info file, but are ignored if
the slave does not have SSL support enabled.

MASTER_CONNECT_RETRY specifies how many seconds to wait between connect
retries. The default is 60. The number of reconnection attempts is
limited by the --master-retry-count server option; for more
information, see
https://mariadb.com/kb/en/replication-and-binary-log-server-system-variables/.

MASTER_HEARTBEAT_PERIOD sets the interval in seconds between
replication heartbeats. Whenever the master''s binary log is updated
with an event, the waiting period for the next heartbeat is reset.
interval is a decimal value having the range 0 to 4294967 seconds and a
resolution in milliseconds; the smallest nonzero value is 0.001.
Heartbeats are sent by the master only if there are no unsent events in
the binary log file for a period longer than interval.

Setting interval to 0 disables heartbeats altogether. The default value
for interval is equal to the value of slave_net_timeout divided by 2.

Setting @@global.slave_net_timeout to a value less than that of the
current heartbeat interval results in a warning being issued. The
effect of issuing RESET SLAVE on the heartbeat interval is to reset it
to the default value.

MASTER_LOG_FILE and MASTER_LOG_POS are the coordinates at which the
slave I/O thread should begin reading from the master the next time the
thread starts. RELAY_LOG_FILE and RELAY_LOG_POS are the coordinates at
which the slave SQL thread should begin reading from the relay log the
next time the thread starts. If you specify either of MASTER_LOG_FILE
or MASTER_LOG_POS, you cannot specify RELAY_LOG_FILE or RELAY_LOG_POS.
If neither of MASTER_LOG_FILE or MASTER_LOG_POS is specified, the slave
uses the last coordinates of the slave SQL thread before CHANGE MASTER
TO was issued. This ensures that there is no discontinuity in
replication, even if the slave SQL thread was late compared to the
slave I/O thread, when you merely want to change, say, the password to
use.

CHANGE MASTER TO deletes all relay log files and starts a new one,
unless you specify RELAY_LOG_FILE or RELAY_LOG_POS. In that case, relay
log files are kept; the relay_log_purge global variable is set silently
to 0.

Prior to MySQL 5.5, RELAY_LOG_FILE required an absolute path. In MySQL
5.5, the path can be relative, in which case the path is assumed to be
relative to the slave''s data directory. (Bug #12190)

IGNORE_SERVER_IDS was added in MySQL 5.5. This option takes a
comma-separated list of 0 or more server IDs. Events originating from
the corresponding servers are ignored, with the exception of log
rotation and deletion events, which are still recorded in the relay
log.

In circular replication, the originating server normally acts as the
terminator of its own events, so that they are not applied more than
once. Thus, this option is useful in circular replication when one of
the servers in the circle is removed. Suppose that you have a circular
replication setup with 4 servers, having server IDs 1, 2, 3, and 4, and
server 3 fails. When bridging the gap by starting replication from
server 2 to server 4, you can include IGNORE_SERVER_IDS = (3) in the
CHANGE MASTER TO statement that you issue on server 4 to tell it to use
server 2 as its master instead of server 3. Doing so causes it to
ignore and not to propagate any statements that originated with the
server that is no longer in use.

If a CHANGE MASTER TO statement is issued without any IGNORE_SERVER_IDS
option, any existing list is preserved; RESET SLAVE also has no effect
on the server ID list. To clear the list of ignored servers, it is
necessary to use the option with an empty list:

CHANGE MASTER TO IGNORE_SERVER_IDS = ();

If IGNORE_SERVER_IDS contains the server''s own ID and the server was
started with the --replicate-same-server-id option enabled, an error
results.

Also beginning with MySQL 5.5, the master.info file and the output of
SHOW SLAVE STATUS are extended to provide the list of servers that are
currently ignored. For more information, see
https://mariadb.com/kb/en/show-slave-status/, and
[HELP SHOW SLAVE STATUS].

Beginning with MySQL 5.5.5, invoking CHANGE MASTER TO causes the
previous values for MASTER_HOST, MASTER_PORT, MASTER_LOG_FILE, and
MASTER_LOG_POS to be written to the error log, along with other
information about the slave''s state prior to execution.

CHANGE MASTER TO is useful for setting up a slave when you have the
snapshot of the master and have recorded the master binary log
coordinates corresponding to the time of the snapshot. After loading
the snapshot into the slave to synchronize it to the slave, you can run
CHANGE MASTER TO MASTER_LOG_FILE=''log_name'', MASTER_LOG_POS=log_pos on
the slave to specify the coordinates at which the slave should begin
reading the master binary log.

The following example changes the master server the slave uses and
establishes the master binary log coordinates from which the slave
begins reading. This is used when you want to set up the slave to
replicate the master:

CHANGE MASTER TO
  MASTER_HOST=''master2.mycompany.com'',
  MASTER_USER=''replication'',
  MASTER_PASSWORD=''bigs3cret'',
  MASTER_PORT=3306,
  MASTER_LOG_FILE=''master2-bin.001'',
  MASTER_LOG_POS=4,
  MASTER_CONNECT_RETRY=10;

The next example shows an operation that is less frequently employed.
It is used when the slave has relay log files that you want it to
execute again for some reason. To do this, the master need not be
reachable. You need only use CHANGE MASTER TO and start the SQL thread
(START SLAVE SQL_THREAD):

CHANGE MASTER TO
  RELAY_LOG_FILE=''slave-relay-bin.006'',
  RELAY_LOG_POS=4025;

URL: https://mariadb.com/kb/en/change-master-to/

', '', 'https://mariadb.com/kb/en/change-master-to/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (186, 'DROP DATABASE', 39, 'Syntax:
DROP {DATABASE | SCHEMA} [IF EXISTS] db_name

DROP DATABASE drops all tables in the database and deletes the
database. Be very careful with this statement! To use DROP DATABASE,
you need the DROP privilege on the database. DROP SCHEMA is a synonym
for DROP DATABASE.

*Important*: When a database is dropped, user privileges on the
database are not automatically dropped. See [HELP GRANT].

IF EXISTS is used to prevent an error from occurring if the database
does not exist.

URL: https://mariadb.com/kb/en/drop-database/

', '', 'https://mariadb.com/kb/en/drop-database/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (187, 'MBREQUAL', 6, 'MBREqual(g1,g2)

Returns 1 or 0 to indicate whether the Minimum Bounding Rectangles of
the two geometries g1 and g2 are the same.

URL: https://mariadb.com/kb/en/mbrequal/

', '', 'https://mariadb.com/kb/en/mbrequal/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (188, 'TIMESTAMP FUNCTION', 31, 'Syntax:
TIMESTAMP(expr), TIMESTAMP(expr1,expr2)

With a single argument, this function returns the date or datetime
expression expr as a datetime value. With two arguments, it adds the
time expression expr2 to the date or datetime expression expr1 and
returns the result as a datetime value.

URL: https://mariadb.com/kb/en/timestamp-function/

', 'MariaDB> SELECT TIMESTAMP(''2003-12-31'');
        -> ''2003-12-31 00:00:00''
MariaDB> SELECT TIMESTAMP(''2003-12-31 12:00:00'',''12:00:00'');
        -> ''2004-01-01 00:00:00''
', 'https://mariadb.com/kb/en/timestamp-function/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (189, 'PROCEDURE ANALYSE', 33, 'Syntax:
ANALYSE([max_elements[,max_memory]])

ANALYSE() examines the result from a query and returns an analysis of
the results that suggests optimal data types for each column that may
help reduce table sizes. To obtain this analysis, append PROCEDURE
ANALYSE to the end of a SELECT statement:

SELECT ... FROM ... WHERE ... PROCEDURE ANALYSE([max_elements,[max_memory]])

For example:

SELECT col1, col2 FROM table1 PROCEDURE ANALYSE(10, 2000);

The results show some statistics for the values returned by the query,
and propose an optimal data type for the columns. This can be helpful
for checking your existing tables, or after importing new data. You may
need to try different settings for the arguments so that PROCEDURE
ANALYSE() does not suggest the ENUM data type when it is not
appropriate.

The arguments are optional and are used as follows:

o max_elements (default 256) is the maximum number of distinct values
  that ANALYSE() notices per column. This is used by ANALYSE() to check
  whether the optimal data type should be of type ENUM; if there are
  more than max_elements distinct values, then ENUM is not a suggested
  type.

o max_memory (default 8192) is the maximum amount of memory that
  ANALYSE() should allocate per column while trying to find all
  distinct values.

URL: https://mariadb.com/kb/en/procedure-analyse/

', '', 'https://mariadb.com/kb/en/procedure-analyse/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (190, 'HELP_VERSION', 9, 'This help information was generated from the MySQL 5.5 Reference Manual
on: 2012-08-25 (revision: 31914)

This information applies to MySQL 5.5 through 5.5.29.
', '', '');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (191, 'CHARACTER_LENGTH', 37, 'Syntax:
CHARACTER_LENGTH(str)

CHARACTER_LENGTH() is a synonym for CHAR_LENGTH().

URL: https://mariadb.com/kb/en/character_length/

', '', 'https://mariadb.com/kb/en/character_length/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (192, 'SHOW GRANTS', 26, 'Syntax:
SHOW GRANTS [FOR user]

This statement lists the GRANT statement or statements that must be
issued to duplicate the privileges that are granted to a MySQL user
account. The account is named using the same format as for the GRANT
statement; for example, ''jeffrey''@''localhost''. If you specify only the
user name part of the account name, a host name part of ''%'' is used.
For additional information about specifying account names, see [HELP
GRANT].

MariaDB> SHOW GRANTS FOR ''root''@''localhost'';
+---------------------------------------------------------------------+
| Grants for root@localhost                                           |
+---------------------------------------------------------------------+
| GRANT ALL PRIVILEGES ON *.* TO ''root''@''localhost'' WITH GRANT OPTION |
+---------------------------------------------------------------------+

To list the privileges granted to the account that you are using to
connect to the server, you can use any of the following statements:

SHOW GRANTS;
SHOW GRANTS FOR CURRENT_USER;
SHOW GRANTS FOR CURRENT_USER();

If SHOW GRANTS FOR CURRENT_USER (or any of the equivalent syntaxes) is
used in DEFINER context, such as within a stored procedure that is
defined with SQL SECURITY DEFINER), the grants displayed are those of
the definer and not the invoker.

URL: https://mariadb.com/kb/en/show-grants/

', '', 'https://mariadb.com/kb/en/show-grants/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (193, 'SHOW PRIVILEGES', 26, 'Syntax:
SHOW PRIVILEGES

SHOW PRIVILEGES shows the list of system privileges that the MySQL
server supports. The exact list of privileges depends on the version of
your server.

URL: https://mariadb.com/kb/en/show-privileges/

', '', 'https://mariadb.com/kb/en/show-privileges/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (194, 'CREATE TABLESPACE', 39, 'Syntax:
CREATE TABLESPACE tablespace_name
    ADD DATAFILE ''file_name''
    USE LOGFILE GROUP logfile_group
    [EXTENT_SIZE [=] extent_size]
    [INITIAL_SIZE [=] initial_size]
    [AUTOEXTEND_SIZE [=] autoextend_size]
    [MAX_SIZE [=] max_size]
    [NODEGROUP [=] nodegroup_id]
    [WAIT]
    [COMMENT [=] comment_text]
    ENGINE [=] engine_name

This statement is used with NDB cluster, which is not supported by MariaDB.', '', 'https://mariadb.com/kb/en/create-tablespace/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (195, 'INSERT FUNCTION', 37, 'Syntax:
INSERT(str,pos,len,newstr)

Returns the string str, with the substring beginning at position pos
and len characters long replaced by the string newstr. Returns the
original string if pos is not within the length of the string. Replaces
the rest of the string from position pos if len is not within the
length of the rest of the string. Returns NULL if any argument is NULL.

URL: https://mariadb.com/kb/en/insert-function/

', 'MariaDB> SELECT INSERT(''Quadratic'', 3, 4, ''What'');
        -> ''QuWhattic''
MariaDB> SELECT INSERT(''Quadratic'', -1, 4, ''What'');
        -> ''Quadratic''
MariaDB> SELECT INSERT(''Quadratic'', 3, 100, ''What'');
        -> ''QuWhat''
', 'https://mariadb.com/kb/en/insert-function/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (196, 'CRC32', 4, 'Syntax:
CRC32(expr)

Computes a cyclic redundancy check value and returns a 32-bit unsigned
value. The result is NULL if the argument is NULL. The argument is
expected to be a string and (if possible) is treated as one if it is
not.

URL: https://mariadb.com/kb/en/crc32/

', 'MariaDB> SELECT CRC32(''MySQL'');
        -> 3259397556
MariaDB> SELECT CRC32(''mysql'');
        -> 2501908538
', 'https://mariadb.com/kb/en/crc32/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (197, 'XOR', 15, 'Syntax:
XOR

Logical XOR. Returns NULL if either operand is NULL. For non-NULL
operands, evaluates to 1 if an odd number of operands is nonzero,
otherwise 0 is returned.

URL: https://mariadb.com/kb/en/xor/

', 'MariaDB> SELECT 1 XOR 1;
        -> 0
MariaDB> SELECT 1 XOR 0;
        -> 1
MariaDB> SELECT 1 XOR NULL;
        -> NULL
MariaDB> SELECT 1 XOR 1 XOR 1;
        -> 1
', 'https://mariadb.com/kb/en/xor/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (198, 'STARTPOINT', 13, 'StartPoint(ls)

Returns the Point that is the start point of the LineString value ls.

URL: https://mariadb.com/kb/en/startpoint/

', 'MariaDB> SET @ls = ''LineString(1 1,2 2,3 3)'';
MariaDB> SELECT AsText(StartPoint(GeomFromText(@ls)));
+---------------------------------------+
| AsText(StartPoint(GeomFromText(@ls))) |
+---------------------------------------+
| POINT(1 1)                            |
+---------------------------------------+
', 'https://mariadb.com/kb/en/startpoint/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (201, 'MPOLYFROMTEXT', 3, 'MPolyFromText(wkt[,srid]), MultiPolygonFromText(wkt[,srid])

Constructs a MULTIPOLYGON value using its WKT representation and SRID.

URL: https://mariadb.com/kb/en/mpolyfromtext/

', '', 'https://mariadb.com/kb/en/mpolyfromtext/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (202, 'MBRINTERSECTS', 6, 'MBRIntersects(g1,g2)

Returns 1 or 0 to indicate whether the Minimum Bounding Rectangles of
the two geometries g1 and g2 intersect.

URL: https://mariadb.com/kb/en/mbrintersects/

', '', 'https://mariadb.com/kb/en/mbrintersects/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (203, 'BIT_OR', 16, 'Syntax:
BIT_OR(expr)

Returns the bitwise OR of all bits in expr. The calculation is
performed with 64-bit (BIGINT) precision.

URL: https://mariadb.com/kb/en/bit_or/

', '', 'https://mariadb.com/kb/en/bit_or/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (199, 'GRANT', 10, 'Syntax:
GRANT
    priv_type [(column_list)]
      [, priv_type [(column_list)]] ...
    ON [object_type] priv_level
    TO user_specification [, user_specification] ...
    [REQUIRE {NONE | ssl_option [[AND] ssl_option] ...}]
    [WITH with_option ...]

GRANT PROXY ON user_specification
    TO user_specification [, user_specification] ...
    [WITH GRANT OPTION]

object_type:
    TABLE
  | FUNCTION
  | PROCEDURE

priv_level:
    *
  | *.*
  | db_name.*
  | db_name.tbl_name
  | tbl_name
  | db_name.routine_name

user_specification:
    user
    [
        IDENTIFIED BY [PASSWORD] ''password''
      | IDENTIFIED WITH auth_plugin [AS ''auth_string'']
    ]

ssl_option:
    SSL
  | X509
  | CIPHER ''cipher''
  | ISSUER ''issuer''
  | SUBJECT ''subject''

with_option:
    GRANT OPTION
  | MAX_QUERIES_PER_HOUR count
  | MAX_UPDATES_PER_HOUR count
  | MAX_CONNECTIONS_PER_HOUR count
  | MAX_USER_CONNECTIONS count

The GRANT statement grants privileges to MySQL user accounts. GRANT
also serves to specify other account characteristics such as use of
secure connections and limits on access to server resources. To use
GRANT, you must have the GRANT OPTION privilege, and you must have the
privileges that you are granting.

Normally, a database administrator first uses CREATE USER to create an
account, then GRANT to define its privileges and characteristics. For
example:

CREATE USER ''jeffrey''@''localhost'' IDENTIFIED BY ''mypass'';
GRANT ALL ON db1.* TO ''jeffrey''@''localhost'';
GRANT SELECT ON db2.invoice TO ''jeffrey''@''localhost'';
GRANT USAGE ON *.* TO ''jeffrey''@''localhost'' WITH MAX_QUERIES_PER_HOUR 90;

However, if an account named in a GRANT statement does not already
exist, GRANT may create it under the conditions described later in the
discussion of the NO_AUTO_CREATE_USER SQL mode.

The REVOKE statement is related to GRANT and enables administrators to
remove account privileges. See [HELP REVOKE].

When successfully executed from the mysql program, GRANT responds with
Query OK, 0 rows affected. To determine what privileges result from the
operation, use SHOW GRANTS. See [HELP SHOW GRANTS].

URL: https://mariadb.com/kb/en/grant/

', '', 'https://mariadb.com/kb/en/grant/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (200, 'DECLARE VARIABLE', 23, 'Syntax:
DECLARE var_name [, var_name] ... type [DEFAULT value]

This statement declares local variables within stored programs. To
provide a default value for a variable, include a DEFAULT clause. The
value can be specified as an expression; it need not be a constant. If
the DEFAULT clause is missing, the initial value is NULL.

Local variables are treated like stored routine parameters with respect
to data type and overflow checking. See [HELP CREATE PROCEDURE].

Variable declarations must appear before cursor or handler
declarations.

Local variable names are not case sensitive. Permissible characters and
quoting rules are the same as for other identifiers, as described in
https://mariadb.com/kb/en/identifier-names/.

The scope of a local variable is the BEGIN ... END block within which
it is declared. The variable can be referred to in blocks nested within
the declaring block, except those blocks that declare a variable with
the same name.

URL: https://mariadb.com/kb/en/declare-variable/

', '', 'https://mariadb.com/kb/en/declare-variable/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (204, 'YEARWEEK', 31, 'Syntax:
YEARWEEK(date), YEARWEEK(date,mode)

Returns year and week for a date. The mode argument works exactly like
the mode argument to WEEK(). The year in the result may be different
from the year in the date argument for the first and the last week of
the year.

URL: https://mariadb.com/kb/en/yearweek/

', 'MariaDB> SELECT YEARWEEK(''1987-01-01'');
        -> 198653
', 'https://mariadb.com/kb/en/yearweek/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (205, 'NOT BETWEEN', 18, 'Syntax:
expr NOT BETWEEN min AND max

This is the same as NOT (expr BETWEEN min AND max).

URL: https://mariadb.com/kb/en/not-between/

', '', 'https://mariadb.com/kb/en/not-between/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (206, 'IS NOT', 18, 'Syntax:
IS NOT boolean_value

Tests a value against a boolean value, where boolean_value can be TRUE,
FALSE, or UNKNOWN.

URL: https://mariadb.com/kb/en/is-not/

', 'MariaDB> SELECT 1 IS NOT UNKNOWN, 0 IS NOT UNKNOWN, NULL IS NOT UNKNOWN;
        -> 1, 1, 0
', 'https://mariadb.com/kb/en/is-not/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (207, 'LOG10', 4, 'Syntax:
LOG10(X)

Returns the base-10 logarithm of X.

URL: https://mariadb.com/kb/en/log10/

', 'MariaDB> SELECT LOG10(2);
        -> 0.30102999566398
MariaDB> SELECT LOG10(100);
        -> 2
MariaDB> SELECT LOG10(-100);
        -> NULL
', 'https://mariadb.com/kb/en/log10/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (208, 'SQRT', 4, 'Syntax:
SQRT(X)

Returns the square root of a nonnegative number X.

URL: https://mariadb.com/kb/en/sqrt/

', 'MariaDB> SELECT SQRT(4);
        -> 2
MariaDB> SELECT SQRT(20);
        -> 4.4721359549996
MariaDB> SELECT SQRT(-16);
        -> NULL
', 'https://mariadb.com/kb/en/sqrt/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (209, 'DECIMAL', 22, 'DECIMAL[(M[,D])] [UNSIGNED] [ZEROFILL]

A packed "exact" fixed-point number. M is the total number of digits
(the precision) and D is the number of digits after the decimal point
(the scale). The decimal point and (for negative numbers) the "-" sign
are not counted in M. If D is 0, values have no decimal point or
fractional part. The maximum number of digits (M) for DECIMAL is 65.
The maximum number of supported decimals (D) is 30. If D is omitted,
the default is 0. If M is omitted, the default is 10.

UNSIGNED, if specified, disallows negative values.

All basic calculations (+, -, *, /) with DECIMAL columns are done with
a precision of 65 digits.

URL: https://mariadb.com/kb/en/decimal/

', '', 'https://mariadb.com/kb/en/decimal/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (210, 'CREATE INDEX', 39, 'Syntax:
CREATE [ONLINE|OFFLINE] [UNIQUE|FULLTEXT|SPATIAL] INDEX index_name
    [index_type]
    ON tbl_name (index_col_name,...)
    [index_option] ...

index_col_name:
    col_name [(length)] [ASC | DESC]

index_type:
    USING {BTREE | HASH}

index_option:
    KEY_BLOCK_SIZE [=] value
  | index_type
  | WITH PARSER parser_name
  | COMMENT ''string''

CREATE INDEX is mapped to an ALTER TABLE statement to create indexes.
See [HELP ALTER TABLE]. CREATE INDEX cannot be used to create a PRIMARY
KEY; use ALTER TABLE instead. For more information about indexes, see
https://mariadb.com/kb/en/optimization-and-indexes/.

URL: https://mariadb.com/kb/en/create-index/

', '', 'https://mariadb.com/kb/en/create-index/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (211, 'CREATE FUNCTION', 39, 'The CREATE FUNCTION statement is used to create stored functions and
user-defined functions (UDFs):

o For information about creating stored functions, see [HELP CREATE
  PROCEDURE].

o For information about creating user-defined functions, see [HELP
  CREATE FUNCTION UDF].

URL: https://mariadb.com/kb/en/create-function/

', '', 'https://mariadb.com/kb/en/create-function/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (213, 'GEOMETRYN', 25, 'GeometryN(gc,N)

Returns the N-th geometry in the GeometryCollection value gc.
Geometries are numbered beginning with 1.

URL: https://mariadb.com/kb/en/geometryn/

', 'MariaDB> SET @gc = ''GeometryCollection(Point(1 1),LineString(2 2, 3 3))'';
MariaDB> SELECT AsText(GeometryN(GeomFromText(@gc),1));
+----------------------------------------+
| AsText(GeometryN(GeomFromText(@gc),1)) |
+----------------------------------------+
| POINT(1 1)                             |
+----------------------------------------+
', 'https://mariadb.com/kb/en/geometryn/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (214, '<<', 19, 'Syntax:
<<

Shifts a longlong (BIGINT) number to the left.

URL: https://mariadb.com/kb/en/shift-left/

', 'MariaDB> SELECT 1 << 2;
        -> 4
', 'https://mariadb.com/kb/en/shift-left/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (212, 'ALTER DATABASE', 39, 'Syntax:
ALTER {DATABASE | SCHEMA} [db_name]
    alter_specification ...
ALTER {DATABASE | SCHEMA} db_name
    UPGRADE DATA DIRECTORY NAME

alter_specification:
    [DEFAULT] CHARACTER SET [=] charset_name
  | [DEFAULT] COLLATE [=] collation_name

ALTER DATABASE enables you to change the overall characteristics of a
database. These characteristics are stored in the db.opt file in the
database directory. To use ALTER DATABASE, you need the ALTER privilege
on the database. ALTER SCHEMA is a synonym for ALTER DATABASE.

The database name can be omitted from the first syntax, in which case
the statement applies to the default database.

National Language Characteristics

The CHARACTER SET clause changes the default database character set.
The COLLATE clause changes the default database collation.
https://mariadb.com/kb/en/data-types-character-sets-and-collations/, discusses
character set and collation names.

You can see what character sets and collations are available using,
respectively, the SHOW CHARACTER SET and SHOW COLLATION statements. See
[HELP SHOW CHARACTER SET], and [HELP SHOW COLLATION], for more
information.

If you change the default character set or collation for a database,
stored routines that use the database defaults must be dropped and
recreated so that they use the new defaults. (In a stored routine,
variables with character data types use the database defaults if the
character set or collation are not specified explicitly. See [HELP
CREATE PROCEDURE].)

Upgrading from Versions Older than MySQL 5.1

The syntax that includes the UPGRADE DATA DIRECTORY NAME clause updates
the name of the directory associated with the database to use the
encoding implemented in MySQL 5.1 for mapping database names to
database directory names (see
https://mariadb.com/kb/en/identifier-to-file-name-mapping/). This
clause is for use under these conditions:

o It is intended when upgrading MySQL to 5.1 or later from older
  versions.

o It is intended to update a database directory name to the current
  encoding format if the name contains special characters that need
  encoding.

o The statement is used by mysqlcheck (as invoked by mysql_upgrade).

For example, if a database in MySQL 5.0 has the name a-b-c, the name
contains instances of the - (dash) character. In MySQL 5.0, the
database directory is also named a-b-c, which is not necessarily safe
for all file systems. In MySQL 5.1 and later, the same database name is
encoded as a@002db@002dc to produce a file system-neutral directory
name.

When a MySQL installation is upgraded to MySQL 5.1 or later from an
older version,the server displays a name such as a-b-c (which is in the
old format) as #mysql50#a-b-c, and you must refer to the name using the
#mysql50# prefix. Use UPGRADE DATA DIRECTORY NAME in this case to
explicitly tell the server to re-encode the database directory name to
the current encoding format:

ALTER DATABASE `#mysql50#a-b-c` UPGRADE DATA DIRECTORY NAME;

After executing this statement, you can refer to the database as a-b-c
without the special #mysql50# prefix.

URL: https://mariadb.com/kb/en/alter-database/

', '', 'https://mariadb.com/kb/en/alter-database/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (215, 'SHOW TABLE STATUS', 26, 'Syntax:
SHOW TABLE STATUS [{FROM | IN} db_name]
    [LIKE ''pattern'' | WHERE expr]

SHOW TABLE STATUS works likes SHOW TABLES, but provides a lot of
information about each non-TEMPORARY table. You can also get this list
using the mysqlshow --status db_name command. The LIKE clause, if
present, indicates which table names to match. The WHERE clause can be
given to select rows using more general conditions, as discussed in
https://mariadb.com/kb/en/extended-show/.

URL: https://mariadb.com/kb/en/show-table-status/

', '', 'https://mariadb.com/kb/en/show-table-status/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (216, 'MD5', 12, 'Syntax:
MD5(str)

Calculates an MD5 128-bit checksum for the string. The value is
returned as a string of 32 hex digits, or NULL if the argument was
NULL. The return value can, for example, be used as a hash key. See the
notes at the beginning of this section about storing hash values
efficiently.

As of MySQL 5.5.3, the return value is a nonbinary string in the
connection character set. Before 5.5.3, the return value is a binary
string; see the notes at the beginning of this section about using the
value as a nonbinary string.

URL: https://mariadb.com/kb/en/md5/

', 'MariaDB> SELECT MD5(''testing'');
        -> ''ae2b1fca515949e5d54fb22b8ed95575''
', 'https://mariadb.com/kb/en/md5/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (217, '<', 18, 'Syntax:
<

Less than:

URL: https://mariadb.com/kb/en/less-than/

', 'MariaDB> SELECT 2 < 2;
        -> 0
', 'https://mariadb.com/kb/en/less-than/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (218, 'UNIX_TIMESTAMP', 31, 'Syntax:
UNIX_TIMESTAMP(), UNIX_TIMESTAMP(date)

If called with no argument, returns a Unix timestamp (seconds since
''1970-01-01 00:00:00'' UTC) as an unsigned integer. If UNIX_TIMESTAMP()
is called with a date argument, it returns the value of the argument as
seconds since ''1970-01-01 00:00:00'' UTC. date may be a DATE string, a
DATETIME string, a TIMESTAMP, or a number in the format YYMMDD or
YYYYMMDD. The server interprets date as a value in the current time
zone and converts it to an internal value in UTC. Clients can set their
time zone as described in
https://mariadb.com/kb/en/time-zones/.

URL: https://mariadb.com/kb/en/unix_timestamp/

', 'MariaDB> SELECT UNIX_TIMESTAMP();
        -> 1196440210
MariaDB> SELECT UNIX_TIMESTAMP(''2007-11-30 10:30:19'');
        -> 1196440219
', 'https://mariadb.com/kb/en/unix_timestamp/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (219, 'DAYOFMONTH', 31, 'Syntax:
DAYOFMONTH(date)

Returns the day of the month for date, in the range 1 to 31, or 0 for
dates such as ''0000-00-00'' or ''2008-00-00'' that have a zero day part.

URL: https://mariadb.com/kb/en/dayofmonth/

', 'MariaDB> SELECT DAYOFMONTH(''2007-02-03'');
        -> 3
', 'https://mariadb.com/kb/en/dayofmonth/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (220, 'ASCII', 37, 'Syntax:
ASCII(str)

Returns the numeric value of the leftmost character of the string str.
Returns 0 if str is the empty string. Returns NULL if str is NULL.
ASCII() works for 8-bit characters.

URL: https://mariadb.com/kb/en/ascii/

', 'MariaDB> SELECT ASCII(''2'');
        -> 50
MariaDB> SELECT ASCII(2);
        -> 50
MariaDB> SELECT ASCII(''dx'');
        -> 100
', 'https://mariadb.com/kb/en/ascii/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (221, 'DIV', 4, 'Syntax:
DIV

Integer division. Similar to FLOOR(), but is safe with BIGINT values.

As of MySQL 5.5.3, if either operand has a noninteger type, the
operands are converted to DECIMAL and divided using DECIMAL arithmetic
before converting the result to BIGINT. If the result exceeds BIGINT
range, an error occurs. Before MySQL 5.5.3, incorrect results may occur
for noninteger operands that exceed BIGINT range.

URL: https://mariadb.com/kb/en/div/

', 'MariaDB> SELECT 5 DIV 2;
        -> 2
', 'https://mariadb.com/kb/en/div/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (224, 'GEOMETRY', 34, 'MySQL provides a standard way of creating spatial columns for geometry
types, for example, with CREATE TABLE or ALTER TABLE. Currently,
spatial columns are supported for MyISAM, Aria, InnoDB and ARCHIVE
tables. See also the annotations about spatial indexes under [HELP
SPATIAL].

URL: https://mariadb.com/kb/en/gis-functionality/

', 'CREATE TABLE geom (g GEOMETRY);
', 'https://mariadb.com/kb/en/gis-functionality/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (225, 'NUMPOINTS', 13, 'NumPoints(ls)

Returns the number of Point objects in the LineString value ls.

URL: https://mariadb.com/kb/en/numpoints/

', 'MariaDB> SET @ls = ''LineString(1 1,2 2,3 3)'';
MariaDB> SELECT NumPoints(GeomFromText(@ls));
+------------------------------+
| NumPoints(GeomFromText(@ls)) |
+------------------------------+
|                            3 |
+------------------------------+
', 'https://mariadb.com/kb/en/numpoints/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (222, 'RENAME USER', 10, 'Syntax:
RENAME USER old_user TO new_user
    [, old_user TO new_user] ...

The RENAME USER statement renames existing MySQL accounts. To use it,
you must have the global CREATE USER privilege or the UPDATE privilege
for the mysql database. An error occurs if any old account does not
exist or any new account exists. Each account name uses the format
described in https://mariadb.com/kb/en/create-user/#account-names.
For example:

RENAME USER ''jeffrey''@''localhost'' TO ''jeff''@''127.0.0.1'';

If you specify only the user name part of the account name, a host name
part of ''%'' is used.

RENAME USER causes the privileges held by the old user to be those held
by the new user. However, RENAME USER does not automatically drop or
invalidate databases or objects within them that the old user created.
This includes stored programs or views for which the DEFINER attribute
names the old user. Attempts to access such objects may produce an
error if they execute in definer security context. (For information
about security context, see
https://mariadb.com/kb/en/stored-routine-privileges/.)

The privilege changes take effect as indicated in
http://dev.mysql.com/doc/refman/5.5/en/privilege-changes.html.

URL: https://mariadb.com/kb/en/rename-user/

', '', 'https://mariadb.com/kb/en/rename-user/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (223, 'SHOW SLAVE STATUS', 26, 'Syntax:
SHOW SLAVE STATUS

This statement provides status information on essential parameters of
the slave threads. It requires either the SUPER or REPLICATION CLIENT
privilege.

If you issue this statement using the mysql client, you can use a \\G
statement terminator rather than a semicolon to obtain a more readable
vertical layout:

MariaDB> SHOW SLAVE STATUS\\G
*************************** 1. row ***************************
               Slave_IO_State: Waiting for master to send event
                  Master_Host: localhost
                  Master_User: root
                  Master_Port: 3306
                Connect_Retry: 3
              Master_Log_File: gbichot-bin.005
          Read_Master_Log_Pos: 79
               Relay_Log_File: gbichot-relay-bin.005
                Relay_Log_Pos: 548
        Relay_Master_Log_File: gbichot-bin.005
             Slave_IO_Running: Yes
            Slave_SQL_Running: Yes
              Replicate_Do_DB:
          Replicate_Ignore_DB:
           Replicate_Do_Table:
       Replicate_Ignore_Table:
      Replicate_Wild_Do_Table:
  Replicate_Wild_Ignore_Table:
                   Last_Errno: 0
                   Last_Error:
                 Skip_Counter: 0
          Exec_Master_Log_Pos: 79
              Relay_Log_Space: 552
              Until_Condition: None
               Until_Log_File:
                Until_Log_Pos: 0
           Master_SSL_Allowed: No
           Master_SSL_CA_File:
           Master_SSL_CA_Path:
              Master_SSL_Cert:
            Master_SSL_Cipher:
               Master_SSL_Key:
        Seconds_Behind_Master: 8
Master_SSL_Verify_Server_Cert: No
                Last_IO_Errno: 0
                Last_IO_Error:
               Last_SQL_Errno: 0
               Last_SQL_Error:
  Replicate_Ignore_Server_Ids: 0
             Master_Server_Id: 1

URL: https://mariadb.com/kb/en/show-slave-status/

', '', 'https://mariadb.com/kb/en/show-slave-status/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (226, 'ALTER LOGFILE GROUP', 39, 'Syntax:
ALTER LOGFILE GROUP logfile_group
    ADD UNDOFILE ''file_name''
    [INITIAL_SIZE [=] size]
    [WAIT]
    ENGINE [=] engine_name

This statement is used with NDB cluster, which is not supported by MariaDB.
', '', 'https://mariadb.com/kb/en/alter-logfile-group/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (227, '&', 19, 'Syntax:
&

Bitwise AND:

URL: https://mariadb.com/kb/en/bitwise_and/

', 'MariaDB> SELECT 29 & 15;
        -> 13
', 'https://mariadb.com/kb/en/bitwise_and/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (228, 'LOCALTIMESTAMP', 31, 'Syntax:
LOCALTIMESTAMP, LOCALTIMESTAMP()

LOCALTIMESTAMP and LOCALTIMESTAMP() are synonyms for NOW().

URL: https://mariadb.com/kb/en/localtimestamp/

', '', 'https://mariadb.com/kb/en/localtimestamp/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (229, 'ASSIGN-EQUAL', 15, 'Syntax:
=

This operator is used to perform value assignments in two cases,
described in the next two paragraphs.

Within a SET statement, = is treated as an assignment operator that
causes the user variable on the left hand side of the operator to take
on the value to its right. (In other words, when used in a SET
statement, = is treated identically to :=.) The value on the right hand
side may be a literal value, another variable storing a value, or any
legal expression that yields a scalar value, including the result of a
query (provided that this value is a scalar value). You can perform
multiple assignments in the same SET statement.

In the SET clause of an UPDATE statement, = also acts as an assignment
operator; in this case, however, it causes the column named on the left
hand side of the operator to assume the value given to the right,
provided any WHERE conditions that are part of the UPDATE are met. You
can make multiple assignments in the same SET clause of an UPDATE
statement.

In any other context, = is treated as a comparison operator.

URL: https://mariadb.com/kb/en/assignment-operators-assignment-operator/

', 'MariaDB> SELECT @var1, @var2;
        -> NULL, NULL
MariaDB> SELECT @var1 := 1, @var2;
        -> 1, NULL
MariaDB> SELECT @var1, @var2;
        -> 1, NULL
MariaDB> SELECT @var1, @var2 := @var1;
        -> 1, 1
MariaDB> SELECT @var1, @var2;
        -> 1, 1
', 'https://mariadb.com/kb/en/assignment-operators-assignment-operator/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (231, 'ADDDATE', 31, 'Syntax:
ADDDATE(date,INTERVAL expr unit), ADDDATE(expr,days)

When invoked with the INTERVAL form of the second argument, ADDDATE()
is a synonym for DATE_ADD(). The related function SUBDATE() is a
synonym for DATE_SUB(). For information on the INTERVAL unit argument,
see the discussion for DATE_ADD().

MariaDB> SELECT DATE_ADD(''2008-01-02'', INTERVAL 31 DAY);
        -> ''2008-02-02''
MariaDB> SELECT ADDDATE(''2008-01-02'', INTERVAL 31 DAY);
        -> ''2008-02-02''

When invoked with the days form of the second argument, MySQL treats it
as an integer number of days to be added to expr.

URL: https://mariadb.com/kb/en/adddate/

', 'MariaDB> SELECT ADDDATE(''2008-01-02'', 31);
        -> ''2008-02-02''
', 'https://mariadb.com/kb/en/adddate/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (234, 'SMALLINT', 22, 'SMALLINT[(M)] [UNSIGNED] [ZEROFILL]

A small integer. The signed range is -32768 to 32767. The unsigned
range is 0 to 65535.

URL: https://mariadb.com/kb/en/smallint/

', '', 'https://mariadb.com/kb/en/smallint/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (235, 'DOUBLE PRECISION', 22, 'DOUBLE PRECISION[(M,D)] [UNSIGNED] [ZEROFILL], REAL[(M,D)] [UNSIGNED]
[ZEROFILL]

These types are synonyms for DOUBLE. Exception: If the REAL_AS_FLOAT
SQL mode is enabled, REAL is a synonym for FLOAT rather than DOUBLE.

URL: https://mariadb.com/kb/en/double-precision/

', '', 'https://mariadb.com/kb/en/double-precision/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (236, 'ORD', 37, 'Syntax:
ORD(str)

If the leftmost character of the string str is a multi-byte character,
returns the code for that character, calculated from the numeric values
of its constituent bytes using this formula:

  (1st byte code)
+ (2nd byte code * 256)
+ (3rd byte code * 2562) ...

If the leftmost character is not a multi-byte character, ORD() returns
the same value as the ASCII() function.

URL: https://mariadb.com/kb/en/ord/

', 'MariaDB> SELECT ORD(''2'');
        -> 50
', 'https://mariadb.com/kb/en/ord/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (237, 'DEALLOCATE PREPARE', 8, 'Syntax:
{DEALLOCATE | DROP} PREPARE stmt_name

To deallocate a prepared statement produced with PREPARE, use a
DEALLOCATE PREPARE statement that refers to the prepared statement
name. Attempting to execute a prepared statement after deallocating it
results in an error.

URL: https://mariadb.com/kb/en/deallocate-drop-prepared-statement/

', '', 'https://mariadb.com/kb/en/deallocate-drop-prepared-statement/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (230, 'CONVERT', 37, 'Syntax:
CONVERT(expr,type), CONVERT(expr USING transcoding_name)

The CONVERT() and CAST() functions take an expression of any type and
produce a result value of a specified type.

The type for the result can be one of the following values:

o BINARY[(N)]

o CHAR[(N)]

o DATE

o DATETIME

o DECIMAL[(M[,D])]

o SIGNED [INTEGER]

o TIME

o UNSIGNED [INTEGER]

BINARY produces a string with the BINARY data type. See
https://mariadb.com/kb/en/binary/ for a
description of how this affects comparisons. If the optional length N
is given, BINARY(N) causes the cast to use no more than N bytes of the
argument. Values shorter than N bytes are padded with 0x00 bytes to a
length of N.

CHAR(N) causes the cast to use no more than N characters of the
argument.

CAST() and CONVERT(... USING ...) are standard SQL syntax. The
non-USING form of CONVERT() is ODBC syntax.

CONVERT() with USING is used to convert data between different
character sets. In MySQL, transcoding names are the same as the
corresponding character set names. For example, this statement converts
the string ''abc'' in the default character set to the corresponding
string in the utf8 character set:

SELECT CONVERT(''abc'' USING utf8);

URL: https://mariadb.com/kb/en/convert/

', 'SELECT enum_col FROM tbl_name ORDER BY CAST(enum_col AS CHAR);
', 'https://mariadb.com/kb/en/convert/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (232, 'REPEAT LOOP', 23, 'Syntax:
[begin_label:] REPEAT
    statement_list
UNTIL search_condition
END REPEAT [end_label]

The statement list within a REPEAT statement is repeated until the
search_condition expression is true. Thus, a REPEAT always enters the
loop at least once. statement_list consists of one or more statements,
each terminated by a semicolon (;) statement delimiter.

A REPEAT statement can be labeled. For the rules regarding label use,
see [HELP labels].

URL: https://mariadb.com/kb/en/repeat-loop/

', 'MariaDB> delimiter //

MariaDB> CREATE PROCEDURE dorepeat(p1 INT)
    -> BEGIN
    ->   SET @x = 0;
    ->   REPEAT
    ->     SET @x = @x + 1;
    ->   UNTIL @x > p1 END REPEAT;
    -> END
    -> //
Query OK, 0 rows affected (0.00 sec)

MariaDB> CALL dorepeat(1000)//
Query OK, 0 rows affected (0.00 sec)

MariaDB> SELECT @x//
+------+
| @x   |
+------+
| 1001 |
+------+
1 row in set (0.00 sec)
', 'https://mariadb.com/kb/en/repeat-loop/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (233, 'ALTER FUNCTION', 39, 'Syntax:
ALTER FUNCTION func_name [characteristic ...]

characteristic:
    COMMENT ''string''
  | LANGUAGE SQL
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }

This statement can be used to change the characteristics of a stored
function. More than one change may be specified in an ALTER FUNCTION
statement. However, you cannot change the parameters or body of a
stored function using this statement; to make such changes, you must
drop and re-create the function using DROP FUNCTION and CREATE
FUNCTION.

You must have the ALTER ROUTINE privilege for the function. (That
privilege is granted automatically to the function creator.) If binary
logging is enabled, the ALTER FUNCTION statement might also require the
SUPER privilege, as described in
https://mariadb.com/kb/en/binary-logging-of-stored-routines/.

URL: https://mariadb.com/kb/en/alter-function/

', '', 'https://mariadb.com/kb/en/alter-function/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (238, 'ENVELOPE', 36, 'Envelope(g)

Returns the Minimum Bounding Rectangle (MBR) for the geometry value g.
The result is returned as a Polygon value.

The polygon is defined by the corner points of the bounding box:

POLYGON((MINX MINY, MAXX MINY, MAXX MAXY, MINX MAXY, MINX MINY))

URL: https://mariadb.com/kb/en/envelope/

', 'MariaDB> SELECT AsText(Envelope(GeomFromText(''LineString(1 1,2 2)'')));
+-------------------------------------------------------+
| AsText(Envelope(GeomFromText(''LineString(1 1,2 2)''))) |
+-------------------------------------------------------+
| POLYGON((1 1,2 1,2 2,1 2,1 1))                        |
+-------------------------------------------------------+
', 'https://mariadb.com/kb/en/envelope/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (239, 'IS_FREE_LOCK', 14, 'Syntax:
IS_FREE_LOCK(str)

Checks whether the lock named str is free to use (that is, not locked).
Returns 1 if the lock is free (no one is using the lock), 0 if the lock
is in use, and NULL if an error occurs (such as an incorrect argument).

URL: https://mariadb.com/kb/en/is_free_lock/

', '', 'https://mariadb.com/kb/en/is_free_lock/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (240, 'TOUCHES', 30, 'Touches(g1,g2)

Returns 1 or 0 to indicate whether g1 spatially touches g2. Two
geometries spatially touch if the interiors of the geometries do not
intersect, but the boundary of one of the geometries intersects either
the boundary or the interior of the other.

URL: https://mariadb.com/kb/en/touches/

', '', 'https://mariadb.com/kb/en/touches/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (241, 'INET_ATON', 14, 'Syntax:
INET_ATON(expr)

Given the dotted-quad representation of an IPv4 network address as a
string, returns an integer that represents the numeric value of the
address in network byte order (big endian). INET_ATON() returns NULL if
it does not understand its argument.

URL: https://mariadb.com/kb/en/inet_aton/

', 'MariaDB> SELECT INET_ATON(''10.0.5.9'');
        -> 167773449
', 'https://mariadb.com/kb/en/inet_aton/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (242, 'UNCOMPRESS', 12, 'Syntax:
UNCOMPRESS(string_to_uncompress)

Uncompresses a string compressed by the COMPRESS() function. If the
argument is not a compressed value, the result is NULL. This function
requires MySQL to have been compiled with a compression library such as
zlib. Otherwise, the return value is always NULL.

URL: https://mariadb.com/kb/en/uncompress/

', 'MariaDB> SELECT UNCOMPRESS(COMPRESS(''any string''));
        -> ''any string''
MariaDB> SELECT UNCOMPRESS(''any string'');
        -> NULL
', 'https://mariadb.com/kb/en/uncompress/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (243, 'AUTO_INCREMENT', 22, 'The AUTO_INCREMENT attribute can be used to generate a unique identity
for new rows:

URL: https://mariadb.com/kb/en/auto_increment/

', 'CREATE TABLE animals (
     id MEDIUMINT NOT NULL AUTO_INCREMENT,
     name CHAR(30) NOT NULL,
     PRIMARY KEY (id)
);

INSERT INTO animals (name) VALUES
    (''dog''),(''cat''),(''penguin''),
    (''lax''),(''whale''),(''ostrich'');

SELECT * FROM animals;
', 'https://mariadb.com/kb/en/auto_increment/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (244, 'ISSIMPLE', 36, 'IsSimple(g)

Currently, this function is a placeholder and should not be used. If
implemented, its behavior will be as described in the next paragraph.

Returns 1 if the geometry value g has no anomalous geometric points,
such as self-intersection or self-tangency. IsSimple() returns 0 if the
argument is not simple, and -1 if it is NULL.

The description of each instantiable geometric class given earlier in
the chapter includes the specific conditions that cause an instance of
that class to be classified as not simple. (See [HELP Geometry
hierarchy].)

URL: https://mariadb.com/kb/en/issimple/

', '', 'https://mariadb.com/kb/en/issimple/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (245, '- BINARY', 4, 'Syntax:
-

Subtraction:

URL: https://mariadb.com/kb/en/subtraction-operator-/

', 'MariaDB> SELECT 3-5;
        -> -2
', 'https://mariadb.com/kb/en/subtraction-operator-/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (246, 'GEOMCOLLFROMTEXT', 3, 'GeomCollFromText(wkt[,srid]), GeometryCollectionFromText(wkt[,srid])

Constructs a GEOMETRYCOLLECTION value using its WKT representation and
SRID.

URL: https://mariadb.com/kb/en/geomcollfromtext/

', '', 'https://mariadb.com/kb/en/geomcollfromtext/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (247, 'WKT DEFINITION', 3, 'The Well-Known Text (WKT) representation of Geometry is designed to
exchange geometry data in ASCII form. For a Backus-Naur grammar that
specifies the formal production rules for writing WKT values, see the
OpenGIS specification document referenced in
https://mariadb.com/kb/en/gis-resources/.

URL: https://mariadb.com/kb/en/wkt-definition/

', '', 'https://mariadb.com/kb/en/wkt-definition/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (248, 'CURRENT_TIME', 31, 'Syntax:
CURRENT_TIME, CURRENT_TIME()

CURRENT_TIME and CURRENT_TIME() are synonyms for CURTIME().

URL: https://mariadb.com/kb/en/current_time/

', '', 'https://mariadb.com/kb/en/current_time/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (249, 'REVOKE', 10, 'Syntax:
REVOKE
    priv_type [(column_list)]
      [, priv_type [(column_list)]] ...
    ON [object_type] priv_level
    FROM user [, user] ...

REVOKE ALL PRIVILEGES, GRANT OPTION
    FROM user [, user] ...

REVOKE PROXY ON user
    FROM user [, user] ...

The REVOKE statement enables system administrators to revoke privileges
from MySQL accounts. Each account name uses the format described in
https://mariadb.com/kb/en/create-user#account-names. For example:

REVOKE INSERT ON *.* FROM ''jeffrey''@''localhost'';

If you specify only the user name part of the account name, a host name
part of ''%'' is used.

For details on the levels at which privileges exist, the permissible
priv_type and priv_level values, and the syntax for specifying users
and passwords, see [HELP GRANT]

To use the first REVOKE syntax, you must have the GRANT OPTION
privilege, and you must have the privileges that you are revoking.

To revoke all privileges, use the second syntax, which drops all
global, database, table, column, and routine privileges for the named
user or users:

REVOKE ALL PRIVILEGES, GRANT OPTION FROM user [, user] ...

To use this REVOKE syntax, you must have the global CREATE USER
privilege or the UPDATE privilege for the mysql database.

URL: https://mariadb.com/kb/en/revoke/

', '', 'https://mariadb.com/kb/en/revoke/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (250, 'LAST_INSERT_ID', 17, 'Syntax:
LAST_INSERT_ID(), LAST_INSERT_ID(expr)

LAST_INSERT_ID() (with no argument) returns a BIGINT (64-bit) value
representing the first automatically generated value successfully
inserted for an AUTO_INCREMENT column as a result of the most recently
executed INSERT statement. The value of LAST_INSERT_ID() remains
unchanged if no rows are successfully inserted.

For example, after inserting a row that generates an AUTO_INCREMENT
value, you can get the value like this:

MariaDB> SELECT LAST_INSERT_ID();
        -> 195

The currently executing statement does not affect the value of
LAST_INSERT_ID(). Suppose that you generate an AUTO_INCREMENT value
with one statement, and then refer to LAST_INSERT_ID() in a
multiple-row INSERT statement that inserts rows into a table with its
own AUTO_INCREMENT column. The value of LAST_INSERT_ID() will remain
stable in the second statement; its value for the second and later rows
is not affected by the earlier row insertions. (However, if you mix
references to LAST_INSERT_ID() and LAST_INSERT_ID(expr), the effect is
undefined.)

If the previous statement returned an error, the value of
LAST_INSERT_ID() is undefined. For transactional tables, if the
statement is rolled back due to an error, the value of LAST_INSERT_ID()
is left undefined. For manual ROLLBACK, the value of LAST_INSERT_ID()
is not restored to that before the transaction; it remains as it was at
the point of the ROLLBACK.

Within the body of a stored routine (procedure or function) or a
trigger, the value of LAST_INSERT_ID() changes the same way as for
statements executed outside the body of these kinds of objects. The
effect of a stored routine or trigger upon the value of
LAST_INSERT_ID() that is seen by following statements depends on the
kind of routine:

o If a stored procedure executes statements that change the value of
  LAST_INSERT_ID(), the changed value is seen by statements that follow
  the procedure call.

o For stored functions and triggers that change the value, the value is
  restored when the function or trigger ends, so following statements
  will not see a changed value.

URL: https://mariadb.com/kb/en/last_insert_id/

', '', 'https://mariadb.com/kb/en/last_insert_id/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (251, 'LAST_DAY', 31, 'Syntax:
LAST_DAY(date)

Takes a date or datetime value and returns the corresponding value for
the last day of the month. Returns NULL if the argument is invalid.

URL: https://mariadb.com/kb/en/last_day/

', 'MariaDB> SELECT LAST_DAY(''2003-02-05'');
        -> ''2003-02-28''
MariaDB> SELECT LAST_DAY(''2004-02-05'');
        -> ''2004-02-29''
MariaDB> SELECT LAST_DAY(''2004-01-01 01:01:01'');
        -> ''2004-01-31''
MariaDB> SELECT LAST_DAY(''2003-03-32'');
        -> NULL
', 'https://mariadb.com/kb/en/last_day/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (252, 'MEDIUMINT', 22, 'MEDIUMINT[(M)] [UNSIGNED] [ZEROFILL]

A medium-sized integer. The signed range is -8388608 to 8388607. The
unsigned range is 0 to 16777215.

URL: https://mariadb.com/kb/en/mediumint/

', '', 'https://mariadb.com/kb/en/mediumint/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (253, 'FLOOR', 4, 'Syntax:
FLOOR(X)

Returns the largest integer value not greater than X.

URL: https://mariadb.com/kb/en/floor/

', 'MariaDB> SELECT FLOOR(1.23);
        -> 1
MariaDB> SELECT FLOOR(-1.23);
        -> -2
', 'https://mariadb.com/kb/en/floor/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (254, 'RTRIM', 37, 'Syntax:
RTRIM(str)

Returns the string str with trailing space characters removed.

URL: https://mariadb.com/kb/en/rtrim/

', 'MariaDB> SELECT RTRIM(''barbar   '');
        -> ''barbar''
', 'https://mariadb.com/kb/en/rtrim/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (256, 'DEGREES', 4, 'Syntax:
DEGREES(X)

Returns the argument X, converted from radians to degrees.

URL: https://mariadb.com/kb/en/degrees/

', 'MariaDB> SELECT DEGREES(PI());
        -> 180
MariaDB> SELECT DEGREES(PI() / 2);
        -> 90
', 'https://mariadb.com/kb/en/degrees/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (258, 'UNHEX', 37, 'Syntax:

UNHEX(str)

For a string argument str, UNHEX(str) performs the inverse operation of
HEX(str). That is, it interprets each pair of characters in the
argument as a hexadecimal number and converts it to the character
represented by the number. The return value is a binary string.

URL: https://mariadb.com/kb/en/unhex/

', 'MariaDB> SELECT UNHEX(''4D7953514C'');
        -> ''MySQL''
MariaDB> SELECT 0x4D7953514C;
        -> ''MySQL''
MariaDB> SELECT UNHEX(HEX(''string''));
        -> ''string''
MariaDB> SELECT HEX(UNHEX(''1267''));
        -> ''1267''
', 'https://mariadb.com/kb/en/unhex/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (259, '- UNARY', 4, 'Syntax:
-

Unary minus. This operator changes the sign of the operand.

URL: https://mariadb.com/kb/en/subtraction-operator-/

', 'MariaDB> SELECT - 2;
        -> -2
', 'https://mariadb.com/kb/en/subtraction-operator-/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (260, 'STD', 16, 'Syntax:
STD(expr)

Returns the population standard deviation of expr. This is an extension
to standard SQL. The standard SQL function STDDEV_POP() can be used
instead.

This function returns NULL if there were no matching rows.

URL: https://mariadb.com/kb/en/std/

', '', 'https://mariadb.com/kb/en/std/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (261, 'COS', 4, 'Syntax:
COS(X)

Returns the cosine of X, where X is given in radians.

URL: https://mariadb.com/kb/en/cos/

', 'MariaDB> SELECT COS(PI());
        -> -1
', 'https://mariadb.com/kb/en/cos/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (262, 'DATE FUNCTION', 31, 'Syntax:
DATE(expr)

Extracts the date part of the date or datetime expression expr.

URL: https://mariadb.com/kb/en/date-function/

', 'MariaDB> SELECT DATE(''2003-12-31 01:02:03'');
        -> ''2003-12-31''
', 'https://mariadb.com/kb/en/date-function/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (263, 'DROP TRIGGER', 39, 'Syntax:
DROP TRIGGER [IF EXISTS] [schema_name.]trigger_name

This statement drops a trigger. The schema (database) name is optional.
If the schema is omitted, the trigger is dropped from the default
schema. DROP TRIGGER requires the TRIGGER privilege for the table
associated with the trigger.

Use IF EXISTS to prevent an error from occurring for a trigger that
does not exist. A NOTE is generated for a nonexistent trigger when
using IF EXISTS. See [HELP SHOW WARNINGS].

Triggers for a table are also dropped if you drop the table.

URL: https://mariadb.com/kb/en/drop-trigger/

', '', 'https://mariadb.com/kb/en/drop-trigger/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (255, 'EXPLAIN', 28, 'Syntax:
EXPLAIN [explain_type] SELECT select_options

explain_type:
    EXTENDED
  | PARTITIONS

Or:

EXPLAIN tbl_name

The EXPLAIN statement can be used either as a way to obtain information
about how MySQL executes a statement, or as a synonym for DESCRIBE:

o When you precede a SELECT statement with the keyword EXPLAIN, MySQL
  displays information from the optimizer about the query execution
  plan. That is, MySQL explains how it would process the statement,
  including information about how tables are joined and in which order.
  EXPLAIN EXTENDED can be used to obtain additional information.

  For information about using EXPLAIN and EXPLAIN EXTENDED to obtain
  query execution plan information, see
  https://mariadb.com/kb/en/explain/.

o EXPLAIN PARTITIONS is useful only when examining queries involving
  partitioned tables. For details, see
  http://dev.mysql.com/doc/refman/5.5/en/partitioning-info.html.

o EXPLAIN tbl_name is synonymous with DESCRIBE tbl_name or SHOW COLUMNS
  FROM tbl_name. For information about DESCRIBE and SHOW COLUMNS, see
  [HELP DESCRIBE], and [HELP SHOW COLUMNS].

URL: https://mariadb.com/kb/en/explain/

', '', 'https://mariadb.com/kb/en/explain/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (257, 'VARCHAR', 22, '[NATIONAL] VARCHAR(M) [CHARACTER SET charset_name] [COLLATE
collation_name]

A variable-length string. M represents the maximum column length in
characters. The range of M is 0 to 65,535. The effective maximum length
of a VARCHAR is subject to the maximum row size (65,535 bytes, which is
shared among all columns) and the character set used. For example, utf8
characters can require up to three bytes per character, so a VARCHAR
column that uses the utf8 character set can be declared to be a maximum
of 21,844 characters. See
http://dev.mysql.com/doc/refman/5.5/en/column-count-limit.html.

MySQL stores VARCHAR values as a 1-byte or 2-byte length prefix plus
data. The length prefix indicates the number of bytes in the value. A
VARCHAR column uses one length byte if values require no more than 255
bytes, two length bytes if values may require more than 255 bytes.

*Note*: MySQL 5.5 follows the standard SQL specification, and does not
remove trailing spaces from VARCHAR values.

VARCHAR is shorthand for CHARACTER VARYING. NATIONAL VARCHAR is the
standard SQL way to define that a VARCHAR column should use some
predefined character set. MySQL 4.1 and up uses utf8 as this predefined
character set.
https://mariadb.com/kb/en/varchar/. NVARCHAR
is shorthand for NATIONAL VARCHAR.

URL: https://mariadb.com/kb/en/varchar/

', '', 'https://mariadb.com/kb/en/varchar/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (264, 'RESET MASTER', 8, 'Syntax:
RESET MASTER

Deletes all binary log files listed in the index file, resets the
binary log index file to be empty, and creates a new binary log file.
This statement is intended to be used only when the master is started
for the first time.

URL: https://mariadb.com/kb/en/reset-master/

', '', 'https://mariadb.com/kb/en/reset-master/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (265, 'TAN', 4, 'Syntax:
TAN(X)

Returns the tangent of X, where X is given in radians.

URL: https://mariadb.com/kb/en/tan/

', 'MariaDB> SELECT TAN(PI());
        -> -1.2246063538224e-16
MariaDB> SELECT TAN(PI()+1);
        -> 1.5574077246549
', 'https://mariadb.com/kb/en/tan/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (266, 'PI', 4, 'Syntax:
PI()

Returns the value of π (pi). The default number of decimal places
displayed is seven, but MySQL uses the full double-precision value
internally.

URL: https://mariadb.com/kb/en/pi/

', 'MariaDB> SELECT PI();
        -> 3.141593
MariaDB> SELECT PI()+0.000000000000000000;
        -> 3.141592653589793116
', 'https://mariadb.com/kb/en/pi/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (267, 'WEEKOFYEAR', 31, 'Syntax:
WEEKOFYEAR(date)

Returns the calendar week of the date as a number in the range from 1
to 53. WEEKOFYEAR() is a compatibility function that is equivalent to
WEEK(date,3).

URL: https://mariadb.com/kb/en/weekofyear/

', 'MariaDB> SELECT WEEKOFYEAR(''2008-02-20'');
        -> 8
', 'https://mariadb.com/kb/en/weekofyear/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (268, '/', 4, 'Syntax:
/

Division:

URL: https://mariadb.com/kb/en/division-operator/

', 'MariaDB> SELECT 3/5;
        -> 0.60
', 'https://mariadb.com/kb/en/division-operator/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (269, 'PURGE BINARY LOGS', 8, 'Syntax:
PURGE { BINARY | MASTER } LOGS
    { TO ''log_name'' | BEFORE datetime_expr }

The binary log is a set of files that contain information about data
modifications made by the MySQL server. The log consists of a set of
binary log files, plus an index file (see
https://mariadb.com/kb/en/overview-of-the-binary-log/).

The PURGE BINARY LOGS statement deletes all the binary log files listed
in the log index file prior to the specified log file name or date.
BINARY and MASTER are synonyms. Deleted log files also are removed from
the list recorded in the index file, so that the given log file becomes
the first in the list.

This statement has no effect if the server was not started with the
--log-bin option to enable binary logging.

URL: https://mariadb.com/kb/en/sql-commands-purge-logs/

', 'PURGE BINARY LOGS TO ''mysql-bin.010'';
PURGE BINARY LOGS BEFORE ''2008-04-02 22:46:26'';
', 'https://mariadb.com/kb/en/sql-commands-purge-logs/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (270, 'STDDEV_SAMP', 16, 'Syntax:
STDDEV_SAMP(expr)

Returns the sample standard deviation of expr (the square root of
VAR_SAMP().

STDDEV_SAMP() returns NULL if there were no matching rows.

URL: https://mariadb.com/kb/en/stddev_samp/

', '', 'https://mariadb.com/kb/en/stddev_samp/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (271, 'SCHEMA', 17, 'Syntax:
SCHEMA()

This function is a synonym for DATABASE().

URL: https://mariadb.com/kb/en/schema/

', '', 'https://mariadb.com/kb/en/schema/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (272, 'MLINEFROMWKB', 32, 'MLineFromWKB(wkb[,srid]), MultiLineStringFromWKB(wkb[,srid])

Constructs a MULTILINESTRING value using its WKB representation and
SRID.

URL: https://mariadb.com/kb/en/mlinefromwkb/

', '', 'https://mariadb.com/kb/en/mlinefromwkb/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (273, 'LOG2', 4, 'Syntax:
LOG2(X)

Returns the base-2 logarithm of X.

URL: https://mariadb.com/kb/en/log2/

', 'MariaDB> SELECT LOG2(65536);
        -> 16
MariaDB> SELECT LOG2(-100);
        -> NULL
', 'https://mariadb.com/kb/en/log2/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (274, 'SUBTIME', 31, 'Syntax:
SUBTIME(expr1,expr2)

SUBTIME() returns expr1 - expr2 expressed as a value in the same format
as expr1. expr1 is a time or datetime expression, and expr2 is a time
expression.

URL: https://mariadb.com/kb/en/subtime/

', 'MariaDB> SELECT SUBTIME(''2007-12-31 23:59:59.999999'',''1 1:1:1.000002'');
        -> ''2007-12-30 22:58:58.999997''
MariaDB> SELECT SUBTIME(''01:00:00.999999'', ''02:00:00.999998'');
        -> ''-00:59:59.999999''
', 'https://mariadb.com/kb/en/subtime/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (275, 'UNCOMPRESSED_LENGTH', 12, 'Syntax:
UNCOMPRESSED_LENGTH(compressed_string)

Returns the length that the compressed string had before being
compressed.

URL: https://mariadb.com/kb/en/uncompressed_length/

', 'MariaDB> SELECT UNCOMPRESSED_LENGTH(COMPRESS(REPEAT(''a'',30)));
        -> 30
', 'https://mariadb.com/kb/en/uncompressed_length/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (277, 'POW', 4, 'Syntax:
POW(X,Y)

Returns the value of X raised to the power of Y.

URL: https://mariadb.com/kb/en/pow/

', 'MariaDB> SELECT POW(2,2);
        -> 4
MariaDB> SELECT POW(2,-2);
        -> 0.25
', 'https://mariadb.com/kb/en/pow/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (278, 'SHOW CREATE TABLE', 26, 'Syntax:
SHOW CREATE TABLE tbl_name

Shows the CREATE TABLE statement that creates the given table. To use
this statement, you must have some privilege for the table. This
statement also works with views.
SHOW CREATE TABLE quotes table and column names according to the value
of the sql_quote_show_create option. See
https://mariadb.com/kb/en/server-system-variables/.

URL: https://mariadb.com/kb/en/show-create-table/

', 'MariaDB> SHOW CREATE TABLE t\\G
*************************** 1. row ***************************
       Table: t
Create Table: CREATE TABLE t (
  id INT(11) default NULL auto_increment,
  s char(60) default NULL,
  PRIMARY KEY (id)
) ENGINE=MyISAM
', 'https://mariadb.com/kb/en/show-create-table/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (276, 'DROP TABLE', 39, 'Syntax:
DROP [TEMPORARY] TABLE [IF EXISTS]
    tbl_name [, tbl_name] ...
    [RESTRICT | CASCADE]

DROP TABLE removes one or more tables. You must have the DROP privilege
for each table. All table data and the table definition are removed, so
be careful with this statement! If any of the tables named in the
argument list do not exist, MySQL returns an error indicating by name
which nonexisting tables it was unable to drop, but it also drops all
of the tables in the list that do exist.

*Important*: When a table is dropped, user privileges on the table are
not automatically dropped. See [HELP GRANT].

Note that for a partitioned table, DROP TABLE permanently removes the
table definition, all of its partitions, and all of the data which was
stored in those partitions. It also removes the partitioning definition
(.par) file associated with the dropped table.

Use IF EXISTS to prevent an error from occurring for tables that do not
exist. A NOTE is generated for each nonexistent table when using IF
EXISTS. See [HELP SHOW WARNINGS].

RESTRICT and CASCADE are permitted to make porting easier. In MySQL
5.5, they do nothing.

*Note*: DROP TABLE automatically commits the current active
transaction, unless you use the TEMPORARY keyword.

URL: https://mariadb.com/kb/en/drop-table/

', '', 'https://mariadb.com/kb/en/drop-table/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (279, 'DUAL', 27, 'You are permitted to specify DUAL as a dummy table name in situations
where no tables are referenced:

MariaDB> SELECT 1 + 1 FROM DUAL;
        -> 2

DUAL is purely for the convenience of people who require that all
SELECT statements should have FROM and possibly other clauses. MySQL
may ignore the clauses. MySQL does not require FROM DUAL if no tables
are referenced.

URL: https://mariadb.com/kb/en/dual/

', '', 'https://mariadb.com/kb/en/dual/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (280, 'INSTR', 37, 'Syntax:
INSTR(str,substr)

Returns the position of the first occurrence of substring substr in
string str. This is the same as the two-argument form of LOCATE(),
except that the order of the arguments is reversed.

URL: https://mariadb.com/kb/en/instr/

', 'MariaDB> SELECT INSTR(''foobarbar'', ''bar'');
        -> 4
MariaDB> SELECT INSTR(''xbar'', ''foobar'');
        -> 0
', 'https://mariadb.com/kb/en/instr/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (281, 'NOW', 31, 'Syntax:
NOW()

Returns the current date and time as a value in ''YYYY-MM-DD HH:MM:SS''
or YYYYMMDDHHMMSS.uuuuuu format, depending on whether the function is
used in a string or numeric context. The value is expressed in the
current time zone.

URL: https://mariadb.com/kb/en/now/

', 'MariaDB> SELECT NOW();
        -> ''2007-12-15 23:50:26''
MariaDB> SELECT NOW() + 0;
        -> 20071215235026.000000
', 'https://mariadb.com/kb/en/now/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (282, 'SHOW ENGINES', 26, 'Syntax:
SHOW [STORAGE] ENGINES

SHOW ENGINES displays status information about the server''s storage
engines. This is particularly useful for checking whether a storage
engine is supported, or to see what the default engine is.

URL: https://mariadb.com/kb/en/show-engines/

', '', 'https://mariadb.com/kb/en/show-engines/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (283, '>=', 18, 'Syntax:
>=

Greater than or equal:

URL: https://mariadb.com/kb/en/greater-than-or-equal/

', 'MariaDB> SELECT 2 >= 2;
        -> 1
', 'https://mariadb.com/kb/en/greater-than-or-equal/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (284, 'EXP', 4, 'Syntax:
EXP(X)

Returns the value of e (the base of natural logarithms) raised to the
power of X. The inverse of this function is LOG() (using a single
argument only) or LN().

URL: https://mariadb.com/kb/en/exp/

', 'MariaDB> SELECT EXP(2);
        -> 7.3890560989307
MariaDB> SELECT EXP(-2);
        -> 0.13533528323661
MariaDB> SELECT EXP(0);
        -> 1
', 'https://mariadb.com/kb/en/exp/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (285, 'LONGBLOB', 22, 'LONGBLOB

A BLOB column with a maximum length of 4,294,967,295 or 4GB (232 - 1)
bytes. The effective maximum length of LONGBLOB columns depends on the
configured maximum packet size in the client/server protocol and
available memory. Each LONGBLOB value is stored using a 4-byte length
prefix that indicates the number of bytes in the value.

URL: https://mariadb.com/kb/en/longblob/

', '', 'https://mariadb.com/kb/en/longblob/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (286, 'POINTN', 13, 'PointN(ls,N)

Returns the N-th Point in the Linestring value ls. Points are numbered
beginning with 1.

URL: https://mariadb.com/kb/en/pointn/

', 'MariaDB> SET @ls = ''LineString(1 1,2 2,3 3)'';
MariaDB> SELECT AsText(PointN(GeomFromText(@ls),2));
+-------------------------------------+
| AsText(PointN(GeomFromText(@ls),2)) |
+-------------------------------------+
| POINT(2 2)                          |
+-------------------------------------+
', 'https://mariadb.com/kb/en/pointn/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (287, 'YEAR DATA TYPE', 22, 'YEAR[(2|4)]

A year in two-digit or four-digit format. The default is four-digit
format. YEAR(2) or YEAR(4) differ in display format, but have the same
range of values. In four-digit format, values display as 1901 to 2155,
and 0000. In two-digit format, values display as 70 to 69, representing
years from 1970 to 2069. MySQL displays YEAR values in YYYY or
YYformat, but permits assignment of values to YEAR columns using either
strings or numbers.

*Note*: The YEAR(2) data type has certain issues that you should
consider before choosing to use it. As of MySQL 5.5.27, YEAR(2) is
deprecated. For more information, see
http://dev.mysql.com/doc/refman/5.5/en/migrating-to-year4.html.

For additional information about YEAR display format and inerpretation
of input values, see https://mariadb.com/kb/en/year-data-type/.

URL: https://mariadb.com/kb/en/year-data-type/

', '', 'https://mariadb.com/kb/en/year-data-type/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (288, 'SUM', 16, 'Syntax:
SUM([DISTINCT] expr)

Returns the sum of expr. If the return set has no rows, SUM() returns
NULL. The DISTINCT keyword can be used to sum only the distinct values
of expr.

SUM() returns NULL if there were no matching rows.

URL: https://mariadb.com/kb/en/sum/

', '', 'https://mariadb.com/kb/en/sum/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (289, 'OCT', 37, 'Syntax:
OCT(N)

Returns a string representation of the octal value of N, where N is a
longlong (BIGINT) number. This is equivalent to CONV(N,10,8). Returns
NULL if N is NULL.

URL: https://mariadb.com/kb/en/oct/

', 'MariaDB> SELECT OCT(12);
        -> ''14''
', 'https://mariadb.com/kb/en/oct/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (291, 'UNINSTALL PLUGIN', 5, 'Syntax:
UNINSTALL PLUGIN plugin_name

This statement removes an installed server plugin. It requires the
DELETE privilege for the mysql.plugin table.

plugin_name must be the name of some plugin that is listed in the
mysql.plugin table. The server executes the plugin''s deinitialization
function and removes the row for the plugin from the mysql.plugin
table, so that subsequent server restarts will not load and initialize
the plugin. UNINSTALL PLUGIN does not remove the plugin''s shared
library file.

URL: https://mariadb.com/kb/en/uninstall-plugin/

', '', 'https://mariadb.com/kb/en/uninstall-plugin/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (292, 'ASBINARY', 32, 'AsBinary(g), AsWKB(g)

Converts a value in internal geometry format to its WKB representation
and returns the binary result.

URL: https://mariadb.com/kb/en/asbinary/

', 'SELECT AsBinary(g) FROM geom;
', 'https://mariadb.com/kb/en/asbinary/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (293, 'REPEAT FUNCTION', 37, 'Syntax:
REPEAT(str,count)

Returns a string consisting of the string str repeated count times. If
count is less than 1, returns an empty string. Returns NULL if str or
count are NULL.

URL: https://mariadb.com/kb/en/repeat-function/

', 'MariaDB> SELECT REPEAT(''MySQL'', 3);
        -> ''MySQLMySQLMySQL''
', 'https://mariadb.com/kb/en/repeat-function/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (290, 'SYSDATE', 31, 'Syntax:
SYSDATE()

Returns the current date and time as a value in ''YYYY-MM-DD HH:MM:SS''
or YYYYMMDDHHMMSS.uuuuuu format, depending on whether the function is
used in a string or numeric context.

SYSDATE() returns the time at which it executes. This differs from the
behavior for NOW(), which returns a constant time that indicates the
time at which the statement began to execute. (Within a stored function
or trigger, NOW() returns the time at which the function or triggering
statement began to execute.)

MariaDB> SELECT NOW(), SLEEP(2), NOW();
+---------------------+----------+---------------------+
| NOW()               | SLEEP(2) | NOW()               |
+---------------------+----------+---------------------+
| 2006-04-12 13:47:36 |        0 | 2006-04-12 13:47:36 |
+---------------------+----------+---------------------+

MariaDB> SELECT SYSDATE(), SLEEP(2), SYSDATE();
+---------------------+----------+---------------------+
| SYSDATE()           | SLEEP(2) | SYSDATE()           |
+---------------------+----------+---------------------+
| 2006-04-12 13:47:44 |        0 | 2006-04-12 13:47:46 |
+---------------------+----------+---------------------+

In addition, the SET TIMESTAMP statement affects the value returned by
NOW() but not by SYSDATE(). This means that timestamp settings in the
binary log have no effect on invocations of SYSDATE().

Because SYSDATE() can return different values even within the same
statement, and is not affected by SET TIMESTAMP, it is nondeterministic
and therefore unsafe for replication if statement-based binary logging
is used. If that is a problem, you can use row-based logging.

Alternatively, you can use the --sysdate-is-now option to cause
SYSDATE() to be an alias for NOW(). This works if the option is used on
both the master and the slave.

The nondeterministic nature of SYSDATE() also means that indexes cannot
be used for evaluating expressions that refer to it.

URL: https://mariadb.com/kb/en/sysdate/

', '', 'https://mariadb.com/kb/en/sysdate/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (294, 'SHOW TABLES', 26, 'Syntax:
SHOW [FULL] TABLES [{FROM | IN} db_name]
    [LIKE ''pattern'' | WHERE expr]

SHOW TABLES lists the non-TEMPORARY tables in a given database. You can
also get this list using the mysqlshow db_name command. The LIKE
clause, if present, indicates which table names to match. The WHERE
clause can be given to select rows using more general conditions, as
discussed in https://mariadb.com/kb/en/extended-show/.

This statement also lists any views in the database. The FULL modifier
is supported such that SHOW FULL TABLES displays a second output
column. Values for the second column are BASE TABLE for a table and
VIEW for a view.

If you have no privileges for a base table or view, it does not show up
in the output from SHOW TABLES or mysqlshow db_name.

URL: https://mariadb.com/kb/en/show-tables/

', '', 'https://mariadb.com/kb/en/show-tables/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (295, 'MAKEDATE', 31, 'Syntax:
MAKEDATE(year,dayofyear)

Returns a date, given year and day-of-year values. dayofyear must be
greater than 0 or the result is NULL.

URL: https://mariadb.com/kb/en/makedate/

', 'MariaDB> SELECT MAKEDATE(2011,31), MAKEDATE(2011,32);
        -> ''2011-01-31'', ''2011-02-01''
MariaDB> SELECT MAKEDATE(2011,365), MAKEDATE(2014,365);
        -> ''2011-12-31'', ''2014-12-31''
MariaDB> SELECT MAKEDATE(2011,0);
        -> NULL
', 'https://mariadb.com/kb/en/makedate/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (296, 'BINARY OPERATOR', 37, 'Syntax:
BINARY

The BINARY operator casts the string following it to a binary string.
This is an easy way to force a column comparison to be done byte by
byte rather than character by character. This causes the comparison to
be case sensitive even if the column is not defined as BINARY or BLOB.
BINARY also causes trailing spaces to be significant.

URL: https://mariadb.com/kb/en/binary-operator/

', 'MariaDB> SELECT ''a'' = ''A'';
        -> 1
MariaDB> SELECT BINARY ''a'' = ''A'';
        -> 0
MariaDB> SELECT ''a'' = ''a '';
        -> 1
MariaDB> SELECT BINARY ''a'' = ''a '';
        -> 0
', 'https://mariadb.com/kb/en/binary-operator/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (297, 'MBROVERLAPS', 6, 'MBROverlaps(g1,g2)

Returns 1 or 0 to indicate whether the Minimum Bounding Rectangles of
the two geometries g1 and g2 overlap. The term spatially overlaps is
used if two geometries intersect and their intersection results in a
geometry of the same dimension but not equal to either of the given
geometries.

URL: https://mariadb.com/kb/en/mbroverlaps/

', '', 'https://mariadb.com/kb/en/mbroverlaps/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (298, 'SOUNDEX', 37, 'Syntax:
SOUNDEX(str)

Returns a soundex string from str. Two strings that sound almost the
same should have identical soundex strings. A standard soundex string
is four characters long, but the SOUNDEX() function returns an
arbitrarily long string. You can use SUBSTRING() on the result to get a
standard soundex string. All nonalphabetic characters in str are
ignored. All international alphabetic characters outside the A-Z range
are treated as vowels.

*Important*: When using SOUNDEX(), you should be aware of the following
limitations:

o This function, as currently implemented, is intended to work well
  with strings that are in the English language only. Strings in other
  languages may not produce reliable results.

o This function is not guaranteed to provide consistent results with
  strings that use multi-byte character sets, including utf-8.

  We hope to remove these limitations in a future release. See Bug
  #22638 for more information.

URL: https://mariadb.com/kb/en/soundex/

', 'MariaDB> SELECT SOUNDEX(''Hello'');
        -> ''H400''
MariaDB> SELECT SOUNDEX(''Quadratically'');
        -> ''Q36324''
', 'https://mariadb.com/kb/en/soundex/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (299, 'MBRTOUCHES', 6, 'MBRTouches(g1,g2)

Returns 1 or 0 to indicate whether the Minimum Bounding Rectangles of
the two geometries g1 and g2 touch. Two geometries spatially touch if
the interiors of the geometries do not intersect, but the boundary of
one of the geometries intersects either the boundary or the interior of
the other.

URL: https://mariadb.com/kb/en/mbrtouches/

', '', 'https://mariadb.com/kb/en/mbrtouches/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (300, 'DROP EVENT', 39, 'Syntax:
DROP EVENT [IF EXISTS] event_name

This statement drops the event named event_name. The event immediately
ceases being active, and is deleted completely from the server.

If the event does not exist, the error ERROR 1517 (HY000): Unknown
event ''event_name'' results. You can override this and cause the
statement to generate a warning for nonexistent events instead using IF
EXISTS.

This statement requires the EVENT privilege for the schema to which the
event to be dropped belongs.

URL: https://mariadb.com/kb/en/drop-event/

', '', 'https://mariadb.com/kb/en/drop-event/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (301, 'INSERT SELECT', 27, 'Syntax:
INSERT [LOW_PRIORITY | HIGH_PRIORITY] [IGNORE]
    [INTO] tbl_name [(col_name,...)]
    SELECT ...
    [ ON DUPLICATE KEY UPDATE col_name=expr, ... ]

With INSERT ... SELECT, you can quickly insert many rows into a table
from one or many tables. For example:

INSERT INTO tbl_temp2 (fld_id)
  SELECT tbl_temp1.fld_order_id
  FROM tbl_temp1 WHERE tbl_temp1.fld_order_id > 100;

URL: https://mariadb.com/kb/en/insert-select/

', '', 'https://mariadb.com/kb/en/insert-select/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (302, 'CREATE PROCEDURE', 39, 'Syntax:
CREATE
    [DEFINER = { user | CURRENT_USER }]
    PROCEDURE sp_name ([proc_parameter[,...]])
    [characteristic ...] routine_body

CREATE
    [DEFINER = { user | CURRENT_USER }]
    FUNCTION sp_name ([func_parameter[,...]])
    RETURNS type
    [characteristic ...] routine_body

proc_parameter:
    [ IN | OUT | INOUT ] param_name type

func_parameter:
    param_name type

type:
    Any valid MySQL data type

characteristic:
    COMMENT ''string''
  | LANGUAGE SQL
  | [NOT] DETERMINISTIC
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }

routine_body:
    Valid SQL routine statement

These statements create stored routines. By default, a routine is
associated with the default database. To associate the routine
explicitly with a given database, specify the name as db_name.sp_name
when you create it.

The CREATE FUNCTION statement is also used in MySQL to support UDFs
(user-defined functions). See
https://mariadb.com/kb/en/create-function-udf/. A UDF can
be regarded as an external stored function. Stored functions share
their namespace with UDFs. See
http://dev.mysql.com/doc/refman/5.5/en/function-resolution.html, for
the rules describing how the server interprets references to different
kinds of functions.

To invoke a stored procedure, use the CALL statement (see [HELP CALL]).
To invoke a stored function, refer to it in an expression. The function
returns a value during expression evaluation.

CREATE PROCEDURE and CREATE FUNCTION require the CREATE ROUTINE
privilege. They might also require the SUPER privilege, depending on
the DEFINER value, as described later in this section. If binary
logging is enabled, CREATE FUNCTION might require the SUPER privilege,
as described in
https://mariadb.com/kb/en/binary-logging-of-stored-routines/.

By default, MySQL automatically grants the ALTER ROUTINE and EXECUTE
privileges to the routine creator. This behavior can be changed by
disabling the automatic_sp_privileges system variable. See
https://mariadb.com/kb/en/stored-routine-privileges/.

The DEFINER and SQL SECURITY clauses specify the security context to be
used when checking access privileges at routine execution time, as
described later in this section.

If the routine name is the same as the name of a built-in SQL function,
a syntax error occurs unless you use a space between the name and the
following parenthesis when defining the routine or invoking it later.
For this reason, avoid using the names of existing SQL functions for
your own stored routines.

The IGNORE_SPACE SQL mode applies to built-in functions, not to stored
routines. It is always permissible to have spaces after a stored
routine name, regardless of whether IGNORE_SPACE is enabled.

The parameter list enclosed within parentheses must always be present.
If there are no parameters, an empty parameter list of () should be
used. Parameter names are not case sensitive.

Each parameter is an IN parameter by default. To specify otherwise for
a parameter, use the keyword OUT or INOUT before the parameter name.

*Note*: Specifying a parameter as IN, OUT, or INOUT is valid only for a
PROCEDURE. For a FUNCTION, parameters are always regarded as IN
parameters.

An IN parameter passes a value into a procedure. The procedure might
modify the value, but the modification is not visible to the caller
when the procedure returns. An OUT parameter passes a value from the
procedure back to the caller. Its initial value is NULL within the
procedure, and its value is visible to the caller when the procedure
returns. An INOUT parameter is initialized by the caller, can be
modified by the procedure, and any change made by the procedure is
visible to the caller when the procedure returns.

For each OUT or INOUT parameter, pass a user-defined variable in the
CALL statement that invokes the procedure so that you can obtain its
value when the procedure returns. If you are calling the procedure from
within another stored procedure or function, you can also pass a
routine parameter or local routine variable as an IN or INOUT
parameter.

The following example shows a simple stored procedure that uses an OUT
parameter:

MariaDB> delimiter //

MariaDB> CREATE PROCEDURE simpleproc (OUT param1 INT)
    -> BEGIN
    ->   SELECT COUNT(*) INTO param1 FROM t;
    -> END//
Query OK, 0 rows affected (0.00 sec)

MariaDB> delimiter ;

MariaDB> CALL simpleproc(@a);
Query OK, 0 rows affected (0.00 sec)

MariaDB> SELECT @a;
+------+
| @a   |
+------+
| 3    |
+------+
1 row in set (0.00 sec)

The example uses the mysql client delimiter command to change the
statement delimiter from ; to // while the procedure is being defined.
This enables the ; delimiter used in the procedure body to be passed
through to the server rather than being interpreted by mysql itself.
See
https://mariadb.com/kb/en/stored-procedure-overview/.

The RETURNS clause may be specified only for a FUNCTION, for which it
is mandatory. It indicates the return type of the function, and the
function body must contain a RETURN value statement. If the RETURN
statement returns a value of a different type, the value is coerced to
the proper type. For example, if a function specifies an ENUM or SET
value in the RETURNS clause, but the RETURN statement returns an
integer, the value returned from the function is the string for the
corresponding ENUM member of set of SET members.

The following example function takes a parameter, performs an operation
using an SQL function, and returns the result. In this case, it is
unnecessary to use delimiter because the function definition contains
no internal ; statement delimiters:

MariaDB> CREATE FUNCTION hello (s CHAR(20))
MariaDB> RETURNS CHAR(50) DETERMINISTIC
    -> RETURN CONCAT(''Hello, '',s,''!'');
Query OK, 0 rows affected (0.00 sec)

MariaDB> SELECT hello(''world'');
+----------------+
| hello(''world'') |
+----------------+
| Hello, world!  |
+----------------+
1 row in set (0.00 sec)

Parameter types and function return types can be declared to use any
valid data type, except that the COLLATE attribute cannot be used prior
to MySQL 5.5.3. As of 5.5.3, COLLATE can be used if preceded by the
CHARACTER SET attribute.

The routine_body consists of a valid SQL routine statement. This can be
a simple statement such as SELECT or INSERT, or a compound statement
written using BEGIN and END. Compound statements can contain
declarations, loops, and other control structure statements. The syntax
for these statements is described in
https://mariadb.com/kb/programmatic-and-compound-statements.

MySQL permits routines to contain DDL statements, such as CREATE and
DROP. MySQL also permits stored procedures (but not stored functions)
to contain SQL transaction statements such as COMMIT. Stored functions
may not contain statements that perform explicit or implicit commit or
rollback. Support for these statements is not required by the SQL
standard, which states that each DBMS vendor may decide whether to
permit them.

Statements that return a result set can be used within a stored
procedure but not within a stored function. This prohibition includes
SELECT statements that do not have an INTO var_list clause and other
statements such as SHOW, EXPLAIN, and CHECK TABLE. For statements that
can be determined at function definition time to return a result set, a
Not allowed to return a result set from a function error occurs
(ER_SP_NO_RETSET). For statements that can be determined only at
runtime to return a result set, a PROCEDURE %s can''t return a result
set in the given context error occurs (ER_SP_BADSELECT).

USE statements within stored routines are not permitted. When a routine
is invoked, an implicit USE db_name is performed (and undone when the
routine terminates). The causes the routine to have the given default
database while it executes. References to objects in databases other
than the routine default database should be qualified with the
appropriate database name.

For additional information about statements that are not permitted in
stored routines, see
https://mariadb.com/kb/en/stored-routine-privileges/
.

For information about invoking stored procedures from within programs
written in a language that has a MySQL interface, see [HELP CALL].

MySQL stores the sql_mode system variable setting that is in effect at
the time a routine is created, and always executes the routine with
this setting in force, regardless of the server SQL mode in effect when
the routine is invoked.

The switch from the SQL mode of the invoker to that of the routine
occurs after evaluation of arguments and assignment of the resulting
values to routine parameters. If you define a routine in strict SQL
mode but invoke it in nonstrict mode, assignment of arguments to
routine parameters does not take place in strict mode. If you require
that expressions passed to a routine be assigned in strict SQL mode,
you should invoke the routine with strict mode in effect.

URL: https://mariadb.com/kb/en/create-procedure/

', '', 'https://mariadb.com/kb/en/create-procedure/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (303, 'VARBINARY', 22, 'VARBINARY(M)

The VARBINARY type is similar to the VARCHAR type, but stores binary
byte strings rather than nonbinary character strings. M represents the
maximum column length in bytes.

URL: https://mariadb.com/kb/en/varbinary/

', '', 'https://mariadb.com/kb/en/varbinary/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (304, 'LOAD INDEX', 26, 'Syntax:
LOAD INDEX INTO CACHE
  tbl_index_list [, tbl_index_list] ...

tbl_index_list:
  tbl_name
    [PARTITION (partition_list | ALL)]
    [[INDEX|KEY] (index_name[, index_name] ...)]
    [IGNORE LEAVES]

partition_list:
    partition_name[, partition_name][, ...]

The LOAD INDEX INTO CACHE statement preloads a table index into the key
cache to which it has been assigned by an explicit CACHE INDEX
statement, or into the default key cache otherwise.

LOAD INDEX INTO CACHE is used only for MyISAM tables. In MySQL 5.5, it
is also supported for partitioned MyISAM tables; in addition, indexes
on partitioned tables can be preloaded for one, several, or all
partitions.

The IGNORE LEAVES modifier causes only blocks for the nonleaf nodes of
the index to be preloaded.

IGNORE LEAVES is also supported for partitioned MyISAM tables.

URL: https://mariadb.com/kb/en/load-index/

', '', 'https://mariadb.com/kb/en/load-index/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (305, 'UNION', 27, 'Syntax:
SELECT ...
UNION [ALL | DISTINCT] SELECT ...
[UNION [ALL | DISTINCT] SELECT ...]

UNION is used to combine the result from multiple SELECT statements
into a single result set.

The column names from the first SELECT statement are used as the column
names for the results returned. Selected columns listed in
corresponding positions of each SELECT statement should have the same
data type. (For example, the first column selected by the first
statement should have the same type as the first column selected by the
other statements.)

URL: https://mariadb.com/kb/en/union/

', '', 'https://mariadb.com/kb/en/union/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (306, 'TO_DAYS', 31, 'Syntax:
TO_DAYS(date)

Given a date date, returns a day number (the number of days since year
0).

URL: https://mariadb.com/kb/en/to_days/

', 'MariaDB> SELECT TO_DAYS(950501);
        -> 728779
MariaDB> SELECT TO_DAYS(''2007-10-07'');
        -> 733321
', 'https://mariadb.com/kb/en/to_days/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (307, 'NOT REGEXP', 37, 'Syntax:
expr NOT REGEXP pat, expr NOT RLIKE pat

This is the same as NOT (expr REGEXP pat).

URL: https://mariadb.com/kb/en/not-regexp/

', '', 'https://mariadb.com/kb/en/not-regexp/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (308, 'SHOW INDEX', 26, 'Syntax:
SHOW {INDEX | INDEXES | KEYS}
    {FROM | IN} tbl_name
    [{FROM | IN} db_name]
    [WHERE expr]

SHOW INDEX returns table index information. The format resembles that
of the SQLStatistics call in ODBC. This statement requires some
privilege for any column in the table.
You can use db_name.tbl_name as an alternative to the tbl_name FROM
db_name syntax. These two statements are equivalent:

SHOW INDEX FROM mytable FROM mydb;
SHOW INDEX FROM mydb.mytable;

The WHERE clause can be given to select rows using more general
conditions, as discussed in
https://mariadb.com/kb/en/extended-show/.

You can also list a table''s indexes with the mysqlshow -k db_name
tbl_name command.

URL: https://mariadb.com/kb/en/show-index/

', '', 'https://mariadb.com/kb/en/show-index/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (309, 'SHOW CREATE DATABASE', 26, 'Syntax:
SHOW CREATE {DATABASE | SCHEMA} [IF NOT EXISTS] db_name

Shows the CREATE DATABASE statement that creates the given database. If
the SHOW statement includes an IF NOT EXISTS clause, the output too
includes such a clause. SHOW CREATE SCHEMA is a synonym for SHOW CREATE
DATABASE.

URL: https://mariadb.com/kb/en/show-create-database/

', 'MariaDB> SHOW CREATE DATABASE test\\G
*************************** 1. row ***************************
       Database: test
Create Database: CREATE DATABASE `test`
                 /*!40100 DEFAULT CHARACTER SET latin1 */

MariaDB> SHOW CREATE SCHEMA test\\G
*************************** 1. row ***************************
       Database: test
Create Database: CREATE DATABASE `test`
                 /*!40100 DEFAULT CHARACTER SET latin1 */
', 'https://mariadb.com/kb/en/show-create-database/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (310, 'LEAVE', 23, 'Syntax:
LEAVE label

This statement is used to exit the flow control construct that has the
given label. If the label is for the outermost stored program block,
LEAVE exits the program.

LEAVE can be used within BEGIN ... END or loop constructs (LOOP,
REPEAT, WHILE).

URL: https://mariadb.com/kb/en/leave/

', '', 'https://mariadb.com/kb/en/leave/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (311, 'NOT IN', 18, 'Syntax:
expr NOT IN (value,...)

This is the same as NOT (expr IN (value,...)).

URL: https://mariadb.com/kb/en/not-in/

', '', 'https://mariadb.com/kb/en/not-in/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (312, '!', 15, 'Syntax:
NOT, !

Logical NOT. Evaluates to 1 if the operand is 0, to 0 if the operand is
nonzero, and NOT NULL returns NULL.

URL: https://mariadb.com/kb/en/not/

', 'MariaDB> SELECT NOT 10;
        -> 0
MariaDB> SELECT NOT 0;
        -> 1
MariaDB> SELECT NOT NULL;
        -> NULL
MariaDB> SELECT ! (1+1);
        -> 0
MariaDB> SELECT ! 1+1;
        -> 1
', 'https://mariadb.com/kb/en/not/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (314, 'DOUBLE', 22, 'DOUBLE[(M,D)] [UNSIGNED] [ZEROFILL]

A normal-size (double-precision) floating-point number. Permissible
values are -1.7976931348623157E+308 to -2.2250738585072014E-308, 0, and
2.2250738585072014E-308 to 1.7976931348623157E+308. These are the
theoretical limits, based on the IEEE standard. The actual range might
be slightly smaller depending on your hardware or operating system.

M is the total number of digits and D is the number of digits following
the decimal point. If M and D are omitted, values are stored to the
limits permitted by the hardware. A double-precision floating-point
number is accurate to approximately 15 decimal places.

UNSIGNED, if specified, disallows negative values.

URL: https://mariadb.com/kb/en/double/

', '', 'https://mariadb.com/kb/en/double/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (315, 'TIME', 22, 'TIME

A time. The range is ''-838:59:59'' to ''838:59:59''. MySQL displays TIME
values in ''HH:MM:SS'' format, but permits assignment of values to TIME
columns using either strings or numbers.

URL: https://mariadb.com/kb/en/time/

', '', 'https://mariadb.com/kb/en/time/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (316, '&&', 15, 'Syntax:
AND, &&

Logical AND. Evaluates to 1 if all operands are nonzero and not NULL,
to 0 if one or more operands are 0, otherwise NULL is returned.

URL: https://mariadb.com/kb/en/and/

', 'MariaDB> SELECT 1 && 1;
        -> 1
MariaDB> SELECT 1 && 0;
        -> 0
MariaDB> SELECT 1 && NULL;
        -> NULL
MariaDB> SELECT 0 && NULL;
        -> 0
MariaDB> SELECT NULL && 0;
        -> 0
', 'https://mariadb.com/kb/en/and/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (317, 'X', 11, 'X(p)

Returns the X-coordinate value for the Point object p as a
double-precision number.

URL: https://mariadb.com/kb/en/x/

', 'MariaDB> SELECT X(POINT(56.7, 53.34));
+-----------------------+
| X(POINT(56.7, 53.34)) |
+-----------------------+
|                  56.7 |
+-----------------------+
', 'https://mariadb.com/kb/en/x/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (318, 'SYSTEM_USER', 17, 'Syntax:
SYSTEM_USER()

SYSTEM_USER() is a synonym for USER().

URL: https://mariadb.com/kb/en/system_user/

', '', 'https://mariadb.com/kb/en/system_user/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (319, 'FOUND_ROWS', 17, 'Syntax:
FOUND_ROWS()

A SELECT statement may include a LIMIT clause to restrict the number of
rows the server returns to the client. In some cases, it is desirable
to know how many rows the statement would have returned without the
LIMIT, but without running the statement again. To obtain this row
count, include a SQL_CALC_FOUND_ROWS option in the SELECT statement,
and then invoke FOUND_ROWS() afterward:

URL: https://mariadb.com/kb/en/found_rows/

', 'MariaDB> SELECT SQL_CALC_FOUND_ROWS * FROM tbl_name
    -> WHERE id > 100 LIMIT 10;
MariaDB> SELECT FOUND_ROWS();
', 'https://mariadb.com/kb/en/found_rows/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (313, 'DECLARE HANDLER', 23, 'Syntax:
DECLARE handler_action HANDLER
    FOR condition_value [, condition_value] ...
    statement

handler_action:
    CONTINUE
  | EXIT
  | UNDO

condition_value:
    mysql_error_code
  | SQLSTATE [VALUE] sqlstate_value
  | condition_name
  | SQLWARNING
  | NOT FOUND
  | SQLEXCEPTION

The DECLARE ... HANDLER statement specifies a handler that deals with
one or more conditions. If one of these conditions occurs, the
specified statement executes. statement can be a simple statement such
as SET var_name = value, or a compound statement written using BEGIN
and END (see [HELP BEGIN END]).

Handler declarations must appear after variable or condition
declarations.

The handler_action value indicates what action the handler takes after
execution of the handler statement:

o CONTINUE: Execution of the current program continues.

o EXIT: Execution terminates for the BEGIN ... END compound statement
  in which the handler is declared. This is true even if the condition
  occurs in an inner block.

o UNDO: Not supported.

The condition_value for DECLARE ... HANDLER indicates the specific
condition or class of conditions that activates the handler:

o A MySQL error code (a number) or an SQLSTATE value (a 5-character
  string literal). You should not use MySQL error code 0 or SQLSTATE
  values that begin with ''00'', because those indicate success rather
  than an error condition. For a list of MySQL error codes and SQLSTATE
  values, see
  https://mariadb.com/kb/en/mariadb-error-codes/.

o A condition name previously specified with DECLARE ... CONDITION. A
  condition name can be associated with a MySQL error code or SQLSTATE
  value. See [HELP DECLARE CONDITION].

o SQLWARNING is shorthand for the class of SQLSTATE values that begin
  with ''01''.

o NOT FOUND is shorthand for the class of SQLSTATE values that begin
  with ''02''. This is relevant within the context of cursors and is used
  to control what happens when a cursor reaches the end of a data set.
  If no more rows are available, a No Data condition occurs with
  SQLSTATE value ''02000''. To detect this condition, you can set up a
  handler for it (or for a NOT FOUND condition). For an example, see
  https://mariadb.com/kb/en/cursor-overview/. This condition
  also occurs for SELECT ... INTO var_list statements that retrieve no
  rows.

o SQLEXCEPTION is shorthand for the class of SQLSTATE values that do
  not begin with ''00'', ''01'', or ''02''.

If a condition occurs for which no handler has been declared, the
action taken depends on the condition class:

o For SQLEXCEPTION conditions, the stored program terminates at the
  statement that raised the condition, as if there were an EXIT
  handler. If the program was called by another stored program, the
  calling program handles the condition using the handler selection
  rules applied to its own handlers.

o For SQLWARNING conditions, the program continues executing, as if
  there were a CONTINUE handler.

o For NOT FOUND conditions, if the condition was raised normally, the
  action is CONTINUE. If it was raised by SIGNAL or RESIGNAL, the
  action is EXIT.

URL: https://mariadb.com/kb/en/declare-handler/

', 'MariaDB> CREATE TABLE test.t (s1 INT, PRIMARY KEY (s1));
Query OK, 0 rows affected (0.00 sec)

MariaDB> delimiter //

MariaDB> CREATE PROCEDURE handlerdemo ()
    -> BEGIN
    ->   DECLARE CONTINUE HANDLER FOR SQLSTATE ''23000'' SET @x2 = 1;
    ->   SET @x = 1;
    ->   INSERT INTO test.t VALUES (1);
    ->   SET @x = 2;
    ->   INSERT INTO test.t VALUES (1);
    ->   SET @x = 3;
    -> END;
    -> //
Query OK, 0 rows affected (0.00 sec)

MariaDB> CALL handlerdemo()//
Query OK, 0 rows affected (0.00 sec)

MariaDB> SELECT @x//
    +------+
    | @x   |
    +------+
    | 3    |
    +------+
    1 row in set (0.00 sec)
', 'https://mariadb.com/kb/en/declare-handler/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (320, 'CROSSES', 30, 'Crosses(g1,g2)

Returns 1 if g1 spatially crosses g2. Returns NULL if g1 is a Polygon
or a MultiPolygon, or if g2 is a Point or a MultiPoint. Otherwise,
returns 0.

The term spatially crosses denotes a spatial relation between two given
geometries that has the following properties:

o The two geometries intersect

o Their intersection results in a geometry that has a dimension that is
  one less than the maximum dimension of the two given geometries

o Their intersection is not equal to either of the two given geometries

URL: https://mariadb.com/kb/en/crosses/

', '', 'https://mariadb.com/kb/en/crosses/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (321, 'TRUNCATE TABLE', 39, 'Syntax:
TRUNCATE [TABLE] tbl_name

TRUNCATE TABLE empties a table completely. It requires the DROP
privilege.

Logically, TRUNCATE TABLE is similar to a DELETE statement that deletes
all rows, or a sequence of DROP TABLE and CREATE TABLE statements. To
achieve high performance, it bypasses the DML method of deleting data.
Thus, it cannot be rolled back, it does not cause ON DELETE triggers to
fire, and it cannot be performed for InnoDB tables with parent-child
foreign key relationships.

Although TRUNCATE TABLE is similar to DELETE, it is classified as a DDL
statement rather than a DML statement. It differs from DELETE in the
following ways in MySQL 5.5:

o Truncate operations drop and re-create the table, which is much
  faster than deleting rows one by one, particularly for large tables.

o Truncate operations cause an implicit commit, and so cannot be rolled
  back.

o Truncation operations cannot be performed if the session holds an
  active table lock.

o TRUNCATE TABLE fails for an InnoDB table if there are any FOREIGN KEY
  constraints from other tables that reference the table. Foreign key
  constraints between columns of the same table are permitted.

o Truncation operations do not return a meaningful value for the number
  of deleted rows. The usual result is "0 rows affected," which should
  be interpreted as "no information."

o As long as the table format file tbl_name.frm is valid, the table can
  be re-created as an empty table with TRUNCATE TABLE, even if the data
  or index files have become corrupted.

o Any AUTO_INCREMENT value is reset to its start value. This is true
  even for MyISAM and InnoDB, which normally do not reuse sequence
  values.

o When used with partitioned tables, TRUNCATE TABLE preserves the
  partitioning; that is, the data and index files are dropped and
  re-created, while the partition definitions (.par) file is
  unaffected.

o The TRUNCATE TABLE statement does not invoke ON DELETE triggers.

URL: https://mariadb.com/kb/en/truncate-table/

', '', 'https://mariadb.com/kb/en/truncate-table/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (322, 'BIT_XOR', 16, 'Syntax:
BIT_XOR(expr)

Returns the bitwise XOR of all bits in expr. The calculation is
performed with 64-bit (BIGINT) precision.

URL: https://mariadb.com/kb/en/bit_xor/

', '', 'https://mariadb.com/kb/en/bit_xor/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (323, 'CURRENT_DATE', 31, 'Syntax:
CURRENT_DATE, CURRENT_DATE()

CURRENT_DATE and CURRENT_DATE() are synonyms for CURDATE().

URL: https://mariadb.com/kb/en/current_date/

', '', 'https://mariadb.com/kb/en/current_date/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (325, 'AREA', 2, 'Area(poly)

Returns as a double-precision number the area of the Polygon value
poly, as measured in its spatial reference system.

URL: https://mariadb.com/kb/en/area/

', 'MariaDB> SET @poly = ''Polygon((0 0,0 3,3 0,0 0),(1 1,1 2,2 1,1 1))'';
MariaDB> SELECT Area(GeomFromText(@poly));
+---------------------------+
| Area(GeomFromText(@poly)) |
+---------------------------+
|                         4 |
+---------------------------+
', 'https://mariadb.com/kb/en/area/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (324, 'START SLAVE', 8, 'Syntax:
START SLAVE [thread_types]

START SLAVE [SQL_THREAD] UNTIL
    MASTER_LOG_FILE = ''log_name'', MASTER_LOG_POS = log_pos

START SLAVE [SQL_THREAD] UNTIL
    RELAY_LOG_FILE = ''log_name'', RELAY_LOG_POS = log_pos

thread_types:
    [thread_type [, thread_type] ... ]

thread_type: IO_THREAD | SQL_THREAD

START SLAVE with no thread_type options starts both of the slave
threads. The I/O thread reads events from the master server and stores
them in the relay log. The SQL thread reads events from the relay log
and executes them. START SLAVE requires the SUPER privilege.

If START SLAVE succeeds in starting the slave threads, it returns
without any error. However, even in that case, it might be that the
slave threads start and then later stop (for example, because they do
not manage to connect to the master or read its binary log, or some
other problem). START SLAVE does not warn you about this. You must
check the slave''s error log for error messages generated by the slave
threads, or check that they are running satisfactorily with SHOW SLAVE
STATUS.

URL: https://mariadb.com/kb/en/start-slave/

', '', 'https://mariadb.com/kb/en/start-slave/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (326, 'FLUSH', 26, 'Syntax:
FLUSH [NO_WRITE_TO_BINLOG | LOCAL]
    flush_option [, flush_option] ...

The FLUSH statement has several variant forms that clear or reload
various internal caches, flush tables, or acquire locks. To execute
FLUSH, you must have the RELOAD privilege. Specific flush options might
require additional privileges, as described later.

By default, the server writes FLUSH statements to the binary log so
that they replicate to replication slaves. To suppress logging, use the
optional NO_WRITE_TO_BINLOG keyword or its alias LOCAL.

*Note*: FLUSH LOGS, FLUSH MASTER, FLUSH SLAVE, and FLUSH TABLES WITH
READ LOCK (with or without a table list) are not written to the binary
log in any case because they would cause problems if replicated to a
slave.

The FLUSH statement causes an implicit commit. See
http://dev.mysql.com/doc/refman/5.5/en/implicit-commit.html.

The RESET statement is similar to FLUSH. See [HELP RESET], for
information about using the RESET statement with replication.

URL: https://mariadb.com/kb/en/flush/

', '', 'https://mariadb.com/kb/en/flush/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (327, 'BEGIN END', 23, 'Syntax:
[begin_label:] BEGIN
    [statement_list]
END [end_label]

BEGIN ... END syntax is used for writing compound statements, which can
appear within stored programs (stored procedures and functions,
triggers, and events). A compound statement can contain multiple
statements, enclosed by the BEGIN and END keywords. statement_list
represents a list of one or more statements, each terminated by a
semicolon (;) statement delimiter. The statement_list itself is
optional, so the empty compound statement (BEGIN END) is legal.

BEGIN ... END blocks can be nested.

Use of multiple statements requires that a client is able to send
statement strings containing the ; statement delimiter. In the mysql
command-line client, this is handled with the delimiter command.
Changing the ; end-of-statement delimiter (for example, to //) permit ;
to be used in a program body. For an example, see
https://mariadb.com/kb/en/stored-procedure-overview/.

A BEGIN ... END block can be labeled. See [HELP labels].

URL: https://mariadb.com/kb/en/begin-end/

', '', 'https://mariadb.com/kb/en/begin-end/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (328, 'SHOW PROCEDURE STATUS', 26, 'Syntax:
SHOW PROCEDURE STATUS
    [LIKE ''pattern'' | WHERE expr]

This statement is a MySQL extension. It returns characteristics of a
stored procedure, such as the database, name, type, creator, creation
and modification dates, and character set information. A similar
statement, SHOW FUNCTION STATUS, displays information about stored
functions (see [HELP SHOW FUNCTION STATUS]).

The LIKE clause, if present, indicates which procedure or function
names to match. The WHERE clause can be given to select rows using more
general conditions, as discussed in
https://mariadb.com/kb/en/extended-show/.

URL: https://mariadb.com/kb/en/show-procedure-status/

', 'MariaDB> SHOW PROCEDURE STATUS LIKE ''sp1''\\G
*************************** 1. row ***************************
                  Db: test
                Name: sp1
                Type: PROCEDURE
             Definer: testuser@localhost
            Modified: 2004-08-03 15:29:37
             Created: 2004-08-03 15:29:37
       Security_type: DEFINER
             Comment:
character_set_client: latin1
collation_connection: latin1_swedish_ci
  Database Collation: latin1_swedish_ci
', 'https://mariadb.com/kb/en/show-procedure-status/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (329, 'DESCRIBE', 28, 'Syntax:
{DESCRIBE | DESC} tbl_name [col_name | wild]

DESCRIBE provides information about the columns in a table. It is a
shortcut for SHOW COLUMNS FROM. These statements also display
information for views. (See [HELP SHOW COLUMNS].)

col_name can be a column name, or a string containing the SQL "%" and
"_" wildcard characters to obtain output only for the columns with
names matching the string. There is no need to enclose the string
within quotation marks unless it contains spaces or other special
characters.

MariaDB> DESCRIBE City;
+------------+----------+------+-----+---------+----------------+
| Field      | Type     | Null | Key | Default | Extra          |
+------------+----------+------+-----+---------+----------------+
| Id         | int(11)  | NO   | PRI | NULL    | auto_increment |
| Name       | char(35) | NO   |     |         |                |
| Country    | char(3)  | NO   | UNI |         |                |
| District   | char(20) | YES  | MUL |         |                |
| Population | int(11)  | NO   |     | 0       |                |
+------------+----------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

The description for SHOW COLUMNS provides more information about the
output columns (see [HELP SHOW COLUMNS]).

URL: https://mariadb.com/kb/en/describe/

', '', 'https://mariadb.com/kb/en/describe/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (331, 'DROP USER', 10, 'Syntax:
DROP USER user [, user] ...

The DROP USER statement removes one or more MySQL accounts and their
privileges. It removes privilege rows for the account from all grant
tables. To use this statement, you must have the global CREATE USER
privilege or the DELETE privilege for the mysql database. Each account
name uses the format described in
https://mariadb.com/kb/en/create-user#account-names. For example:

DROP USER ''jeffrey''@''localhost'';

If you specify only the user name part of the account name, a host name
part of ''%'' is used.

URL: https://mariadb.com/kb/en/drop-user/

', '', 'https://mariadb.com/kb/en/drop-user/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (332, 'STDDEV_POP', 16, 'Syntax:
STDDEV_POP(expr)

Returns the population standard deviation of expr (the square root of
VAR_POP()). You can also use STD() or STDDEV(), which are equivalent
but not standard SQL.

STDDEV_POP() returns NULL if there were no matching rows.

URL: https://mariadb.com/kb/en/stddev_pop/

', '', 'https://mariadb.com/kb/en/stddev_pop/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (335, 'ISEMPTY', 36, 'IsEmpty(g)

Returns 1 if the geometry value g is the empty geometry, 0 if it is not
empty, and -1 if the argument is NULL. If the geometry is empty, it
represents the empty point set.

URL: https://mariadb.com/kb/en/isempty/

', '', 'https://mariadb.com/kb/en/isempty/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (336, 'SHOW FUNCTION STATUS', 26, 'Syntax:
SHOW FUNCTION STATUS
    [LIKE ''pattern'' | WHERE expr]

This statement is similar to SHOW PROCEDURE STATUS but for stored
functions. See [HELP SHOW PROCEDURE STATUS].

URL: https://mariadb.com/kb/en/show-function-status/

', '', 'https://mariadb.com/kb/en/show-function-status/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (330, 'SHOW WARNINGS', 26, 'Syntax:
SHOW WARNINGS [LIMIT [offset,] row_count]
SHOW COUNT(*) WARNINGS

SHOW WARNINGS shows information about the conditions (errors, warnings,
and notes) that resulted from the last statement in the current session
that generated messages. It shows nothing if the last statement used a
table and generated no messages. (That is, a statement that uses a
table but generates no messages clears the message list.) Statements
that do not use tables and do not generate messages have no effect on
the message list.

Warnings are generated for DML statements such as INSERT, UPDATE, and
LOAD DATA INFILE as well as DDL statements such as CREATE TABLE and
ALTER TABLE.

SHOW WARNINGS is also used following EXPLAIN EXTENDED, to display the
extra information generated by EXPLAIN when the EXTENDED keyword is
used. See https://mariadb.com/kb/en/explain#explain-extended.

The LIMIT clause has the same syntax as for the SELECT statement. See
https://mariadb.com/kb/en/select/.

A related statement, SHOW ERRORS, shows only the error conditions (it
excludes warnings and notes). See [HELP SHOW ERRORS].

The SHOW COUNT(*) WARNINGS statement displays the total number of
errors, warnings, and notes. You can also retrieve this number from the
warning_count system variable:

SHOW COUNT(*) WARNINGS;
SELECT @@warning_count;

URL: https://mariadb.com/kb/en/show-warnings/

', '', 'https://mariadb.com/kb/en/show-warnings/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (333, 'SHOW CHARACTER SET', 26, 'Syntax:
SHOW CHARACTER SET
    [LIKE ''pattern'' | WHERE expr]

The SHOW CHARACTER SET statement shows all available character sets.
The LIKE clause, if present, indicates which character set names to
match. The WHERE clause can be given to select rows using more general
conditions, as discussed in
https://mariadb.com/kb/en/extended-show/. For example:

MariaDB> SHOW CHARACTER SET LIKE ''latin%'';
+---------+-----------------------------+-------------------+--------+
| Charset | Description                 | Default collation | Maxlen |
+---------+-----------------------------+-------------------+--------+
| latin1  | cp1252 West European        | latin1_swedish_ci |      1 |
| latin2  | ISO 8859-2 Central European | latin2_general_ci |      1 |
| latin5  | ISO 8859-9 Turkish          | latin5_turkish_ci |      1 |
| latin7  | ISO 8859-13 Baltic          | latin7_general_ci |      1 |
+---------+-----------------------------+-------------------+--------+

URL: https://mariadb.com/kb/en/show-character-set/

', '', 'https://mariadb.com/kb/en/show-character-set/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (334, 'SUBSTRING', 37, 'Syntax:
SUBSTRING(str,pos), SUBSTRING(str FROM pos), SUBSTRING(str,pos,len),
SUBSTRING(str FROM pos FOR len)

The forms without a len argument return a substring from string str
starting at position pos. The forms with a len argument return a
substring len characters long from string str, starting at position
pos. The forms that use FROM are standard SQL syntax. It is also
possible to use a negative value for pos. In this case, the beginning
of the substring is pos characters from the end of the string, rather
than the beginning. A negative value may be used for pos in any of the
forms of this function.

For all forms of SUBSTRING(), the position of the first character in
the string from which the substring is to be extracted is reckoned as
1.

URL: https://mariadb.com/kb/en/substring/

', 'MariaDB> SELECT SUBSTRING(''Quadratically'',5);
        -> ''ratically''
MariaDB> SELECT SUBSTRING(''foobarbar'' FROM 4);
        -> ''barbar''
MariaDB> SELECT SUBSTRING(''Quadratically'',5,6);
        -> ''ratica''
MariaDB> SELECT SUBSTRING(''Sakila'', -3);
        -> ''ila''
MariaDB> SELECT SUBSTRING(''Sakila'', -5, 3);
        -> ''aki''
MariaDB> SELECT SUBSTRING(''Sakila'' FROM -4 FOR 2);
        -> ''ki''
', 'https://mariadb.com/kb/en/substring/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (337, 'LTRIM', 37, 'Syntax:
LTRIM(str)

Returns the string str with leading space characters removed.

URL: https://mariadb.com/kb/en/ltrim/

', 'MariaDB> SELECT LTRIM(''  barbar'');
        -> ''barbar''
', 'https://mariadb.com/kb/en/ltrim/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (338, 'INTERSECTS', 30, 'Intersects(g1,g2)

Returns 1 or 0 to indicate whether g1 spatially intersects g2.

URL: https://mariadb.com/kb/en/intersects/

', '', 'https://mariadb.com/kb/en/intersects/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (339, 'CALL', 27, 'Syntax:
CALL sp_name([parameter[,...]])
CALL sp_name[()]

The CALL statement invokes a stored procedure that was defined
previously with CREATE PROCEDURE.

Stored procedures that take no arguments can be invoked without
parentheses. That is, CALL p() and CALL p are equivalent.

CALL can pass back values to its caller using parameters that are
declared as OUT or INOUT parameters. When the procedure returns, a
client program can also obtain the number of rows affected for the
final statement executed within the routine: At the SQL level, call the
ROW_COUNT() function; from the C API, call the mysql_affected_rows()
function.

URL: https://mariadb.com/kb/en/call/

', '', 'https://mariadb.com/kb/en/call/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (340, 'MBRDISJOINT', 6, 'MBRDisjoint(g1,g2)

Returns 1 or 0 to indicate whether the Minimum Bounding Rectangles of
the two geometries g1 and g2 are disjoint (do not intersect).

URL: https://mariadb.com/kb/en/mbrdisjoint/

', '', 'https://mariadb.com/kb/en/mbrdisjoint/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (342, 'SUBSTRING_INDEX', 37, 'Syntax:
SUBSTRING_INDEX(str,delim,count)

Returns the substring from string str before count occurrences of the
delimiter delim. If count is positive, everything to the left of the
final delimiter (counting from the left) is returned. If count is
negative, everything to the right of the final delimiter (counting from
the right) is returned. SUBSTRING_INDEX() performs a case-sensitive
match when searching for delim.

URL: https://mariadb.com/kb/en/substring_index/

', 'MariaDB> SELECT SUBSTRING_INDEX(''www.mariadb.org'', ''.'', 2);
        -> ''www.mariadb''
MariaDB> SELECT SUBSTRING_INDEX(''www.mariadb.org'', ''.'', -2);
        -> ''mariadb.org''
', 'https://mariadb.com/kb/en/substring_index/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (343, 'ENCODE', 12, 'Syntax:
ENCODE(str,pass_str)

Encrypt str using pass_str as the password. To decrypt the result, use
DECODE().

The result is a binary string of the same length as str.

The strength of the encryption is based on how good the random
generator is. It should suffice for short strings.

URL: https://mariadb.com/kb/en/encode/

', '', 'https://mariadb.com/kb/en/encode/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (345, 'TRUNCATE', 4, 'Syntax:
TRUNCATE(X,D)

Returns the number X, truncated to D decimal places. If D is 0, the
result has no decimal point or fractional part. D can be negative to
cause D digits left of the decimal point of the value X to become zero.

URL: https://mariadb.com/kb/en/truncate/

', 'MariaDB> SELECT TRUNCATE(1.223,1);
        -> 1.2
MariaDB> SELECT TRUNCATE(1.999,1);
        -> 1.9
MariaDB> SELECT TRUNCATE(1.999,0);
        -> 1
MariaDB> SELECT TRUNCATE(-1.999,1);
        -> -1.9
MariaDB> SELECT TRUNCATE(122,-2);
       -> 100
MariaDB> SELECT TRUNCATE(10.28*100,0);
       -> 1028
', 'https://mariadb.com/kb/en/truncate/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (348, 'GREATEST', 18, 'Syntax:
GREATEST(value1,value2,...)

With two or more arguments, returns the largest (maximum-valued)
argument. The arguments are compared using the same rules as for
LEAST().

URL: https://mariadb.com/kb/en/greatest/

', 'MariaDB> SELECT GREATEST(2,0);
        -> 2
MariaDB> SELECT GREATEST(34.0,3.0,5.0,767.0);
        -> 767.0
MariaDB> SELECT GREATEST(''B'',''A'',''C'');
        -> ''C''
', 'https://mariadb.com/kb/en/greatest/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (341, 'VALUES', 14, 'Syntax:
VALUES(col_name)

In an INSERT ... ON DUPLICATE KEY UPDATE statement, you can use the
VALUES(col_name) function in the UPDATE clause to refer to column
values from the INSERT portion of the statement. In other words,
VALUES(col_name) in the UPDATE clause refers to the value of col_name
that would be inserted, had no duplicate-key conflict occurred. This
function is especially useful in multiple-row inserts. The VALUES()
function is meaningful only in the ON DUPLICATE KEY UPDATE clause of
INSERT statements and returns NULL otherwise. See
https://mariadb.com/kb/en/insert-on-duplicate-key-update/.

URL: https://mariadb.com/kb/en/values/

', 'MariaDB> INSERT INTO table (a,b,c) VALUES (1,2,3),(4,5,6)
    -> ON DUPLICATE KEY UPDATE c=VALUES(a)+VALUES(b);
', 'https://mariadb.com/kb/en/values/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (344, 'LOOP', 23, 'Syntax:
[begin_label:] LOOP
    statement_list
END LOOP [end_label]

LOOP implements a simple loop construct, enabling repeated execution of
the statement list, which consists of one or more statements, each
terminated by a semicolon (;) statement delimiter. The statements
within the loop are repeated until the loop is terminated. Usually,
this is accomplished with a LEAVE statement. Within a stored function,
RETURN can also be used, which exits the function entirely.

Neglecting to include a loop-termination statement results in an
infinite loop.

A LOOP statement can be labeled. For the rules regarding label use, see
[HELP labels].

URL: https://mariadb.com/kb/en/loop/

', 'CREATE PROCEDURE doiterate(p1 INT)
BEGIN
  label1: LOOP
    SET p1 = p1 + 1;
    IF p1 < 10 THEN
      ITERATE label1;
    END IF;
    LEAVE label1;
  END LOOP label1;
  SET @x = p1;
END;
', 'https://mariadb.com/kb/en/loop/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (346, 'TIMESTAMPADD', 31, 'Syntax:
TIMESTAMPADD(unit,interval,datetime_expr)

Adds the integer expression interval to the date or datetime expression
datetime_expr. The unit for interval is given by the unit argument,
which should be one of the following values: MICROSECOND
(microseconds), SECOND, MINUTE, HOUR, DAY, WEEK, MONTH, QUARTER, or
YEAR.

It is possible to use FRAC_SECOND in place of MICROSECOND, but
FRAC_SECOND is deprecated. FRAC_SECOND was removed in MySQL 5.5.3.

The unit value may be specified using one of keywords as shown, or with
a prefix of SQL_TSI_. For example, DAY and SQL_TSI_DAY both are legal.

URL: https://mariadb.com/kb/en/timestampadd/

', 'MariaDB> SELECT TIMESTAMPADD(MINUTE,1,''2003-01-02'');
        -> ''2003-01-02 00:01:00''
MariaDB> SELECT TIMESTAMPADD(WEEK,1,''2003-01-02'');
        -> ''2003-01-09''
', 'https://mariadb.com/kb/en/timestampadd/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (347, 'SHOW', 26, 'SHOW has many forms that provide information about databases, tables,
columns, or status information about the server. This section describes
those following:

SHOW AUTHORS
SHOW {BINARY | MASTER} LOGS
SHOW BINLOG EVENTS [IN ''log_name''] [FROM pos] [LIMIT [offset,] row_count]
SHOW CHARACTER SET [like_or_where]
SHOW COLLATION [like_or_where]
SHOW [FULL] COLUMNS FROM tbl_name [FROM db_name] [like_or_where]
SHOW CONTRIBUTORS
SHOW CREATE DATABASE db_name
SHOW CREATE EVENT event_name
SHOW CREATE FUNCTION func_name
SHOW CREATE PROCEDURE proc_name
SHOW CREATE TABLE tbl_name
SHOW CREATE TRIGGER trigger_name
SHOW CREATE VIEW view_name
SHOW DATABASES [like_or_where]
SHOW ENGINE engine_name {STATUS | MUTEX}
SHOW [STORAGE] ENGINES
SHOW ERRORS [LIMIT [offset,] row_count]
SHOW EVENTS
SHOW FUNCTION CODE func_name
SHOW FUNCTION STATUS [like_or_where]
SHOW GRANTS FOR user
SHOW INDEX FROM tbl_name [FROM db_name]
SHOW MASTER STATUS
SHOW OPEN TABLES [FROM db_name] [like_or_where]
SHOW PLUGINS
SHOW PROCEDURE CODE proc_name
SHOW PROCEDURE STATUS [like_or_where]
SHOW PRIVILEGES
SHOW [FULL] PROCESSLIST
SHOW PROFILE [types] [FOR QUERY n] [OFFSET n] [LIMIT n]
SHOW PROFILES
SHOW SLAVE HOSTS
SHOW SLAVE STATUS
SHOW [GLOBAL | SESSION] STATUS [like_or_where]
SHOW TABLE STATUS [FROM db_name] [like_or_where]
SHOW [FULL] TABLES [FROM db_name] [like_or_where]
SHOW TRIGGERS [FROM db_name] [like_or_where]
SHOW [GLOBAL | SESSION] VARIABLES [like_or_where]
SHOW WARNINGS [LIMIT [offset,] row_count]

like_or_where:
    LIKE ''pattern''
  | WHERE expr

If the syntax for a given SHOW statement includes a LIKE ''pattern''
part, ''pattern'' is a string that can contain the SQL "%" and "_"
wildcard characters. The pattern is useful for restricting statement
output to matching values.

Several SHOW statements also accept a WHERE clause that provides more
flexibility in specifying which rows to display. See
https://mariadb.com/kb/en/extended-show/.

URL: https://mariadb.com/kb/en/show/

', '', 'https://mariadb.com/kb/en/show/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (349, 'SHOW VARIABLES', 26, 'Syntax:
SHOW [GLOBAL | SESSION] VARIABLES
    [LIKE ''pattern'' | WHERE expr]

SHOW VARIABLES shows the values of MySQL system variables. This
information also can be obtained using the mysqladmin variables
command. The LIKE clause, if present, indicates which variable names to
match. The WHERE clause can be given to select rows using more general
conditions, as discussed in
https://mariadb.com/kb/en/extended-show/. This
statement does not require any privilege. It requires only the ability
to connect to the server.

With the GLOBAL modifier, SHOW VARIABLES displays the values that are
used for new connections to MySQL. As of MySQL 5.5.3, if a variable has
no global value, no value is displayed. Before 5.5.3, the session value
is displayed. With SESSION, SHOW VARIABLES displays the values that are
in effect for the current connection. If no modifier is present, the
default is SESSION. LOCAL is a synonym for SESSION.
With a LIKE clause, the statement displays only rows for those
variables with names that match the pattern. To obtain the row for a
specific variable, use a LIKE clause as shown:

SHOW VARIABLES LIKE ''max_join_size'';
SHOW SESSION VARIABLES LIKE ''max_join_size'';

To get a list of variables whose name match a pattern, use the "%"
wildcard character in a LIKE clause:

SHOW VARIABLES LIKE ''%size%'';
SHOW GLOBAL VARIABLES LIKE ''%size%'';

Wildcard characters can be used in any position within the pattern to
be matched. Strictly speaking, because "_" is a wildcard that matches
any single character, you should escape it as "\\_" to match it
literally. In practice, this is rarely necessary.

URL: https://mariadb.com/kb/en/show-variables/

', '', 'https://mariadb.com/kb/en/show-variables/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (350, 'BINLOG', 26, 'Syntax:
BINLOG ''str''

BINLOG is an internal-use statement. It is generated by the mysqlbinlog
program as the printable representation of certain events in binary log
files. (See https://mariadb.com/kb/en/mysqlbinlog/.)
The ''str'' value is a base 64-encoded string the that server decodes to
determine the data change indicated by the corresponding event. This
statement requires the SUPER privilege.

URL: https://mariadb.com/kb/en/binlog/

', '', 'https://mariadb.com/kb/en/binlog/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (351, 'BIT_AND', 16, 'Syntax:
BIT_AND(expr)

Returns the bitwise AND of all bits in expr. The calculation is
performed with 64-bit (BIGINT) precision.

URL: https://mariadb.com/kb/en/bit_and/

', '', 'https://mariadb.com/kb/en/bit_and/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (352, 'SECOND', 31, 'Syntax:
SECOND(time)

Returns the second for time, in the range 0 to 59.

URL: https://mariadb.com/kb/en/second/

', 'MariaDB> SELECT SECOND(''10:05:03'');
        -> 3
', 'https://mariadb.com/kb/en/second/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (353, 'ATAN2', 4, 'Syntax:
ATAN(Y,X), ATAN2(Y,X)

Returns the arc tangent of the two variables X and Y. It is similar to
calculating the arc tangent of Y / X, except that the signs of both
arguments are used to determine the quadrant of the result.

URL: https://mariadb.com/kb/en/atan2/

', 'MariaDB> SELECT ATAN(-2,2);
        -> -0.78539816339745
MariaDB> SELECT ATAN2(PI(),0);
        -> 1.5707963267949
', 'https://mariadb.com/kb/en/atan2/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (354, 'MBRCONTAINS', 6, 'MBRContains(g1,g2)

Returns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1
contains the Minimum Bounding Rectangle of g2. This tests the opposite
relationship as MBRWithin().

URL: https://mariadb.com/kb/en/mbrcontains/

', 'MariaDB> SET @g1 = GeomFromText(''Polygon((0 0,0 3,3 3,3 0,0 0))'');
MariaDB> SET @g2 = GeomFromText(''Point(1 1)'');
MariaDB> SELECT MBRContains(@g1,@g2), MBRContains(@g2,@g1);
----------------------+----------------------+
| MBRContains(@g1,@g2) | MBRContains(@g2,@g1) |
+----------------------+----------------------+
|                    1 |                    0 |
+----------------------+----------------------+
', 'https://mariadb.com/kb/en/mbrcontains/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (355, 'HOUR', 31, 'Syntax:
HOUR(time)

Returns the hour for time. The range of the return value is 0 to 23 for
time-of-day values. However, the range of TIME values actually is much
larger, so HOUR can return values greater than 23.

URL: https://mariadb.com/kb/en/hour/

', 'MariaDB> SELECT HOUR(''10:05:03'');
        -> 10
MariaDB> SELECT HOUR(''272:59:59'');
        -> 272
', 'https://mariadb.com/kb/en/hour/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (356, 'SELECT', 27, 'Syntax:
SELECT
    [ALL | DISTINCT | DISTINCTROW ]
      [HIGH_PRIORITY]
      [STRAIGHT_JOIN]
      [SQL_SMALL_RESULT] [SQL_BIG_RESULT] [SQL_BUFFER_RESULT]
      [SQL_CACHE | SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS]
    select_expr [, select_expr ...]
    [FROM table_references
    [WHERE where_condition]
    [GROUP BY {col_name | expr | position}
      [ASC | DESC], ... [WITH ROLLUP]]
    [HAVING where_condition]
    [ORDER BY {col_name | expr | position}
      [ASC | DESC], ...]
    [LIMIT {[offset,] row_count | row_count OFFSET offset}]
    [PROCEDURE procedure_name(argument_list)]
    [INTO OUTFILE ''file_name''
        [CHARACTER SET charset_name]
        export_options
      | INTO DUMPFILE ''file_name''
      | INTO var_name [, var_name]]
    [FOR UPDATE | LOCK IN SHARE MODE]]

SELECT is used to retrieve rows selected from one or more tables, and
can include UNION statements and subqueries. See [HELP UNION], and
https://mariadb.com/kb/en/subqueries/.

The most commonly used clauses of SELECT statements are these:

o Each select_expr indicates a column that you want to retrieve. There
  must be at least one select_expr.

o table_references indicates the table or tables from which to retrieve
  rows. Its syntax is described in [HELP JOIN].

o The WHERE clause, if given, indicates the condition or conditions
  that rows must satisfy to be selected. where_condition is an
  expression that evaluates to true for each row to be selected. The
  statement selects all rows if there is no WHERE clause.

  In the WHERE expression, you can use any of the functions and
  operators that MySQL supports, except for aggregate (summary)
  functions. See
  https://mariadb.com/kb/en/select#select-expressions, and
  https://mariadb.com/kb/en/functions-and-operators/.

SELECT can also be used to retrieve rows computed without reference to
any table.

URL: https://mariadb.com/kb/en/select/

', '', 'https://mariadb.com/kb/en/select/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (357, 'COT', 4, 'Syntax:
COT(X)

Returns the cotangent of X.

URL: https://mariadb.com/kb/en/cot/

', 'MariaDB> SELECT COT(12);
        -> -1.5726734063977
MariaDB> SELECT COT(0);
        -> NULL
', 'https://mariadb.com/kb/en/cot/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (358, 'SHOW CREATE EVENT', 26, 'Syntax:
SHOW CREATE EVENT event_name

This statement displays the CREATE EVENT statement needed to re-create
a given event. It requires the EVENT privilege for the database from
which the event is to be shown. For example (using the same event
e_daily defined and then altered in [HELP SHOW EVENTS]):

URL: https://mariadb.com/kb/en/show-create-event/

', 'MariaDB> SHOW CREATE EVENT test.e_daily\\G
*************************** 1. row ***************************
               Event: e_daily
            sql_mode:
           time_zone: SYSTEM
        Create Event: CREATE EVENT `e_daily`
                        ON SCHEDULE EVERY 1 DAY
                        STARTS CURRENT_TIMESTAMP + INTERVAL 6 HOUR
                        ON COMPLETION NOT PRESERVE
                        ENABLE
                        COMMENT ''Saves total number of sessions then
                                clears the table each day''
                        DO BEGIN
                          INSERT INTO site_activity.totals (time, total)
                            SELECT CURRENT_TIMESTAMP, COUNT(*)
                            FROM site_activity.sessions;
                          DELETE FROM site_activity.sessions;
                        END
character_set_client: latin1
collation_connection: latin1_swedish_ci
  Database Collation: latin1_swedish_ci
', 'https://mariadb.com/kb/en/show-create-event/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (359, 'LOAD_FILE', 37, 'Syntax:
LOAD_FILE(file_name)

Reads the file and returns the file contents as a string. To use this
function, the file must be located on the server host, you must specify
the full path name to the file, and you must have the FILE privilege.
The file must be readable by all and its size less than
max_allowed_packet bytes. If the secure_file_priv system variable is
set to a nonempty directory name, the file to be loaded must be located
in that directory.

If the file does not exist or cannot be read because one of the
preceding conditions is not satisfied, the function returns NULL.

The character_set_filesystem system variable controls interpretation of
file names that are given as literal strings.

URL: https://mariadb.com/kb/en/load_file/

', 'MariaDB> UPDATE t
            SET blob_col=LOAD_FILE(''/tmp/picture'')
            WHERE id=1;
', 'https://mariadb.com/kb/en/load_file/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (360, 'POINTFROMTEXT', 3, 'PointFromText(wkt[,srid])

Constructs a POINT value using its WKT representation and SRID.

URL: https://mariadb.com/kb/en/pointfromtext/

', '', 'https://mariadb.com/kb/en/pointfromtext/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (361, 'GROUP_CONCAT', 16, 'Syntax:
GROUP_CONCAT(expr)

This function returns a string result with the concatenated non-NULL
values from a group. It returns NULL if there are no non-NULL values.
The full syntax is as follows:

GROUP_CONCAT([DISTINCT] expr [,expr ...]
             [ORDER BY {unsigned_integer | col_name | expr}
                 [ASC | DESC] [,col_name ...]]
             [SEPARATOR str_val])

URL: https://mariadb.com/kb/en/group_concat/

', 'MariaDB> SELECT student_name,
    ->     GROUP_CONCAT(test_score)
    ->     FROM student
    ->     GROUP BY student_name;
', 'https://mariadb.com/kb/en/group_concat/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (362, 'DATE_FORMAT', 31, 'Syntax:
DATE_FORMAT(date,format)

Formats the date value according to the format string.

URL: https://mariadb.com/kb/en/date_format/

', 'MariaDB> SELECT DATE_FORMAT(''2009-10-04 22:23:00'', ''%W %M %Y'');
        -> ''Sunday October 2009''
MariaDB> SELECT DATE_FORMAT(''2007-10-04 22:23:00'', ''%H:%i:%s'');
        -> ''22:23:00''
MariaDB> SELECT DATE_FORMAT(''1900-10-04 22:23:00'',
    ->                 ''%D %y %a %d %m %b %j'');
        -> ''4th 00 Thu 04 10 Oct 277''
MariaDB> SELECT DATE_FORMAT(''1997-10-04 22:23:00'',
    ->                 ''%H %k %I %r %T %S %w'');
        -> ''22 22 10 10:23:00 PM 22:23:00 00 6''
MariaDB> SELECT DATE_FORMAT(''1999-01-01'', ''%X %V'');
        -> ''1998 52''
MariaDB> SELECT DATE_FORMAT(''2006-06-00'', ''%d'');
        -> ''00''
', 'https://mariadb.com/kb/en/date_format/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (363, 'BENCHMARK', 17, 'Syntax:
BENCHMARK(count,expr)

The BENCHMARK() function executes the expression expr repeatedly count
times. It may be used to time how quickly MySQL processes the
expression. The result value is always 0. The intended use is from
within the mysql client, which reports query execution times:

URL: https://mariadb.com/kb/en/benchmark/

', 'MariaDB> SELECT BENCHMARK(1000000,ENCODE(''hello'',''goodbye''));
+----------------------------------------------+
| BENCHMARK(1000000,ENCODE(''hello'',''goodbye'')) |
+----------------------------------------------+
|                                            0 |
+----------------------------------------------+
1 row in set (4.74 sec)
', 'https://mariadb.com/kb/en/benchmark/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (364, 'YEAR', 31, 'Syntax:
YEAR(date)

Returns the year for date, in the range 1000 to 9999, or 0 for the
"zero" date.

URL: https://mariadb.com/kb/en/year/

', 'MariaDB> SELECT YEAR(''1987-01-01'');
        -> 1987
', 'https://mariadb.com/kb/en/year/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (365, 'SHOW ENGINE', 26, 'Syntax:
SHOW ENGINE engine_name {STATUS | MUTEX}

SHOW ENGINE displays operational information about a storage engine.
The following statements currently are supported:

SHOW ENGINE INNODB STATUS
SHOW ENGINE INNODB MUTEX
SHOW ENGINE PERFORMANCE_SCHEMA STATUS

SHOW ENGINE INNODB STATUS displays extensive information from the
standard InnoDB Monitor about the state of the InnoDB storage engine.
For information about the standard monitor and other InnoDB Monitors
that provide information about InnoDB processing, see
http://dev.mysql.com/doc/refman/5.5/en/innodb-monitors.html.

SHOW ENGINE INNODB MUTEX displays InnoDB mutex statistics. The
statement displays the following fields:

o Type

  Always InnoDB.

o Name

  The source file where the mutex is implemented, and the line number
  in the file where the mutex is created. The line number may change
  depending on your version of MySQL.

o Status

  The mutex status. This field displays several values if UNIV_DEBUG
  was defined at MySQL compilation time (for example, in include/univ.i
  in the InnoDB part of the MySQL source tree). If UNIV_DEBUG was not
  defined, the statement displays only the os_waits value. In the
  latter case (without UNIV_DEBUG), the information on which the output
  is based is insufficient to distinguish regular mutexes and mutexes
  that protect rw-locks (which permit multiple readers or a single
  writer). Consequently, the output may appear to contain multiple rows
  for the same mutex.

  o count indicates how many times the mutex was requested.

  o spin_waits indicates how many times the spinlock had to run.

  o spin_rounds indicates the number of spinlock rounds. (spin_rounds
    divided by spin_waits provides the average round count.)

  o os_waits indicates the number of operating system waits. This
    occurs when the spinlock did not work (the mutex was not locked
    during the spinlock and it was necessary to yield to the operating
    system and wait).

  o os_yields indicates the number of times a the thread trying to lock
    a mutex gave up its timeslice and yielded to the operating system
    (on the presumption that permitting other threads to run will free
    the mutex so that it can be locked).

  o os_wait_times indicates the amount of time (in ms) spent in
    operating system waits, if the timed_mutexes system variable is 1
    (ON). If timed_mutexes is 0 (OFF), timing is disabled, so
    os_wait_times is 0. timed_mutexes is off by default.

Information from this statement can be used to diagnose system
problems. For example, large values of spin_waits and spin_rounds may
indicate scalability problems.

Use SHOW ENGINE PERFORMANCE_SCHEMA STATUS to inspect the internal
operation of the Performance Schema code:

MariaDB> SHOW ENGINE PERFORMANCE_SCHEMA STATUS\\G
...
*************************** 3. row ***************************
  Type: performance_schema
  Name: events_waits_history.row_size
Status: 76
*************************** 4. row ***************************
  Type: performance_schema
  Name: events_waits_history.row_count
Status: 10000
*************************** 5. row ***************************
  Type: performance_schema
  Name: events_waits_history.memory
Status: 760000
...
*************************** 57. row ***************************
  Type: performance_schema
  Name: performance_schema.memory
Status: 26459600
...

The intent of this statement is to help the DBA to understand the
effects that different options have on memory requirements.

Name values consist of two parts, which name an internal buffer and an
attribute of the buffer, respectively:

o Internal buffers that are exposed as a table in the
  performance_schema database are named after the table. Examples:
  events_waits_history.row_size, mutex_instances.row_count.

o Internal buffers that are not exposed as a table are named within
  parentheses. Examples: (pfs_cond_class).row_size,
  (pfs_mutex_class).memory.

o Values that apply to the Performance Schema as a whole begin with
  performance_schema. Example: performance_schema.memory.

Attributes have these meanings:

o row_size cannot be changed. It is the size of the internal record
  used by the implementation.

o row_count can be changed depending on the configuration options.

o For a table, tbl_name.memory is the product of row_size multiplied by
  row_count. For the Performance Schema as a whole,
  performance_schema.memory is the sum of all the memory used (the sum
  of all other memory values).

In some cases, there is a direct relationship between a configuration
parameter and a SHOW ENGINE value. For example,
events_waits_history_long.row_count corresponds to
performance_schema_events_waits_history_long_size. In other cases, the
relationship is more complex. For example,
events_waits_history.row_count corresponds to
performance_schema_events_waits_history_size (the number of rows per
thread) multiplied by performance_schema_max_thread_instances ( the
number of threads).

URL: https://mariadb.com/kb/en/show-engine/

', '', 'https://mariadb.com/kb/en/show-engine/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (366, 'NAME_CONST', 14, 'Syntax:
NAME_CONST(name,value)

Returns the given value. When used to produce a result set column,
NAME_CONST() causes the column to have the given name. The arguments
should be constants.

MariaDB> SELECT NAME_CONST(''myname'', 14);
+--------+
| myname |
+--------+
|     14 |
+--------+

URL: https://mariadb.com/kb/en/name_const/

', '', 'https://mariadb.com/kb/en/name_const/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (367, 'RELEASE_LOCK', 14, 'Syntax:
RELEASE_LOCK(str)

Releases the lock named by the string str that was obtained with
GET_LOCK(). Returns 1 if the lock was released, 0 if the lock was not
established by this thread (in which case the lock is not released),
and NULL if the named lock did not exist. The lock does not exist if it
was never obtained by a call to GET_LOCK() or if it has previously been
released.

The DO statement is convenient to use with RELEASE_LOCK(). See [HELP
DO].

URL: https://mariadb.com/kb/en/release_lock/

', '', 'https://mariadb.com/kb/en/release_lock/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (368, 'IS NULL', 18, 'Syntax:
IS NULL

Tests whether a value is NULL.

URL: https://mariadb.com/kb/en/is-null/

', 'MariaDB> SELECT 1 IS NULL, 0 IS NULL, NULL IS NULL;
        -> 0, 0, 1
', 'https://mariadb.com/kb/en/is-null/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (369, 'CONVERT_TZ', 31, 'Syntax:
CONVERT_TZ(dt,from_tz,to_tz)

CONVERT_TZ() converts a datetime value dt from the time zone given by
from_tz to the time zone given by to_tz and returns the resulting
value. Time zones are specified as described in
https://mariadb.com/kb/en/time-zones/. This
function returns NULL if the arguments are invalid.

URL: https://mariadb.com/kb/en/convert_tz/

', 'MariaDB> SELECT CONVERT_TZ(''2004-01-01 12:00:00'',''GMT'',''MET'');
        -> ''2004-01-01 13:00:00''
MariaDB> SELECT CONVERT_TZ(''2004-01-01 12:00:00'',''+00:00'',''+10:00'');
        -> ''2004-01-01 22:00:00''
', 'https://mariadb.com/kb/en/convert_tz/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (370, 'TIME_TO_SEC', 31, 'Syntax:
TIME_TO_SEC(time)

Returns the time argument, converted to seconds.

URL: https://mariadb.com/kb/en/time_to_sec/

', 'MariaDB> SELECT TIME_TO_SEC(''22:23:00'');
        -> 80580
MariaDB> SELECT TIME_TO_SEC(''00:39:38'');
        -> 2378
', 'https://mariadb.com/kb/en/time_to_sec/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (371, 'WEEKDAY', 31, 'Syntax:
WEEKDAY(date)

Returns the weekday index for date (0 = Monday, 1 = Tuesday, ... 6 =
Sunday).

URL: https://mariadb.com/kb/en/weekday/

', 'MariaDB> SELECT WEEKDAY(''2008-02-03 22:23:00'');
        -> 6
MariaDB> SELECT WEEKDAY(''2007-11-06'');
        -> 1
', 'https://mariadb.com/kb/en/weekday/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (372, 'EXPORT_SET', 37, 'Syntax:
EXPORT_SET(bits,on,off[,separator[,number_of_bits]])

Returns a string such that for every bit set in the value bits, you get
an on string and for every bit not set in the value, you get an off
string. Bits in bits are examined from right to left (from low-order to
high-order bits). Strings are added to the result from left to right,
separated by the separator string (the default being the comma
character ","). The number of bits examined is given by number_of_bits,
which has a default of 64 if not specified. number_of_bits is silently
clipped to 64 if larger than 64. It is treated as an unsigned integer,
so a value of -1 is effectively the same as 64.

URL: https://mariadb.com/kb/en/export_set/

', 'MariaDB> SELECT EXPORT_SET(5,''Y'',''N'','','',4);
        -> ''Y,N,Y,N''
MariaDB> SELECT EXPORT_SET(6,''1'',''0'','','',10);
        -> ''0,1,1,0,0,0,0,0,0,0''
', 'https://mariadb.com/kb/en/export_set/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (373, 'ALTER SERVER', 39, 'Syntax:
ALTER SERVER  server_name
    OPTIONS (option [, option] ...)

Alters the server information for server_name, adjusting any of the
options permitted in the CREATE SERVER statement. See [HELP CREATE
SERVER]. The corresponding fields in the mysql.servers table are
updated accordingly. This statement requires the SUPER privilege.

URL: https://mariadb.com/kb/en/alter-server/

', 'ALTER SERVER s OPTIONS (USER ''sally'');
', 'https://mariadb.com/kb/en/alter-server/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (374, 'RESIGNAL', 23, 'Syntax:
RESIGNAL [condition_value]
    [SET signal_information_item
    [, signal_information_item] ...]

condition_value:
    SQLSTATE [VALUE] sqlstate_value
  | condition_name

signal_information_item:
    condition_information_item_name = simple_value_specification

condition_information_item_name:
    CLASS_ORIGIN
  | SUBCLASS_ORIGIN
  | MESSAGE_TEXT
  | MYSQL_ERRNO
  | CONSTRAINT_CATALOG
  | CONSTRAINT_SCHEMA
  | CONSTRAINT_NAME
  | CATALOG_NAME
  | SCHEMA_NAME
  | TABLE_NAME
  | COLUMN_NAME
  | CURSOR_NAME

condition_name, simple_value_specification:
    (see following discussion)

RESIGNAL passes on the error condition information that is available
during execution of a condition handler within a compound statement
inside a stored procedure or function, trigger, or event. RESIGNAL may
change some or all information before passing it on. RESIGNAL is
related to SIGNAL, but instead of originating a condition as SIGNAL
does, RESIGNAL relays existing condition information, possibly after
modifying it.

RESIGNAL makes it possible to both handle an error and return the error
information. Otherwise, by executing an SQL statement within the
handler, information that caused the handler''s activation is destroyed.
RESIGNAL also can make some procedures shorter if a given handler can
handle part of a situation, then pass the condition "up the line" to
another handler.

No special privileges are required to execute the RESIGNAL statement.

For condition_value and signal_information_item, the definitions and
rules are the same for RESIGNAL as for SIGNAL (see [HELP SIGNAL]).

The RESIGNAL statement takes condition_value and SET clauses, both of
which are optional. This leads to several possible uses:

o RESIGNAL alone:

RESIGNAL;

o RESIGNAL with new signal information:

RESIGNAL SET signal_information_item [, signal_information_item] ...;

o RESIGNAL with a condition value and possibly new signal information:

RESIGNAL condition_value
    [SET signal_information_item [, signal_information_item] ...];

URL: https://mariadb.com/kb/en/resignal/

', '', 'https://mariadb.com/kb/en/resignal/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (375, 'TIME FUNCTION', 31, 'Syntax:
TIME(expr)

Extracts the time part of the time or datetime expression expr and
returns it as a string.

URL: https://mariadb.com/kb/en/time-function/

', 'MariaDB> SELECT TIME(''2003-12-31 01:02:03'');
        -> ''01:02:03''
MariaDB> SELECT TIME(''2003-12-31 01:02:03.000123'');
        -> ''01:02:03.000123''
', 'https://mariadb.com/kb/en/time-function/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (376, 'DATE_ADD', 31, 'Syntax:
DATE_ADD(date,INTERVAL expr unit), DATE_SUB(date,INTERVAL expr unit)

These functions perform date arithmetic. The date argument specifies
the starting date or datetime value. expr is an expression specifying
the interval value to be added or subtracted from the starting date.
expr is a string; it may start with a "-" for negative intervals. unit
is a keyword indicating the units in which the expression should be
interpreted.

URL: https://mariadb.com/kb/en/date_add/

', 'MariaDB> SELECT ''2008-12-31 23:59:59'' + INTERVAL 1 SECOND;
        -> ''2009-01-01 00:00:00''
MariaDB> SELECT INTERVAL 1 DAY + ''2008-12-31'';
        -> ''2009-01-01''
MariaDB> SELECT ''2005-01-01'' - INTERVAL 1 SECOND;
        -> ''2004-12-31 23:59:59''
MariaDB> SELECT DATE_ADD(''2000-12-31 23:59:59'',
    ->                 INTERVAL 1 SECOND);
        -> ''2001-01-01 00:00:00''
MariaDB> SELECT DATE_ADD(''2010-12-31 23:59:59'',
    ->                 INTERVAL 1 DAY);
        -> ''2011-01-01 23:59:59''
MariaDB> SELECT DATE_ADD(''2100-12-31 23:59:59'',
    ->                 INTERVAL ''1:1'' MINUTE_SECOND);
        -> ''2101-01-01 00:01:00''
MariaDB> SELECT DATE_SUB(''2005-01-01 00:00:00'',
    ->                 INTERVAL ''1 1:1:1'' DAY_SECOND);
        -> ''2004-12-30 22:58:59''
MariaDB> SELECT DATE_ADD(''1900-01-01 00:00:00'',
    ->                 INTERVAL ''-1 10'' DAY_HOUR);
        -> ''1899-12-30 14:00:00''
MariaDB> SELECT DATE_SUB(''1998-01-02'', INTERVAL 31 DAY);
        -> ''1997-12-02''
MariaDB> SELECT DATE_ADD(''1992-12-31 23:59:59.000002'',
    ->            INTERVAL ''1.999999'' SECOND_MICROSECOND);
        -> ''1993-01-01 00:00:01.000001''
', 'https://mariadb.com/kb/en/date_add/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (377, 'CAST', 37, 'Syntax:
CAST(expr AS type)

The CAST() function takes an expression of any type and produces a
result value of a specified type, similar to CONVERT(). See the
description of CONVERT() for more information.

URL: https://mariadb.com/kb/en/cast/

', '', 'https://mariadb.com/kb/en/cast/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (378, 'SOUNDS LIKE', 37, 'Syntax:
expr1 SOUNDS LIKE expr2

This is the same as SOUNDEX(expr1) = SOUNDEX(expr2).

URL: https://mariadb.com/kb/en/sounds-like/

', '', 'https://mariadb.com/kb/en/sounds-like/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (379, 'PERIOD_DIFF', 31, 'Syntax:
PERIOD_DIFF(P1,P2)

Returns the number of months between periods P1 and P2. P1 and P2
should be in the format YYMM or YYYYMM. Note that the period arguments
P1 and P2 are not date values.

URL: https://mariadb.com/kb/en/period_diff/

', 'MariaDB> SELECT PERIOD_DIFF(200802,200703);
        -> 11
', 'https://mariadb.com/kb/en/period_diff/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (380, 'LIKE', 37, 'Syntax:
expr LIKE pat [ESCAPE ''escape_char'']

Pattern matching using SQL simple regular expression comparison.
Returns 1 (TRUE) or 0 (FALSE). If either expr or pat is NULL, the
result is NULL.

The pattern need not be a literal string. For example, it can be
specified as a string expression or table column.

URL: https://mariadb.com/kb/en/like/

', 'MariaDB> SELECT ''David!'' LIKE ''David_'';
        -> 1
MariaDB> SELECT ''David!'' LIKE ''%D%v%'';
        -> 1
', 'https://mariadb.com/kb/en/like/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (381, 'MULTIPOINT', 24, 'MultiPoint(pt1,pt2,...)

Constructs a MultiPoint value using Point or WKB Point arguments.

URL: https://mariadb.com/kb/en/multipoint/

', '', 'https://mariadb.com/kb/en/multipoint/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (382, '>>', 19, 'Syntax:
>>

Shifts a longlong (BIGINT) number to the right.

URL: https://mariadb.com/kb/en/shift-right/

', 'MariaDB> SELECT 4 >> 2;
        -> 1
', 'https://mariadb.com/kb/en/shift-right/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (383, 'FETCH', 23, 'Syntax:
FETCH [[NEXT] FROM] cursor_name INTO var_name [, var_name] ...

This statement fetches the next row for the SELECT statement associated
with the specified cursor (which must be open), and advances the cursor
pointer. If a row exists, the fetched columns are stored in the named
variables. The number of columns retrieved by the SELECT statement must
match the number of output variables specified in the FETCH statement.

If no more rows are available, a No Data condition occurs with SQLSTATE
value ''02000''. To detect this condition, you can set up a handler for
it (or for a NOT FOUND condition). For an example, see
https://mariadb.com/kb/en/cursor-overview/.

URL: https://mariadb.com/kb/en/fetch/

', '', 'https://mariadb.com/kb/en/fetch/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (384, 'AVG', 16, 'Syntax:
AVG([DISTINCT] expr)

Returns the average value of expr. The DISTINCT option can be used to
return the average of the distinct values of expr.

AVG() returns NULL if there were no matching rows.

URL: https://mariadb.com/kb/en/avg/

', 'MariaDB> SELECT student_name, AVG(test_score)
    ->        FROM student
    ->        GROUP BY student_name;
', 'https://mariadb.com/kb/en/avg/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (385, 'TRUE FALSE', 29, 'The constants TRUE and FALSE evaluate to 1 and 0, respectively. The
constant names can be written in any lettercase.

MariaDB> SELECT TRUE, true, FALSE, false;
        -> 1, 1, 0, 0

URL: https://mariadb.com/kb/en/true-false/

', '', 'https://mariadb.com/kb/en/true-false/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (386, 'MBRWITHIN', 6, 'MBRWithin(g1,g2)

Returns 1 or 0 to indicate whether the Minimum Bounding Rectangle of g1
is within the Minimum Bounding Rectangle of g2. This tests the opposite
relationship as MBRContains().

URL: https://mariadb.com/kb/en/mbrwithin/

', 'MariaDB> SET @g1 = GeomFromText(''Polygon((0 0,0 3,3 3,3 0,0 0))'');
MariaDB> SET @g2 = GeomFromText(''Polygon((0 0,0 5,5 5,5 0,0 0))'');
MariaDB> SELECT MBRWithin(@g1,@g2), MBRWithin(@g2,@g1);
+--------------------+--------------------+
| MBRWithin(@g1,@g2) | MBRWithin(@g2,@g1) |
+--------------------+--------------------+
|                  1 |                  0 |
+--------------------+--------------------+
', 'https://mariadb.com/kb/en/mbrwithin/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (387, 'SESSION_USER', 17, 'Syntax:
SESSION_USER()

SESSION_USER() is a synonym for USER().

URL: https://mariadb.com/kb/en/session_user/

', '', 'https://mariadb.com/kb/en/session_user/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (388, 'IN', 18, 'Syntax:
expr IN (value,...)

Returns 1 if expr is equal to any of the values in the IN list, else
returns 0. If all values are constants, they are evaluated according to
the type of expr and sorted. The search for the item then is done using
a binary search. This means IN is very quick if the IN value list
consists entirely of constants. Otherwise, type conversion takes place
according to the rules described in
https://mariadb.com/kb/en/type-conversion/, but
applied to all the arguments.

URL: https://mariadb.com/kb/en/in/

', 'MariaDB> SELECT 2 IN (0,3,5,7);
        -> 0
MariaDB> SELECT ''wefwf'' IN (''wee'',''wefwf'',''weg'');
        -> 1
', 'https://mariadb.com/kb/en/in/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (389, 'QUOTE', 37, 'Syntax:
QUOTE(str)

Quotes a string to produce a result that can be used as a properly
escaped data value in an SQL statement. The string is returned enclosed
by single quotation marks and with each instance of backslash ("\\"),
single quote ("''"), ASCII NUL, and Control+Z preceded by a backslash.
If the argument is NULL, the return value is the word "NULL" without
enclosing single quotation marks.

URL: https://mariadb.com/kb/en/quote/

', 'MariaDB> SELECT QUOTE(''Don\\''t!'');
        -> ''Don\\''t!''
MariaDB> SELECT QUOTE(NULL);
        -> NULL
', 'https://mariadb.com/kb/en/quote/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (390, 'HELP COMMAND', 26, 'Syntax:
MariaDB> help search_string

If you provide an argument to the help command, mysql uses it as a
search string to access server-side help from the contents of the MySQL
Reference Manual. The proper operation of this command requires that
the help tables in the mysql database be initialized with help topic
information .

If there is no match for the search string, the search fails:

MariaDB> help me

Nothing found
Please try to run ''help contents'' for a list of all accessible topics

Use help contents to see a list of the help categories:

MariaDB> help contents
You asked for help about help category: "Contents"
For more information, type ''help <item>'', where <item> is one of the
following categories:
   Account Management
   Administration
   Data Definition
   Data Manipulation
   Data Types
   Functions
   Functions and Modifiers for Use with GROUP BY
   Geographic Features
   Language Structure
   Plugins
   Storage Engines
   Stored Routines
   Table Maintenance
   Transactions
   Triggers

If the search string matches multiple items, mysql shows a list of
matching topics:

MariaDB> help logs
Many help items for your request exist.
To make a more specific request, please type ''help <item>'',
where <item> is one of the following topics:
   SHOW
   SHOW BINARY LOGS
   SHOW ENGINE
   SHOW LOGS

Use a topic as the search string to see the help entry for that topic:

MariaDB> help show binary logs
Name: ''SHOW BINARY LOGS''
Description:
Syntax:
SHOW BINARY LOGS
SHOW MASTER LOGS

Lists the binary log files on the server. This statement is used as
part of the procedure described in [purge-binary-logs], that shows how
to determine which logs can be purged.

MariaDB> SHOW BINARY LOGS;
+---------------+-----------+
| Log_name      | File_size |
+---------------+-----------+
| binlog.000015 |    724935 |
| binlog.000016 |    733481 |
+---------------+-----------+

URL: https://mariadb.com/kb/en/help-command/

', '', 'https://mariadb.com/kb/en/help-command/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (391, 'QUARTER', 31, 'Syntax:
QUARTER(date)

Returns the quarter of the year for date, in the range 1 to 4.

URL: https://mariadb.com/kb/en/quarter/

', 'MariaDB> SELECT QUARTER(''2008-04-01'');
        -> 2
', 'https://mariadb.com/kb/en/quarter/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (392, 'POSITION', 37, 'Syntax:
POSITION(substr IN str)

POSITION(substr IN str) is a synonym for LOCATE(substr,str).

URL: https://mariadb.com/kb/en/position/

', '', 'https://mariadb.com/kb/en/position/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (393, 'SHOW CREATE FUNCTION', 26, 'Syntax:
SHOW CREATE FUNCTION func_name

This statement is similar to SHOW CREATE PROCEDURE but for stored
functions. See [HELP SHOW CREATE PROCEDURE].

URL: https://mariadb.com/kb/en/show-create-function/

', '', 'https://mariadb.com/kb/en/show-create-function/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (394, 'IS_USED_LOCK', 14, 'Syntax:
IS_USED_LOCK(str)

Checks whether the lock named str is in use (that is, locked). If so,
it returns the connection identifier of the client that holds the lock.
Otherwise, it returns NULL.

URL: https://mariadb.com/kb/en/is_used_lock/

', '', 'https://mariadb.com/kb/en/is_used_lock/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (395, 'POLYFROMTEXT', 3, 'PolyFromText(wkt[,srid]), PolygonFromText(wkt[,srid])

Constructs a POLYGON value using its WKT representation and SRID.

URL: https://mariadb.com/kb/en/polyfromtext/

', '', 'https://mariadb.com/kb/en/polyfromtext/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (397, 'CEIL', 4, 'Syntax:
CEIL(X)

CEIL() is a synonym for CEILING().

URL: https://mariadb.com/kb/en/ceil/

', '', 'https://mariadb.com/kb/en/ceil/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (398, 'LENGTH', 37, 'Syntax:
LENGTH(str)

Returns the length of the string str, measured in bytes. A multi-byte
character counts as multiple bytes. This means that for a string
containing five 2-byte characters, LENGTH() returns 10, whereas
CHAR_LENGTH() returns 5.

URL: https://mariadb.com/kb/en/length/

', 'MariaDB> SELECT LENGTH(''text'');
        -> 4
', 'https://mariadb.com/kb/en/length/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (396, 'DES_ENCRYPT', 12, 'Syntax:
DES_ENCRYPT(str[,{key_num|key_str}])

Encrypts the string with the given key using the Triple-DES algorithm.

This function works only if MySQL has been configured with SSL support.
See https://mariadb.com/kb/en/ssl-connections/.

The encryption key to use is chosen based on the second argument to
DES_ENCRYPT(), if one was given. With no argument, the first key from
the DES key file is used. With a key_num argument, the given key number
(0 to 9) from the DES key file is used. With a key_str argument, the
given key string is used to encrypt str.

The key file can be specified with the --des-key-file server option.

The return string is a binary string where the first character is
CHAR(128 | key_num). If an error occurs, DES_ENCRYPT() returns NULL.

The 128 is added to make it easier to recognize an encrypted key. If
you use a string key, key_num is 127.

The string length for the result is given by this formula:

new_len = orig_len + (8 - (orig_len % 8)) + 1

Each line in the DES key file has the following format:

key_num des_key_str

Each key_num value must be a number in the range from 0 to 9. Lines in
the file may be in any order. des_key_str is the string that is used to
encrypt the message. There should be at least one space between the
number and the key. The first key is the default key that is used if
you do not specify any key argument to DES_ENCRYPT().

You can tell MySQL to read new key values from the key file with the
FLUSH DES_KEY_FILE statement. This requires the RELOAD privilege.

One benefit of having a set of default keys is that it gives
applications a way to check for the existence of encrypted column
values, without giving the end user the right to decrypt those values.

URL: https://mariadb.com/kb/en/des_encrypt/

', 'MariaDB> SELECT customer_address FROM customer_table 
     > WHERE crypted_credit_card = DES_ENCRYPT(''credit_card_number'');
', 'https://mariadb.com/kb/en/des_encrypt/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (399, 'STR_TO_DATE', 31, 'Syntax:
STR_TO_DATE(str,format)

This is the inverse of the DATE_FORMAT() function. It takes a string
str and a format string format. STR_TO_DATE() returns a DATETIME value
if the format string contains both date and time parts, or a DATE or
TIME value if the string contains only date or time parts. If the date,
time, or datetime value extracted from str is illegal, STR_TO_DATE()
returns NULL and produces a warning.

The server scans str attempting to match format to it. The format
string can contain literal characters and format specifiers beginning
with %. Literal characters in format must match literally in str.
Format specifiers in format must match a date or time part in str. For
the specifiers that can be used in format, see the DATE_FORMAT()
function description.

MariaDB> SELECT STR_TO_DATE(''01,5,2013'',''%d,%m,%Y'');
        -> ''2013-05-01''
MariaDB> SELECT STR_TO_DATE(''May 1, 2013'',''%M %d,%Y'');
        -> ''2013-05-01''

Scanning starts at the beginning of str and fails if format is found
not to match. Extra characters at the end of str are ignored.

MariaDB> SELECT STR_TO_DATE(''a09:30:17'',''a%h:%i:%s'');
        -> ''09:30:17''
MariaDB> SELECT STR_TO_DATE(''a09:30:17'',''%h:%i:%s'');
        -> NULL
MariaDB> SELECT STR_TO_DATE(''09:30:17a'',''%h:%i:%s'');
        -> ''09:30:17''

Unspecified date or time parts have a value of 0, so incompletely
specified values in str produce a result with some or all parts set to
0:

MariaDB> SELECT STR_TO_DATE(''abc'',''abc'');
        -> ''0000-00-00''
MariaDB> SELECT STR_TO_DATE(''9'',''%m'');
        -> ''0000-09-00''
MariaDB> SELECT STR_TO_DATE(''9'',''%s'');
        -> ''00:00:09''

URL: https://mariadb.com/kb/en/str_to_date/

', '', 'https://mariadb.com/kb/en/str_to_date/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (400, 'Y', 11, 'Y(p)

Returns the Y-coordinate value for the Point object p as a
double-precision number.

URL: https://mariadb.com/kb/en/y/

', 'MariaDB> SELECT Y(POINT(56.7, 53.34));
+-----------------------+
| Y(POINT(56.7, 53.34)) |
+-----------------------+
|                 53.34 |
+-----------------------+
', 'https://mariadb.com/kb/en/y/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (401, 'CHECKSUM TABLE', 20, 'Syntax:
CHECKSUM TABLE tbl_name [, tbl_name] ... [ QUICK | EXTENDED ]

CHECKSUM TABLE reports a table checksum. This statement requires the
SELECT privilege for the table.

With QUICK, the live table checksum is reported if it is available, or
NULL otherwise. This is very fast. A live checksum is enabled by
specifying the CHECKSUM=1 table option when you create the table;
currently, this is supported only for MyISAM tables. See [HELP CREATE
TABLE].

With EXTENDED, the entire table is read row by row and the checksum is
calculated. This can be very slow for large tables.

If neither QUICK nor EXTENDED is specified, MySQL returns a live
checksum if the table storage engine supports it and scans the table
otherwise.

For a nonexistent table, CHECKSUM TABLE returns NULL and generates a
warning.

In MySQL 5.5, CHECKSUM TABLE returns 0 for partitioned tables unless
you include the EXTENDED option. This issue is resolved in MySQL 5.6.
(Bug #11933226, Bug #60681)

The checksum value depends on the table row format. If the row format
changes, the checksum also changes. For example, the storage format for
VARCHAR changed between MySQL 4.1 and 5.0, so if a 4.1 table is
upgraded to MySQL 5.0, the checksum value may change.

URL: https://mariadb.com/kb/en/checksum-table/

', '', 'https://mariadb.com/kb/en/checksum-table/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (402, 'NUMINTERIORRINGS', 2, 'NumInteriorRings(poly)

Returns the number of interior rings in the Polygon value poly.

URL: https://mariadb.com/kb/en/numinteriorrings/

', 'MariaDB> SET @poly =
    -> ''Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))'';
MariaDB> SELECT NumInteriorRings(GeomFromText(@poly));
+---------------------------------------+
| NumInteriorRings(GeomFromText(@poly)) |
+---------------------------------------+
|                                     1 |
+---------------------------------------+
', 'https://mariadb.com/kb/en/numinteriorrings/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (403, 'INTERIORRINGN', 2, 'InteriorRingN(poly,N)

Returns the N-th interior ring for the Polygon value poly as a
LineString. Rings are numbered beginning with 1.

URL: https://mariadb.com/kb/en/interiorringn/

', 'MariaDB> SET @poly =
    -> ''Polygon((0 0,0 3,3 3,3 0,0 0),(1 1,1 2,2 2,2 1,1 1))'';
MariaDB> SELECT AsText(InteriorRingN(GeomFromText(@poly),1));
+----------------------------------------------+
| AsText(InteriorRingN(GeomFromText(@poly),1)) |
+----------------------------------------------+
| LINESTRING(1 1,1 2,2 2,2 1,1 1)              |
+----------------------------------------------+
', 'https://mariadb.com/kb/en/interiorringn/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (404, 'UTC_TIME', 31, 'Syntax:
UTC_TIME, UTC_TIME()

Returns the current UTC time as a value in ''HH:MM:SS'' or HHMMSS.uuuuuu
format, depending on whether the function is used in a string or
numeric context.

URL: https://mariadb.com/kb/en/utc_time/

', 'MariaDB> SELECT UTC_TIME(), UTC_TIME() + 0;
        -> ''18:07:53'', 180753.000000
', 'https://mariadb.com/kb/en/utc_time/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (405, 'DROP FUNCTION', 39, 'The DROP FUNCTION statement is used to drop stored functions and
user-defined functions (UDFs):

o For information about dropping stored functions, see [HELP DROP
  PROCEDURE].

o For information about dropping user-defined functions, see [HELP DROP
  FUNCTION UDF].

URL: https://mariadb.com/kb/en/drop-function/

', '', 'https://mariadb.com/kb/en/drop-function/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (406, 'ALTER EVENT', 39, 'Syntax:
ALTER
    [DEFINER = { user | CURRENT_USER }]
    EVENT event_name
    [ON SCHEDULE schedule]
    [ON COMPLETION [NOT] PRESERVE]
    [RENAME TO new_event_name]
    [ENABLE | DISABLE | DISABLE ON SLAVE]
    [COMMENT ''comment'']
    [DO event_body]

The ALTER EVENT statement changes one or more of the characteristics of
an existing event without the need to drop and recreate it. The syntax
for each of the DEFINER, ON SCHEDULE, ON COMPLETION, COMMENT, ENABLE /
DISABLE, and DO clauses is exactly the same as when used with CREATE
EVENT. (See [HELP CREATE EVENT].)

Any user can alter an event defined on a database for which that user
has the EVENT privilege. When a user executes a successful ALTER EVENT
statement, that user becomes the definer for the affected event.

ALTER EVENT works only with an existing event:

MariaDB> ALTER EVENT no_such_event 
     >     ON SCHEDULE 
     >       EVERY ''2:3'' DAY_HOUR;
ERROR 1517 (HY000): Unknown event ''no_such_event''

URL: https://mariadb.com/kb/en/alter-event/

', '', 'https://mariadb.com/kb/en/alter-event/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (407, 'STDDEV', 16, 'Syntax:
STDDEV(expr)

Returns the population standard deviation of expr. This function is
provided for compatibility with Oracle. The standard SQL function
STDDEV_POP() can be used instead.

This function returns NULL if there were no matching rows.

URL: https://mariadb.com/kb/en/stddev/

', '', 'https://mariadb.com/kb/en/stddev/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (408, 'DATE_SUB', 31, 'Syntax:
DATE_SUB(date,INTERVAL expr unit)

See the description for DATE_ADD().

URL: https://mariadb.com/kb/en/date_sub/

', '', 'https://mariadb.com/kb/en/date_sub/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (409, 'PERIOD_ADD', 31, 'Syntax:
PERIOD_ADD(P,N)

Adds N months to period P (in the format YYMM or YYYYMM). Returns a
value in the format YYYYMM. Note that the period argument P is not a
date value.

URL: https://mariadb.com/kb/en/period_add/

', 'MariaDB> SELECT PERIOD_ADD(200801,2);
        -> 200803
', 'https://mariadb.com/kb/en/period_add/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (410, '|', 19, 'Syntax:
|

Bitwise OR:

URL: https://mariadb.com/kb/en/bitwise-or/

', 'MariaDB> SELECT 29 | 15;
        -> 31
', 'https://mariadb.com/kb/en/bitwise-or/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (411, 'GEOMFROMTEXT', 3, 'GeomFromText(wkt[,srid]), GeometryFromText(wkt[,srid])

Constructs a geometry value of any type using its WKT representation
and SRID.

URL: https://mariadb.com/kb/en/geomfromtext/

', '', 'https://mariadb.com/kb/en/geomfromtext/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (412, 'UUID_SHORT', 14, 'Syntax:
UUID_SHORT()

Returns a "short" universal identifier as a 64-bit unsigned integer
(rather than a string-form 128-bit identifier as returned by the UUID()
function).

The value of UUID_SHORT() is guaranteed to be unique if the following
conditions hold:

o The server_id of the current host is unique among your set of master
  and slave servers

o server_id is between 0 and 255

o You do not set back your system time for your server between mysqld
  restarts

o You do not invoke UUID_SHORT() on average more than 16 million times
  per second between mysqld restarts

The UUID_SHORT() return value is constructed this way:

  (server_id & 255) << 56
+ (server_startup_time_in_seconds << 24)
+ incremented_variable++;

URL: https://mariadb.com/kb/en/uuid_short/

', 'MariaDB> SELECT UUID_SHORT();
        -> 92395783831158784
', 'https://mariadb.com/kb/en/uuid_short/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (413, 'RIGHT', 37, 'Syntax:
RIGHT(str,len)

Returns the rightmost len characters from the string str, or NULL if
any argument is NULL.

URL: https://mariadb.com/kb/en/right/

', 'MariaDB> SELECT RIGHT(''foobarbar'', 4);
        -> ''rbar''
', 'https://mariadb.com/kb/en/right/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (414, 'DATEDIFF', 31, 'Syntax:
DATEDIFF(expr1,expr2)

DATEDIFF() returns expr1 - expr2 expressed as a value in days from one
date to the other. expr1 and expr2 are date or date-and-time
expressions. Only the date parts of the values are used in the
calculation.

URL: https://mariadb.com/kb/en/datediff/

', 'MariaDB> SELECT DATEDIFF(''2007-12-31 23:59:59'',''2007-12-30'');
        -> 1
MariaDB> SELECT DATEDIFF(''2010-11-30 23:59:59'',''2010-12-31'');
        -> -31
', 'https://mariadb.com/kb/en/datediff/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (415, 'DROP TABLESPACE', 39, 'Syntax:
DROP TABLESPACE tablespace_name
    ENGINE [=] engine_name

This statement is used with NDB cluster, which is not supported by MariaDB.

URL: https://mariadb.com/kb/en/drop-tablespace/

', '', 'https://mariadb.com/kb/en/drop-tablespace/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (416, 'DROP PROCEDURE', 39, 'Syntax:
DROP {PROCEDURE | FUNCTION} [IF EXISTS] sp_name

This statement is used to drop a stored procedure or function. That is,
the specified routine is removed from the server. You must have the
ALTER ROUTINE privilege for the routine. (If the
automatic_sp_privileges system variable is enabled, that privilege and
EXECUTE are granted automatically to the routine creator when the
routine is created and dropped from the creator when the routine is
dropped. See
https://mariadb.com/kb/en/stored-routine-privileges/.
)

The IF EXISTS clause is a MySQL extension. It prevents an error from
occurring if the procedure or function does not exist. A warning is
produced that can be viewed with SHOW WARNINGS.

URL: https://mariadb.com/kb/en/drop-procedure/

', '', 'https://mariadb.com/kb/en/drop-procedure/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (417, 'CHECK TABLE', 20, 'Syntax:
CHECK TABLE tbl_name [, tbl_name] ... [option] ...

option = {FOR UPGRADE | QUICK | FAST | MEDIUM | EXTENDED | CHANGED}

CHECK TABLE checks a table or tables for errors. CHECK TABLE works for
InnoDB, MyISAM, ARCHIVE, and CSV tables. For MyISAM tables, the key
statistics are updated as well.

To check a table, you must have some privilege for it.

CHECK TABLE can also check views for problems, such as tables that are
referenced in the view definition that no longer exist.

CHECK TABLE is supported for partitioned tables, and you can use ALTER
TABLE ... CHECK PARTITION to check one or more partitions; for more
information, see [HELP ALTER TABLE].

URL: https://mariadb.com/kb/en/sql-commands-check-table/

', '', 'https://mariadb.com/kb/en/sql-commands-check-table/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (418, 'BIN', 37, 'Syntax:
BIN(N)

Returns a string representation of the binary value of N, where N is a
longlong (BIGINT) number. This is equivalent to CONV(N,10,2). Returns
NULL if N is NULL.

URL: https://mariadb.com/kb/en/bin/

', 'MariaDB> SELECT BIN(12);
        -> ''1100''
', 'https://mariadb.com/kb/en/bin/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (422, 'MULTILINESTRING', 24, 'MultiLineString(ls1,ls2,...)

Constructs a MultiLineString value using LineString or WKB LineString
arguments.

URL: https://mariadb.com/kb/en/multilinestring/

', '', 'https://mariadb.com/kb/en/multilinestring/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (423, 'LOCALTIME', 31, 'Syntax:
LOCALTIME, LOCALTIME()

LOCALTIME and LOCALTIME() are synonyms for NOW().

URL: https://mariadb.com/kb/en/localtime/

', '', 'https://mariadb.com/kb/en/localtime/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (424, 'SHOW RELAYLOG EVENTS', 26, 'Syntax:
SHOW RELAYLOG EVENTS
   [IN ''log_name''] [FROM pos] [LIMIT [offset,] row_count]

Shows the events in the relay log of a replication slave. If you do not
specify ''log_name'', the first relay log is displayed. This statement
has no effect on the master.

URL: https://mariadb.com/kb/en/show-relaylog-events/

', '', 'https://mariadb.com/kb/en/show-relaylog-events/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (425, 'MPOINTFROMTEXT', 3, 'MPointFromText(wkt[,srid]), MultiPointFromText(wkt[,srid])

Constructs a MULTIPOINT value using its WKT representation and SRID.

URL: https://mariadb.com/kb/en/mpointfromtext/

', '', 'https://mariadb.com/kb/en/mpointfromtext/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (426, 'BLOB', 22, 'BLOB[(M)]

A BLOB column with a maximum length of 65,535 (216 - 1) bytes. Each
BLOB value is stored using a 2-byte length prefix that indicates the
number of bytes in the value.

An optional length M can be given for this type. If this is done, MySQL
creates the column as the smallest BLOB type large enough to hold
values M bytes long.

URL: https://mariadb.com/kb/en/blob/

', '', 'https://mariadb.com/kb/en/blob/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (419, 'INSTALL PLUGIN', 5, 'Syntax:
INSTALL PLUGIN plugin_name SONAME ''shared_library_name''

This statement installs a server plugin. It requires the INSERT
privilege for the mysql.plugin table.

plugin_name is the name of the plugin as defined in the plugin
descriptor structure contained in the library file (see
http://dev.mysql.com/doc/refman/5.5/en/plugin-data-structures.html).
Plugin names are not case sensitive. For maximal compatibility, plugin
names should be limited to ASCII letters, digits, and underscore
because they are used in C source files, shell command lines, M4 and
Bourne shell scripts, and SQL environments.

shared_library_name is the name of the shared library that contains the
plugin code. The name includes the file name extension (for example,
libmyplugin.so, libmyplugin.dll, or libmyplugin.dylib).

The shared library must be located in the plugin directory (the
directory named by the plugin_dir system variable). The library must be
in the plugin directory itself, not in a subdirectory. By default,
plugin_dir is the plugin directory under the directory named by the
pkglibdir configuration variable, but it can be changed by setting the
value of plugin_dir at server startup. For example, set its value in a
my.cnf file:

[mysqld]
plugin_dir=/path/to/plugin/directory

If the value of plugin_dir is a relative path name, it is taken to be
relative to the MySQL base directory (the value of the basedir system
variable).

INSTALL PLUGIN loads and initializes the plugin code to make the plugin
available for use. A plugin is initialized by executing its
initialization function, which handles any setup that the plugin must
perform before it can be used. When the server shuts down, it executes
the deinitialization function for each plugin that is loaded so that
the plugin has a change to perform any final cleanup.

INSTALL PLUGIN also registers the plugin by adding a line that
indicates the plugin name and library file name to the mysql.plugin
table. At server startup, the server loads and initializes any plugin
that is listed in the mysql.plugin table. This means that a plugin is
installed with INSTALL PLUGIN only once, not every time the server
starts. Plugin loading at startup does not occur if the server is
started with the --skip-grant-tables option.

A plugin library can contain multiple plugins. For each of them to be
installed, use a separate INSTALL PLUGIN statement. Each statement
names a different plugin, but all of them specify the same library
name.

URL: https://mariadb.com/kb/en/install-plugin/

', '', 'https://mariadb.com/kb/en/install-plugin/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (420, 'DECLARE CURSOR', 23, 'Syntax:
DECLARE cursor_name CURSOR FOR select_statement

This statement declares a cursor and associates it with a SELECT
statement that retrieves the rows to be traversed by the cursor. To
fetch the rows later, use a FETCH statement. The number of columns
retrieved by the SELECT statement must match the number of output
variables specified in the FETCH statement.

The SELECT statement cannot have an INTO clause.

Cursor declarations must appear before handler declarations and after
variable and condition declarations.

A stored program may contain multiple cursor declarations, but each
cursor declared in a given block must have a unique name. For an
example, see https://mariadb.com/kb/en/programmatic-and-compound-statements-cursors/.

For information available through SHOW statements, it is possible in
many cases to obtain equivalent information by using a cursor with an
INFORMATION_SCHEMA table.

URL: https://mariadb.com/kb/en/declare-cursor/

', '', 'https://mariadb.com/kb/en/declare-cursor/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (427, 'SHA1', 12, 'Syntax:
SHA1(str), SHA(str)

Calculates an SHA-1 160-bit checksum for the string, as described in
RFC 3174 (Secure Hash Algorithm). The value is returned as a string of
40 hex digits, or NULL if the argument was NULL. One of the possible
uses for this function is as a hash key. See the notes at the beginning
of this section about storing hash values efficiently. You can also use
SHA1() as a cryptographic function for storing passwords. SHA() is
synonymous with SHA1().

As of MySQL 5.5.3, the return value is a nonbinary string in the
connection character set. Before 5.5.3, the return value is a binary
string; see the notes at the beginning of this section about using the
value as a nonbinary string.

URL: https://mariadb.com/kb/en/sha1/

', 'MariaDB> SELECT SHA1(''abc'');
        -> ''a9993e364706816aba3e25717850c26c9cd0d89d''
', 'https://mariadb.com/kb/en/sha1/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (428, 'SUBSTR', 37, 'Syntax:
SUBSTR(str,pos), SUBSTR(str FROM pos), SUBSTR(str,pos,len), SUBSTR(str
FROM pos FOR len)

SUBSTR() is a synonym for SUBSTRING().

URL: https://mariadb.com/kb/en/substr/

', '', 'https://mariadb.com/kb/en/substr/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (429, 'PASSWORD', 12, 'Syntax:
PASSWORD(str)

Calculates and returns a hashed password string from the plaintext
password str and returns a nonbinary string in the connection character
set (a binary string before MySQL 5.5.3), or NULL if the argument is
NULL. This function is the SQL interface to the algorithm used by the
server to encrypt MySQL passwords for storage in the mysql.user grant
table.

The password hashing method used by PASSWORD() depends on the value of
the old_passwords system variable:

URL: https://mariadb.com/kb/en/password/

', 'MariaDB> SET old_passwords = 0;
MariaDB> SELECT PASSWORD(''mypass'');
+-------------------------------------------+
| PASSWORD(''mypass'')                        |
+-------------------------------------------+
| *6C8989366EAF75BB670AD8EA7A7FC1176A95CEF4 |
+-------------------------------------------+

MariaDB> SET old_passwords = 1;
MariaDB> SELECT PASSWORD(''mypass'');
+--------------------+
| PASSWORD(''mypass'') |
+--------------------+
| 6f8c114b58f2ce9e   |
+--------------------+
', 'https://mariadb.com/kb/en/password/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (430, 'CHAR', 22, '[NATIONAL] CHAR[(M)] [CHARACTER SET charset_name] [COLLATE
collation_name]

A fixed-length string that is always right-padded with spaces to the
specified length when stored. M represents the column length in
characters. The range of M is 0 to 255. If M is omitted, the length is
1.

*Note*: Trailing spaces are removed when CHAR values are retrieved
unless the PAD_CHAR_TO_FULL_LENGTH SQL mode is enabled.

URL: https://mariadb.com/kb/en/char/

', '', 'https://mariadb.com/kb/en/char/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (431, 'UTC_DATE', 31, 'Syntax:
UTC_DATE, UTC_DATE()

Returns the current UTC date as a value in ''YYYY-MM-DD'' or YYYYMMDD
format, depending on whether the function is used in a string or
numeric context.

URL: https://mariadb.com/kb/en/utc_date/

', 'MariaDB> SELECT UTC_DATE(), UTC_DATE() + 0;
        -> ''2003-08-14'', 20030814
', 'https://mariadb.com/kb/en/utc_date/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (432, 'DIMENSION', 36, 'Dimension(g)

Returns the inherent dimension of the geometry value g. The result can
be -1, 0, 1, or 2. The meaning of these values is given in
https://mariadb.com/kb/en/dimension/.

URL: https://mariadb.com/kb/en/dimension/

', 'MariaDB> SELECT Dimension(GeomFromText(''LineString(1 1,2 2)''));
+------------------------------------------------+
| Dimension(GeomFromText(''LineString(1 1,2 2)'')) |
+------------------------------------------------+
|                                              1 |
+------------------------------------------------+
', 'https://mariadb.com/kb/en/dimension/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (433, 'COUNT DISTINCT', 16, 'Syntax:
COUNT(DISTINCT expr,[expr...])

Returns a count of the number of rows with different non-NULL expr
values.

COUNT(DISTINCT) returns 0 if there were no matching rows.

URL: https://mariadb.com/kb/en/count-distinct/

', 'MariaDB> SELECT COUNT(DISTINCT results) FROM student;
', 'https://mariadb.com/kb/en/count-distinct/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (421, 'LOAD DATA', 27, 'Syntax:
LOAD DATA [LOW_PRIORITY | CONCURRENT] [LOCAL] INFILE ''file_name''
    [REPLACE | IGNORE]
    INTO TABLE tbl_name
    [CHARACTER SET charset_name]
    [{FIELDS | COLUMNS}
        [TERMINATED BY ''string'']
        [[OPTIONALLY] ENCLOSED BY ''char'']
        [ESCAPED BY ''char'']
    ]
    [LINES
        [STARTING BY ''string'']
        [TERMINATED BY ''string'']
    ]
    [IGNORE number {LINES | ROWS}]
    [(col_name_or_user_var,...)]
    [SET col_name = expr,...]

The LOAD DATA INFILE statement reads rows from a text file into a table
at a very high speed. The file name must be given as a literal string.

LOAD DATA INFILE is the complement of SELECT ... INTO OUTFILE. (See
https://mariadb.com/kb/en/select-into/.) To write data
from a table to a file, use SELECT ... INTO OUTFILE. To read the file
back into a table, use LOAD DATA INFILE. The syntax of the FIELDS and
LINES clauses is the same for both statements. Both clauses are
optional, but FIELDS must precede LINES if both are specified.

For more information about the efficiency of INSERT versus LOAD DATA
INFILE and speeding up LOAD DATA INFILE, see
http://dev.mysql.com/doc/refman/5.5/en/insert-speed.html.

The character set indicated by the character_set_database system
variable is used to interpret the information in the file. SET NAMES
and the setting of character_set_client do not affect interpretation of
input. If the contents of the input file use a character set that
differs from the default, it is usually preferable to specify the
character set of the file by using the CHARACTER SET clause. A
character set of binary specifies "no conversion."

LOAD DATA INFILE interprets all fields in the file as having the same
character set, regardless of the data types of the columns into which
field values are loaded. For proper interpretation of file contents,
you must ensure that it was written with the correct character set. For
example, if you write a data file with mysqldump -T or by issuing a
SELECT ... INTO OUTFILE statement in mysql, be sure to use a
--default-character-set option with mysqldump or mysql so that output
is written in the character set to be used when the file is loaded with
LOAD DATA INFILE.

*Note*: It is not possible to load data files that use the ucs2, utf16,
or utf32 character set.

The character_set_filesystem system variable controls the
interpretation of the file name.

You can also load data files by using the mysqlimport utility; it
operates by sending a LOAD DATA INFILE statement to the server. The
--local option causes mysqlimport to read data files from the client
host. You can specify the --compress option to get better performance
over slow networks if the client and server support the compressed
protocol. See https://mariadb.com/kb/en/mysqlimport/.

If you use LOW_PRIORITY, execution of the LOAD DATA statement is
delayed until no other clients are reading from the table. This affects
only storage engines that use only table-level locking (such as MyISAM,
MEMORY, and MERGE).

If you specify CONCURRENT with a MyISAM table that satisfies the
condition for concurrent inserts (that is, it contains no free blocks
in the middle), other threads can retrieve data from the table while
LOAD DATA is executing. Using this option affects the performance of
LOAD DATA a bit, even if no other thread is using the table at the same
time.

Prior to MySQL 5.5.1, CONCURRENT was not replicated when using
statement-based replication (see Bug #34628). However, it is replicated
when using row-based replication, regardless of the version. See
http://dev.mysql.com/doc/refman/5.5/en/replication-features-load-data.h
tml, for more information.

The LOCAL keyword, if specified, is interpreted with respect to the
client end of the connection:

o If LOCAL is specified, the file is read by the client program on the
  client host and sent to the server. The file can be given as a full
  path name to specify its exact location. If given as a relative path
  name, the name is interpreted relative to the directory in which the
  client program was started.

  When using LOCAL with LOAD DATA, a copy of the file is created in the
  server''s temporary directory. This is not the directory determined by
  the value of tmpdir or slave_load_tmpdir, but rather the operating
  system''s temporary directory, and is not configurable in the MySQL
  Server. (Typically the system temporary directory is /tmp on Linux
  systems and C:\\WINDOWS\\TEMP on Windows.) Lack of sufficient space for
  the copy in this directory can cause the LOAD DATA LOCAL statement to
  fail.

o If LOCAL is not specified, the file must be located on the server
  host and is read directly by the server. The server uses the
  following rules to locate the file:

  o If the file name is an absolute path name, the server uses it as
    given.

  o If the file name is a relative path name with one or more leading
    components, the server searches for the file relative to the
    server''s data directory.

  o If a file name with no leading components is given, the server
    looks for the file in the database directory of the default
    database.

Note that, in the non-LOCAL case, these rules mean that a file named as
./myfile.txt is read from the server''s data directory, whereas the file
named as myfile.txt is read from the database directory of the default
database. For example, if db1 is the default database, the following
LOAD DATA statement reads the file data.txt from the database directory
for db1, even though the statement explicitly loads the file into a
table in the db2 database:

LOAD DATA INFILE ''data.txt'' INTO TABLE db2.my_table;

Windows path names are specified using forward slashes rather than
backslashes. If you do use backslashes, you must double them.

For security reasons, when reading text files located on the server,
the files must either reside in the database directory or be readable
by all. Also, to use LOAD DATA INFILE on server files, you must have
the FILE privilege. See
https://mariadb.com/kb/en/grant/. For
non-LOCAL load operations, if the secure_file_priv system variable is
set to a nonempty directory name, the file to be loaded must be located
in that directory.

URL: https://mariadb.com/kb/en/load-data-infile/

', '', 'https://mariadb.com/kb/en/load-data-infile/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (434, 'BIT', 22, 'BIT[(M)]

A bit-field type. M indicates the number of bits per value, from 1 to
64. The default is 1 if M is omitted.

URL: https://mariadb.com/kb/en/bit/

', '', 'https://mariadb.com/kb/en/bit/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (435, 'EQUALS', 30, 'Equals(g1,g2)

Returns 1 or 0 to indicate whether g1 is spatially equal to g2.

URL: https://mariadb.com/kb/en/equals/

', '', 'https://mariadb.com/kb/en/equals/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (436, 'SHOW CREATE VIEW', 26, 'Syntax:
SHOW CREATE VIEW view_name

This statement shows a CREATE VIEW statement that creates the given
view.

URL: https://mariadb.com/kb/en/show-create-view/

', '', 'https://mariadb.com/kb/en/show-create-view/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (437, 'INTERVAL', 18, 'Syntax:
INTERVAL(N,N1,N2,N3,...)

Returns 0 if N < N1, 1 if N < N2 and so on or -1 if N is NULL. All
arguments are treated as integers. It is required that N1 < N2 < N3 <
... < Nn for this function to work correctly. This is because a binary
search is used (very fast).

URL: https://mariadb.com/kb/en/interval/

', 'MariaDB> SELECT INTERVAL(23, 1, 15, 17, 30, 44, 200);
        -> 3
MariaDB> SELECT INTERVAL(10, 1, 10, 100, 1000);
        -> 2
MariaDB> SELECT INTERVAL(22, 23, 30, 44, 200);
        -> 0
', 'https://mariadb.com/kb/en/interval/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (438, 'FROM_DAYS', 31, 'Syntax:
FROM_DAYS(N)

Given a day number N, returns a DATE value.

URL: https://mariadb.com/kb/en/from_days/

', 'MariaDB> SELECT FROM_DAYS(730669);
        -> ''2007-07-03''
', 'https://mariadb.com/kb/en/from_days/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (439, 'ALTER PROCEDURE', 39, 'Syntax:
ALTER PROCEDURE proc_name [characteristic ...]

characteristic:
    COMMENT ''string''
  | LANGUAGE SQL
  | { CONTAINS SQL | NO SQL | READS SQL DATA | MODIFIES SQL DATA }
  | SQL SECURITY { DEFINER | INVOKER }

This statement can be used to change the characteristics of a stored
procedure. More than one change may be specified in an ALTER PROCEDURE
statement. However, you cannot change the parameters or body of a
stored procedure using this statement; to make such changes, you must
drop and re-create the procedure using DROP PROCEDURE and CREATE
PROCEDURE.

You must have the ALTER ROUTINE privilege for the procedure. By
default, that privilege is granted automatically to the procedure
creator. This behavior can be changed by disabling the
automatic_sp_privileges system variable. See
https://mariadb.com/kb/en/stored-routine-privileges/.

URL: https://mariadb.com/kb/en/alter-procedure/

', '', 'https://mariadb.com/kb/en/alter-procedure/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (440, 'BIT_COUNT', 19, 'Syntax:
BIT_COUNT(N)

Returns the number of bits that are set in the argument N.

URL: https://mariadb.com/kb/en/bit_count/

', 'MariaDB> SELECT BIT_COUNT(29), BIT_COUNT(b''101010'');
        -> 4, 3
', 'https://mariadb.com/kb/en/bit_count/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (441, 'OCTET_LENGTH', 37, 'Syntax:
OCTET_LENGTH(str)

OCTET_LENGTH() is a synonym for LENGTH().

URL: https://mariadb.com/kb/en/octet_length/

', '', 'https://mariadb.com/kb/en/octet_length/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (442, 'UTC_TIMESTAMP', 31, 'Syntax:
UTC_TIMESTAMP, UTC_TIMESTAMP()

Returns the current UTC date and time as a value in ''YYYY-MM-DD
HH:MM:SS'' or YYYYMMDDHHMMSS.uuuuuu format, depending on whether the
function is used in a string or numeric context.

URL: https://mariadb.com/kb/en/utc_timestamp/

', 'MariaDB> SELECT UTC_TIMESTAMP(), UTC_TIMESTAMP() + 0;
        -> ''2003-08-14 18:08:04'', 20030814180804.000000
', 'https://mariadb.com/kb/en/utc_timestamp/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (443, 'AES_ENCRYPT', 12, 'Syntax:
AES_ENCRYPT(str,key_str)

AES_ENCRYPT() and AES_DECRYPT() enable encryption and decryption of
data using the official AES (Advanced Encryption Standard) algorithm,
previously known as "Rijndael." Encoding with a 128-bit key length is
used, but you can extend it up to 256 bits by modifying the source. We
chose 128 bits because it is much faster and it is secure enough for
most purposes.

AES_ENCRYPT() encrypts a string and returns a binary string.
AES_DECRYPT() decrypts the encrypted string and returns the original
string. The input arguments may be any length. If either argument is
NULL, the result of this function is also NULL.

Because AES is a block-level algorithm, padding is used to encode
uneven length strings and so the result string length may be calculated
using this formula:

16 * (trunc(string_length / 16) + 1)

If AES_DECRYPT() detects invalid data or incorrect padding, it returns
NULL. However, it is possible for AES_DECRYPT() to return a non-NULL
value (possibly garbage) if the input data or the key is invalid.

You can use the AES functions to store data in an encrypted form by
modifying your queries:

URL: https://mariadb.com/kb/en/aes_encrypt/

', 'INSERT INTO t VALUES (1,AES_ENCRYPT(''text'',''password''));
', 'https://mariadb.com/kb/en/aes_encrypt/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (444, '+', 4, 'Syntax:
+

Addition:

URL: https://mariadb.com/kb/en/addition-operator/

', 'MariaDB> SELECT 3+5;
        -> 8
', 'https://mariadb.com/kb/en/addition-operator/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (445, 'INET_NTOA', 14, 'Syntax:
INET_NTOA(expr)

Given a numeric IPv4 network address in network byte order, returns the
dotted-quad representation of the address as a string. INET_NTOA()
returns NULL if it does not understand its argument.

As of MySQL 5.5.3, the return value is a nonbinary string in the
connection character set. Before 5.5.3, the return value is a binary
string.

URL: https://mariadb.com/kb/en/inet_ntoa/

', 'MariaDB> SELECT INET_NTOA(167773449);
        -> ''10.0.5.9''
', 'https://mariadb.com/kb/en/inet_ntoa/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (446, 'ACOS', 4, 'Syntax:
ACOS(X)

Returns the arc cosine of X, that is, the value whose cosine is X.
Returns NULL if X is not in the range -1 to 1.

URL: https://mariadb.com/kb/en/acos/

', 'MariaDB> SELECT ACOS(1);
        -> 0
MariaDB> SELECT ACOS(1.0001);
        -> NULL
MariaDB> SELECT ACOS(0);
        -> 1.5707963267949
', 'https://mariadb.com/kb/en/acos/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (448, 'CEILING', 4, 'Syntax:
CEILING(X)

Returns the smallest integer value not less than X.

URL: https://mariadb.com/kb/en/ceiling/

', 'MariaDB> SELECT CEILING(1.23);
        -> 2
MariaDB> SELECT CEILING(-1.23);
        -> -1
', 'https://mariadb.com/kb/en/ceiling/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (449, 'SIN', 4, 'Syntax:
SIN(X)

Returns the sine of X, where X is given in radians.

URL: https://mariadb.com/kb/en/sin/

', 'MariaDB> SELECT SIN(PI());
        -> 1.2246063538224e-16
MariaDB> SELECT ROUND(SIN(PI()));
        -> 0
', 'https://mariadb.com/kb/en/sin/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (450, 'DAYOFWEEK', 31, 'Syntax:
DAYOFWEEK(date)

Returns the weekday index for date (1 = Sunday, 2 = Monday, ..., 7 =
Saturday). These index values correspond to the ODBC standard.

URL: https://mariadb.com/kb/en/dayofweek/

', 'MariaDB> SELECT DAYOFWEEK(''2007-02-03'');
        -> 7
', 'https://mariadb.com/kb/en/dayofweek/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (451, 'SHOW PROCESSLIST', 26, 'Syntax:
SHOW [FULL] PROCESSLIST

SHOW PROCESSLIST shows you which threads are running. You can also get
this information from the INFORMATION_SCHEMA PROCESSLIST table or the
mysqladmin processlist command. If you have the PROCESS privilege, you
can see all threads. Otherwise, you can see only your own threads (that
is, threads associated with the MySQL account that you are using). If
you do not use the FULL keyword, only the first 100 characters of each
statement are shown in the Info field.

URL: https://mariadb.com/kb/en/show-processlist/

', '', 'https://mariadb.com/kb/en/show-processlist/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (452, 'LINEFROMWKB', 32, 'LineFromWKB(wkb[,srid]), LineStringFromWKB(wkb[,srid])

Constructs a LINESTRING value using its WKB representation and SRID.

URL: https://mariadb.com/kb/en/linefromwkb/

', '', 'https://mariadb.com/kb/en/linefromwkb/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (453, 'GEOMETRYTYPE', 36, 'GeometryType(g)

Returns as a binary string the name of the geometry type of which the
geometry instance g is a member. The name corresponds to one of the
instantiable Geometry subclasses.

URL: https://mariadb.com/kb/en/geometrytype/

', 'MariaDB> SELECT GeometryType(GeomFromText(''POINT(1 1)''));
+------------------------------------------+
| GeometryType(GeomFromText(''POINT(1 1)'')) |
+------------------------------------------+
| POINT                                    |
+------------------------------------------+
', 'https://mariadb.com/kb/en/geometrytype/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (454, 'CREATE VIEW', 39, 'Syntax:
CREATE
    [OR REPLACE]
    [ALGORITHM = {UNDEFINED | MERGE | TEMPTABLE}]
    [DEFINER = { user | CURRENT_USER }]
    [SQL SECURITY { DEFINER | INVOKER }]
    VIEW view_name [(column_list)]
    AS select_statement
    [WITH [CASCADED | LOCAL] CHECK OPTION]

The CREATE VIEW statement creates a new view, or replaces an existing
one if the OR REPLACE clause is given. If the view does not exist,
CREATE OR REPLACE VIEW is the same as CREATE VIEW. If the view does
exist, CREATE OR REPLACE VIEW is the same as ALTER VIEW.

The select_statement is a SELECT statement that provides the definition
of the view. (When you select from the view, you select in effect using
the SELECT statement.) select_statement can select from base tables or
other views.

The view definition is "frozen" at creation time, so changes to the
underlying tables afterward do not affect the view definition. For
example, if a view is defined as SELECT * on a table, new columns added
to the table later do not become part of the view.

The ALGORITHM clause affects how MySQL processes the view. The DEFINER
and SQL SECURITY clauses specify the security context to be used when
checking access privileges at view invocation time. The WITH CHECK
OPTION clause can be given to constrain inserts or updates to rows in
tables referenced by the view. These clauses are described later in
this section.

The CREATE VIEW statement requires the CREATE VIEW privilege for the
view, and some privilege for each column selected by the SELECT
statement. For columns used elsewhere in the SELECT statement you must
have the SELECT privilege. If the OR REPLACE clause is present, you
must also have the DROP privilege for the view. CREATE VIEW might also
require the SUPER privilege, depending on the DEFINER value, as
described later in this section.

When a view is referenced, privilege checking occurs as described later
in this section.

A view belongs to a database. By default, a new view is created in the
default database. To create the view explicitly in a given database,
specify the name as db_name.view_name when you create it:

MariaDB> CREATE VIEW test.v AS SELECT * FROM t;

Within a database, base tables and views share the same namespace, so a
base table and a view cannot have the same name.

Columns retrieved by the SELECT statement can be simple references to
table columns. They can also be expressions that use functions,
constant values, operators, and so forth.

Views must have unique column names with no duplicates, just like base
tables. By default, the names of the columns retrieved by the SELECT
statement are used for the view column names. To define explicit names
for the view columns, the optional column_list clause can be given as a
list of comma-separated identifiers. The number of names in column_list
must be the same as the number of columns retrieved by the SELECT
statement.

Unqualified table or view names in the SELECT statement are interpreted
with respect to the default database. A view can refer to tables or
views in other databases by qualifying the table or view name with the
proper database name.

A view can be created from many kinds of SELECT statements. It can
refer to base tables or other views. It can use joins, UNION, and
subqueries. The SELECT need not even refer to any tables. The following
example defines a view that selects two columns from another table, as
well as an expression calculated from those columns:

MariaDB> CREATE TABLE t (qty INT, price INT);
MariaDB> INSERT INTO t VALUES(3, 50);
MariaDB> CREATE VIEW v AS SELECT qty, price, qty*price AS value FROM t;
MariaDB> SELECT * FROM v;
+------+-------+-------+
| qty  | price | value |
+------+-------+-------+
|    3 |    50 |   150 |
+------+-------+-------+

A view definition is subject to the following restrictions:

o The SELECT statement cannot contain a subquery in the FROM clause.

o The SELECT statement cannot refer to system or user variables.

o Within a stored program, the definition cannot refer to program
  parameters or local variables.

o The SELECT statement cannot refer to prepared statement parameters.

o Any table or view referred to in the definition must exist. However,
  after a view has been created, it is possible to drop a table or view
  that the definition refers to. In this case, use of the view results
  in an error. To check a view definition for problems of this kind,
  use the CHECK TABLE statement.

o The definition cannot refer to a TEMPORARY table, and you cannot
  create a TEMPORARY view.

o Any tables named in the view definition must exist at definition
  time.

o You cannot associate a trigger with a view.

o Aliases for column names in the SELECT statement are checked against
  the maximum column length of 64 characters (not the maximum alias
  length of 256 characters).

ORDER BY is permitted in a view definition, but it is ignored if you
select from a view using a statement that has its own ORDER BY.

For other options or clauses in the definition, they are added to the
options or clauses of the statement that references the view, but the
effect is undefined. For example, if a view definition includes a LIMIT
clause, and you select from the view using a statement that has its own
LIMIT clause, it is undefined which limit applies. This same principle
applies to options such as ALL, DISTINCT, or SQL_SMALL_RESULT that
follow the SELECT keyword, and to clauses such as INTO, FOR UPDATE,
LOCK IN SHARE MODE, and PROCEDURE.

If you create a view and then change the query processing environment
by changing system variables, that may affect the results that you get
from the view:

MariaDB> CREATE VIEW v (mycol) AS SELECT ''abc'';
Query OK, 0 rows affected (0.01 sec)

MariaDB> SET sql_mode = '''';
Query OK, 0 rows affected (0.00 sec)

MariaDB> SELECT "mycol" FROM v;
+-------+
| mycol |
+-------+
| mycol |
+-------+
1 row in set (0.01 sec)

MariaDB> SET sql_mode = ''ANSI_QUOTES'';
Query OK, 0 rows affected (0.00 sec)

MariaDB> SELECT "mycol" FROM v;
+-------+
| mycol |
+-------+
| abc   |
+-------+
1 row in set (0.00 sec)

The DEFINER and SQL SECURITY clauses determine which MySQL account to
use when checking access privileges for the view when a statement is
executed that references the view. The valid SQL SECURITY
characteristic values are DEFINER and INVOKER. These indicate that the
required privileges must be held by the user who defined or invoked the
view, respectively. The default SQL SECURITY value is DEFINER.

If a user value is given for the DEFINER clause, it should be a MySQL
account specified as ''user_name''@''host_name'' (the same format used in
the GRANT statement), CURRENT_USER, or CURRENT_USER(). The default
DEFINER value is the user who executes the CREATE VIEW statement. This
is the same as specifying DEFINER = CURRENT_USER explicitly.

If you specify the DEFINER clause, these rules determine the valid
DEFINER user values:

o If you do not have the SUPER privilege, the only valid user value is
  your own account, either specified literally or by using
  CURRENT_USER. You cannot set the definer to some other account.

o If you have the SUPER privilege, you can specify any syntactically
  valid account name. If the account does not actually exist, a warning
  is generated.

o Although it is possible to create a view with a nonexistent DEFINER
  account, an error occurs when the view is referenced if the SQL
  SECURITY value is DEFINER but the definer account does not exist.

For more information about view security, see
https://mariadb.com/kb/en/stored-routine-privileges/.

Within a view definition, CURRENT_USER returns the view''s DEFINER value
by default. For views defined with the SQL SECURITY INVOKER
characteristic, CURRENT_USER returns the account for the view''s
invoker. For information about user auditing within views, see
http://dev.mysql.com/doc/refman/5.5/en/account-activity-auditing.html.

Within a stored routine that is defined with the SQL SECURITY DEFINER
characteristic, CURRENT_USER returns the routine''s DEFINER value. This
also affects a view defined within such a routine, if the view
definition contains a DEFINER value of CURRENT_USER.

View privileges are checked like this:

o At view definition time, the view creator must have the privileges
  needed to use the top-level objects accessed by the view. For
  example, if the view definition refers to table columns, the creator
  must have some privilege for each column in the select list of the
  definition, and the SELECT privilege for each column used elsewhere
  in the definition. If the definition refers to a stored function,
  only the privileges needed to invoke the function can be checked. The
  privileges required at function invocation time can be checked only
  as it executes: For different invocations, different execution paths
  within the function might be taken.

o The user who references a view must have appropriate privileges to
  access it (SELECT to select from it, INSERT to insert into it, and so
  forth.)

o When a view has been referenced, privileges for objects accessed by
  the view are checked against the privileges held by the view DEFINER
  account or invoker, depending on whether the SQL SECURITY
  characteristic is DEFINER or INVOKER, respectively.

o If reference to a view causes execution of a stored function,
  privilege checking for statements executed within the function depend
  on whether the function SQL SECURITY characteristic is DEFINER or
  INVOKER. If the security characteristic is DEFINER, the function runs
  with the privileges of the DEFINER account. If the characteristic is
  INVOKER, the function runs with the privileges determined by the
  view''s SQL SECURITY characteristic.

Example: A view might depend on a stored function, and that function
might invoke other stored routines. For example, the following view
invokes a stored function f():

CREATE VIEW v AS SELECT * FROM t WHERE t.id = f(t.name);

Suppose that f() contains a statement such as this:

IF name IS NULL then
  CALL p1();
ELSE
  CALL p2();
END IF;

The privileges required for executing statements within f() need to be
checked when f() executes. This might mean that privileges are needed
for p1() or p2(), depending on the execution path within f(). Those
privileges must be checked at runtime, and the user who must possess
the privileges is determined by the SQL SECURITY values of the view v
and the function f().

The DEFINER and SQL SECURITY clauses for views are extensions to
standard SQL. In standard SQL, views are handled using the rules for
SQL SECURITY DEFINER. The standard says that the definer of the view,
which is the same as the owner of the view''s schema, gets applicable
privileges on the view (for example, SELECT) and may grant them. MySQL
has no concept of a schema "owner", so MySQL adds a clause to identify
the definer. The DEFINER clause is an extension where the intent is to
have what the standard has; that is, a permanent record of who defined
the view. This is why the default DEFINER value is the account of the
view creator.

The optional ALGORITHM clause is a MySQL extension to standard SQL. It
affects how MySQL processes the view. ALGORITHM takes three values:
MERGE, TEMPTABLE, or UNDEFINED. The default algorithm is UNDEFINED if
no ALGORITHM clause is present. For more information, see
https://mariadb.com/kb/en/view-algorithms/.

Some views are updatable. That is, you can use them in statements such
as UPDATE, DELETE, or INSERT to update the contents of the underlying
table. For a view to be updatable, there must be a one-to-one
relationship between the rows in the view and the rows in the
underlying table. There are also certain other constructs that make a
view nonupdatable.

The WITH CHECK OPTION clause can be given for an updatable view to
prevent inserts or updates to rows except those for which the WHERE
clause in the select_statement is true.

In a WITH CHECK OPTION clause for an updatable view, the LOCAL and
CASCADED keywords determine the scope of check testing when the view is
defined in terms of another view. The LOCAL keyword restricts the CHECK
OPTION only to the view being defined. CASCADED causes the checks for
underlying views to be evaluated as well. When neither keyword is
given, the default is CASCADED.

For more information about updatable views and the WITH CHECK OPTION
clause, see
https://mariadb.com/kb/en/inserting-and-updating-with-views/.

URL: https://mariadb.com/kb/en/create-view/

', '', 'https://mariadb.com/kb/en/create-view/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (455, 'TRIM', 37, 'Syntax:
TRIM([{BOTH | LEADING | TRAILING} [remstr] FROM] str), TRIM([remstr
FROM] str)

Returns the string str with all remstr prefixes or suffixes removed. If
none of the specifiers BOTH, LEADING, or TRAILING is given, BOTH is
assumed. remstr is optional and, if not specified, spaces are removed.

URL: https://mariadb.com/kb/en/trim/

', 'MariaDB> SELECT TRIM(''  bar   '');
        -> ''bar''
MariaDB> SELECT TRIM(LEADING ''x'' FROM ''xxxbarxxx'');
        -> ''barxxx''
MariaDB> SELECT TRIM(BOTH ''x'' FROM ''xxxbarxxx'');
        -> ''bar''
MariaDB> SELECT TRIM(TRAILING ''xyz'' FROM ''barxxyz'');
        -> ''barx''
', 'https://mariadb.com/kb/en/trim/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (447, 'ISOLATION', 8, 'Syntax:
SET [GLOBAL | SESSION] TRANSACTION ISOLATION LEVEL
  {
       REPEATABLE READ
     | READ COMMITTED
     | READ UNCOMMITTED
     | SERIALIZABLE
   }

This statement sets the transaction isolation level, used for
operations on InnoDB tables.

Scope of the Isolation Level

You can set the isolation level globally, for the current session, or
for the next transaction:

o With the GLOBAL keyword, the statement sets the default transaction
  level globally for all subsequent sessions. Existing sessions are
  unaffected.

o With the SESSION keyword, the statement sets the default transaction
  level for all subsequent transactions performed within the current
  session.

o Without any SESSION or GLOBAL keyword, the statement sets the
  isolation level for the next (not started) transaction performed
  within the current session.

A change to the global default isolation level requires the SUPER
privilege. Any session is free to change its session isolation level
(even in the middle of a transaction), or the isolation level for its
next transaction.

SET TRANSACTION ISOLATION LEVEL without GLOBAL or SESSION is not
permitted while there is an active transaction:

MariaDB> START TRANSACTION;
Query OK, 0 rows affected (0.02 sec)

MariaDB> SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
ERROR 1568 (25001): Transaction isolation level can''t be changed
while a transaction is in progress

To set the global default isolation level at server startup, use the
--transaction-isolation=level option to mysqld on the command line or
in an option file. Values of level for this option use dashes rather
than spaces, so the permissible values are READ-UNCOMMITTED,
READ-COMMITTED, REPEATABLE-READ, or SERIALIZABLE. For example, to set
the default isolation level to REPEATABLE READ, use these lines in the
[mysqld] section of an option file:

[mysqld]
transaction-isolation = REPEATABLE-READ

It is possible to check or set the global and session transaction
isolation levels at runtime by using the tx_isolation system variable:

SELECT @@GLOBAL.tx_isolation, @@tx_isolation;
SET GLOBAL tx_isolation=''REPEATABLE-READ'';
SET SESSION tx_isolation=''SERIALIZABLE'';

Details and Usage of Isolation Levels

InnoDB supports each of the transaction isolation levels described here
using different locking strategies. You can enforce a high degree of
consistency with the default REPEATABLE READ level, for operations on
crucial data where ACID compliance is important. Or you can relax the
consistency rules with READ COMMITTED or even READ UNCOMMITTED, in
situations such as bulk reporting where precise consistency and
repeatable results are less important than minimizing the amount of
overhead for locking. SERIALIZABLE enforces even stricter rules than
REPEATABLE READ, and is used mainly in specialized situations, such as
with XA transactions and for troubleshooting issues with concurrency
and deadlocks.

For full information about how these isolation levels work with InnoDB
transactions, see
http://dev.mysql.com/doc/refman/5.1/en/innodb-transaction-model.html.
In particular, for additional information about InnoDB record-level
locks and how it uses them to execute various types of statements, see
http://dev.mysql.com/doc/refman/5.5/en/innodb-record-level-locks.html
and http://dev.mysql.com/doc/refman/5.5/en/innodb-locks-set.html.

The following list describes how MySQL supports the different
transaction levels. The list goes from the most commonly used level to
the least used.

o REPEATABLE READ

  This is the default isolation level for InnoDB. For consistent reads,
  there is an important difference from the READ COMMITTED isolation
  level: All consistent reads within the same transaction read the
  snapshot established by the first read. This convention means that if
  you issue several plain (nonlocking) SELECT statements within the
  same transaction, these SELECT statements are consistent also with
  respect to each other. See
  http://dev.mysql.com/doc/refman/5.5/en/innodb-consistent-read.html.

  For locking reads (SELECT with FOR UPDATE or LOCK IN SHARE MODE),
  UPDATE, and DELETE statements, locking depends on whether the
  statement uses a unique index with a unique search condition, or a
  range-type search condition. For a unique index with a unique search
  condition, InnoDB locks only the index record found, not the gap
  before it. For other search conditions, InnoDB locks the index range
  scanned, using gap locks or next-key (gap plus index-record) locks to
  block insertions by other sessions into the gaps covered by the
  range.

o READ COMMITTED

  A somewhat Oracle-like isolation level with respect to consistent
  (nonlocking) reads: Each consistent read, even within the same
  transaction, sets and reads its own fresh snapshot. See
  http://dev.mysql.com/doc/refman/5.5/en/innodb-consistent-read.html.

  For locking reads (SELECT with FOR UPDATE or LOCK IN SHARE MODE),
  InnoDB locks only index records, not the gaps before them, and thus
  permits the free insertion of new records next to locked records. For
  UPDATE and DELETE statements, locking depends on whether the
  statement uses a unique index with a unique search condition (such as
  WHERE id = 100), or a range-type search condition (such as WHERE id >
  100). For a unique index with a unique search condition, InnoDB locks
  only the index record found, not the gap before it. For range-type
  searches, InnoDB locks the index range scanned, using gap locks or
  next-key (gap plus index-record) locks to block insertions by other
  sessions into the gaps covered by the range. This is necessary
  because "phantom rows" must be blocked for MySQL replication and
  recovery to work.

  *Note*: In MySQL 5.5, if the READ COMMITTED isolation level is used
  or the innodb_locks_unsafe_for_binlog system variable is enabled,
  there is no InnoDB gap locking except for foreign-key constraint
  checking and duplicate-key checking. Also, record locks for
  nonmatching rows are released after MySQL has evaluated the WHERE
  condition. If you use READ COMMITTED or enable
  innodb_locks_unsafe_for_binlog, you must use row-based binary
  logging.

o READ UNCOMMITTED

  SELECT statements are performed in a nonlocking fashion, but a
  possible earlier version of a row might be used. Thus, using this
  isolation level, such reads are not consistent. This is also called a
  "dirty read." Otherwise, this isolation level works like READ
  COMMITTED.

o SERIALIZABLE

  This level is like REPEATABLE READ, but InnoDB implicitly converts
  all plain SELECT statements to SELECT ... LOCK IN SHARE MODE if
  autocommit is disabled. If autocommit is enabled, the SELECT is its
  own transaction. It therefore is known to be read only and can be
  serialized if performed as a consistent (nonlocking) read and need
  not block for other transactions. (To force a plain SELECT to block
  if other transactions have modified the selected rows, disable
  autocommit.)

URL: https://mariadb.com/kb/en/set-transaction-isolation-level/

', '', 'https://mariadb.com/kb/en/set-transaction-isolation-level/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (456, 'IS', 18, 'Syntax:
IS boolean_value

Tests a value against a boolean value, where boolean_value can be TRUE,
FALSE, or UNKNOWN.

URL: https://mariadb.com/kb/en/is/

', 'MariaDB> SELECT 1 IS TRUE, 0 IS FALSE, NULL IS UNKNOWN;
        -> 1, 1, 1
', 'https://mariadb.com/kb/en/is/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (457, 'GET_FORMAT', 31, 'Syntax:
GET_FORMAT({DATE|TIME|DATETIME}, {''EUR''|''USA''|''JIS''|''ISO''|''INTERNAL''})

Returns a format string. This function is useful in combination with
the DATE_FORMAT() and the STR_TO_DATE() functions.

URL: https://mariadb.com/kb/en/get_format/

', 'MariaDB> SELECT DATE_FORMAT(''2003-10-03'',GET_FORMAT(DATE,''EUR''));
        -> ''03.10.2003''
MariaDB> SELECT STR_TO_DATE(''10.31.2003'',GET_FORMAT(DATE,''USA''));
        -> ''2003-10-31''
', 'https://mariadb.com/kb/en/get_format/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (458, 'TINYBLOB', 22, 'TINYBLOB

A BLOB column with a maximum length of 255 (28 - 1) bytes. Each
TINYBLOB value is stored using a 1-byte length prefix that indicates
the number of bytes in the value.

URL: https://mariadb.com/kb/en/tinyblob/

', '', 'https://mariadb.com/kb/en/tinyblob/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (459, 'SIGNAL', 23, 'Syntax:
SIGNAL condition_value
    [SET signal_information_item
    [, signal_information_item] ...]

condition_value:
    SQLSTATE [VALUE] sqlstate_value
  | condition_name

signal_information_item:
    condition_information_item_name = simple_value_specification

condition_information_item_name:
    CLASS_ORIGIN
  | SUBCLASS_ORIGIN
  | MESSAGE_TEXT
  | MYSQL_ERRNO
  | CONSTRAINT_CATALOG
  | CONSTRAINT_SCHEMA
  | CONSTRAINT_NAME
  | CATALOG_NAME
  | SCHEMA_NAME
  | TABLE_NAME
  | COLUMN_NAME
  | CURSOR_NAME

condition_name, simple_value_specification:
    (see following discussion)

SIGNAL is the way to "return" an error. SIGNAL provides error
information to a handler, to an outer portion of the application, or to
the client. Also, it provides control over the error''s characteristics
(error number, SQLSTATE value, message). Without SIGNAL, it is
necessary to resort to workarounds such as deliberately referring to a
nonexistent table to cause a routine to return an error.

No special privileges are required to execute the SIGNAL statement.

The condition_value in a SIGNAL statement indicates the error value to
be returned. It can be an SQLSTATE value (a 5-character string literal)
or a condition_name that refers to a named condition previously defined
with DECLARE ... CONDITION (see [HELP DECLARE CONDITION]).

An SQLSTATE value can indicate errors, warnings, or "not found." The
first two characters of the value indicate its error class, as
discussed in
https://mariadb.com/kb/en/signal/#signal-condition-inf
ormation-items. Some signal values cause statement termination; see
https://mariadb.com/kb/en/signal/#signal-effects.

The SQLSTATE value for a SIGNAL statement should not start with ''00''
because such values indicate success and are not valid for signaling an
error. This is true whether the SQLSTATE value is specified directly in
the SIGNAL statement or in a named condition referred to in the
statement. If the value is invalid, a Bad SQLSTATE error occurs.

To signal a generic SQLSTATE value, use ''45000'', which means "unhandled
user-defined exception."

The SIGNAL statement optionally includes a SET clause that contains
multiple signal items, in a comma-separated list of
condition_information_item_name = simple_value_specification
assignments.

Each condition_information_item_name may be specified only once in the
SET clause. Otherwise, a Duplicate condition information item error
occurs.

Valid simple_value_specification designators can be specified using
stored procedure or function parameters, stored program local variables
declared with DECLARE, user-defined variables, system variables, or
literals. A character literal may include a _charset introducer.

For information about permissible condition_information_item_name
values, see
https://mariadb.com/kb/en/signal/#signal-condition-inf
ormation-items.

URL: https://mariadb.com/kb/en/signal/

', 'CREATE PROCEDURE p (pval INT)
BEGIN
  DECLARE specialty CONDITION FOR SQLSTATE ''45000'';
  IF pval = 0 THEN
    SIGNAL SQLSTATE ''01000'';
  ELSEIF pval = 1 THEN
    SIGNAL SQLSTATE ''45000''
      SET MESSAGE_TEXT = ''An error occurred'';
  ELSEIF pval = 2 THEN
    SIGNAL specialty
      SET MESSAGE_TEXT = ''An error occurred'';
  ELSE
    SIGNAL SQLSTATE ''01000''
      SET MESSAGE_TEXT = ''A warning occurred'', MYSQL_ERRNO = 1000;
    SIGNAL SQLSTATE ''45000''
      SET MESSAGE_TEXT = ''An error occurred'', MYSQL_ERRNO = 1001;
  END IF;
END;
', 'https://mariadb.com/kb/en/signal/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (460, 'SAVEPOINT', 8, 'Syntax:
SAVEPOINT identifier
ROLLBACK [WORK] TO [SAVEPOINT] identifier
RELEASE SAVEPOINT identifier

InnoDB supports the SQL statements SAVEPOINT, ROLLBACK TO SAVEPOINT,
RELEASE SAVEPOINT and the optional WORK keyword for ROLLBACK.

URL: https://mariadb.com/kb/en/savepoint/

', '', 'https://mariadb.com/kb/en/savepoint/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (461, 'USER', 17, 'Syntax:
USER()

Returns the current MySQL user name and host name as a string in the
utf8 character set.

URL: https://mariadb.com/kb/en/user/

', 'MariaDB> SELECT USER();
        -> ''davida@localhost''
', 'https://mariadb.com/kb/en/user/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (462, 'LABELS', 23, 'Syntax:
[begin_label:] BEGIN
    [statement_list]
END [end_label]

[begin_label:] LOOP
    statement_list
END LOOP [end_label]

[begin_label:] REPEAT
    statement_list
UNTIL search_condition
END REPEAT [end_label]

[begin_label:] WHILE search_condition DO
    statement_list
END WHILE [end_label]

Labels are permitted for BEGIN ... END blocks and for the LOOP, REPEAT,
and WHILE statements. Label use for those statements follows these
rules:

o begin_label must be followed by a colon.

o begin_label can be given without end_label. If end_label is present,
  it must be the same as begin_label.

o end_label cannot be given without begin_label.

o Labels at the same nesting level must be distinct.

o Labels can be up to 16 characters long.

To refer to a label within the labeled construct, use an ITERATE or
LEAVE statement. The following example uses those statements to
continue iterating or terminate the loop:

CREATE PROCEDURE doiterate(p1 INT)
BEGIN
  label1: LOOP
    SET p1 = p1 + 1;
    IF p1 < 10 THEN ITERATE label1; END IF;
    LEAVE label1;
  END LOOP label1;
END;

The scope of a block label does not include the code for handlers
declared within the block. For details, see [HELP DECLARE HANDLER].

URL: https://mariadb.com/kb/en/labels/

', '', 'https://mariadb.com/kb/en/labels/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (464, 'MPOINTFROMWKB', 32, 'MPointFromWKB(wkb[,srid]), MultiPointFromWKB(wkb[,srid])

Constructs a MULTIPOINT value using its WKB representation and SRID.

URL: https://mariadb.com/kb/en/mpointfromwkb/

', '', 'https://mariadb.com/kb/en/mpointfromwkb/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (465, 'CHAR BYTE', 22, 'The CHAR BYTE data type is an alias for the BINARY data type. This is a
compatibility feature.

URL: https://mariadb.com/kb/en/char-byte/

', '', 'https://mariadb.com/kb/en/char-byte/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (469, '>', 18, 'Syntax:
>

Greater than:

URL: https://mariadb.com/kb/en/greater-than/

', 'MariaDB> SELECT 2 > 2;
        -> 0
', 'https://mariadb.com/kb/en/greater-than/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (471, 'MICROSECOND', 31, 'Syntax:
MICROSECOND(expr)

Returns the microseconds from the time or datetime expression expr as a
number in the range from 0 to 999999.

URL: https://mariadb.com/kb/en/microsecond/

', 'MariaDB> SELECT MICROSECOND(''12:00:00.123456'');
        -> 123456
MariaDB> SELECT MICROSECOND(''2009-12-31 23:59:59.000010'');
        -> 10
', 'https://mariadb.com/kb/en/microsecond/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (474, 'FIELD', 37, 'Syntax:
FIELD(str,str1,str2,str3,...)

Returns the index (position) of str in the str1, str2, str3, ... list.
Returns 0 if str is not found.

If all arguments to FIELD() are strings, all arguments are compared as
strings. If all arguments are numbers, they are compared as numbers.
Otherwise, the arguments are compared as double.

If str is NULL, the return value is 0 because NULL fails equality
comparison with any value. FIELD() is the complement of ELT().

URL: https://mariadb.com/kb/en/field/

', 'MariaDB> SELECT FIELD(''ej'', ''Hej'', ''ej'', ''Heja'', ''hej'', ''foo'');
        -> 2
MariaDB> SELECT FIELD(''fo'', ''Hej'', ''ej'', ''Heja'', ''hej'', ''foo'');
        -> 0
', 'https://mariadb.com/kb/en/field/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (463, 'ALTER TABLE', 39, 'Syntax:
ALTER [ONLINE | OFFLINE] [IGNORE] TABLE tbl_name
    [alter_specification [, alter_specification] ...]
    [partition_options]

alter_specification:
    table_options
  | ADD [COLUMN] col_name column_definition
        [FIRST | AFTER col_name ]
  | ADD [COLUMN] (col_name column_definition,...)
  | ADD {INDEX|KEY} [index_name]
        [index_type] (index_col_name,...) [index_option] ...
  | ADD [CONSTRAINT [symbol]] PRIMARY KEY
        [index_type] (index_col_name,...) [index_option] ...
  | ADD [CONSTRAINT [symbol]]
        UNIQUE [INDEX|KEY] [index_name]
        [index_type] (index_col_name,...) [index_option] ...
  | ADD FULLTEXT [INDEX|KEY] [index_name]
        (index_col_name,...) [index_option] ...
  | ADD SPATIAL [INDEX|KEY] [index_name]
        (index_col_name,...) [index_option] ...
  | ADD [CONSTRAINT [symbol]]
        FOREIGN KEY [index_name] (index_col_name,...)
        reference_definition
  | ALTER [COLUMN] col_name {SET DEFAULT literal | DROP DEFAULT}
  | CHANGE [COLUMN] old_col_name new_col_name column_definition
        [FIRST|AFTER col_name]
  | MODIFY [COLUMN] col_name column_definition
        [FIRST | AFTER col_name]
  | DROP [COLUMN] col_name
  | DROP PRIMARY KEY
  | DROP {INDEX|KEY} index_name
  | DROP FOREIGN KEY fk_symbol
  | MAX_ROWS = rows
  | DISABLE KEYS
  | ENABLE KEYS
  | RENAME [TO|AS] new_tbl_name
  | ORDER BY col_name [, col_name] ...
  | CONVERT TO CHARACTER SET charset_name [COLLATE collation_name]
  | [DEFAULT] CHARACTER SET [=] charset_name [COLLATE [=] collation_name]
  | DISCARD TABLESPACE
  | IMPORT TABLESPACE
  | FORCE
  | ADD PARTITION (partition_definition)
  | DROP PARTITION partition_names
  | TRUNCATE PARTITION {partition_names | ALL}
  | COALESCE PARTITION number
  | REORGANIZE PARTITION [partition_names INTO (partition_definitions)]
  | ANALYZE PARTITION {partition_names | ALL}
  | CHECK PARTITION {partition_names | ALL}
  | OPTIMIZE PARTITION {partition_names | ALL}
  | REBUILD PARTITION {partition_names | ALL}
  | REPAIR PARTITION {partition_names | ALL}
  | PARTITION BY partitioning_expression
  | REMOVE PARTITIONING

index_col_name:
    col_name [(length)] [ASC | DESC]

index_type:
    USING {BTREE | HASH}

index_option:
    KEY_BLOCK_SIZE [=] value
  | index_type
  | WITH PARSER parser_name
  | COMMENT ''string''

table_options:
    table_option [[,] table_option] ...  (see CREATE TABLE options)

partition_options:
    (see CREATE TABLE options)

ALTER TABLE changes the structure of a table. For example, you can add
or delete columns, create or destroy indexes, change the type of
existing columns, or rename columns or the table itself. You can also
change characteristics such as the storage engine used for the table or
the table comment.

Partitioning-related clauses for ALTER TABLE can be used with
partitioned tables for repartitioning, for adding, dropping, merging,
and splitting partitions, and for performing partitioning maintenance.
For more information, see
http://dev.mysql.com/doc/refman/5.5/en/alter-table-partition-operations
.html.

Following the table name, specify the alterations to be made. If none
are given, ALTER TABLE does nothing.

URL: https://mariadb.com/kb/en/alter-table/

', '', 'https://mariadb.com/kb/en/alter-table/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (466, 'REPAIR TABLE', 20, 'Syntax:
REPAIR [NO_WRITE_TO_BINLOG | LOCAL] TABLE
    tbl_name [, tbl_name] ...
    [QUICK] [EXTENDED] [USE_FRM]

REPAIR TABLE repairs a possibly corrupted table. By default, it has the
same effect as myisamchk --recover tbl_name. REPAIR TABLE works for
MyISAM, ARCHIVE, and CSV tables. See
https://mariadb.com/kb/en/myisam-storage-engine/, and
https://mariadb.com/kb/en/archive/, and
https://mariadb.com/kb/en/csv/

This statement requires SELECT and INSERT privileges for the table.

REPAIR TABLE is supported for partitioned tables. However, the USE_FRM
option cannot be used with this statement on a partitioned table.

You can use ALTER TABLE ... REPAIR PARTITION to repair one or more
partitions; for more information, see [HELP ALTER TABLE], and
http://dev.mysql.com/doc/refman/5.5/en/partitioning-maintenance.html.

URL: https://mariadb.com/kb/en/repair-table/

', '', 'https://mariadb.com/kb/en/repair-table/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (467, 'MERGE', 39, 'The MERGE storage engine, also known as the MRG_MyISAM engine, is a
collection of identical MyISAM tables that can be used as one.
"Identical" means that all tables have identical column and index
information. You cannot merge MyISAM tables in which the columns are
listed in a different order, do not have exactly the same columns, or
have the indexes in different order. However, any or all of the MyISAM
tables can be compressed with myisampack. See
https://mariadb.com/kb/en/myisampack/. Differences in
table options such as AVG_ROW_LENGTH, MAX_ROWS, or PACK_KEYS do not
matter.

URL: https://mariadb.com/kb/en/merge/

', 'MariaDB> CREATE TABLE t1 (
    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ->    message CHAR(20)) ENGINE=MyISAM;
MariaDB> CREATE TABLE t2 (
    ->    a INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    ->    message CHAR(20)) ENGINE=MyISAM;
MariaDB> INSERT INTO t1 (message) VALUES (''Testing''),(''table''),(''t1'');
MariaDB> INSERT INTO t2 (message) VALUES (''Testing''),(''table''),(''t2'');
MariaDB> CREATE TABLE total (
    ->    a INT NOT NULL AUTO_INCREMENT,
    ->    message CHAR(20), INDEX(a))
    ->    ENGINE=MERGE UNION=(t1,t2) INSERT_METHOD=LAST;
', 'https://mariadb.com/kb/en/merge/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (475, 'MAKETIME', 31, 'Syntax:
MAKETIME(hour,minute,second)

Returns a time value calculated from the hour, minute, and second
arguments.

URL: https://mariadb.com/kb/en/maketime/

', 'MariaDB> SELECT MAKETIME(12,15,30);
        -> ''12:15:30''
', 'https://mariadb.com/kb/en/maketime/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (476, 'CURDATE', 31, 'Syntax:
CURDATE()

Returns the current date as a value in ''YYYY-MM-DD'' or YYYYMMDD format,
depending on whether the function is used in a string or numeric
context.

URL: https://mariadb.com/kb/en/curdate/

', 'MariaDB> SELECT CURDATE();
        -> ''2008-06-13''
MariaDB> SELECT CURDATE() + 0;
        -> 20080613
', 'https://mariadb.com/kb/en/curdate/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (478, 'ALTER TABLESPACE', 39, 'Syntax:
ALTER TABLESPACE tablespace_name
    {ADD|DROP} DATAFILE ''file_name''
    [INITIAL_SIZE [=] size]
    [WAIT]
    ENGINE [=] engine_name

This statement is used with NDB cluster, which is not supported by MariaDB.

URL: https://mariadb.com/kb/en/alter-tablespace/

', '', 'https://mariadb.com/kb/en/alter-tablespace/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (479, 'IF FUNCTION', 7, 'Syntax:
IF(expr1,expr2,expr3)

If expr1 is TRUE (expr1 <> 0 and expr1 <> NULL) then IF() returns
expr2; otherwise it returns expr3. IF() returns a numeric or string
value, depending on the context in which it is used.

URL: https://mariadb.com/kb/en/if-function/

', 'MariaDB> SELECT IF(1>2,2,3);
        -> 3
MariaDB> SELECT IF(1<2,''yes'',''no'');
        -> ''yes''
MariaDB> SELECT IF(STRCMP(''test'',''test1''),''no'',''yes'');
        -> ''no''
', 'https://mariadb.com/kb/en/if-function/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (480, 'ENUM', 22, 'ENUM(''value1'',''value2'',...) [CHARACTER SET charset_name] [COLLATE
collation_name]

An enumeration. A string object that can have only one value, chosen
from the list of values ''value1'', ''value2'', ..., NULL or the special ''''
error value. An ENUM column can have a maximum of 65,535 distinct
values. ENUM values are represented internally as integers.

URL: https://mariadb.com/kb/en/enum/

', '', 'https://mariadb.com/kb/en/enum/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (468, 'CREATE TABLE', 39, 'Syntax:
CREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name
    (create_definition,...)
    [table_options]
    [partition_options]

Or:

CREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name
    [(create_definition,...)]
    [table_options]
    [partition_options]
    select_statement

Or:

CREATE [TEMPORARY] TABLE [IF NOT EXISTS] tbl_name
    { LIKE old_tbl_name | (LIKE old_tbl_name) }

create_definition:
    col_name column_definition
  | [CONSTRAINT [symbol]] PRIMARY KEY [index_type] (index_col_name,...)
      [index_option] ...
  | {INDEX|KEY} [index_name] [index_type] (index_col_name,...)
      [index_option] ...
  | [CONSTRAINT [symbol]] UNIQUE [INDEX|KEY]
      [index_name] [index_type] (index_col_name,...)
      [index_option] ...
  | {FULLTEXT|SPATIAL} [INDEX|KEY] [index_name] (index_col_name,...)
      [index_option] ...
  | [CONSTRAINT [symbol]] FOREIGN KEY
      [index_name] (index_col_name,...) reference_definition
  | CHECK (expr)

column_definition:
    data_type [NOT NULL | NULL] [DEFAULT default_value]
      [AUTO_INCREMENT] [UNIQUE [KEY] | [PRIMARY] KEY]
      [COMMENT ''string'']
      [COLUMN_FORMAT {FIXED|DYNAMIC|DEFAULT}]
      [STORAGE {DISK|MEMORY|DEFAULT}]
      [reference_definition]

data_type:
    BIT[(length)]
  | TINYINT[(length)] [UNSIGNED] [ZEROFILL]
  | SMALLINT[(length)] [UNSIGNED] [ZEROFILL]
  | MEDIUMINT[(length)] [UNSIGNED] [ZEROFILL]
  | INT[(length)] [UNSIGNED] [ZEROFILL]
  | INTEGER[(length)] [UNSIGNED] [ZEROFILL]
  | BIGINT[(length)] [UNSIGNED] [ZEROFILL]
  | REAL[(length,decimals)] [UNSIGNED] [ZEROFILL]
  | DOUBLE[(length,decimals)] [UNSIGNED] [ZEROFILL]
  | FLOAT[(length,decimals)] [UNSIGNED] [ZEROFILL]
  | DECIMAL[(length[,decimals])] [UNSIGNED] [ZEROFILL]
  | NUMERIC[(length[,decimals])] [UNSIGNED] [ZEROFILL]
  | DATE
  | TIME
  | TIMESTAMP
  | DATETIME
  | YEAR
  | CHAR[(length)]
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | VARCHAR(length)
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | BINARY[(length)]
  | VARBINARY(length)
  | TINYBLOB
  | BLOB
  | MEDIUMBLOB
  | LONGBLOB
  | TINYTEXT [BINARY]
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | TEXT [BINARY]
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | MEDIUMTEXT [BINARY]
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | LONGTEXT [BINARY]
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | ENUM(value1,value2,value3,...)
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | SET(value1,value2,value3,...)
      [CHARACTER SET charset_name] [COLLATE collation_name]
  | spatial_type

index_col_name:
    col_name [(length)] [ASC | DESC]

index_type:
    USING {BTREE | HASH}

index_option:
    KEY_BLOCK_SIZE [=] value
  | index_type
  | WITH PARSER parser_name
  | COMMENT ''string''

reference_definition:
    REFERENCES tbl_name (index_col_name,...)
      [MATCH FULL | MATCH PARTIAL | MATCH SIMPLE]
      [ON DELETE reference_option]
      [ON UPDATE reference_option]

reference_option:
    RESTRICT | CASCADE | SET NULL | NO ACTION

table_options:
    table_option [[,] table_option] ...

table_option:
    ENGINE [=] engine_name
  | AUTO_INCREMENT [=] value
  | AVG_ROW_LENGTH [=] value
  | [DEFAULT] CHARACTER SET [=] charset_name
  | CHECKSUM [=] {0 | 1}
  | [DEFAULT] COLLATE [=] collation_name
  | COMMENT [=] ''string''
  | CONNECTION [=] ''connect_string''
  | DATA DIRECTORY [=] ''absolute path to directory''
  | DELAY_KEY_WRITE [=] {0 | 1}
  | INDEX DIRECTORY [=] ''absolute path to directory''
  | INSERT_METHOD [=] { NO | FIRST | LAST }
  | KEY_BLOCK_SIZE [=] value
  | MAX_ROWS [=] value
  | MIN_ROWS [=] value
  | PACK_KEYS [=] {0 | 1 | DEFAULT}
  | PASSWORD [=] ''string''
  | ROW_FORMAT [=] {DEFAULT|DYNAMIC|FIXED|COMPRESSED|REDUNDANT|COMPACT}
  | TABLESPACE tablespace_name [STORAGE {DISK|MEMORY|DEFAULT}]
  | UNION [=] (tbl_name[,tbl_name]...)

partition_options:
    PARTITION BY
        { [LINEAR] HASH(expr)
        | [LINEAR] KEY(column_list)
        | RANGE{(expr) | COLUMNS(column_list)}
        | LIST{(expr) | COLUMNS(column_list)} }
    [PARTITIONS num]
    [SUBPARTITION BY
        { [LINEAR] HASH(expr)
        | [LINEAR] KEY(column_list) }
      [SUBPARTITIONS num]
    ]
    [(partition_definition [, partition_definition] ...)]

partition_definition:
    PARTITION partition_name
        [VALUES 
            {LESS THAN {(expr | value_list) | MAXVALUE} 
            | 
            IN (value_list)}]
        [[STORAGE] ENGINE [=] engine_name]
        [COMMENT [=] ''comment_text'' ]
        [DATA DIRECTORY [=] ''data_dir'']
        [INDEX DIRECTORY [=] ''index_dir'']
        [MAX_ROWS [=] max_number_of_rows]
        [MIN_ROWS [=] min_number_of_rows]
        [TABLESPACE [=] tablespace_name]
        [NODEGROUP [=] node_group_id]
        [(subpartition_definition [, subpartition_definition] ...)]

subpartition_definition:
    SUBPARTITION logical_name
        [[STORAGE] ENGINE [=] engine_name]
        [COMMENT [=] ''comment_text'' ]
        [DATA DIRECTORY [=] ''data_dir'']
        [INDEX DIRECTORY [=] ''index_dir'']
        [MAX_ROWS [=] max_number_of_rows]
        [MIN_ROWS [=] min_number_of_rows]
        [TABLESPACE [=] tablespace_name]
        [NODEGROUP [=] node_group_id]

select_statement:
    [IGNORE | REPLACE] [AS] SELECT ...   (Some valid select statement)

CREATE TABLE creates a table with the given name. You must have the
CREATE privilege for the table.

Rules for permissible table names are given in
https://mariadb.com/kb/en/identifier-names/. By default,
the table is created in the default database, using the InnoDB storage
engine. An error occurs if the table exists, if there is no default
database, or if the database does not exist.

URL: https://mariadb.com/kb/en/create-table/

', '', 'https://mariadb.com/kb/en/create-table/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (481, 'DATABASE', 17, 'Syntax:
DATABASE()

Returns the default (current) database name as a string in the utf8
character set. If there is no default database, DATABASE() returns
NULL. Within a stored routine, the default database is the database
that the routine is associated with, which is not necessarily the same
as the database that is the default in the calling context.

URL: https://mariadb.com/kb/en/database/

', 'MariaDB> SELECT DATABASE();
        -> ''test''
', 'https://mariadb.com/kb/en/database/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (482, 'POINTFROMWKB', 32, 'PointFromWKB(wkb[,srid])

Constructs a POINT value using its WKB representation and SRID.

URL: https://mariadb.com/kb/en/pointfromwkb/

', '', 'https://mariadb.com/kb/en/pointfromwkb/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (483, 'POWER', 4, 'Syntax:
POWER(X,Y)

This is a synonym for POW().

URL: https://mariadb.com/kb/en/power/

', '', 'https://mariadb.com/kb/en/power/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (484, 'ATAN', 4, 'Syntax:
ATAN(X)

Returns the arc tangent of X, that is, the value whose tangent is X.

URL: https://mariadb.com/kb/en/atan/

', 'MariaDB> SELECT ATAN(2);
        -> 1.1071487177941
MariaDB> SELECT ATAN(-2);
        -> -1.1071487177941
', 'https://mariadb.com/kb/en/atan/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (485, 'STRCMP', 37, 'Syntax:
STRCMP(expr1,expr2)

STRCMP() returns 0 if the strings are the same, -1 if the first
argument is smaller than the second according to the current sort
order, and 1 otherwise.

URL: https://mariadb.com/kb/en/strcmp/

', 'MariaDB> SELECT STRCMP(''text'', ''text2'');
        -> -1
MariaDB> SELECT STRCMP(''text2'', ''text'');
        -> 1
MariaDB> SELECT STRCMP(''text'', ''text'');
        -> 0
', 'https://mariadb.com/kb/en/strcmp/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (470, 'ANALYZE TABLE', 20, 'Syntax:
ANALYZE [NO_WRITE_TO_BINLOG | LOCAL] TABLE
    tbl_name [, tbl_name] ...

ANALYZE TABLE analyzes and stores the key distribution for a table.
During the analysis, the table is locked with a read lock for InnoDB
and MyISAM. This statement works with InnoDB, Aria and MyISAM tables.
For MyISAM tables, this statement is equivalent to using myisamchk
--analyze.

For more information on how the analysis works within InnoDB, see
http://dev.mysql.com/doc/refman/5.5/en/innodb-restrictions.html.

MySQL uses the stored key distribution to decide the order in which
tables should be joined when you perform a join on something other than
a constant. In addition, key distributions can be used when deciding
which indexes to use for a specific table within a query.

This statement requires SELECT and INSERT privileges for the table.

ANALYZE TABLE is supported for partitioned tables, and you can use
ALTER TABLE ... ANALYZE PARTITION to analyze one or more partitions;
for more information, see [HELP ALTER TABLE], and
http://dev.mysql.com/doc/refman/5.5/en/partitioning-maintenance.html.

URL: https://mariadb.com/kb/en/analyze-table/

', '', 'https://mariadb.com/kb/en/analyze-table/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (472, 'CONSTRAINT', 39, 'InnoDB supports foreign keys, which let you cross-reference related
data across tables, and foreign key constraints, which help keep this
spread-out data consistent. The syntax for an InnoDB foreign key
constraint definition in the CREATE TABLE or ALTER TABLE statement
looks like this:

[CONSTRAINT [symbol]] FOREIGN KEY
    [index_name] (index_col_name, ...)
    REFERENCES tbl_name (index_col_name,...)
    [ON DELETE reference_option]
    [ON UPDATE reference_option]

reference_option:
    RESTRICT | CASCADE | SET NULL | NO ACTION

URL: https://mariadb.com/kb/en/constraint/

', 'CREATE TABLE product (category INT NOT NULL, id INT NOT NULL,
                      price DECIMAL,
                      PRIMARY KEY(category, id)) ENGINE=INNODB;
CREATE TABLE customer (id INT NOT NULL,
                       PRIMARY KEY (id)) ENGINE=INNODB;
CREATE TABLE product_order (no INT NOT NULL AUTO_INCREMENT,
                            product_category INT NOT NULL,
                            product_id INT NOT NULL,
                            customer_id INT NOT NULL,
                            PRIMARY KEY(no),
                            INDEX (product_category, product_id),
                            FOREIGN KEY (product_category, product_id)
                              REFERENCES product(category, id)
                              ON UPDATE CASCADE ON DELETE RESTRICT,
                            INDEX (customer_id),
                            FOREIGN KEY (customer_id)
                              REFERENCES customer(id)) ENGINE=INNODB;
', 'https://mariadb.com/kb/en/constraint/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (473, 'CREATE SERVER', 39, 'Syntax:
CREATE SERVER server_name
    FOREIGN DATA WRAPPER wrapper_name
    OPTIONS (option [, option] ...)

option:
  { HOST character-literal
  | DATABASE character-literal
  | USER character-literal
  | PASSWORD character-literal
  | SOCKET character-literal
  | OWNER character-literal
  | PORT numeric-literal }

This statement creates the definition of a server for use with the
FEDERATED storage engine. The CREATE SERVER statement creates a new row
within the servers table within the mysql database. This statement
requires the SUPER privilege.

The server_name should be a unique reference to the server. Server
definitions are global within the scope of the server, it is not
possible to qualify the server definition to a specific database.
server_name has a maximum length of 64 characters (names longer than 64
characters are silently truncated), and is case insensitive. You may
specify the name as a quoted string.

The wrapper_name should be mysql, and may be quoted with single
quotation marks. Other values for wrapper_name are not currently
supported.

For each option you must specify either a character literal or numeric
literal. Character literals are UTF-8, support a maximum length of 64
characters and default to a blank (empty) string. String literals are
silently truncated to 64 characters. Numeric literals must be a number
between 0 and 9999, default value is 0.

*Note*: Note that the OWNER option is currently not applied, and has no
effect on the ownership or operation of the server connection that is
created.

The CREATE SERVER statement creates an entry in the mysql.servers table
that can later be used with the CREATE TABLE statement when creating a
FEDERATED table. The options that you specify will be used to populate
the columns in the mysql.servers table. The table columns are
Server_name, Host, Db, Username, Password, Port and Socket.

URL: https://mariadb.com/kb/en/create-server/

', 'CREATE SERVER s
FOREIGN DATA WRAPPER mysql
OPTIONS (USER ''Remote'', HOST ''192.168.1.106'', DATABASE ''test'');
', 'https://mariadb.com/kb/en/create-server/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (489, 'MEDIUMTEXT', 22, 'MEDIUMTEXT [CHARACTER SET charset_name] [COLLATE collation_name]

A TEXT column with a maximum length of 16,777,215 (224 - 1) characters.
The effective maximum length is less if the value contains multi-byte
characters. Each MEDIUMTEXT value is stored using a 3-byte length
prefix that indicates the number of bytes in the value.

URL: https://mariadb.com/kb/en/mediumtext/

', '', 'https://mariadb.com/kb/en/mediumtext/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (490, 'LN', 4, 'Syntax:
LN(X)

Returns the natural logarithm of X; that is, the base-e logarithm of X.
If X is less than or equal to 0, then NULL is returned.

URL: https://mariadb.com/kb/en/ln/

', 'MariaDB> SELECT LN(2);
        -> 0.69314718055995
MariaDB> SELECT LN(-2);
        -> NULL
', 'https://mariadb.com/kb/en/ln/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (491, 'RETURN', 23, 'Syntax:
RETURN expr

The RETURN statement terminates execution of a stored function and
returns the value expr to the function caller. There must be at least
one RETURN statement in a stored function. There may be more than one
if the function has multiple exit points.

This statement is not used in stored procedures, triggers, or events.
The LEAVE statement can be used to exit a stored program of those
types.

URL: https://mariadb.com/kb/en/return/

', '', 'https://mariadb.com/kb/en/return/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (493, 'LOG', 4, 'Syntax:
LOG(X), LOG(B,X)

If called with one parameter, this function returns the natural
logarithm of X. If X is less than or equal to 0, then NULL is returned.

The inverse of this function (when called with a single argument) is
the EXP() function.

URL: https://mariadb.com/kb/en/log/

', 'MariaDB> SELECT LOG(2);
        -> 0.69314718055995
MariaDB> SELECT LOG(-2);
        -> NULL
', 'https://mariadb.com/kb/en/log/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (494, 'SET SQL_LOG_BIN', 8, 'Syntax:
SET sql_log_bin = {0|1}

The sql_log_bin variable controls whether logging to the binary log is
done. The default value is 1 (do logging). To change logging for the
current session, change the session value of this variable. The session
user must have the SUPER privilege to set this variable.

Beginning with MySQL 5.5.5, it is no longer possible to set
@@session.sql_log_bin within a transaction or subquery. (Bug #53437)

URL: https://mariadb.com/kb/en/set-sql_log_bin/

', '', 'https://mariadb.com/kb/en/set-sql_log_bin/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (495, '!=', 18, 'Syntax:
<>, !=

Not equal:

URL: https://mariadb.com/kb/en/not-equal/

', 'MariaDB> SELECT ''.01'' <> ''0.01'';
        -> 1
MariaDB> SELECT .01 <> ''0.01'';
        -> 0
MariaDB> SELECT ''zapp'' <> ''zappp'';
        -> 1
', 'https://mariadb.com/kb/en/not-equal/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (477, 'SET PASSWORD', 10, 'Syntax:
SET PASSWORD [FOR user] =
    {
        PASSWORD(''cleartext password'')
      | OLD_PASSWORD(''cleartext password'')
      | ''encrypted password''
    }

The SET PASSWORD statement assigns a password to an existing MySQL user
account. When the read_only system variable is enabled, the SUPER
privilege is required to use SET PASSWORD, in addition to whatever
other privileges might be required.

If the password is specified using the PASSWORD() or OLD_PASSWORD()
function, the cleartext (unencrypted) password should be given as the
argument to the function, which hashes the password and returns the
encrypted password string. If the password is specified without using
either function, it should be the already encrypted password value as a
literal string. In all cases, the encrypted password string must be in
the format required by the authentication method used for the account.

The old_passwords system variable value determines the hashing method
used by PASSWORD(). If you specify the password using that function and
SET PASSWORD rejects the password as not being in the correct format,
it may be necessary to set old_passwords to change the hashing method.
For descriptions of the permitted values, see
https://mariadb.com/kb/en/server-system-variables#old_passwords.

With no FOR user clause, this statement sets the password for the
current user. (To see which account the server authenticated you as,
invoke the CURRENT_USER() function.) Any client who successfully
connects to the server using a nonanonymous account can change the
password for that account.

With a FOR user clause, this statement sets the password for the named
user. You must have the UPDATE privilege for the mysql database to do
this. The user account name uses the format described in
https://mariadb.com/kb/en/create-user#account-names. The user
value should be given as ''user_name''@''host_name'', where ''user_name'' and
''host_name'' are exactly as listed in the User and Host columns of the
mysql.user table row. (If you specify only a user name, a host name of
''%'' is used.) For example, to set the password for an account with User
and Host column values of ''bob'' and ''%.example.org'', write the
statement like this:

SET PASSWORD FOR ''bob''@''%.example.org'' = PASSWORD(''cleartext password'');

URL: https://mariadb.com/kb/en/set-password/

', '', 'https://mariadb.com/kb/en/set-password/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (486, 'INSERT DELAYED', 27, 'Syntax:
INSERT DELAYED ...

The DELAYED option for the INSERT statement is a MySQL extension to
standard SQL that is very useful if you have clients that cannot or
need not wait for the INSERT to complete. This is a common situation
when you use MySQL for logging and you also periodically run SELECT and
UPDATE statements that take a long time to complete.

When a client uses INSERT DELAYED, it gets an okay from the server at
once, and the row is queued to be inserted when the table is not in use
by any other thread.

Another major benefit of using INSERT DELAYED is that inserts from many
clients are bundled together and written in one block. This is much
faster than performing many separate inserts.

Note that INSERT DELAYED is slower than a normal INSERT if the table is
not otherwise in use. There is also the additional overhead for the
server to handle a separate thread for each table for which there are
delayed rows. This means that you should use INSERT DELAYED only when
you are really sure that you need it.

The queued rows are held only in memory until they are inserted into
the table. This means that if you terminate mysqld forcibly (for
example, with kill -9) or if mysqld dies unexpectedly, any queued rows
that have not been written to disk are lost.

There are some constraints on the use of DELAYED:

o INSERT DELAYED works only with MyISAM, MEMORY, ARCHIVE, and BLACKHOLE
  tables. For engines that do not support DELAYED, an error occurs.

o An error occurs for INSERT DELAYED if used with a table that has been
  locked with LOCK TABLES because the insert must be handled by a
  separate thread, not by the session that holds the lock.

o For MyISAM tables, if there are no free blocks in the middle of the
  data file, concurrent SELECT and INSERT statements are supported.
  Under these circumstances, you very seldom need to use INSERT DELAYED
  with MyISAM.

o INSERT DELAYED should be used only for INSERT statements that specify
  value lists. The server ignores DELAYED for INSERT ... SELECT or
  INSERT ... ON DUPLICATE KEY UPDATE statements.

o Because the INSERT DELAYED statement returns immediately, before the
  rows are inserted, you cannot use LAST_INSERT_ID() to get the
  AUTO_INCREMENT value that the statement might generate.

o DELAYED rows are not visible to SELECT statements until they actually
  have been inserted.

o Prior to MySQL 5.5.7, INSERT DELAYED was treated as a normal INSERT
  if the statement inserted multiple rows, binary logging was enabled,
  and the global logging format was statement-based (that is, whenever
  binlog_format was set to STATEMENT). Beginning with MySQL 5.5.7,
  INSERT DELAYED is always handled as a simple INSERT (that is, without
  the DELAYED option) whenever the value of binlog_format is STATEMENT
  or MIXED. (In the latter case, the statement no longer triggers a
  switch to row-based logging, and so is logged using the
  statement-based format.)

  This does not apply when using row-based binary logging mode
  (binlog_format set to ROW), in which INSERT DELAYED statements are
  always executed using the DELAYED option as specified, and logged as
  row-update events.

o DELAYED is ignored on slave replication servers, so that INSERT
  DELAYED is treated as a normal INSERT on slaves. This is because
  DELAYED could cause the slave to have different data than the master.

o Pending INSERT DELAYED statements are lost if a table is write locked
  and ALTER TABLE is used to modify the table structure.

o INSERT DELAYED is not supported for views.

o INSERT DELAYED is not supported for partitioned tables.

URL: https://mariadb.com/kb/en/insert-delayed/

', '', 'https://mariadb.com/kb/en/insert-delayed/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (496, 'WHILE', 23, 'Syntax:
[begin_label:] WHILE search_condition DO
    statement_list
END WHILE [end_label]

The statement list within a WHILE statement is repeated as long as the
search_condition expression is true. statement_list consists of one or
more SQL statements, each terminated by a semicolon (;) statement
delimiter.

A WHILE statement can be labeled. For the rules regarding label use,
see [HELP labels].

URL: https://mariadb.com/kb/en/while/

', 'CREATE PROCEDURE dowhile()
BEGIN
  DECLARE v1 INT DEFAULT 5;

  WHILE v1 > 0 DO
    ...
    SET v1 = v1 - 1;
  END WHILE;
END;
', 'https://mariadb.com/kb/en/while/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (497, 'AES_DECRYPT', 12, 'Syntax:
AES_DECRYPT(crypt_str,key_str)

This function decrypts data using the official AES (Advanced Encryption
Standard) algorithm. For more information, see the description of
AES_ENCRYPT().

URL: https://mariadb.com/kb/en/aes_decrypt/

', '', 'https://mariadb.com/kb/en/aes_decrypt/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (498, 'DAYNAME', 31, 'Syntax:
DAYNAME(date)

Returns the name of the weekday for date. The language used for the
name is controlled by the value of the lc_time_names system variable
(https://mariadb.com/kb/en/server-system-variables#lc_time_names).

URL: https://mariadb.com/kb/en/dayname/

', 'MariaDB> SELECT DAYNAME(''2007-02-03'');
        -> ''Saturday''
', 'https://mariadb.com/kb/en/dayname/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (487, 'SHOW PROFILE', 26, 'Syntax:
SHOW PROFILE [type [, type] ... ]
    [FOR QUERY n]
    [LIMIT row_count [OFFSET offset]]

type:
    ALL
  | BLOCK IO
  | CONTEXT SWITCHES
  | CPU
  | IPC
  | MEMORY
  | PAGE FAULTS
  | SOURCE
  | SWAPS

The SHOW PROFILE and SHOW PROFILES statements display profiling
information that indicates resource usage for statements executed
during the course of the current session.

Profiling is controlled by the profiling session variable, which has a
default value of 0 (OFF). Profiling is enabled by setting profiling to
1 or ON:

MariaDB> SET profiling = 1;

SHOW PROFILES displays a list of the most recent statements sent to the
server. The size of the list is controlled by the
profiling_history_size session variable, which has a default value of
15. The maximum value is 100. Setting the value to 0 has the practical
effect of disabling profiling.

All statements are profiled except SHOW PROFILE and SHOW PROFILES, so
you will find neither of those statements in the profile list.
Malformed statements are profiled. For example, SHOW PROFILING is an
illegal statement, and a syntax error occurs if you try to execute it,
but it will show up in the profiling list.

SHOW PROFILE displays detailed information about a single statement.
Without the FOR QUERY n clause, the output pertains to the most
recently executed statement. If FOR QUERY n is included, SHOW PROFILE
displays information for statement n. The values of n correspond to the
Query_ID values displayed by SHOW PROFILES.

The LIMIT row_count clause may be given to limit the output to
row_count rows. If LIMIT is given, OFFSET offset may be added to begin
the output offset rows into the full set of rows.

By default, SHOW PROFILE displays Status and Duration columns. The
Status values are like the State values displayed by SHOW PROCESSLIST,
although there might be some minor differences in interpretion for the
two statements for some status values (see
http://dev.mysql.com/doc/refman/5.5/en/thread-information.html).

Optional type values may be specified to display specific additional
types of information:

o ALL displays all information

o BLOCK IO displays counts for block input and output operations

o CONTEXT SWITCHES displays counts for voluntary and involuntary
  context switches

o CPU displays user and system CPU usage times

o IPC displays counts for messages sent and received

o MEMORY is not currently implemented

o PAGE FAULTS displays counts for major and minor page faults

o SOURCE displays the names of functions from the source code, together
  with the name and line number of the file in which the function
  occurs

o SWAPS displays swap counts

Profiling is enabled per session. When a session ends, its profiling
information is lost.

URL: https://mariadb.com/kb/en/show-profile/

', 'MariaDB> SELECT @@profiling;
+-------------+
| @@profiling |
+-------------+
|           0 |
+-------------+
1 row in set (0.00 sec)

MariaDB> SET profiling = 1;
Query OK, 0 rows affected (0.00 sec)

MariaDB> DROP TABLE IF EXISTS t1;
Query OK, 0 rows affected, 1 warning (0.00 sec)

MariaDB> CREATE TABLE T1 (id INT);
Query OK, 0 rows affected (0.01 sec)

MariaDB> SHOW PROFILES;
+----------+----------+--------------------------+
| Query_ID | Duration | Query                    |
+----------+----------+--------------------------+
|        0 | 0.000088 | SET PROFILING = 1        |
|        1 | 0.000136 | DROP TABLE IF EXISTS t1  |
|        2 | 0.011947 | CREATE TABLE t1 (id INT) |
+----------+----------+--------------------------+
3 rows in set (0.00 sec)

MariaDB> SHOW PROFILE;
+----------------------+----------+
| Status               | Duration |
+----------------------+----------+
| checking permissions | 0.000040 |
| creating table       | 0.000056 |
| After create         | 0.011363 |
| query end            | 0.000375 |
| freeing items        | 0.000089 |
| logging slow query   | 0.000019 |
| cleaning up          | 0.000005 |
+----------------------+----------+
7 rows in set (0.00 sec)

MariaDB> SHOW PROFILE FOR QUERY 1;
+--------------------+----------+
| Status             | Duration |
+--------------------+----------+
| query end          | 0.000107 |
| freeing items      | 0.000008 |
| logging slow query | 0.000015 |
| cleaning up        | 0.000006 |
+--------------------+----------+
4 rows in set (0.00 sec)

MariaDB> SHOW PROFILE CPU FOR QUERY 2;
+----------------------+----------+----------+------------+
| Status               | Duration | CPU_user | CPU_system |
+----------------------+----------+----------+------------+
| checking permissions | 0.000040 | 0.000038 |   0.000002 |
| creating table       | 0.000056 | 0.000028 |   0.000028 |
| After create         | 0.011363 | 0.000217 |   0.001571 |
| query end            | 0.000375 | 0.000013 |   0.000028 |
| freeing items        | 0.000089 | 0.000010 |   0.000014 |
| logging slow query   | 0.000019 | 0.000009 |   0.000010 |
| cleaning up          | 0.000005 | 0.000003 |   0.000002 |
+----------------------+----------+----------+------------+
7 rows in set (0.00 sec)
', 'https://mariadb.com/kb/en/show-profile/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (499, 'COERCIBILITY', 17, 'Syntax:
COERCIBILITY(str)

Returns the collation coercibility value of the string argument.

URL: https://mariadb.com/kb/en/coercibility/

', 'MariaDB> SELECT COERCIBILITY(''abc'' COLLATE latin1_swedish_ci);
        -> 0
MariaDB> SELECT COERCIBILITY(USER());
        -> 3
MariaDB> SELECT COERCIBILITY(''abc'');
        -> 4
', 'https://mariadb.com/kb/en/coercibility/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (500, 'INT', 22, 'INT[(M)] [UNSIGNED] [ZEROFILL]

A normal-size integer. The signed range is -2147483648 to 2147483647.
The unsigned range is 0 to 4294967295.

URL: https://mariadb.com/kb/en/int/

', '', 'https://mariadb.com/kb/en/int/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (501, 'GLENGTH', 13, 'GLength(ls)

Returns as a double-precision number the length of the LineString value
ls in its associated spatial reference.

URL: https://mariadb.com/kb/en/glength/

', 'MariaDB> SET @ls = ''LineString(1 1,2 2,3 3)'';
MariaDB> SELECT GLength(GeomFromText(@ls));
+----------------------------+
| GLength(GeomFromText(@ls)) |
+----------------------------+
|            2.8284271247462 |
+----------------------------+
', 'https://mariadb.com/kb/en/glength/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (502, 'RADIANS', 4, 'Syntax:
RADIANS(X)

Returns the argument X, converted from degrees to radians. (Note that
π radians equals 180 degrees.)

URL: https://mariadb.com/kb/en/radians/

', 'MariaDB> SELECT RADIANS(90);
        -> 1.5707963267949
', 'https://mariadb.com/kb/en/radians/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (503, 'COLLATION', 17, 'Syntax:
COLLATION(str)

Returns the collation of the string argument.

URL: https://mariadb.com/kb/en/collation/

', 'MariaDB> SELECT COLLATION(''abc'');
        -> ''latin1_swedish_ci''
MariaDB> SELECT COLLATION(_utf8''abc'');
        -> ''utf8_general_ci''
', 'https://mariadb.com/kb/en/collation/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (504, 'COALESCE', 18, 'Syntax:
COALESCE(value,...)

Returns the first non-NULL value in the list, or NULL if there are no
non-NULL values.

URL: https://mariadb.com/kb/en/coalesce/

', 'MariaDB> SELECT COALESCE(NULL,1);
        -> 1
MariaDB> SELECT COALESCE(NULL,NULL,NULL);
        -> NULL
', 'https://mariadb.com/kb/en/coalesce/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (505, 'VERSION', 17, 'Syntax:
VERSION()

Returns a string that indicates the MySQL server version. The string
uses the utf8 character set. The value might have a suffix in addition
to the version number. See the description of the version system
variable in
https://mariadb.com/kb/en/server-system-variables#version.

URL: https://mariadb.com/kb/en/version/

', 'MariaDB> SELECT VERSION();
        -> ''5.5.29-standard''
', 'https://mariadb.com/kb/en/version/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (488, 'SHOW PROCEDURE CODE', 26, 'Syntax:
SHOW PROCEDURE CODE proc_name

This statement is a MySQL extension that is available only for servers
that have been built with debugging support. It displays a
representation of the internal implementation of the named stored
procedure. A similar statement, SHOW FUNCTION CODE, displays
information about stored functions (see [HELP SHOW FUNCTION CODE]).

Both statements require that you be the owner of the routine or have
SELECT access to the mysql.proc table.

If the named routine is available, each statement produces a result
set. Each row in the result set corresponds to one "instruction" in the
routine. The first column is Pos, which is an ordinal number beginning
with 0. The second column is Instruction, which contains an SQL
statement (usually changed from the original source), or a directive
which has meaning only to the stored-routine handler.

URL: https://mariadb.com/kb/en/show-procedure-code/

', 'MariaDB> DELIMITER //
MariaDB> CREATE PROCEDURE p1 ()
    -> BEGIN
    ->   DECLARE fanta INT DEFAULT 55;
    ->   DROP TABLE t2;
    ->   LOOP
    ->     INSERT INTO t3 VALUES (fanta);
    ->     END LOOP;
    ->   END//
Query OK, 0 rows affected (0.00 sec)

MariaDB> SHOW PROCEDURE CODE p1//
+-----+----------------------------------------+
| Pos | Instruction                            |
+-----+----------------------------------------+
|   0 | set fanta@0 55                         |
|   1 | stmt 9 "DROP TABLE t2"                 |
|   2 | stmt 5 "INSERT INTO t3 VALUES (fanta)" |
|   3 | jump 2                                 |
+-----+----------------------------------------+
4 rows in set (0.00 sec)
', 'https://mariadb.com/kb/en/show-procedure-code/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (492, 'SHOW COLLATION', 26, 'Syntax:
SHOW COLLATION
    [LIKE ''pattern'' | WHERE expr]

This statement lists collations supported by the server. By default,
the output from SHOW COLLATION includes all available collations. The
LIKE clause, if present, indicates which collation names to match. The
WHERE clause can be given to select rows using more general conditions,
as discussed in
https://mariadb.com/kb/en/extended-show/. For example:

MariaDB> SHOW COLLATION LIKE ''latin1%'';
+-------------------+---------+----+---------+----------+---------+
| Collation         | Charset | Id | Default | Compiled | Sortlen |
+-------------------+---------+----+---------+----------+---------+
| latin1_german1_ci | latin1  |  5 |         |          |       0 |
| latin1_swedish_ci | latin1  |  8 | Yes     | Yes      |       0 |
| latin1_danish_ci  | latin1  | 15 |         |          |       0 |
| latin1_german2_ci | latin1  | 31 |         | Yes      |       2 |
| latin1_bin        | latin1  | 47 |         | Yes      |       0 |
| latin1_general_ci | latin1  | 48 |         |          |       0 |
| latin1_general_cs | latin1  | 49 |         |          |       0 |
| latin1_spanish_ci | latin1  | 94 |         |          |       0 |
+-------------------+---------+----+---------+----------+---------+

URL: https://mariadb.com/kb/en/show-collation/

', '', 'https://mariadb.com/kb/en/show-collation/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (506, 'MAKE_SET', 37, 'Syntax:
MAKE_SET(bits,str1,str2,...)

Returns a set value (a string containing substrings separated by ","
characters) consisting of the strings that have the corresponding bit
in bits set. str1 corresponds to bit 0, str2 to bit 1, and so on. NULL
values in str1, str2, ... are not appended to the result.

URL: https://mariadb.com/kb/en/make_set/

', 'MariaDB> SELECT MAKE_SET(1,''a'',''b'',''c'');
        -> ''a''
MariaDB> SELECT MAKE_SET(1 | 4,''hello'',''nice'',''world'');
        -> ''hello,world''
MariaDB> SELECT MAKE_SET(1 | 4,''hello'',''nice'',NULL,''world'');
        -> ''hello''
MariaDB> SELECT MAKE_SET(0,''a'',''b'',''c'');
        -> ''''
', 'https://mariadb.com/kb/en/make_set/');
INSERT INTO mysql.help_topic (help_topic_id, name, help_category_id, description, example, url) VALUES (507, 'FIND_IN_SET', 37, 'Syntax:
FIND_IN_SET(str,strlist)

Returns a value in the range of 1 to N if the string str is in the
string list strlist consisting of N substrings. A string list is a
string composed of substrings separated by "," characters. If the first
argument is a constant string and the second is a column of type SET,
the FIND_IN_SET() function is optimized to use bit arithmetic. Returns
0 if str is not in strlist or if strlist is the empty string. Returns
NULL if either argument is NULL. This function does not work properly
if the first argument contains a comma (",") character.

URL: https://mariadb.com/kb/en/find_in_set/

', 'MariaDB> SELECT FIND_IN_SET(''b'',''a,b,c,d'');
        -> 2
', 'https://mariadb.com/kb/en/find_in_set/');