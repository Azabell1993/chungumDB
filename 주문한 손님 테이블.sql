
CREATE TABLE SONNIM (
   MEMBER_ORDERNUM       INT             	NOT NULL 	AUTO_INCREMENT 		COMMENT '번호(PK)'
	,MEMBER_ID 				VARCHAR(30)		NOT NULL 		COMMENT '회원 아이디'
	,MEMBER_ORDER_COUNT     INT            NOT NULL         COMMENT '총 주문 수량'
	,MEMBER_ORDER_PAY	 	 INT			NOT NULL 		COMMENT '총 주문 가격'
	,PRIMARY KEY(MEMBER_ORDERNUM)
) DEFAULT CHARSET=utf8mb4;

SELECT * FROM sonnim;

-- 아이디 조회
SELECT DISTINCT O.MEMBER_ID 
FROM MENUTBL M, ORDERTBL O 
WHERE O.MEMBER_ID = 'testUser00'
AND   M.CAFE_MENU = O.MEMBER_MENU_NUM;

-- 유저별 메뉴, 갯수, 가격 
SELECT M.CAFE_MENU, O.MEMBER_ORDER_COUNT , M.CAFE_PRICE, (O.MEMBER_ORDER_COUNT * M.CAFE_PRICE) AS PAY
FROM MENUTBL M, ORDERTBL O 
WHERE O.MEMBER_ID = 'testUser00'
AND   M.CAFE_MENU = O.MEMBER_MENU_NUM;

-- 총 주문 수량
SELECT SUM(MEMBER_ORDER_COUNT)
FROM MENUTBL M, ORDERTBL O 
WHERE O.MEMBER_ID = 'testUser00'
AND   M.CAFE_MENU = O.MEMBER_MENU_NUM;

-- 메뉴 별 총 주문 수량 
SELECT SUM(MEMBER_ORDER_COUNT)
FROM MENUTBL M, ORDERTBL O 
WHERE M.CAFE_MENU_NUM  = '101';

-- 메뉴 별 총 주문 가격
SELECT SUM(O.MEMBER_ORDER_COUNT * M.CAFE_PRICE)
FROM MENUTBL M, ORDERTBL O 
WHERE M.CAFE_MENU_NUM  = '101';


SELECT * FROM MENUTBL; 


-- 총 결제 비용
SELECT SUM( O.MEMBER_ORDER_COUNT * M.CAFE_PRICE )
FROM MENUTBL M, ORDERTBL O 
WHERE O.MEMBER_ID = 'testUser00'
AND   M.CAFE_MENU = O.MEMBER_MENU_NUM;


DESC SONNIM ;

SELECT * FROM MENUTBL M  ;
--------------------

--  testUser02 유저 주문하기
INSERT INTO SONNIM (MEMBER_ID, MEMBER_ORDER_COUNT, MEMBER_ORDER_PAY)
SELECT DISTINCT O.MEMBER_ID,  SUM(MEMBER_ORDER_COUNT), SUM(O.MEMBER_ORDER_COUNT * M.CAFE_PRICE)
FROM MENUTBL M, ORDERTBL O 
WHERE O.MEMBER_ID = 'testUser03'
AND   M.CAFE_MENU = O.MEMBER_MENU_NUM;

SELECT * FROM SONNIM S ;

SELECT MEMBER_ORDERNUM FROM SONNIM WHERE MEMBER_ID = 'testUser03';

--  손님 별 추가
INSERT INTO SONNIM (MEMBER_ID, MEMBER_ORDER_COUNT, MEMBER_ORDER_PAY)
SELECT DISTINCT O.MEMBER_ID,  SUM(MEMBER_ORDER_COUNT), SUM(O.MEMBER_ORDER_COUNT * M.CAFE_PRICE)
FROM MENUTBL M, ORDERTBL O 
WHERE O.MEMBER_ID = 'testUser00'
AND   M.CAFE_MENU = O.MEMBER_MENU_NUM;

INSERT INTO SONNIM (MEMBER_ID, MEMBER_ORDER_COUNT, MEMBER_ORDER_PAY)
SELECT DISTINCT O.MEMBER_ID,  SUM(MEMBER_ORDER_COUNT), SUM(O.MEMBER_ORDER_COUNT * M.CAFE_PRICE)
FROM MENUTBL M, ORDERTBL O 
WHERE O.MEMBER_ID = 'testUser01'
AND   M.CAFE_MENU = O.MEMBER_MENU_NUM;

INSERT INTO SONNIM (MEMBER_ID, MEMBER_ORDER_COUNT, MEMBER_ORDER_PAY)
SELECT DISTINCT O.MEMBER_ID,  SUM(MEMBER_ORDER_COUNT), SUM(O.MEMBER_ORDER_COUNT * M.CAFE_PRICE)
FROM MENUTBL M, ORDERTBL O 
WHERE O.MEMBER_ID = 'testUser02'
AND   M.CAFE_MENU = O.MEMBER_MENU_NUM;

INSERT INTO SONNIM (MEMBER_ID, MEMBER_ORDER_COUNT, MEMBER_ORDER_PAY, )
SELECT DISTINCT O.MEMBER_ID,  SUM(MEMBER_ORDER_COUNT), SUM(O.MEMBER_ORDER_COUNT * M.CAFE_PRICE)
FROM MENUTBL M, ORDERTBL O 
WHERE O.MEMBER_ID = 'testUser03'
AND   M.CAFE_MENU = O.MEMBER_MENU_NUM;

SELECT * FROM SONNIM ;

-- -------------------------------------------------------------------------------------------