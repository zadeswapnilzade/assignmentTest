package com.swaz.assignment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value="/Test")

public class Testrest {
	
	@RequestMapping(method=RequestMethod.GET ,  consumes="text/xml" )
	@ResponseBody
	public String checkRest()
	{
		return "hello";
	}
	

}
