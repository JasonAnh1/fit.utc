package com.nckh.cnttva1k61.entities;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;


@Entity
@Table(name = "tbl_users")
public class User extends BaseEntity implements UserDetails{
	
	@Column(name = "username", length = 45, nullable = false)
	private String name;
	
	@Column(name = "password", length = 100, nullable = false)
	private String password;
	
	@Column(name = "email", length = 45, nullable = false)
	private String email;
	
	@Column(name = "fullname", length = 50, nullable = false)
	private String fullname;

	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "users")
	private Set<Role> roles = new HashSet<Role>();
	public void addRole(Role role) {
		role.getUsers().add(this);
		roles.add(role);
	}
	
	public void deleteRole(Role role) {
		role.getUsers().remove(this);
		roles.remove(role);
	}
	
	public String getUserName() {
		return name; 
	}

	public void setUserName(String username) {
		this.name = username;
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


	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public String getUsername() {
		return name;
	}

	public void setUsername(String username) {
		this.name = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
	/**
	 * GrantedAuthority chính là Entity Roles
	 */
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.roles;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	@Override
	public boolean isEnabled() {
		return true;
	}
	
	
}
