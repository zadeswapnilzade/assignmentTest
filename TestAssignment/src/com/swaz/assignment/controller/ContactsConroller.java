package com.swaz.assignment.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.swaz.assignment.bean.Contacts;
import com.swaz.assignment.service.ContactsService;

@Controller
@RequestMapping(value="/REST/Contacts")
public class ContactsConroller {
	
	@Autowired
	private ContactsService contactservice;

	public void setContactsrvice(ContactsService contactservice) {
		this.contactservice = contactservice;
	}
		
	@RequestMapping (  method= RequestMethod.GET ,produces = "application/json" )
	@ResponseBody
	public  List<Contacts>  getContacts()
	{
		return contactservice.getContacts();
		
	}
	
	@RequestMapping ( value="/{email}" , method= RequestMethod.GET ,produces = "application/json" )
	@ResponseBody
	public  Contacts  getSingleContact(@PathVariable String email)
	{
		if (email.trim() ==null || email.trim().equals("")) { return null;}
		System.out.println(":::: Searching by email " +email);
				
		return contactservice.getContact(email.trim());
		
	}
	
	@RequestMapping (method= RequestMethod.POST ,  produces = "application/json" )
	@ResponseBody
	public boolean addContact( @RequestBody Contacts contacts)  
	{
		if (contacts.getEmail().trim() ==null || contacts.getEmail().trim().equals("")) { return false;}
		System.out.println(":::::::::::::"+ contacts.toString() );
		//return true;
		//  @RequestParam(value="name") String name , @RequestParam(value="email") String email, @RequestParam(value="profession") String profession
		return contactservice.addContact( contacts.getName().trim() , contacts.getEmail().trim() , contacts.getProfession(), contacts.getSubprofession().trim());
	}
	
	@RequestMapping (method= RequestMethod.PUT , produces = "application/json" )
	@ResponseBody
	public boolean updateContact(@RequestBody Contacts contacts)
	{
		if (contacts.getEmail().trim() ==null || contacts.getEmail().trim().equals("")) { return false;}
		System.out.println("In PUT for Update : " + contacts.toString());
		return contactservice.updateContact(contacts.getName().trim() , contacts.getEmail().trim() , contacts.getProfession().trim(),contacts.getSubprofession().trim());
				
	}
	
	@RequestMapping ( value="/{email}" ,  method= RequestMethod.DELETE , produces = "application/json" )
	@ResponseBody
	public boolean deleteContact(@PathVariable String email)
	{
		System.out.println("Delete Method for email "+email);
		
		if (email.trim()==null || email.trim().equals("")) { return false;}

		return contactservice.deleteContact(email.trim());
		
	}
	
	

}
