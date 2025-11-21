# Exercicis SQL – MySQL Employees Database

A continuació tens un conjunt de 15 exercicis basats en l’esquema oficial de la base de dades **MySQL Employees**.

---

## 1. Cognoms i departament “Sales”
Selecciona tots els empleats que actualment treballen al departament "Sales". Ordena pel cognom i mostra: `emp_no`, `first_name`, `last_name`, `dept_name`.

## 2. Cognoms que comencen per “J”
Mostra l’identificador, el nom i el cognom dels empleats el cognom dels quals comenci per “J”.

## 3. Cognoms amb “e” a la segona posició
Mostra els cognoms de `employees` que tenen una “e” a la segona posició.

## 4. Noms que comencen per “T” i contenen “e”
Mostra els noms (`first_name`) que comencen per "T" i contenen una “e”.

## 5. Títols “Senior Engineer”, “Engineer”, “Assistant Engineer” (IN / OR)
Mostra cognom i títol dels empleats amb un d’aquests títols actuals. Escriu-ho de dues formes: amb `IN` i amb condicions `OR`.

## 6. Títols que NO són els tres anteriors (NOT IN / AND <>)
Mostra cognoms i títol actual dels empleats que **no** tenen cap dels tres títols anteriors. Escriu-ho amb `NOT IN` i amb `AND <>`.

## 7. Development vs Sales amb condicions diferents
Llista empleats que:
- treballen a “Development” i van ser contractats després de 1995-01-01  
**o**
- treballen a “Sales” i van ser contractats abans de 1990-01-01.  
Mostra: `emp_no`, `first_name`, `last_name`, `dept_name`, `hire_date`.

## 8. Departaments d001 o d002 (IN / OR)
Mostra `emp_no`, `first_name`, `last_name`, `dept_no` per empleats actuals de d001 o d002. Escriu-ho amb `IN` i amb `OR`.

## 9. No departaments d001 ni d002 (NOT IN / AND)
Mostra identificador, nom, cognom i departament per empleats que **no** estiguin a d001 o d002. Escriu-ho amb `NOT IN` i amb `AND <>`.

## 10. Sous entre 50.000 i 60.000 (BETWEEN / AND)
Obté `emp_no` i sou actual per sous entre 50k i 60k. Escriu-ho amb `BETWEEN` i amb `>=` i `<=`.

## 11. Sous NO compresos entre 50.000 i 60.000 (NOT BETWEEN / OR)
Mostra `emp_no` i sou actual per sous que no estan entre 50k i 60k. Escriu-ho amb `NOT BETWEEN` i amb `OR`.

## 12. Sous > 80.000 i departaments d001 o d002 (IN / OR)
Mostra `emp_no`, sou actual i `dept_no` per empleats amb sou > 80k i que treballen a d001 o d002. Escriu-ho amb `IN` i amb `OR`.

## 13. Diferència de sous > 20.000
Mostra `emp_no`, nom, cognom, primer sou, sou actual i diferència (actual - primer) per diferències > 20.000.

## 14. Cognoms que contenen “son”
Selecciona empleats amb cognom que contingui “son”, ignorant majúscules/minúscules.

## 15. Llista de managers actuals
Mostra de `dept_manager` els managers que encara són actius (`to_date = '9999-01-01'`): `emp_no`, `dept_no`, `dept_name`, `from_date`, `to_date`.

