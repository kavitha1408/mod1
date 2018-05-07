/************************
2.1 Single Row Functions
************************/

1.SELECT staff_name, lpad(staff_sal, 15,'$') AS "STAFF_SALARY" 
  FROM staff_masters;


2.SELECT student_name, to_char(student_dob, 'MONTH DD, YYYY') AS "DOB" 
  FROM student_masters 
  WHERE to_char(student_dob, 'DAY') LIKE '%SUNDAY%' 
  OR to_char(student_dob, 'DAY') LIKE '%SATURDAY%';


3.SELECT staff_name, round(MONTHS_BETWEEN(sysdate, hiredate)) AS "Months_worked" 
  FROM staff_masters ORDER BY round(MONTHS_BETWEEN(hiredate,sysdate));


4.SELECT staff_name,staff_sal, rpad(' ',((staff_sal/1000)+1),'X') X 
  FROM staff_masters;


5.SELECT * 
  FROM staff_masters 
  WHERE to_char(hiredate,'MON')='DEC' AND to_char(hiredate,'DD')<=15;


6.SELECT staff_name,staff_sal,
  CASE 
  WHEN staff_sal>50000 THEN 'A'
  WHEN staff_sal>=25000 AND staff_sal<50000 THEN 'B'
  WHEN staff_sal>=10000 AND staff_sal<25000 THEN 'C'
  ELSE 'D'
  END
  GRADE FROM staff_masters;


7.SELECT staff_name,hiredate,to_char(hiredate,'day')"DAY" 
  FROM staff_masters 
  ORDER BY to_char(hiredate,'d');


8.SELECT (rpad(substr(staff_name, 0, 1),LENGTH(staff_name)-1,'*')|| substr(staff_name,LENGTH(staff_name),1)) "NAME"
  FROM staff_master; 


9.SELECT instr('Mississippi','i',1,3)"NAME" FROM dual;


10.SELECT  DISTINCT CASE WHEN TO_CHAR(LAST_DAY(sysdate),'d') = 5 THEN TO_CHAR(LAST_DAY(sysdate)-6,'ddspth "of" month, yyyy')
   WHEN TO_CHAR(LAST_DAY(sysdate),'d') = 4 THEN TO_CHAR(LAST_DAY(sysdate)-5,'ddspth "of" month, yyyy')
   WHEN TO_CHAR(LAST_DAY(sysdate),'d') = 3 THEN TO_CHAR(LAST_DAY(sysdate)-4,'ddspth "of" month, yyyy')
   WHEN TO_CHAR(LAST_DAY(sysdate),'d') = 2 THEN TO_CHAR(LAST_DAY(sysdate)-3,'ddspth "of" month, yyyy')
   WHEN TO_CHAR(LAST_DAY(sysdate),'d') = 1 THEN TO_CHAR(LAST_DAY(sysdate)-2,'ddspth "of" month, yyyy')
   WHEN TO_CHAR(LAST_DAY(sysdate),'d') = 7 THEN TO_CHAR(LAST_DAY(sysdate)-1,'ddspth "of" month, yyyy')
   WHEN TO_CHAR(LAST_DAY(sysdate),'d') = 6 THEN TO_CHAR(LAST_DAY(sysdate),'ddspth "of" month, yyyy')
   END as "PAY DATE" FROM staff_masters; 


11.SELECT student_code,student_name,dept_code,
   DECODE(dept_code,20,'Electricals',30,'Electronics','others')
   FROM student_masters;


12.SELECT student_name, NVL(to_char(dept_code), 'No Department')"Department" FROM student_masters;

/*****************************
2.2 Group Functions:
******************************/

1.SELECT ROUND(MAX(staff_sal),0)"Maximum",ROUND(MIN(staff_sal),0)"Minimum",ROUND(AVG(staff_sal),0)"Average",ROUND(SUM(staff_sal),0)"Total" 
  FROM staff_masters;


2.SELECT count(mgr_code)"Total No Of Managers", dept_code 
  FROM staff_masters GROUP BY dept_code


3.SELECT dept_code,SUM(staff_sal)"Sal" 
  FROM staff_masters WHERE staff_code<> mgr_code 
  GROUP BY dept_code HAVING SUM(staff_sal)>20000;


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
