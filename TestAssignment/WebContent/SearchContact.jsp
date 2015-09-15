<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript" src="http://www.json.org/json2.js"></script>
<script src="https://code.jquery.com/jquery-1.9.1.js"
	type='text/javascript'></script>

<script type="text/javascript">
 
 var xmlhttp = new XMLHttpRequest();
 var url = "${pageContext.request.contextPath}/REST/Contacts";
 
 function getAllContacts()
 {
	 	 
		 xmlhttp.onreadystatechange=function() {
	     if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	    	 jsonresponse(xmlhttp.responseText);
	     }
	 }
	 xmlhttp.open("GET", url, true);
	 xmlhttp.send();

	 function jsonresponse(response) {
		 
 if (response=="" || response ==null){
			 
			 $( "span" ).text( "No Records found " ).show().fadeOut( 900000 );
			 $('#msgdiv').empty();
		 }
		 
 else {
	     var arr = JSON.parse(response);
	     var i;
	     var out = "<table border=\"1\">"+ "<tr><td>Name</td><td>Email</td><td>Profession</td><td>SubProfession</td>";

	     for(i = 0; i < arr.length; i++) {
	         out +=  "<tr><td>"+ arr[i].name + "</td><td>" +arr[i].email +"</td><td>"+arr[i].profession +"</td><td>"+arr.subprofession+"</td></tr>";
	     }
	     out += "</table>";
	     $( "span" ).empty();
	     document.getElementById("msgdiv").innerHTML = out;
 }
	 }
 }
 
  
	 
	  
 
 
 
function searchContact() 
{
	
	var email = $('#emails').val(); 
	
	if (email==null || email.trim()=="")
	{
		alert( "Please Provide Email ID" );
	}
	else {
	 
	 
		
	 
			var resturl = url+"/"+email;
	 xmlhttp.onreadystatechange=function() {
	     if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	    	 jsonresponse(xmlhttp.responseText);
	     }
	 }
	 xmlhttp.open("GET", resturl, true);
	 xmlhttp.send();

	 function jsonresponse(response) {
		
		
		 if (response=="" || response == null ){
			 
			 $( "span" ).text( "No Record found with Given Email" ).show().fadeOut( 900000 );
			 $('#msgdiv').empty();
		 }
		 else{
			 var obj = jQuery.parseJSON( response );		 	    
	     var out = "<table border=\"1\">";
	         out += "<tr><td>Name</td><td>Email</td><td>Profession</td><td>SubProfession</td>" +
	         "<tr><td>"+ obj.name + "</td><td>" +obj.email +"</td><td>"+obj.profession +"</td><td>"+obj.subprofession+"</td></tr>";
	      out += "</table>";
	      
	     document.getElementById("msgdiv").innerHTML = out;
	     $( "span" ).empty();
		 }
	 }

	}
	}



 </script>

</head>
<body>

	<form id="getcontact" method="get"
		action="${pageContext.request.contextPath}/REST/Contacts">
		<table border="0">
			<tr>
			<td><input name="getall" value="Get All Contacts" type="button"
			onclick="getAllContacts()"></td>
			<td>  OR  </td>
				<td>Search By Email</td>
				<td><input type="email"  name="emails" id="emails" required /></td>
				<td><input type="button" value="Search Contact"	onclick="searchContact()"></td>
			</tr>
			
		</table>

		
		


	</form>

	<div></div>




</body>
</html>