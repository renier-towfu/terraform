# ofcourse dont forget to change the URL

curl --location 'http://13.212.127.227/products' \
--header 'Content-Type: application/json' \
--data '{
    "product_name": "Wireless Headphones",
    "price": 99.99,
    "brand_name": "AudioTech",
    "quantity_available": 50
}'