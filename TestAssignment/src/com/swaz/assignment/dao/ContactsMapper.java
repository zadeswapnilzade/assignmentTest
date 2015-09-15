package com.swaz.assignment.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.swaz.assignment.bean.Contacts;

public class ContactsMapper implements RowMapper<Contacts> {

	
		@Override
		public Contacts mapRow(ResultSet rs, int rowNum)
				throws SQLException {
			// TODO Auto-generated method stub
			Contacts contacts=new Contacts();
			contacts.setSubprofession(rs.getString("SUBPROFESSION"));
			contacts.setId(rs.getInt("ID"));
			contacts.setName(rs.getString("NAME"));
			contacts.setEmail(rs.getString("EMAIL"));
			contacts.setProfession(rs.getString("PROFESSION"));
		
			
			return contacts;
	}

}
