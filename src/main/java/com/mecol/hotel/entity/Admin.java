package com.mecol.hotel.entity;

public class Admin {

	public  Integer getAdmin_id() {
		return admin_id;
	}

	@Override
	public String toString() {
		return "Admin{" +
				"admin_id=" + admin_id +
				", username='" + username + '\'' +
				", password='" + password + '\'' +
				", nickname='" + nickname + '\'' +
				", roleId=" + roleId +
				", roleName='" + roleName + '\'' +
				", sex='" + sex + '\'' +
				", phone='" + phone + '\'' +
				", email='" + email + '\'' +
				'}';
	}

	public void setAdmin_id(Integer admin_id) {
		this.admin_id = admin_id;
	}

	private Integer admin_id;

	private String username;

	private String password;

	private String nickname;

	private Long roleId;
	
	private String roleName;

	private String sex;

	private String phone;

	private String email;

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}



	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getUsername() {
		return username;
	}

	public Long getRoleId() {
		return roleId;
	}

	public void setRoleId(Long roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public void setUsername(String username) {
		this.username = username;
	}



	
}
