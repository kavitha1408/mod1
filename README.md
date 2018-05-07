1. CREATE table Customer(
    Customerid number(5),
    cust_name varchar2(20),
    address1 varchar2(30),
    address2 varchar2(30));
    
	
2. ALTER table Customer modify (cust_name varchar2(30) NOT NULL)
alter table customer rename column cust_name to customer_name;


3.a. ALTER table customer add(gender varchar2(1),age number(3),phoneno number(10));
3.b. ALTER table customer rename to cust_table1;


4. INSERT into cust_table1 values(1000,'Allen','#115 chicago','#115 chicago','M','25','7878776');
INSERT into cust_table1 values(1001,'george','#116 france','#116 france','M',25,434524);
INSERT into cust_table1 values(1002,'becker','#114 new york','#114 new york','M',45,431525);


5. ALTER table Cust_table1 modify (customerid number(5) constraint cu_pk primary key);


6. INSERT into cust_table1 values(1002,'john','#114chicago','#114chicago','M',45,439525);

7. ALTER table cust_table1 disable constraint cu_pk;
insert into cust_table1 values(1002,'Becker','#114 New York','#114 New York','M',45,431525);
insert into cust_table1 values(1003,'Nanapatekar','#115 India','#115 India','M',45,431525);


8. ALTER table cust_table1 enable constraint cu_pk;


9. ALTER table cust_table1 drop primary key;
ALTER table cust_table1 add(price number(8,2));
INSERT into cust_table1 values(1002,'Becker','#114 New York','#114 New York','M',45,431525,15000.50);
INSERT into cust_table1 values(1003,'Nanapatekar','#115 India','#115 India','M',45,431525,20000.50);


10. TRUNCATE table cust_table1;


11. ALTER table cust_table1 add(E_mail varchar2(30));


12. ALTER table cust_table1 drop column E_mail;


13. ALTER table cust_table1 add(EmailId varchar2(30));


14. ALTER table cust_table1 set unused column EmailId;


15. ALTER table cust_table1 drop unused columns;


16. CREATE table Suppliers(
    SuppId number(5),
    sname varchar2(20),
    address1 varchar2(30),
    address2 varchar2(30),
    Contactno number(10));
    
	
17. DROP table Suppliers;
CREATE table CustomerMaster1(
        customerId number(5) constraint Custid_pk1 primary key,
        customername varchar2(30) not null,
        address1 varchar2(30) not null,
        address2 varchar2(30),
        gender varchar2(1),
        age number(3),
        phoneno number(10));

		
18. CREATE table accountmaster(
      customerid number(5),
      accountnumber number(10,2) constraint acc_pk1 primary key,
      accounttype char(3),
      ledgerbalance number(10,2) not null);
    CREATE sequence s41 increment by 1
                    start with 1001
                    maxvalue 2000
                    nocycle;

					
19. ALTER table accountmaster add constraint cust_acc2 foreign key (customerId) references CustomerMaster1(customerId); 


20. INSERT into customermaster1 values(1000,'Allen','#115 chicago','#115 chicago','M',25,7878776);
INSERT into customermaster1 values(1001,'george','#116 france','#116 france','M',25,434524);
INSERT into customermaster1 values(1002,'becker','#114 new york','#114 new york','M',45,431525);

21. ALTER table accountmaster modify accounttype char(3) check(accounttype in ('NRI','IND'));

22. INSERT into accountmaster values(s41.nextval,12345.00,'NRI',15000.00);
INSERT into accountmaster values(s41.nextval,12355.00,'IND',19000.00);
INSERT into accountmaster values(s41.nextval,15345.00,'NRI',20000.00);
INSERT into accountmaster values(s41.nextval,16745.00,'IND',14000.00);
SELECT * from  accountmaster;


23. ALTER table accountmaster modify  ledgerbalance number(10,2) check(ledgerbalance>5000);


24. ALTER table accountmaster
drop constraint cust_acc2;
ALTER TABLE accountmaster
modify (customerid number(5) REFERENCES customermaster1 (customerid) ON DELETE CASCADE );


25. CREATE table accountdetails1 AS (select * from accountmaster);


26. ALTER table accountdetails1 rename to backuptable;


27. CREATE view Acc_view (customercode, accountholdername,accountnumber,type1,balance) as 
(select a.customerid, c.customername,a.accountnumber, a.accounttype, a.ledgerbalance from accountmaster a, customermaster1 c
 where a.customerid=c.customerid);
 
 
28. CREATE view vaccs_dtls as select * from accountmaster
        where accounttype='IND' and ledgerbalance > 10000
        WITH CHECK OPTION CONSTRAINT vaccs_dtls;
		
		
29. CREATE view accsvw10 as select * from accountmaster with CHECK OPTION CONSTRAINT accsvw10;


30. CREATE view dee1 as select dept_name from department_masters d, staff_masters s 
where d.dept_code= s.dept_code and s.staff_sal in(select max(staff_sal) from staff_masters);
select * from dee1;


31. CREATE view dsal as select s.staff_name,max(s.staff_sal)"maxsal", d.dept_code from staff_masters s, department_masters d 
where s.dept_code= d.dept_code and rownum<=6 group by staff_name,d.dept_code order by d.dept_code desc ;
 select * from dsal;


32. CREATE sequence seq_dept21
        increment by 10 
          start with 10
          maxvalue 200
            nocycle;
			
			
33. INSERT INTO department_masters VALUES(seq_dept21.nextval,'mpc');
INSERT INTO department_masters VALUES(seq_dept21.nextval,'ssc');
INSERT INTO department_masters VALUES(seq_dept21.nextval,'biology');


34. ALTER sequence seq_dept21
      increment by 15
      maxvalue 200 
      nocycle;
INSERT INTO department_masters VALUES(seq_dept21.nextval,'zoology');
INSERT INTO department_masters VALUES(seq_dept21.nextval,'geology');
INSERT INTO department_masters VALUES(seq_dept21.nextval,'anotomy');
INSERT INTO department_masters VALUES(seq_dept21.nextval,'botony');
INSERT INTO department_masters VALUES(seq_dept21.nextval,'jee');


35. DROP sequence seq_dept21;


36. CREATE unique index no_name on department_masters(dept_code,dept_name);


37. SELECT * from user_indexes where index_name = 'no_name';


38. CREATE synonym synEmp for emp3;


39. SELECT * from user_synonyms where synonym_name = 'synEmp';



40. CREATE force view item12 (itemno,itemdesc,rate)as SELECT code, category, rate from item;


41. CREATE index idx_emp_hiredate on emp_copy(hiredate);


42. CREATE sequence seq_emp increment by 1
                start with 1001
                minvalue 1002
                nocycle;

