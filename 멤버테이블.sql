
CREATE TABLE MEMBERTBL (   
	MEMBER_ID            VARCHAR(30)      PRIMARY KEY         COMMENT '회원 아이디'
   ,MEMBER_PW            VARCHAR(12)      NOT NULL         COMMENT '회원 패스워드'
   ,MEMBER_GR            ENUM('Y','N')                     					COMMENT '회원 권한(N이면 기본유저, Y이면 카페 관리자)'
   ,MEMBER_NICKNAME      VARCHAR(10)      	UNIQUE              	 		COMMENT '회원 닉네임'
   ,MEMBER_BIRTH         CHAR(20)      		NOT NULL            			COMMENT '회원 생일'
   ,MEMBER_EMAIL         VARCHAR(30)      	NOT NULL 	UNIQUE         		COMMENT '회원 이메일'
   ,MEMBER_JOINDATE      DATETIME                        					COMMENT '가입 날짜'
   ,MEMBER_BLACKYN       ENUM('Y','N')                     				COMMENT '블랙리스트 유무(N:대상아님, Y:대상임)'
   ,MEMBER_EVENTQTY      INT                              					COMMENT '이벤트 당첨 누적 횟수'
   ,PRIMARY KEY(MEMBER_ORDERNUM)
) DEFAULT CHARSET=utf8mb4;


INSERT INTO MEMBERTBL (
	MEMBER_ID
	,MEMBER_PW
	,MEMBER_GR
	,MEMBER_NICKNAME
	,MEMBER_BIRTH
	,MEMBER_EMAIL
	,MEMBER_JOINDATE
	,MEMBER_BLACKYN
	,MEMBER_EVENTQTY)
VALUES (
	'testUser00'
	,'testUse0pas'
	,'N'
	,'nickexam00'
	,'19930315'
	,'test@test.co.kr'
	,NOW()
	,'N'
	,0
);

INSERT INTO MEMBERTBL (
	MEMBER_ID
	,MEMBER_PW
	,MEMBER_GR
	,MEMBER_NICKNAME
	,MEMBER_BIRTH
	,MEMBER_EMAIL
	,MEMBER_JOINDATE
	,MEMBER_BLACKYN
	,MEMBER_EVENTQTY)
VALUES (
	'testUser01'
	,'testUse1pas'
	,'N'
	,'nickexam01'
	,'19831215'
	,'test1@test.co.kr'
	,NOW()
	,'N'
	,0
);

INSERT INTO MEMBERTBL (
	MEMBER_ID
	,MEMBER_PW
	,MEMBER_GR
	,MEMBER_NICKNAME
	,MEMBER_BIRTH
	,MEMBER_EMAIL
	,MEMBER_JOINDATE
	,MEMBER_BLACKYN
	,MEMBER_EVENTQTY)
VALUES (
	'testUser02'
	,'testUse1i23'
	,'N'
	,'nickexam02'
	,'19900125'
	,'test2@test.co.kr'
	,NOW()
	,'N'
	,0
);

INSERT INTO MEMBERTBL (
	MEMBER_ID
	,MEMBER_PW
	,MEMBER_GR
	,MEMBER_NICKNAME
	,MEMBER_BIRTH
	,MEMBER_EMAIL
	,MEMBER_JOINDATE
	,MEMBER_BLACKYN
	,MEMBER_EVENTQTY)
VALUES (
	'testUser03'
	,'testUse3ws'
	,'N'
	,'nickexam03'
	,'20001015'
	,'test3@test.co.kr'
	,NOW()
	,'N'
	,0
);

SELECT * FROM membertbl;
