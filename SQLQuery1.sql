
select * from [workers] where ABS(DATEDIFF(day, S�nnikuup�ev, GETDATE())) <= 3;
select * from [workers] where ABS(DATEDIFF(day, DATEFROMPARTS ( YEAR(getdate()), MONTH(S�nnikuup�ev), DAY(S�nnikuup�ev) ), GETDATE())) <= 3 OR ABS(DATEDIFF(day, DATEFROMPARTS ( YEAR(getdate())+1, MONTH(S�nnikuup�ev), DAY(S�nnikuup�ev) ), GETDATE())) <= 3 OR ABS(DATEDIFF(day, DATEFROMPARTS ( YEAR(getdate())-1, MONTH(S�nnikuup�ev), DAY(S�nnikuup�ev) ), GETDATE())) <= 3
select * from [workers] where ABS(DATEDIFF(day, DATEFROMPARTS ( YEAR(2019), MONTH(S�nnikuup�ev), DAY(S�nnikuup�ev) ), (12/29/2019))) <= 3;

select DATEADD(day,-3,GETDATE());

select DATEADD(month,0,GETDATE())


