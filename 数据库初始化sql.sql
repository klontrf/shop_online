
DROP database IF EXISTS shopping;
create database shopping;
use shopping;
create table users
(
    account  varchar(16) not null comment '账号',
    password varchar(16) null comment '密码',
    mail     varchar(32) null comment '邮箱',
    address  varchar(32) null comment '地址',
    tel      char(11)    null comment '电话',
    name     varchar(8)  null comment '用户名',
permissions int default 0 null comment '权限，0为普通用户，1为管理员',
    constraint users_pk
        primary key (account)
);

create table goods
(
    id   int         not null comment '商品id',
    name varchar(16) null comment '商品名称',
    path varchar(32) null comment '商品图片路径',
    price float null comment '价格',
    introduce text null,
	inventory int null comment '库存量',
	sales int default 0 null comment '销售量',
	state varchar(4) default '启用' null comment '商品状态',

    constraint goods_pk
        primary key (id)
);

create table shopping_Cart
(
    user_account varchar(16) not null comment '用户账号',
    count        int         null comment '加入数量',
    good_id      int         not null comment '商品id',
    constraint shopping_Cart_pk
        primary key (user_account, good_id),
    constraint shopping_Cart_goods_id_fk
        foreign key (good_id) references goods (id),
    constraint shopping_Cart_users_account_fk
        foreign key (user_account) references users (account)
)
    comment '用户购物车';

create table purchase_history
(
    user_account varchar(16) not null comment '用户账号',
    good_id      int         not null comment '商品id',
    count        int         null comment '购买数量',
    constraint purchase_history_pk
        primary key (good_id, user_account),
    constraint purchase_history_goods_id_fk
        foreign key (good_id) references goods (id),
    constraint purchase_history_users_account_fk
        foreign key (user_account) references users (account)
)
    comment '用户购买历史记录';

create table electronics_sort
(
    good_id int not null,
    constraint electronics_sort_pk
        primary key (good_id),
    constraint electronics_sort_goods_id_fk
        foreign key (good_id) references goods (id)
)
    comment '电子产品分类';

create table sport_sort
(
    good_id int not null,
    constraint sport_sort_pk
        primary key (good_id),
    constraint sport_sort_goods_id_fk
        foreign key (good_id) references goods (id)
)
    comment '运动分类';

create table foods_sort
(
    good_id int not null,
    constraint foods_sort_pk
        primary key (good_id),
    constraint foods_sort_goods_id_fk
        foreign key (good_id) references goods (id)
)
    comment '食品分类';

ALTER TABLE shopping_cart DROP FOREIGN KEY shopping_Cart_users_account_fk;
ALTER TABLE shopping_cart ADD FOREIGN KEY (user_account) REFERENCES users(account) ON DELETE CASCADE;

ALTER TABLE purchase_history DROP FOREIGN KEY purchase_history_users_account_fk;
ALTER TABLE purchase_history ADD FOREIGN KEY (user_account) REFERENCES users(account) ON DELETE CASCADE;


INSERT INTO shopping.users (account, password, mail, address, tel, name, permissions)
VALUES ('admin1', '123456', null, null, null, '管理员', 1);

INSERT INTO shopping.goods (id, name, path, price, introduce, inventory, sales)
VALUES (1, 'Redmi Note 11', 'picture/1.jpg', 999,
        'Redmi Note 11 5G 天玑810 33W Pro快充 5000mAh大电池 6GB +128GB 神秘黑境 智能手机 小米 红米', 2000, DEFAULT);


INSERT INTO shopping.goods (id, name, path, price, introduce, inventory, sales)
VALUES (4, '安踏运动鞋', 'picture/4.jpg', 179, '安踏运动鞋男鞋夏季网面透气跑步鞋子男轻便软底耐磨减震户外鞋', 2000,
        DEFAULT);


INSERT INTO shopping.goods (id, name, path, price, introduce, inventory, sales)
VALUES (2, 'Redmi K60', 'picture/2.jpg', 2699, 'Redmi K60 骁龙8+处理器 2K高光屏 6400万超清相机 5500mAh长续航', 2000,
        DEFAULT);

INSERT INTO shopping.goods (id, name, path, price, introduce, inventory, sales)
VALUES (8, '饼干蛋糕', 'picture/8.jpg', 15.9, '麦酥园饼干蛋糕鸡蛋卷蛋酥休闲零食糕点甜点心面包', 3000, DEFAULT);



INSERT INTO shopping.goods (id, name, path, price, introduce, inventory, sales)
VALUES (3, '小米11青春版', 'picture/3.jpg', 1399,
        '小米11青春版 骁龙780G处理器 AMOLED柔性直屏 8GB+256GB 夏日柠檬 5G时尚手机', 2000, DEFAULT);


INSERT INTO shopping.goods (id, name, path, price, introduce, inventory, sales)
VALUES (5, '艾伦伯顿T恤', 'picture/5.jpg', 21.9, '艾伦伯顿（Alen Botun） 运动短袖t恤男夏季吸汗衣篮球跑步女速干衣服健身服夏天冰丝上衣 黑色【冰丝 透气】 XL(180-185CM)
', 2000, DEFAULT);

INSERT INTO shopping.goods (id, name, path, price, introduce, inventory, sales)
VALUES (9, '酱牛肉', 'picture/9.jpg', 59.2, '康新牧场内蒙草原酱牛肉150g×3袋五香味熟食腊味 卤牛肉', 3000, DEFAULT);

INSERT INTO shopping.goods (id, name, path, price, introduce, inventory, sales)
VALUES (6, '李宁运动裤', 'picture/6.jpg', 49,
        '李宁（LI-NING）运动裤男【线下同款】短裤跑步裤透气速干五分裤子运动短裤XL码', 2000, DEFAULT);

INSERT INTO shopping.goods (id, name, path, price, introduce, inventory, sales)
VALUES (7, '三只松鼠零食', 'picture/7.jpg', 117.8, '三只松鼠巨型零食大礼包30包 辣条肉脯休闲零食', 3000, DEFAULT);



INSERT INTO shopping.electronics_sort (good_id)
VALUES (1);

INSERT INTO shopping.electronics_sort (good_id)
VALUES (2);

INSERT INTO shopping.electronics_sort (good_id)
VALUES (3);

INSERT INTO shopping.sport_sort (good_id)
VALUES (4);

INSERT INTO shopping.sport_sort (good_id)
VALUES (5);

INSERT INTO shopping.sport_sort (good_id)
VALUES (6);

INSERT INTO shopping.foods_sort (good_id)
VALUES (7);

INSERT INTO shopping.foods_sort (good_id)
VALUES (8);

INSERT INTO shopping.foods_sort (good_id)
VALUES (9);




drop user if exists 'admin1'@'localhost';
create user 'admin1'@'localhost' identified by '123456';
grant select,insert,update,delete on shopping.* to 'admin1'@'localhost';
flush privileges;