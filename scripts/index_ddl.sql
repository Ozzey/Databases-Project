CREATE INDEX idx_position_positionname ON public.position (PositionName);

CREATE INDEX idx_user_username ON public."user" (UserName);

CREATE INDEX idx_personnel_personnelname ON public.personnel (PersonnelName);

CREATE INDEX idx_personnel_personnelsurname ON public.personnel (PersonnelSurname);

CREATE INDEX idx_personnel_personnelphonenum ON public.personnel (PersonnelPhoneNum);

CREATE INDEX idx_personnel_entrydate ON public.personnel (EntryDate);

CREATE INDEX idx_personnel_salary ON public.personnel (Salary);

CREATE INDEX idx_department_departmentname ON public.department (DepartmentName);

CREATE INDEX idx_store_branchname ON public.store (BranchName);

CREATE INDEX idx_store_storephonenumber ON public.store (StorePhoneNumber);

CREATE INDEX idx_store_storeaddress ON public.store (StoreAddress);

CREATE INDEX idx_store_city ON public.store (City);

CREATE INDEX idx_stock_stocknumber ON public.stock (StockNumber);

CREATE INDEX idx_product_productname ON public.product (ProductName);

CREATE INDEX idx_product_productprice ON public.product (ProductPrice);

CREATE INDEX idx_product_barcode ON public.product (Barcode);

CREATE INDEX idx_brand_brandname ON public.brand (BrandName);

CREATE INDEX idx_categoryname_categoryname ON public.categoryname (CategoryName);

CREATE INDEX idx_size_sizename ON public.size (SizeName);

CREATE INDEX idx_pattern_patternname ON public.pattern (PatternName);

CREATE INDEX idx_color_colorcode ON public.color (ColorCode);

CREATE INDEX idx_type_typename ON public.type (TypeName);

CREATE INDEX idx_category_categorynameid ON public.category (CategoryNameID);

CREATE INDEX idx_category_sizeid ON public.category (SizeID);

CREATE INDEX idx_category_brandid ON public.category (BrandID);

CREATE INDEX idx_category_patternid ON public.category (PatternID);

CREATE INDEX idx_category_colorid ON public.category (ColorID);

CREATE INDEX idx_category_typeid ON public.category (TypeID);

CREATE INDEX idx_sales_salesnumber ON public.sales (SalesNumber);

CREATE INDEX idx_sales_salesdate ON public.sales (SalesDate);

CREATE INDEX idx_exchange_exchangenumber ON public.exchange (ExchangeNumber);

CREATE INDEX idx_exchange_exchangedate ON public.exchange (ExchangeDate);

CREATE INDEX idx_exchange_exchangeexplanation ON public.exchange (ExchangeExplanation);

CREATE INDEX idx_return_returnnumber ON public.return (ReturnNumber);

CREATE INDEX idx_return_returndate ON public.return (ReturnDate);

CREATE INDEX idx_return_returnexplanation ON public.return (ReturnExplanation);
