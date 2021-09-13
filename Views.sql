# Создание представления vw_goods, включающие в себя только необходимые ключевые поля и названия сущностей
CREATE VIEW vw_goods AS 
  SELECT g.id_goods, g.goods, g.price, 
    c.id_categories, c.categories_name 
  FROM goods AS g 
    INNER JOIN goods_categories AS c 
      ON g.id_categories = c.id_categories; 

## Создание SQL запроса, вычисляющего количество товаров в каждой категории, используя внутреннее и внешнее объединения
SELECT c.categories_name AS `Категория`, sub.cnt AS `Количество товаров` 
  FROM goods_categories AS c 
    LEFT JOIN 
(SELECT id_categories, COUNT(goods) AS cnt 
  FROM vw_goods 
    GROUP BY id_categories 
) AS sub 
  ON c.id_categories = sub.id_categories 
    ORDER BY categories_name; 
