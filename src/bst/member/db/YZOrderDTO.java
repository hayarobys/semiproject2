package bst.member.db;

import java.sql.Date;

public class YZOrderDTO {
	private int ORDER_NO;
	private int CTMZ_NO;
	private String MEM_ID;
	private int ORDER_STATUS;
	private int ORDER_PHONE;
	private String ORDER_ADDRESS;
	private String ORDER_NAME;
	private String ORDER_MESSAGE;
	private Date ORDER_DATE;
	private int ORDER_SIZE;
	
	
	public int getORDER_SIZE() {
		return ORDER_SIZE;
	}
	public void setORDER_SIZE(int oRDER_SIZE) {
		ORDER_SIZE = oRDER_SIZE;
	}
	public int getORDER_NO() {
		return ORDER_NO;
	}
	public void setORDER_NO(int oRDER_NO) {
		ORDER_NO = oRDER_NO;
	}
	public int getCTMZ_NO() {
		return CTMZ_NO;
	}
	public void setCTMZ_NO(int cTMZ_NO) {
		CTMZ_NO = cTMZ_NO;
	}
	public String getMEM_ID() {
		return MEM_ID;
	}
	public void setMEM_ID(String mEM_ID) {
		MEM_ID = mEM_ID;
	}
	public int getORDER_STATUS() {
		return ORDER_STATUS;
	}
	public void setORDER_STATUS(int oRDER_STATUS) {
		ORDER_STATUS = oRDER_STATUS;
	}
	public int getORDER_PHONE() {
		return ORDER_PHONE;
	}
	public void setORDER_PHONE(int oRDER_PHONE) {
		ORDER_PHONE = oRDER_PHONE;
	}
	public String getORDER_ADDRESS() {
		return ORDER_ADDRESS;
	}
	public void setORDER_ADDRESS(String oRDER_ADDRESS) {
		ORDER_ADDRESS = oRDER_ADDRESS;
	}
	public String getORDER_NAME() {
		return ORDER_NAME;
	}
	public void setORDER_NAME(String oRDER_NAME) {
		ORDER_NAME = oRDER_NAME;
	}
	public String getORDER_MESSAGE() {
		return ORDER_MESSAGE;
	}
	public void setORDER_MESSAGE(String oRDER_MESSAGE) {
		ORDER_MESSAGE = oRDER_MESSAGE;
	}
	public Date getORDER_DATE() {
		return ORDER_DATE;
	}
	public void setORDER_DATE(Date oRDER_DATE) {
		ORDER_DATE = oRDER_DATE;
	}
	
	
}
