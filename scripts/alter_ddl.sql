ALTER TABLE "user"
ADD CONSTRAINT fk_personnelID
FOREIGN KEY (personnelID)
REFERENCES personnel(personnelID);

ALTER TABLE personnel
ADD CONSTRAINT fk_departmentID
FOREIGN KEY (DepartmentID)
REFERENCES department(DepartmentID);

ALTER TABLE personnel
ADD CONSTRAINT fk_storeID
FOREIGN KEY (StoreID)
REFERENCES store(StoreID);

ALTER TABLE stock
ADD CONSTRAINT fk_product_id
FOREIGN KEY (ProductID)
REFERENCES product(ProductID);

ALTER TABLE sales
ADD CONSTRAINT fk_product_id
FOREIGN KEY (ProductID)
REFERENCES product(ProductID);

ALTER TABLE product
ADD CONSTRAINT fk_category
FOREIGN KEY (CategoryID)
REFERENCES category(CategoryID);
