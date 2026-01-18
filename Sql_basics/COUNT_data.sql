/*it returns the number of rows*/
/* its selects all the rows of all the columns in proucts */
SELECT COUNT(*)
FROM Products;
/*we can specify the specific column name*/
SELECT COUNT(ProductName)
FROM Products;
/* we can specify specific condition*/
SELECT COUNT(ProductID)
FROM Products;
WHERE price>20;
/* ignore the duplicates while counting the rows*/
SELECT COUNT(DISTINCT Price)
FROM Products;
/*can use a descriptive name for the count*/
SELECT COUNT(*)AS[Number of records]
FROM Products;
