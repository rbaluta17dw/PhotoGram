package clases;

import java.util.Date;

public class Posts {
	
	private int id_post;
	private int id_img;
	private int id_usr;
	private String desc;
	private Date up_date;
	
	
	public int getId_post() {
		return id_post;
	}
	public void setId_post(int id_post) {
		this.id_post = id_post;
	}
	public int getId_img() {
		return id_img;
	}
	public void setId_img(int id_img) {
		this.id_img = id_img;
	}
	public int getId_usr() {
		return id_usr;
	}
	public void setId_usr(int id_usr) {
		this.id_usr = id_usr;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
	public Date getUp_date() {
		return up_date;
	}
	public void setUp_date(Date up_date) {
		this.up_date = up_date;
	}

}