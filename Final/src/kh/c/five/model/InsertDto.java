package kh.c.five.model;

import java.io.Serializable;

/*CREATE TABLE EAT_RESTAURANT(
		SEQ NUMBER PRIMARY KEY,
		RS_NAME VARCHAR2(100) UNIQUE,
		RS_ADDRESS1 VARCHAR2(200) NOT NULL,
		RS_ADDRESS2 VARCHAR2(100) NOT NULL,
		RS_PICTURE VARCHAR2(100) NOT NULL,
		RS_CATEGORY VARCHAR2(100) NOT NULL,
		RS_MENU VARCHAR2(4000) NOT NULL,	
		RS_RATING NUMBER NOT NULL,
		RS_READCOUNT NUMBER NOT NULL	
	);
	CREATE SEQUENCE SEQ
	START WITH 1
	INCREMENT BY 1;


	CREATE TABLE RESTAURANT_INFO(
		RS_SEQ NUMBER NOT NULL, 
		RS_NAME VARCHAR2(500) NOT NULL,	
		RS_TIME VARCHAR2(500),
		RS_PHONE VARCHAR2(500),
		RS_PRICE VARCHAR2(500),
		RS_PARKING NUMBER
	);
	CREATE SEQUENCE RS_SEQ
	START WITH 1
	INCREMENT BY 1;*/


public class InsertDto implements Serializable {
	
	private int seq;
	private String rs_name; //식당 이름
	private String rs_address1; //???시 ???구 ???동
	private String rs_address2; //번지수 내지, 도로명 주소 끝 번호
	private String rs_picture; //사진 업로드
	private String rs_category; //한식 중식 일식 etc
	private String rs_menu; //식당메뉴
	private String rs_time; //영업시간
	private int rs_rating; //별점
	private int rs_readcount; //조회수
	private int rs_parking; //주차장시설이 있다 ->1 주차장시설이 없다 ->0
	private String rs_price; //메뉴에 대한 가격
	private String rs_phone; //연락처
	private String rs_keyword; //키워드
	
	public InsertDto() {}
	
	public InsertDto(int seq, String rs_name, String rs_address1, String rs_address2, String rs_picture,
			String rs_category, String rs_menu, String rs_time, int rs_rating, int rs_readcount, int rs_parking,
			String rs_price, String rs_phone, String rs_keyword) {
		super();
		this.seq = seq;
		this.rs_name = rs_name;
		this.rs_address1 = rs_address1;
		this.rs_address2 = rs_address2;
		this.rs_picture = rs_picture;
		this.rs_category = rs_category;
		this.rs_menu = rs_menu;
		this.rs_time = rs_time;
		this.rs_rating = rs_rating;
		this.rs_readcount = rs_readcount;
		this.rs_parking = rs_parking;
		this.rs_price = rs_price;
		this.rs_phone = rs_phone;
		this.rs_keyword = rs_keyword;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getRs_name() {
		return rs_name;
	}
	public void setRs_name(String rs_name) {
		this.rs_name = rs_name;
	}
	public String getRs_address1() {
		return rs_address1;
	}
	public void setRs_address1(String rs_address1) {
		this.rs_address1 = rs_address1;
	}
	public String getRs_address2() {
		return rs_address2;
	}
	public void setRs_address2(String rs_address2) {
		this.rs_address2 = rs_address2;
	}
	public String getRs_picture() {
		return rs_picture;
	}
	public void setRs_picture(String rs_picture) {
		this.rs_picture = rs_picture;
	}
	public String getRs_category() {
		return rs_category;
	}
	public void setRs_category(String rs_category) {
		this.rs_category = rs_category;
	}
	public String getRs_menu() {
		return rs_menu;
	}
	public void setRs_menu(String rs_menu) {
		this.rs_menu = rs_menu;
	}
	public String getRs_time() {
		return rs_time;
	}
	public void setRs_time(String rs_time) {
		this.rs_time = rs_time;
	}
	public int getRs_rating() {
		return rs_rating;
	}
	public void setRs_rating(int rs_rating) {
		this.rs_rating = rs_rating;
	}
	public int getRs_readcount() {
		return rs_readcount;
	}
	public void setRs_readcount(int rs_readcount) {
		this.rs_readcount = rs_readcount;
	}
	public int getRs_parking() {
		return rs_parking;
	}
	public void setRs_parking(int rs_parking) {
		this.rs_parking = rs_parking;
	}
	public String getRs_price() {
		return rs_price;
	}
	public void setRs_price(String rs_price) {
		this.rs_price = rs_price;
	}
	public String getRs_phone() {
		return rs_phone;
	}
	public void setRs_phone(String rs_phone) {
		this.rs_phone = rs_phone;
	}
	public String getRs_keyword() {
		return rs_keyword;
	}
	public void setRs_keyword(String rs_keyword) {
		this.rs_keyword = rs_keyword;
	}
	@Override
	public String toString() {
		return "InsertDto [seq=" + seq + ", rs_name=" + rs_name + ", rs_address1=" + rs_address1 + ", rs_address2="
				+ rs_address2 + ", rs_picture=" + rs_picture + ", rs_category=" + rs_category + ", rs_menu=" + rs_menu
				+ ", rs_time=" + rs_time + ", rs_rating=" + rs_rating + ", rs_readcount=" + rs_readcount
				+ ", rs_parking=" + rs_parking + ", rs_price=" + rs_price + ", rs_phone=" + rs_phone + ", rs_keyword="
				+ rs_keyword + "]";
	}
	
	
	
	
	
	
	
	
	
	
	

}
