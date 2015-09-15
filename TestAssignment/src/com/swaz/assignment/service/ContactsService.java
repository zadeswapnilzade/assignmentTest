package com.swaz.assignment.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.swaz.assignment.bean.Contacts;
import com.swaz.assignment.dao.ContactsDao;

@Service
public class ContactsService {
	
	@Autowired
	ContactsDao contactsdao;
	
	public ContactsDao getContactsdao() {
		return contactsdao;
	}

	public void setContactsdao(ContactsDao contactsdao) {
		this.contactsdao = contactsdao;
	}

	public Contacts getContact(String email)
	{
		return contactsdao.getContact(email);
		
	}
	
	
	public List<Contacts> getContacts()
	{
		return contactsdao.getContacts();
		
	}
	
	public boolean addContact(String name , String email , String profession , String subprofession )
	{
		return contactsdao.addContact(name, email , profession , subprofession);
	}
	
	public boolean updateContact(String name , String email , String profession , String subprofession)
	{
		return contactsdao.updateContact(name , email, profession , subprofession);
			
		
	}
	
	public boolean deleteContact(String email)
	{
		return contactsdao.deleteContact(email);
		
	}

	

}
