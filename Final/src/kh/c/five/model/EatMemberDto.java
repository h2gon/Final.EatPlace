package kh.c.five.model;

import java.io.Serializable;

/*
DROP TABLE EATMEMBER
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_EATMEMBER;

CREATE TABLE EATMEMBER(
	SEQ NUMBER(8) NOT NULL,
	ID VARCHAR2(50) PRIMARY KEY,
	PWD VARCHAR2(50) NOT NULL,
	NAME VARCHAR2(50) NOT NULL,
	EMAIL VARCHAR2(50) UNIQUE,
	NICKNAME VARCHAR2(50) NOT NULL,
	AUTH NUMBER(1) NOT NULL
);

CREATE SEQUENCE SEQ_EATMEMBER
START WITH 1 INCREMENT BY 1;

SELECT * FROM EATMEMBER
*/

public class EatMemberDto implements Serializable{
	private int seq;
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String nickname;
	private int auth;	// 사용자:3  관리자:1
	
	public EatMemberDto() {
	}

	public EatMemberDto(int seq, String id, String pwd, String name, String email, String nickname, int auth) {
		super();
		this.seq = seq;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.nickname = nickname;
		this.auth = auth;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberDto [seq=" + seq + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email
				+ ", nickname=" + nickname + ", auth=" + auth + "]";
	}

}
