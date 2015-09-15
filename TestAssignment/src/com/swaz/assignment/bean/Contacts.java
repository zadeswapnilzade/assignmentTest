package com.swaz.assignment.bean;

import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class Contacts {
	
        
		private String name;
		private String email;
		private String profession;
		private String subprofession;
		private int id;
		
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public String getProfession() {
			return profession;
		}
		public void setProfession(String profession) {
			this.profession = profession;
		}
				
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		
		public String getSubprofession() {
			return subprofession;
		}
		public void setSubprofession(String subprofession) {
			this.subprofession = subprofession;
		}
		@Override
		public String toString() {
			return "Contacts [name=" + name + ", email=" + email
					+ ", profession=" + profession + ", subprofession="
					+ subprofession + ", id=" + id + "]";
		}
		

	

}
