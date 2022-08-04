create database if not exists car_sale;

use car_sale;


CREATE TABLE if not exists  person (
    id         INTEGER primary key auto_increment,
    last_name  varchar(64) NOT NULL,
    first_name varchar(64) NOT NULL,
    gov_id     INTEGER NOT NULL,
    pesel      INTEGER NOT NULL,
    phone      INT,
    gender     varchar(32) 
);

CREATE TABLE if not exists  store (
    store_id   INT primary key auto_increment,
    store_name LONG,
    store_adress varchar(64)
    );
    
CREATE TABLE if not exists  model (
    model_id   INT primary key,
    name varchar(32),
    configuration     LONG
);

CREATE TABLE if not exists  car (
    car_id         int primary key auto_increment,
    color          LONG NOT NULL,
    model_id       INT NOT NULL,
    store_id       INT NOT NULL,
    constraint fk_store_car foreign key (store_id) references store(store_id),
    constraint fk_model_car foreign key (model_id) references model(model_id)
);

CREATE TABLE if not exists  orders (
    order_id    INT primary key auto_increment,
    order_price INT NOT NULL,
    order_date  DATE,
    person_id   INTEGER NOT NULL,
    constraint fk_person_orders foreign key(person_id) references person(id)
);


CREATE TABLE if not exists  employee (
    position       LONG NOT NULL,
    hire_date      DATE,
    person_id      INTEGER primary key,
    salary             INT NOT NULL,
    store_id INT NOT NULL,
    constraint fk_person_employee foreign key (person_id) references person(id),
    constraint fk_store_employee foreign key (store_id) references store(store_id)
);

create table if not exists order_details(
order_id int not null,
car_id int not null,
unit_price double not null,
quantity int default 1,
constraint fk_order_orderDetails foreign key (order_id) references orders(order_id),
constraint fk_car_orderDetails foreign key (car_id) references car(car_id),
constraint primary key pk_order_details(order_id, car_id)
);


create index person_index
on person(first_name, last_name);
 

