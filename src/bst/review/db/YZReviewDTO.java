package bst.review.db;

import java.sql.Date;

public class YZReviewDTO {
	private int REVIEW_NO;
	private String MEM_ID;
	private String REVIEW_IMAGE;
	private String REVIEW_MESSAGE;
	private Date REVIEW_DATE;
	private int REVIEW_RATE;
	private int REVIEW_READCOUNT;
	public int getREVIEW_NO() {
		return REVIEW_NO;
	}
	public void setREVIEW_NO(int rEVIEW_NO) {
		REVIEW_NO = rEVIEW_NO;
	}
	public String getMEM_ID() {
		return MEM_ID;
	}
	public void setMEM_ID(String mEM_ID) {
		MEM_ID = mEM_ID;
	}
	public String getREVIEW_IMAGE() {
		return REVIEW_IMAGE;
	}
	public void setREVIEW_IMAGE(String rEVIEW_IMAGE) {
		REVIEW_IMAGE = rEVIEW_IMAGE;
	}
	public String getREVIEW_MESSAGE() {
		return REVIEW_MESSAGE;
	}
	public void setREVIEW_MESSAGE(String rEVIEW_MESSAGE) {
		REVIEW_MESSAGE = rEVIEW_MESSAGE;
	}
	public Date getREVIEW_DATE() {
		return REVIEW_DATE;
	}
	public void setREVIEW_DATE(Date rEVIEW_DATE) {
		REVIEW_DATE = rEVIEW_DATE;
	}
	public int getREVIEW_RATE() {
		return REVIEW_RATE;
	}
	public void setREVIEW_RATE(int rEVIEW_RATE) {
		REVIEW_RATE = rEVIEW_RATE;
	}
	public int getREVIEW_READCOUNT() {
		return REVIEW_READCOUNT;
	}
	public void setREVIEW_READCOUNT(int rEVIEW_READCOUNT) {
		REVIEW_READCOUNT = rEVIEW_READCOUNT;
	}
	@Override
	public String toString() {
		/*private int REVIEW_NO;
		private String MEM_ID;
		private String REVIEW_IMAGE;
		private String REVIEW_MESSAGE;
		private Date REVIEW_DATE;
		private int REVIEW_RATE;
		private int REVIEW_READCOUNT;*/
		
		StringBuilder str = new StringBuilder();
		str.append("{REVIEW_NO:");	str.append(REVIEW_NO);
		str.append(", MEM_ID:");	str.append(MEM_ID);
		str.append(", REVIEW_IMAGE:");	str.append(REVIEW_IMAGE);
		str.append(", REVIEW_MESSAGE:");str.append(REVIEW_MESSAGE);
		str.append(", REVIEW_DATE");	str.append(REVIEW_DATE);
		str.append(", REVIEW_RATE");	str.append(REVIEW_RATE);
		str.append(", REVIEW_READCOUNT");str.append(REVIEW_READCOUNT);
		str.append("}");
		return str.toString();
	}
	
	
}
