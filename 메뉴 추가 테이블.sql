
-- MENUTBL

CREATE TABLE MENUTBL (
   CAFE_MENU            VARCHAR(20)      PRIMARY KEY         COMMENT '카페 메뉴'
   ,CAFE_MENU_DAE         INT            NOT NULL         COMMENT '메뉴 대분류'
   ,CAFE_MENU_NUM         INT            NOT NULL         COMMENT '메뉴 소분류(넘버링)'
   ,CAFE_PRICE            INT            NOT NULL         COMMENT '카페 가격'
) DEFAULT CHARSET=utf8mb4;

INSERT INTO MENUTBL(
CAFE_MENU
,CAFE_MENU_DAE
,CAFE_MENU_NUM
,CAFE_PRICE
)
VALUES (
'아메리카노'
,'커피'
,'00100'
,'5400'
);

COMMIT;

INSERT INTO MENUTBL(
CAFE_MENU
,CAFE_MENU_DAE
,CAFE_MENU_NUM
,CAFE_PRICE
)
VALUES (
'생강차'
,'티'
,'00101'
,'3500'
);

INSERT INTO MENUTBL(
CAFE_MENU
,CAFE_MENU_DAE
,CAFE_MENU_NUM
,CAFE_PRICE
)
VALUES (
'핫 초코'
,'음료'
,'00102'
,'4700'
);