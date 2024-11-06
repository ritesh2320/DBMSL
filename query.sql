delimiter //
create procedure calfine (roll1 integer, nob varchar(30) )

begin 
	
declare x integer;
declare fine integer;
	
declare continue handler FOR NOT found
begin
select concat("Roll No" , roll1, "NOT FOUND") AS NoRecord ; 
end;
	
select datediff(curdate() , DOI) into x from borrower where Roll = roll1;
		
if ( x > 15 && x < 30 ) then
insert into Fine values ( roll1, curdate() , (x * 5));
end if;
	
if (x > 30 ) then 
insert into Fine values( roll1, curdate() , (x * 50));
end if;
		
end;
//
delimiter ;
