package model;

import java.sql.Blob;

public class Images {
	
	private int id_img;
	private String name;
	private Blob data;
	
	
	public int getId_img() {
		return id_img;
	}
	public void setId_img(int id_img) {
		this.id_img = id_img;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Blob getData() {
		return data;
	}
	public void setData(Blob data) {
		this.data = data;
	}
	
}
