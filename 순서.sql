
-- 초기화 (손님 테이블, 주문 테이블)
-- 결제 완료 시 
truncate `sonnim`;
DELETE FROM ordertbl WHERE  MEMBER_ID = 'testUser00';


-- 재주문 시도
INSERT INTO ORDERTBL(
MEMBER_ID
,MEMBER_MENU_NUM
,MEMBER_ORDER_COUNT
,MEMBER_ORDER_DATE
)
VALUES (
(SELECT MEMBER_ID FROM MEMBERTBL WHERE MEMBER_ID = 'testUser00')
,(SELECT CAFE_MENU FROM MENUTBL WHERE CAFE_MENU_NUM = '100')
,'99'
,NOW()
);

--  손님 별 추가
INSERT INTO SONNIM (MEMBER_ID, MEMBER_ORDER_COUNT, MEMBER_ORDER_PAY)
SELECT DISTINCT O.MEMBER_ID,  MAX(MEMBER_ORDER_COUNT), SUM(O.MEMBER_ORDER_COUNT * M.CAFE_PRICE)
FROM MENUTBL M, ORDERTBL O 
WHERE O.MEMBER_ID = 'testUser00'
AND   M.CAFE_MENU = O.MEMBER_MENU_NUM;

-- 초기화하였으므로 1번 손님 번호표
SELECT MEMBER_ORDERNUM FROM SONNIM WHERE MEMBER_ID = 'testUser00';

-- 1번 손님 결제할 금액
SELECT MEMBER_ORDER_PAY FROM SONNIM WHERE MEMBER_ORDERNUM = (SELECT MEMBER_ORDERNUM ​
FROM SONNIM WHERE MEMBER_ID = 'testUser00');

SELECT * FROM SUBMIT_ORDER SO ;


-- 아메리카노 재정산
INSERT INTO SUBMIT_ORDER (MENU, ORDER_COUNT, ORDER_PAY, ORDER_DATE)
SELECT DISTINCT M.CAFE_MENU, MAX(MEMBER_ORDER_COUNT), SUM(O.MEMBER_ORDER_COUNT * M.CAFE_PRICE), NOW()
FROM  MENUTBL M, ORDERTBL O 
WHERE M.CAFE_MENU_NUM  = '100'
AND   M.CAFE_MENU  = '아메리카노'
AND   O.MEMBER_MENU_NUM = '아메리카노';

SELECT * FROM SONNIM S ;

SELECT MEMBER_ORDERNUM FROM SONNIM WHERE MEMBER_ID = 'testUser00';

SELECT MEMBER_ORDER_PAY FROM SONNIM WHERE MEMBER_ORDERNUM = (SELECT MEMBER_ORDERNUM ​
FROM SONNIM WHERE MEMBER_ID = 'testUser00');




-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



SELECT * FROM SONNIM S ; -- (초기화 필요)

SELECT * FROM ORDERTBL O ; -- (초기화 필요)

SELECT * FROM SUBMIT_ORDER SO ; -- (초기화 금지)

truncate `sonnim`;
DELETE FROM ordertbl WHERE  MEMBER_ID = 'testUser02';

COMMIT;

SELECT * FROM ORDERTBL O ;

-- testUser02 유저.....
-- 장바구니 담기
-- 재주문 시도
-- 핫 초코 77개
INSERT INTO ORDERTBL(
MEMBER_ID
,MEMBER_MENU_NUM
,MEMBER_ORDER_COUNT
,MEMBER_ORDER_DATE
)
VALUES (
(SELECT MEMBER_ID FROM MEMBERTBL WHERE MEMBER_ID = 'testUser02')
,(SELECT CAFE_MENU FROM MENUTBL WHERE CAFE_MENU_NUM = '102')
,'77'
,NOW()
);

-- 주문 확인
SELECT * FROM ORDERTBL O ;

--  testUser02 유저 주문하기
INSERT INTO SONNIM (MEMBER_ID, MEMBER_ORDER_COUNT, MEMBER_ORDER_PAY)
SELECT DISTINCT O.MEMBER_ID,  MAX(MEMBER_ORDER_COUNT), SUM(O.MEMBER_ORDER_COUNT * M.CAFE_PRICE)
FROM MENUTBL M, ORDERTBL O 
WHERE O.MEMBER_ID = 'testUser02'
AND   M.CAFE_MENU = O.MEMBER_MENU_NUM;

-- 주문 담긴 것 확인하기
SELECT * FROM SONNIM S ;

-- 번호 표 출력 (sonnim을 아예 초기화 하였으므로 1번으로 출력됨.)
SELECT MEMBER_ORDERNUM FROM SONNIM WHERE MEMBER_ID = 'testUser02';

-- 핫 초코의 가격은 4700원이다 4700*77 = 361,900원 일치함을 확인할 수 있다.
SELECT MEMBER_ORDER_PAY FROM SONNIM WHERE MEMBER_ORDERNUM = (SELECT MEMBER_ORDERNUM ​
FROM SONNIM WHERE MEMBER_ID = 'testUser02');


-- 가게에 메뉴별 정산 리스트에 해당되는 것을 추가한다. 
INSERT INTO SUBMIT_ORDER (MENU, ORDER_COUNT, ORDER_PAY, ORDER_DATE)
SELECT DISTINCT M.CAFE_MENU, MAX(MEMBER_ORDER_COUNT), SUM(O.MEMBER_ORDER_COUNT * M.CAFE_PRICE), NOW()
FROM  MENUTBL M, ORDERTBL O 
WHERE M.CAFE_MENU_NUM  = '102'
AND   M.CAFE_MENU  = '핫 초코'
AND   O.MEMBER_MENU_NUM = '핫 초코';

-- 가게 정산에 추가한다.
SELECT * FROM SUBMIT_ORDER SO ;

