package bst.member.db;

import java.sql.Date;

public class YZMemberDTO {
	private String MEM_ID;
	private String MEM_PASSWORD;
	private String MEM_NAME;
	private String MEM_EMAIL;
	private String MEM_HOME;
	private String MEM_PHONE;
	private int MEM_GRADE;
	private Date date;
	
	public String getMEM_PHONE(){
			return MEM_PHONE;
	}
	
	public void setMEM_PHONE(String mEM_PHONE) {
		MEM_PHONE = mEM_PHONE;
	}
	
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getMEM_ID() {
		return MEM_ID;
	}
	
	public void setMEM_ID(String mEM_ID) {
		MEM_ID = mEM_ID;
	}
	
	public String getMEM_PASSWORD() {
		return MEM_PASSWORD;
	}
	
	public void setMEM_PASSWORD(String mEM_PASSWORD) {
		MEM_PASSWORD = mEM_PASSWORD;
	}
	
	public String getMEM_NAME() {
		return MEM_NAME;
	}
	
	public void setMEM_NAME(String mEM_NAME) {
		MEM_NAME = mEM_NAME;
	}
	
	public String getMEM_EMAIL() {
		return MEM_EMAIL;
	}
	
	public void setMEM_EMAIL(String mEM_EMAIL) {
		MEM_EMAIL = mEM_EMAIL;
	}
	
	public String getMEM_HOME() {
		return MEM_HOME;
	}
	
	public void setMEM_HOME(String mEM_HOME) {
		MEM_HOME = mEM_HOME;
	}
	
	
	public int getMEM_GRADE() {
		return MEM_GRADE;
	}
	
	public void setMEM_GRADE(int mEM_GRADE) {
		MEM_GRADE = mEM_GRADE;
	}
}
