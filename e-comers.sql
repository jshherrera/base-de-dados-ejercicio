create database e-comers;
use e-comers;
create table usuario(
    user_id int auto_increment primary key,
    user_name varchar(50) unique not null,
    email varchar(100) unique not null,
    password_hash varchar(255) not null,
    create_at timestap defaul current_timestap 
);

create table productos(
    productos_id int auto_increment primary key,
    name varchar (100) not null,
    description text,
    price decimal(10, 2) not null,
    stock int deafaul 0,
    created_at timestap deafaul current_timestap
);

create table carrito_compra(
    cart_id int auto_increment primary key,
    user_id int,
    created_at timestap deafaul current_timestap,
    foreign key (user_id) references users(user_id)
);

create table items_carrito(
    cart_item_id int auto_increment primary key,
    cart_id int,
    productos_id int,
    quantity int not null check (quantity > 0),
    foreign key (cart_id) references carts(cart_id)
    foreign key (productos_id) references productos(productos_id) 
);

create table order_items(
    order_item_id int auto_increment primary key,
    order_id int,
    productos_id int,
    quantity not null,
    price_at_purchase decimal(10 , 2) not null,
    foreign key (order_id) references orders(order_id),
    foreign key (productos_id) references productos(productos_id) 
);

