package dto;

import java.util.Date;

public class Cat {
	private int id;
	private String catname;
	private String introduction;
	private int gender;
	private String picFile;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getCatname() {
		return catname;
	}
	public void setCatname(String catname) {
		this.catname = catname;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getPicFile() {
		return picFile;
	}
	public void setPicFile(String picFile) {
		this.picFile = picFile;
	}
	
}
