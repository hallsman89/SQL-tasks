COMMENT ON TABLE person_discounts
    IS 'Таблица со значением скидки для покупателя в определенном заведении. Скидка зависит от количества посещений этого заведения человеком';

COMMENT ON COLUMN person_discounts.id IS 'id';
COMMENT ON COLUMN person_discounts.person_id IS 'id человека, которому предоставляется скидка';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'id пиццерии, предоставляющей скидку';
COMMENT ON COLUMN person_discounts.discount IS 'Значение скидки в процентах';