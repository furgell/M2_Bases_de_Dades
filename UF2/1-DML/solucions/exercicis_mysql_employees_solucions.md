# Exercicis SQL – MySQL Employees Database (Amb Solucions)

A continuació tens els **15 exercicis** amb les seves **solucions SQL completes** basades en l’esquema oficial de la base de dades *MySQL Employees*.

> Nota: tots els exemples assumeixen que el registre actual és aquell amb `to_date = '9999-01-01'`.

---

## 1. Empleats del departament “Sales”

```sql
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no AND de.to_date = '9999-01-01'
JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
ORDER BY e.last_name;
```

---

## 2. Cognoms que comencen per “J”

```sql
SELECT emp_no, first_name, last_name
FROM employees
WHERE last_name LIKE 'J%';
```

---

## 3. Cognoms amb “e” a la segona posició

```sql
SELECT last_name
FROM employees
WHERE last_name LIKE '_e%';
```

---

## 4. Noms que comencen per “T” i contenen “e”

```sql
SELECT first_name
FROM employees
WHERE first_name LIKE 'T%' AND first_name LIKE '%e%';
```

---

## 5. Títols específics (IN i OR)

### Versió amb IN

```sql
SELECT e.last_name, t.title
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no AND t.to_date = '9999-01-01'
WHERE t.title IN ('Senior Engineer', 'Engineer', 'Assistant Engineer');
```

### Versió amb OR

```sql
SELECT e.last_name, t.title
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no AND t.to_date = '9999-01-01'
WHERE t.title = 'Senior Engineer'
   OR t.title = 'Engineer'
   OR t.title = 'Assistant Engineer';
```

---

## 6. Títols que *NO* són els tres anteriors (NOT IN / AND)

### Versió amb NOT IN

```sql
SELECT e.last_name, t.title
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no AND t.to_date = '9999-01-01'
WHERE t.title NOT IN ('Senior Engineer', 'Engineer', 'Assistant Engineer');
```

### Versió amb AND

```sql
SELECT e.last_name, t.title
FROM employees e
JOIN titles t ON e.emp_no = t.emp_no AND t.to_date = '9999-01-01'
WHERE t.title <> 'Senior Engineer'
  AND t.title <> 'Engineer'
  AND t.title <> 'Assistant Engineer';
```

---

## 7. Development (>1995) o Sales (<1990)

```sql
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name, e.hire_date
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no AND de.to_date = '9999-01-01'
JOIN departments d ON de.dept_no = d.dept_no
WHERE (d.dept_name = 'Development' AND e.hire_date > '1995-01-01')
   OR (d.dept_name = 'Sales' AND e.hire_date < '1990-01-01');
```

---

## 8. Departaments d001 o d002 (IN / OR)

### Versió amb IN

```sql
SELECT e.emp_no, e.first_name, e.last_name, de.dept_no
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no AND de.to_date = '9999-01-01'
WHERE de.dept_no IN ('d001', 'd002');
```

### Versió amb OR

```sql
SELECT e.emp_no, e.first_name, e.last_name, de.dept_no
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no AND de.to_date = '9999-01-01'
WHERE de.dept_no = 'd001'
   OR de.dept_no = 'd002';
```

---

## 9. No d001 ni d002 (NOT IN / AND)

### Versió amb NOT IN

```sql
SELECT e.emp_no, e.first_name, e.last_name, de.dept_no
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no AND de.to_date = '9999-01-01'
WHERE de.dept_no NOT IN ('d001', 'd002');
```

### Versió amb AND

```sql
SELECT e.emp_no, e.first_name, e.last_name, de.dept_no
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no AND de.to_date = '9999-01-01'
WHERE de.dept_no <> 'd001'
  AND de.dept_no <> 'd002';
```

---

## 10. Sous entre 50k i 60k

### Versió amb BETWEEN

```sql
SELECT emp_no, salary
FROM salaries
WHERE to_date = '9999-01-01'
  AND salary BETWEEN 50000 AND 60000;
```

### Versió amb >= i <=

```sql
SELECT emp_no, salary
FROM salaries
WHERE to_date = '9999-01-01'
  AND salary >= 50000 AND salary <= 60000;
```

---

## 11. Sous NO compresos entre 50k i 60k

### Versió amb NOT BETWEEN

```sql
SELECT emp_no, salary
FROM salaries
WHERE to_date = '9999-01-01'
  AND salary NOT BETWEEN 50000 AND 60000;
```

### Versió amb OR

```sql
SELECT emp_no, salary
FROM salaries
WHERE to_date = '9999-01-01'
  AND (salary < 50000 OR salary > 60000);
```

---

## 12. Sous > 80k i departaments d001 o d002

### Versió amb IN

```sql
SELECT e.emp_no, s.salary, de.dept_no
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no AND s.to_date = '9999-01-01'
JOIN dept_emp de ON e.emp_no = de.emp_no AND de.to_date = '9999-01-01'
WHERE s.salary > 80000
  AND de.dept_no IN ('d001', 'd002');
```

### Versió amb OR

```sql
SELECT e.emp_no, s.salary, de.dept_no
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no AND s.to_date = '9999-01-01'
JOIN dept_emp de ON e.emp_no = de.emp_no AND de.to_date = '9999-01-01'
WHERE s.salary > 80000
  AND (de.dept_no = 'd001' OR de.dept_no = 'd002');
```

---

## 13. Diferència entre primer sou i sou actual (> 20k)

```sql
SELECT e.emp_no, e.first_name, e.last_name,
       MIN(s.salary) AS primer_sou,
       MAX(s.salary) AS sou_actual,
       (MAX(s.salary) - MIN(s.salary)) AS diferencia
FROM employees e
JOIN salaries s ON e.emp_no = s.emp_no
GROUP BY e.emp_no
HAVING diferencia > 20000;
```

---

## 14. Cognoms que contenen “son” (case-insensitive)

```sql
SELECT emp_no, last_name
FROM employees
WHERE LOWER(last_name) LIKE '%son%';
```

---

## 15. Managers actuals

```sql
SELECT dm.emp_no, dm.dept_no, d.dept_name, dm.from_date, dm.to_date
FROM dept_manager dm
JOIN departments d ON dm.dept_no = d.dept_no
WHERE dm.to_date = '9999-01-01';
```

---

Fitxer creat automàticament en format **Markdown**.

