DECLARE @i int = 0
DECLARE @baseDate datetime ='1-1-2019'
WHILE @i < 700*1440
BEGIN
 
    INSERT INTO [dbo].[dim_date](Date,AnsiDate,SqlDate,[Day],[Month],[Quarter],[Year],Time,Active) Values (CAST(@baseDate as date),CAST(CAST(@baseDate as date)as char(10)),@baseDate,DAY(@baseDate),MONTH(@baseDate),CONCAT('Q',CEILING(CAST(MONTH(@baseDate) AS FLOAT)/3)),YEAR(@baseDate),CAST(@baseDate as Time),1)
    SET @baseDate=DATEADD(minute,1,@baseDate)
    SET @i = @i + 1
END