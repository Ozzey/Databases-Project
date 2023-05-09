
--1. Trigger to update a column based on changes to another column:
CREATE OR REPLACE FUNCTION update_total_sales() RETURNS TRIGGER AS $$
BEGIN
    UPDATE personnel SET total_sales = total_sales + NEW.saleamount WHERE personnelid = NEW.personnelid;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_sales_trigger
AFTER INSERT ON sales
FOR EACH ROW
EXECUTE FUNCTION update_total_sales();

-- This trigger fires after a new row is inserted into the sales table.
--The trigger calls a function update_total_sales()
--which updates the total_sales column in the personnel table for the personnel selling the product.
--The trigger passes the new row data to the function as a NEW record.


--2. Trigger to enforce a business rule:
CREATE OR REPLACE FUNCTION check_product_price() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.productprice < 0 THEN
        RAISE EXCEPTION 'Product price cannot be negative';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_product_price_trigger
BEFORE INSERT OR UPDATE ON product
FOR EACH ROW
EXECUTE FUNCTION check_product_price();

--This trigger fires before a new row is inserted into or updated in the product table.
--The trigger calls a function check_product_price() which checks if the new or updated product price is negative.
-- If the price is negative, the function raises an exception with an error message.
-- The trigger passes the new or updated row data to the function as a NEW record.


--update_total_sales() function:
CREATE OR REPLACE FUNCTION update_total_sales() RETURNS TRIGGER AS $$
BEGIN
    UPDATE personnel SET total_sales = total_sales + NEW.saleamount WHERE personnelid = NEW.personnelid;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


--check_product_price() function:
CREATE OR REPLACE FUNCTION check_product_price() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.productprice < 0 THEN
        RAISE EXCEPTION 'Product price cannot be negative';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
