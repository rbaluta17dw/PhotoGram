package model;

import java.util.Date;

public class User {
	
	private int id_user;
	private String username;
	private String password;
	private String email;
	private Date birthdate;
	private Image prf_img;
	
	
	public int getId_user() {
		return id_user;
	}
	public void setId_user(int id_user) {
		this.id_user = id_user;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}
	public Image getPrf_img() {
		return prf_img;
	}
	public void setPrf_img(Image prf_img) {
		this.prf_img = prf_img;
	}
	

}
