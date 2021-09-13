# Создание представления vw_goods, включающие в себя только необходимые ключевые поля и названия сущностей
CREATE VIEW vw_goods AS 
  SELECT g.id_goods, g.goods, g.price, 
    c.id_categories, c.categories_name 
  FROM goods AS g 
    INNER JOIN goods_categories AS c 
      ON g.id_categories = c.id_categories; 
