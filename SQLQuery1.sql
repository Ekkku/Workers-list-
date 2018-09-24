
select * from [workers] where ABS(DATEDIFF(day, Sünnikuupäev, GETDATE())) <= 3;
select * from [workers] where ABS(DATEDIFF(day, DATEFROMPARTS ( YEAR(getdate()), MONTH(Sünnikuupäev), DAY(Sünnikuupäev) ), GETDATE())) <= 3 OR ABS(DATEDIFF(day, DATEFROMPARTS ( YEAR(getdate())+1, MONTH(Sünnikuupäev), DAY(Sünnikuupäev) ), GETDATE())) <= 3 OR ABS(DATEDIFF(day, DATEFROMPARTS ( YEAR(getdate())-1, MONTH(Sünnikuupäev), DAY(Sünnikuupäev) ), GETDATE())) <= 3
select * from [workers] where ABS(DATEDIFF(day, DATEFROMPARTS ( YEAR(2019), MONTH(Sünnikuupäev), DAY(Sünnikuupäev) ), (12/29/2019))) <= 3;

select DATEADD(day,-3,GETDATE());

select DATEADD(month,0,GETDATE())


