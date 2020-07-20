# Shopping Cart

### Installation
Prerequisite.

  - Ruby ~> 2.7.x

Go to the project directory and run these commands

```
$ bundle install
$ rake db:setup
$ rails s 

#If you want to run on some specific port then apend -p {portnumber}  
```

Default port will be '3000'
You may access the application at: http://localhost:3000

### APIs

1. Create and persist a shopping cart

    `{host}/carts`

    Method: POST

    body: 
        ```{"cart": {
         		"user_id": 1
         	}}	
         ```

2. Get Cart By User

    `{host}/carts?user_id={user_id}`

    Method: GET

    Response: 
    
            [
               {
                   "id": 2,
                   "user_id": 1,
                   "created_at": "2020-07-15T04:14:59.600Z",
                   "updated_at": "2020-07-15T04:14:59.600Z"
               },
               {
                   "id": 3,
                   "user_id": 1,
                   "created_at": "2020-07-15T04:15:00.460Z",
                   "updated_at": "2020-07-15T04:15:00.460Z"
               }
             ]	
         

3. Get the details of a cart
    `{host}//carts/{cart_id}/items`

    Method: GET

    RESPONSE:
    
        [
               {
                   "id": 14,
                   "product_id": 1,
                   "cart_id": 2,
                   "quantity": 17,
                   "price": "170.0",
                   "created_at": "2020-07-19T22:32:43.564Z",
                   "updated_at": "2020-07-19T22:33:06.894Z"
               },
               {
                   "id": 15,
                   "product_id": 2,
                   "cart_id": 2,
                   "quantity": 4,
                   "price": "243.0",
                   "created_at": "2020-07-19T22:33:32.563Z",
                   "updated_at": "2020-07-19T23:05:16.133Z"
               },
               {
                   "id": 16,
                   "product_id": 3,
                   "cart_id": 2,
                   "quantity": 1,
                   "price": "10.0",
                   "created_at": "2020-07-19T22:33:37.229Z",
                   "updated_at": "2020-07-19T22:33:37.229Z"
               },
               {
                   "id": 17,
                   "product_id": 4,
                   "cart_id": 2,
                   "quantity": 4,
                   "price": "22.0",
                   "created_at": "2020-07-19T22:33:42.299Z",
                   "updated_at": "2020-07-19T23:03:39.275Z"
               }
           ]	

4. Add products to a shopping cart

    `{host}//carts/{cart_id}/add_product`

    Method: POST
    
    body: 
        ```{
           	"product_id": 5,
           	"price": 222
           }	
         ```
    
    Response: 
    ```{
       "id": 18,
       "product_id": 5,
       "cart_id": 2,
       "quantity": 1,
       "price": "222.0",
       "created_at": "2020-07-20T02:57:54.868Z",
       "updated_at": "2020-07-20T02:57:54.868Z"
   }
    ``` 
   
5. Remove products from a shopping cart
    `{host}//carts/{cart_id}/remove_product?product_id={product_id}`
    Method: DELETE

6. Remove products from a shopping cart
    `{host}//carts/{cart_id}/empty`
    Method: DELETE

[![Run in Postman](https://run.pstmn.io/button.svg)](https://app.getpostman.com/run-collection/c575eed9be8822292a6e)



### Run Test


```
# To run all test suite

$ rspec

# To run specific test

$ rspec spec/models/cart_spec.rb 
```

## Docker

### Build and Run in docker

```
$ docker build -t cart .
$ docker run -it --rm cart bundle exec rspec
```

### Use Docker Compose
```
$ docker-compose build
$ docker-compose up

* You should be able to use the app on localhost:3000
```

Run `$ docker ps` to list the running Docker processes.

 

