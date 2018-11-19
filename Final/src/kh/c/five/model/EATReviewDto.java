package kh.c.five.model;

import java.io.Serializable;

/*
 * CREATE TABLE RESTAURANT_REVIEW(
		SEQ NUMBER PRIMARY KEY,
		ID VARCHAR2(100) NOT NULL,
		RS_SEQ NUMBER NOT NULL,
		RS_CONTENT CLOB NOT NULL,
		RS_PICTURE CLOB,
		RS_RATING NUMBER NOT NULL
	);
	CREATE SEQUENCE REIVEW_SEQ
	   START WITH 1 INCREMENT BY 1
	   
	ALTER TABLE RESTAURANT_REVIEW --멤버 ID 외래키로 넘겨받음
	   ADD CONSTRAINT REVIEW_ID_FK
	   FOREIGN KEY (ID) REFERENCES EATMEMBER (ID) ON DELETE CASCADE
	   
	ALTER TABLE RESTAURANT_REVIEW
	   ADD CONSTRAINT REVIEW_SEQ_FK--맛집 번호 외래키로 넘겨받음
	   FOREIGN KEY (SEQ) REFERENCES EAT_RESTAURANT (SEQ) ON DELETE CASCADE
*/

public class EATReviewDto implements Serializable {

	private int seq;
	private String id;
	
	
}
