COMMENT ON TABLE person_discounts IS 'Table personal discounts for customers';
COMMENT ON COLUMN person_discounts.id IS 'Primary key identifier';
COMMENT ON COLUMN person_discounts.person_id IS 'Discount person identifier';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Discount pizzeria identifier';
COMMENT ON COLUMN person_discounts.discount IS 'Discount percentage for this person at this pizzeria';