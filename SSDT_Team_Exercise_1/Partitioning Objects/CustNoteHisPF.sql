﻿CREATE PARTITION FUNCTION CustNoteHisPF(DATETIME) AS RANGE RIGHT FOR VALUES
(N'12/1/2013')
