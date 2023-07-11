COMMENT ON TABLE person_discounts IS 'Таблица персональных скидок для покупателей';
COMMENT ON COLUMN person_discounts.id IS 'Уникальный идентификатор кортежей';
COMMENT ON COLUMN person_discounts.person_id IS 'Уникальный идентификатор покупателя';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Уникальный идентификатор пиццерии';
COMMENT ON COLUMN person_discounts.discount IS 'Процент скидки для покупателей в конкретной пиццерии';