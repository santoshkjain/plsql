SET SERVEROUT ON;
declare
	v_test varchar2(20);
begin
	v_test := 'Skipper';
    DBMS_OUTPUT.PUT_LINE(v_test);
end;
/

declare
    v_salary number(10);
begin  
    select salary into v_salary from employees where employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(v_salary);
end;
/

declare
    v_salary number(10);
    v_fname varchar2(20);
begin  
    select salary, first_name into v_salary, v_fname from employees where employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(v_fname || 'has a salary of ' || v_salary);
end;
/

--Anchored Datatype
declare
    v_fname students.first_name%TYPE
begin
    select first_name into v_fname from students where stu_id = 1;
    DBMS_OUTPUT.PUT_LINE(v_fname);
end;
/

--CONSTANT DEFAULT NOT NULL
declare
    v_pi CONSTANT NUMBER(7,6) NOT NULL DEFAULT 3.141592;
begin   
    DBMS_OUTPUT.PUT_LINE(v_pi);
end;
/

--BIND VARIABLE
SET AUTOPRINT ON;
SET SERVEROUT ON;
VARIABLE v_bind1 varchar2(20);
VARIABLE v_bind2 varchar2(20);
EXEC :v_bind1 := 'Testing'
PRINT :v_bind1
begin
    :v_bind2 := 'Also Testing';
    DBMS_OUTPUT.PUT_LINE(v_bind1 || v_bind2);
end;
/


--IF THEN IF THEN ELSE IF THEN ELSEIF
SET SERVEROUT ON;
declare
    v_place varchar2(20) := '&enter_city';
begin
    if v_place = 'Metropolis' THEN
        DBMS_OUTPUT.PUT_LINE('City is protected by Superman');
    ELSEIF v_place = 'Gotham' THEN
        DBMS_OUTPUT.PUT_LINE('City is protected by Batman');
    ELSEIF v_place = 'Amazon' THEN
        DBMS_OUTPUT.PUT_LINE('City is protected by Wonder woman');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Please contact Avengers')
    END IF;
    DBMS_OUTPUT.PUT_LINE('Thanks for contacting us');
end;
/


select * from superheroes;

select * from first_name, last_name,
 (CASE
    WHEN first_name = 'Tony' and last_name = 'Stark' THEN 'IronMan'
    WHEN first_name = 'Bruce' and last_name = 'Wayne' THEN 'Batman'
    WHEN first_name = 'Clarke' and last_name = 'Kane' THEN 'Superman'
    WHEN first_name = 'Peter' and last_name = 'Parker' THEN 'Spiderman'
    WHEN first_name = 'Gangadhar' and last_name = '' THEN 'Shaktiman'
    Else 'Sorry'
    END
 ) as superheroes
 from superheroes;