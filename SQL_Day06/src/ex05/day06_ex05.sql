COMMENT ON TABLE person_discounts IS 'A table with data about personal discounts';
COMMENT ON COLUMN person_discounts.id IS 'Primary key, identifier of pesonal discount';
COMMENT ON COLUMN person_discounts.person_id IS 'Identifier of person who has discount';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Identifier of pizzeria where person has discount';
COMMENT ON COLUMN person_discounts.discount IS 'Discount for pair of person and pizzeria';