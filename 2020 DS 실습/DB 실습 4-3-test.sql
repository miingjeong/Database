set @a=100;
set @b=200;
set @c =@a+@b;
set @d=@b-@a;
select @a,@b,@c,@d;

drop procedure if exists add_sum;
delimiter $$
create procedure add_sum ( )
begin
	declare a int;
    declare b int;
    declare c int;
    set a=500; set b=300; set c=a+b;
    select a,b,c;
end $$
delimiter $$;

call add_sum;
call add_sum;
call add_sum;

drop procedure if exists score;
delimiter $$
create procedure score()
begin
	declare d int;
    set d=86;
    if d >=90 then select 'A입니다';
    elseif d >=80 then select 'b입니다';
    elseif d>=70 then select 'c입니다';
    else select 'F입니다.';
    end if;
end $$
delimiter;

call score;

drop procedure if exists rep;
delimiter $$
create procedure rep()
begin
	declare i int;
    declare hap int;
	set i=0; set hap=0;
    myLoop: LOOP
		if i >100 then leave myLoop;
        end if;
        set hap=hap + i;
        set i = i +1;
	end loop myLoop;
    select hap;
end $$
delimiter ;

call rep;