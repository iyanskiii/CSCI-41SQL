SELECT b.title AS 'Title', b.retail AS 'Price', p.name AS 'Publisher Name' FROM book b JOIN publisher p ON b.pubID=p.pubID WHERE b.category = 'Computer' ORDER BY price DESC LIMIT 1;

SELECT customer.customerno AS 'Customer Number', CONCAT(customer.firstname,' ',customer.lastname) AS 'Customer Name' 
FROM customer WHERE customerno=1003 OR customerno = 1006 OR customerno = 1010;

SELECT b.ISBN AS 'ISBN', b.title AS 'Book Title', p.name AS 'Publisher Name', b.retail AS 'Retail Price' FROM book b JOIN 
publisher p ON b.pubID=p.pubID WHERE b.retail > (SELECT AVG(retail) FROM book) ORDER BY b.retail DESC;

SELECT b.ISBN , b.title , b.retail FROM book b WHERE b.title = 'BODYBUILD IN 10 MINUTES A DAY' OR b.title = 'COOKING WITH MUSHROOMS' OR b.title ='DATABASE IMPLEMENTATION';

SELECT b.title AS 'title', b.category AS 'category', p.name AS 'name', p.contact AS 'contact', p.phone AS 'phone' FROM book b JOIN publisher p ON b.pubID=p.pubID WHERE b.title='BUILDING A CAR WITH TOOTHPICKS';

SELECT b.ISBN, b.title, b.category FROM book b JOIN publisher p ON b.pubID=p.pubID WHERE p.name=(SELECT DISTINCT p.name FROM book b JOIN publisher 
p ON b.pubID=p.pubID WHERE b.title='Big Bear and Little Dove') AND (b.retail-b.cost)>(SELECT AVG((retail-cost)) FROM book);

SELECT b.ISBN, b.title, b.category FROM book b JOIN publisher p ON b.pubID=p.pubID WHERE p.name=(SELECT DISTINCT p.name FROM book b JOIN publisher 
p ON b.pubID=p.pubID WHERE b.title='Big Bear and Little Dove') AND (b.retail-b.cost)>(SELECT AVG((retail-cost)) FROM book);

SELECT ISBN, title, category, retail FROM book WHERE retail > (SELECT MAX(retail) FROM book WHERE category='Cooking');

SELECT b.ISBN, b.title, b.category, b.retail FROM book b LEFT JOIN orderitem oi ON b.ISBN=oi.ISBN WHERE 
oi.ISBN IS NULL;

SELECT o.orderno AS 'Order Number', o.shipdate AS 'Date of Shipping', CONCAT(c.firstname, ' ', c.lastname) 
AS "Customer's Name" FROM customer c JOIN orders o ON c.customerno=o.customerno WHERE c.state=(SELECT state FROM customer WHERE
firstname='Steve' AND lastname='Schell') AND c.firstname!='Steve' AND c.lastname!='Schell';

SELECT CONCAT(c.firstname, ' ', c.lastname) AS "Customer's Name", o.shipstate AS 'State' FROM customer c JOIN
orders o ON c.customerno=o.customerno JOIN orderitem oi ON o.orderno=oi.orderno JOIN book b ON oi.ISBN=b.ISBN
WHERE b.retail=(SELECT MIN(retail) FROM book) ORDER BY c.firstname DESC;
