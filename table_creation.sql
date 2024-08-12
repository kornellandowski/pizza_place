create table "orders" (
    "row_id" int   not null,
    "order_id" varchar(10)   not null,
    "created_at" timestamp   not null,
    "item_id" varchar(10)   not null,
    "quantity" int   not null,
    "cust_id" int   not null,
    "delivery" boolean   not null,
    "add_id" int   not null,
    constraint "pk_orders" primary key (
        "row_id"
     )
);

create table "customers" (
    "cust_id" int   not null,
    "cust_firstname" varchar(50)   not null,
    "cust_lastname" varchar(50)   not null,
    constraint "pk_customers" primary key (
        "cust_id"
     )
);

create table "address" (
    "add_id" int   not null,
    "delivery_address1" varchar(200)   not null,
    "delivery_address2" varchar(200)   null,
    "delivery_city" varchar(50)   not null,
    "delivery_zipcode" varchar(20)   not null,
    constraint "pk_address" primary key (
        "add_id"
     )
);

create table "item" (
    "item_id" varchar(10)   not null,
    "sku" varchar(20)   not null,
    "item_name" varchar(100)   not null,
    "item_cat" varchar(100)   not null,
    "item_size" varchar(10)   not null,
    "item_price" decimal(10,2)   not null,
    constraint "pk_item" primary key (
        "item_id"
     )
);

create table "ingredient" (
    "ing_id" varchar(10)   not null,
    "ing_name" varchar(200)   not null,
    "ing_weight" int   not null,
    "ing_meas" varchar(20)   not null,
    "ing_price" decimal(5,2)   not null,
    constraint "pk_ingredient" primary key (
        "ing_id"
     )
);

create table "recipe" (
    "row_id" int   not null,
    "recipe_id" varchar(20)   not null,
    "ing_id" varchar(10)   not null,
    "quantity" int   not null,
    constraint "pk_recipe" primary key (
        "row_id"
     )
);

create table "inventory" (
    "inv_id" int   not null,
    "item_id" varchar(10)   not null,
    "quantity" int   not null,
    constraint "pk_inventory" primary key (
        "inv_id"
     )
);

create table "staff" (
    "staff_id" varchar(20)   not null,
    "first_name" varchar(50)   not null,
    "last_name" varchar(50)   not null,
    "position" varchar(100)   not null,
    "hourly_rate" decimal(5,2)   not null,
    constraint "pk_staff" primary key (
        "staff_id"
     )
);

create table "shift" (
    "shift_id" varchar(20)   not null,
    "day_of_week" varchar(10)   not null,
    "start_time" time   not null,
    "end_time" time   not null,
    constraint "pk_shift" primary key (
        "shift_id"
     )
);

create table "rota" (
    "row_id" int   not null,
    "rota_id" varchar(20)   not null,
    "date" timestamp   not null,
    "shift_id" varchar(20)   not null,
    "staff_id" varchar(20)   not null,
    constraint "pk_rota" primary key (
        "row_id"
     )
);
