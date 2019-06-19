
## Applaudo Studio Test

- Folder Name
	- snackstore / Laravel

- Run the nexts commands
	- update composer
	- php artisan serve
	- Create database and products the sql file is in the root directory.
	- php artisan migrate
	- Insert one Role in Role Table /role.sql

- If you want insert data in the products run the script /product.sql
- If you want insert data in the users run the script /user.sql

- Create user
	- Reference USER Secction "register" method
		-> This generated the toket by postman copy and paste on security method
		-> set postman Headers [key=Authorization, Value=Token]
							   [key=Content-Type , Value=application/json]

- ** You Are Ready to use the below methods **

- General Routes

	PostMan

	ROLE / 

	- [ POST , localhost:8000/api/role 		 ](name)
	- [ GET  , localhost:8000/api/role/{id}  ](id)
	- [ GET  , localhost:8000/api/role/index  ]()
	- [ PUT  , localhost:8000/api/role/{id}  ]({"id":1,"name_role": "Admin"}) postman - raw
	- [ DELETE,localhost:8000/api/role/{id}  ](id)

	USER /

	- [ POST , localhost:8000/api/register 	 ](name,email,password,password_confirmation,role)
	- [ POST , localhost:8000/api/login		 ](email,password)
	- [ GET  , localhost:8000/api/user 		 ]() // user active

	PRODUCT /

	- [ GET  , localhost:8000/api/product_list ]() // All products
	- [ GET  , localhost:8000/api/product/{id} ]() // Products By Id
	- [ GET  , localhost:8000/api/product?page=1 ]() // Products By Pagination/2
	- [ GET  , localhost:8000/api/product?page=1&name=puma ]() // Products By name with Pagination/2	
	- [ DELETE,localhost:8000/api/product/1 ]() // Products Delete

	  - Needs  -> Authorization || Tocket
	- [ POST , localhost:8000/api/product ](name,price,stock,description,status) form-data   || New Products
	- [ PUT  , localhost:8000/api/product/{id} ]({ "id":27,tock_product":101}) postman - raw || Update Products 

	PURSCHASE /

	  - Needs  -> Authorization || Tocket
	- [ POST , localhost:8000/api/purchase](customer,product,quantity) form-data || New Purchase
	- [ GET  , localhost:8000/api/purchase/{id}]() id || Get Detail of sales

	LIKING /

	  - Needs  -> Authorization || Tocket
	- [ POST  , localhost:8000/api/product_linking ](product,customer) form-data || Like to Product

	PRODUCT PRICE LOG /
	
	  - Needs  -> Authorization || Tocket
	- [ POST  , localhost:8000/api/product/{id}]({"id":1,"price_product":0.75}) postman - raw || Product price log

