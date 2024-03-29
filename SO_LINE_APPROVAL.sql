-- HYBRID, new table
SET TRUEBITCREATE = OFF;
SET TRUENULLCREATE = OFF;

-- These will error out on first run, ignore through
DROP TABLE SO_LINE_APPROVAL ;  -- This will delete the file if it exists
DROP VIEW V_SO_LINE_APPROVAL ;

CREATE TABLE SO_LINE_APPROVAL  USING '..\..\FILES\@@@ORDAPPR-V0'
(ORDER_NO CHAR(7) NOT NULL,
LINE CHAR(4) NOT NULL,
APPROVAL_FLAG BIT NOT NULL,
FILLER CHAR(20) NOT NULL 
);

CREATE UNIQUE NOT MODIFIABLE INDEX SO_LINE_APPROVALK00 ON SO_LINE_APPROVAL 
(ORDER_NO ASC,
LINE ASC
);

CREATE VIEW V_SO_LINE_APPROVAL  AS SELECT
ORDER_NO ,
LINE ,
APPROVAL_FLAG
FROM SO_LINE_APPROVAL
;
