package com.swaz.assignment.dao;

import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;

import com.swaz.assignment.bean.Contacts;
import com.swaz.assignment.service.ContactsService;

@Component
public class ContactsDao {

	private JdbcTemplate jdbctemplate;

	@Autowired
	public void setDataSource(DataSource datasource) {

		jdbctemplate = new JdbcTemplate(datasource);

	}

	public List<Contacts> getContacts() {

		String SQL = "select * from public."+ "\"CONTACTS\";";
		List<Contacts> contacts = jdbctemplate.query(SQL, new ContactsMapper());
		//for( Contacts c : contacts){ System.out.println("Contact" + c.toString()); }
		return contacts;

	}

	public Contacts getContact(String email) {

		String SQL = "select * from public."+"\"CONTACTS\""+" where "+"\"CONTACTS\"."+ "\"EMAIL\" = ?";

		try
		{
		
		System.out.println(SQL);
		Contacts contacts = jdbctemplate.queryForObject(SQL,
				new Object[] { email }, new ContactsMapper());
		System.out.println(contacts.toString());
		return contacts;
		}
		catch(EmptyResultDataAccessException e)
		{
			return null;
		}

	}

	public boolean addContact(String name , String email , String profession , String subprofession) {

		String SQL = "insert into public."+"\"CONTACTS\""+"values (?,?,?,?)";
		
		System.out.println(SQL);
		try{
			
		int numberOfrows = jdbctemplate
				.update(SQL, new Object[] { name, email,profession,subprofession });
		
		if (numberOfrows > 0)
			return true;
		}
		catch(DuplicateKeyException exp) { return false;}
		
			return false;
	}

	public boolean updateContact(String name , String email , String profession,String subprofession) {
		
		
		Contacts contact = getContact(email);
		
		if (contact!=null ) 
		{
						
		String SQL = "update public."+"\"CONTACTS\""+" set "+"\"NAME\" = ? ,\"EMAIL\" = ? ,\"PROFESSION\"= ? , \"SUBPROFESSION\"=?  where "+"\"CONTACTS\"."+"\"ID\"="+contact.getId();
		System.out.println(SQL);
		int numberOfrows = jdbctemplate
				.update(SQL, new Object[] { name , email, profession , subprofession });
		if (numberOfrows > 0)
			return true;
		else return false;
		}
		else
			System.out.println("Contact is not available in DB");
			return false;

	}

	public boolean deleteContact(String email) {
		String SQL = "delete from public."+"\"CONTACTS\""+" where "+"\"CONTACTS\"."+ "\"EMAIL\" = ?";
		
		System.out.println(SQL);
		int numberOfrows = jdbctemplate.update(SQL, new Object[] { email });
		if (numberOfrows > 0)
			return true;
		else
			return false;

	}

}
