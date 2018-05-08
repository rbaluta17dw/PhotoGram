package model;

import java.util.Date;

public class Post {
	
	private int id_post;
	private Image img;
	private User id_usr;
	private String desc;
	private Date up_date;
	
	public int getId_post() {
		return id_post;
	}
	public void setId_post(int id_post) {
		this.id_post = id_post;
	}

	public Image getImg() {
		return img;
	}
	public void setImg(Image id_img) {
		this.img = id_img;
	}
	public User getId_usr() {
		return id_usr;
	}
	public void setId_usr(User id_usr) {
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
	@Override
	public String toString() {
		return "Post [id_post=" + id_post + ", img=" + img.getName() + ", id_usr=" + id_usr.getUsername() + ", desc=" + desc + ", up_date="
				+ up_date + "]";
	}

	
}