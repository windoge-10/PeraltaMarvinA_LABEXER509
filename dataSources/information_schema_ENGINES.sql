INSERT INTO information_schema.ENGINES (ENGINE, SUPPORT, COMMENT, TRANSACTIONS, XA, SAVEPOINTS) VALUES ('CSV', 'YES', 'Stores tables as CSV files', 'NO', 'NO', 'NO');
INSERT INTO information_schema.ENGINES (ENGINE, SUPPORT, COMMENT, TRANSACTIONS, XA, SAVEPOINTS) VALUES ('MRG_MyISAM', 'YES', 'Collection of identical MyISAM tables', 'NO', 'NO', 'NO');
INSERT INTO information_schema.ENGINES (ENGINE, SUPPORT, COMMENT, TRANSACTIONS, XA, SAVEPOINTS) VALUES ('MEMORY', 'YES', 'Hash based, stored in memory, useful for temporary tables', 'NO', 'NO', 'NO');
INSERT INTO information_schema.ENGINES (ENGINE, SUPPORT, COMMENT, TRANSACTIONS, XA, SAVEPOINTS) VALUES ('Aria', 'YES', 'Crash-safe tables with MyISAM heritage. Used for internal temporary tables and privilege tables', 'NO', 'NO', 'NO');
INSERT INTO information_schema.ENGINES (ENGINE, SUPPORT, COMMENT, TRANSACTIONS, XA, SAVEPOINTS) VALUES ('MyISAM', 'YES', 'Non-transactional engine with good performance and small data footprint', 'NO', 'NO', 'NO');
INSERT INTO information_schema.ENGINES (ENGINE, SUPPORT, COMMENT, TRANSACTIONS, XA, SAVEPOINTS) VALUES ('SEQUENCE', 'YES', 'Generated tables filled with sequential values', 'YES', 'NO', 'YES');
INSERT INTO information_schema.ENGINES (ENGINE, SUPPORT, COMMENT, TRANSACTIONS, XA, SAVEPOINTS) VALUES ('InnoDB', 'DEFAULT', 'Supports transactions, row-level locking, foreign keys and encryption for tables', 'YES', 'YES', 'YES');
INSERT INTO information_schema.ENGINES (ENGINE, SUPPORT, COMMENT, TRANSACTIONS, XA, SAVEPOINTS) VALUES ('PERFORMANCE_SCHEMA', 'YES', 'Performance Schema', 'NO', 'NO', 'NO');