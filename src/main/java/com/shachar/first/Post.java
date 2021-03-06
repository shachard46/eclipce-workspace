package com.shachar.first;

import java.util.Date;
public class Post {
	private int id;
	private String postName;
	private String email;
	private String postText;
	private String postTopicName;
	private Date postDate;

	public Post(String postName, String email, String postText, String postTopicName) {
		this.email = email;
		this.postText = postText;
		this.postTopicName = postTopicName;
		this.postDate = new Date();
		this.postName = postName;

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPostText() {
		return postText;
	}

	public void setPostText(String postText) {
		this.postText = postText;
	}

	public String getPostTopicName() {
		return postTopicName;
	}

	public void setPostTopicName(String postTopicName) {
		this.postTopicName = postTopicName;
	}

	public Date getPostDate() {
		return postDate;
	}
	
	public void setPostDate(Date postDate) {
		this.postDate = postDate;
	}


	public String getPostName() {
		return postName;
	}

	public void setPostName(String postName) {
		this.postName = postName;
	}

}
