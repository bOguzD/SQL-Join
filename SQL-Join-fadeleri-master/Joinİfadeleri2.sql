
SELECT p.ProductName, SUM(od.Quantity) AS toplammiktar ,
MIN(od.Quantity) as minmiktar,
MAX(od.Quantity) as maxmiktar, 
COUNT(o.OrderID)  as siparişsayısı, 
(SUM(od.Quantity)/COUNT(o.OrderID)) as OrtalamaSiparişmiktarı,
AVG(od.Quantity) as OrtalamaSiparişmiktarı
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID=o.CustomerID
INNER JOIN  [Order Details] od
On o.OrderID=od.OrderID
INNER JOIN Products p
On od.ProductID=p.ProductID 
Group By  p.ProductName
Order By p.ProductName