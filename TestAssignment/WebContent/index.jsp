<html lang="en">
<head>
  <meta charset="utf-8">
  <title>submit demo</title>
  <style>
  p {
    margin: 0;
    color: blue;
  }
  div,p {
    margin-left: 10px;
  }
  span {
    color: red;
  }
  </style>
  <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
   <script type="text/javascript">
  
   
      
   
   
   
  function SearchProfessionPlace(value)
  {
    
  /// Add AJAX Call for Getting Hospital and School from DB	  
	          	
  select = document.getElementById("subprofession");
  while (select.firstChild) { select.removeChild(select.firstChild);}
  if (value== 'student')
  {
  	var option = document.createElement("option");
      option.value = 'schoolA';
      option.textContent = 'SchoolA';
      select.appendChild(option);
  }
  if (value== 'doctor')
  {
  	var option = document.createElement("option");
      option.value = 'hospital1';
      option.textContent = 'HospitalA';
      select.appendChild(option);
  }
 }
 </script>
  
</head>
<body>


<p>Contact have Unique email ID , Provide email ID to delete,Update Contact</p>


<form>
<span></span>

  <table >
			<tr>
				<td>Name</td>
				<td><input type="text" name="name" id="name" required=required /></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="email" name="email" id="email" /></td>
			</tr>
			<tr><td>Profession : </td><td>
			<select name=profession id=profession  onchange="SearchProfessionPlace(this.options[this.selectedIndex].value)" >
<option value="" disabled="disabled" selected="selected">Please select a Profession</option>
<option value="student">Student</option>
<option value="doctor">Doctor</option></select></td></tr>
				<tr><td>Sub Profession : </td><td> <select id="subprofession"></select>
			</td></tr>
		
		</table>
  <br>
  <div>
    <input type="hidden"   value="POST"  id="methodtype" name="methodtype" >
    <input type="button"  value="Add Contact"  id="submits"  name="submits"  onclick="addContacts()">
     <input type="button"  value="Update Contact"  id="submitsupdate"  name="submitsupdate"  onclick="updateContact()" >
    <input type="button" value="Delete Contact" 	onclick="DeleteContact()" >
			
  </div>
  <br><br>
  <hr width="600" align="left">
   <jsp:include page="SearchContact.jsp"></jsp:include>
   
    <div id="msgdiv"></div>
   <hr width="600" align="left">
</form>

 
<script>


var xmlhttp = new XMLHttpRequest();
var url = "${pageContext.request.contextPath}/REST/Contacts";

function addContacts(){
	
    var name = $('#name').val();  
    var email = $('#email').val();  
    var profession = $('#profession').val(); 
    var subprofession = $('#subprofession').val(); 
    
    
    if (email==null || email.trim()=="")
	{
		alert( "Please Provide Email ID" );
	}
    else{
    
    
    //var methods=$('#methodtype').val(); 
    var requestbody = {
								"name" : name,
								"email" : email,
								"profession" : profession,
								"subprofession":subprofession
    	};
    
    $.ajax({  
     type : "POST",  
       url : "/TestAssignment/REST/Contacts",   
     data : JSON.stringify(requestbody) ,
     beforeSend : function(xhr) {
			xhr.setRequestHeader("Accept",
					"application/json");
			xhr.setRequestHeader(
					"Content-Type",
					"application/json");
		},success : function(data, status,jqXHR)
		{
    	 
    	 if(JSON.parse(data)==true)
    	 {    		 
    		 $( "span" ).text( "Contact Added" ).show().fadeOut( 90000 );
    		 $('#msgdiv').empty();
    	 }
    	 else {
    		 $( "span" ).text( "Reacord Already Present with given email ID Or Blank Email Provided " ).show().fadeOut( 90000 );
    		  //$('input:hidden[name="methodtype"]').val('PUT');
    		 //document.getElementById("email").readOnly = true;
    		 // $('#submits').val('Update Contact ');
    		 }
   	 
     },  
     error : function(e) {alert('Error: ' + e);} ,
     "Cancel" : function() {(this).dialog("close");}
    });  
    }
 }
 
 
 function updateContact()
 {
	 
	 var name = $('#name').val();  
	    var email = $('#email').val();  
	    var profession = $('#profession').val(); 
	    var subprofession = $('#subprofession').val(); 
	   
	    
	    
	    	var requestbody = {
									"name" : name,
									"email" : email,
									"profession" : profession,
									"subprofession":subprofession
	    	};
	    
	  
	    $.ajax({  
	     type : "PUT",  
	       url : "/TestAssignment/REST/Contacts",   
	     data : JSON.stringify(requestbody) ,
	     beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept",
						"application/json");
				xhr.setRequestHeader(
						"Content-Type",
						"application/json");
			},
	     success : function(data, status,jqXHR){
	    	 
	    	 if(JSON.parse(data)==true)
	    	 {
	    		 
	    		 $( "span" ).text( "Contact Updated" ).show().fadeOut( 900000 );
	    		 //document.getElementById("email").readOnly = true;
	    		 $('#msgdiv').empty();
	    		 
	    	 }
	    	 else {
	    		 $( "span" ).text( "No Record found " ).show().fadeOut( 900000 );
	    		
	    		 //$('input:hidden[name="methodtype"]').val('PUT');
	    		// document.getElementById("email").readOnly = false;
	    		 // $('#submits').val('Update Contact ');
	    		 }
	    	 
	    	 
	     },  
	     error : function(e) {alert('Error: ' + e);} ,
	     "Cancel" : function() {(this).dialog("close");}
	    }); 
	 
	 
 }
 
  
function DeleteContact()
{

	    // var name = $('#name').val();  
	    var email = $('#email').val();  
	    // var profession = $('#profession').val(); 
	    // var subprofession = $('#subprofession').val(); 
	    // var methods=$('#methodtype').val(); 
	      	
	    
 if (email==null || email.trim()=="")
	{
		alert( "Please Provide Email ID" );
	}
    else{
    
	    
	    $.ajax({  
	     type : "DELETE",  
	       url : "/TestAssignment/REST/Contacts/"+email,   
	    // data : JSON.stringify(requestbody) ,
	     beforeSend : function(xhr) {
				xhr.setRequestHeader("Accept",
						"application/json");
				xhr.setRequestHeader(
						"Content-Type",
						"application/json");
			},
	     success : function(data, status,jqXHR){
	    	 
	    	 if(JSON.parse(data)==true)
	    	 {
	    		 
	    		 $('#msgdiv').empty();
	    		 $( "span" ).text( "Contact Deleted" ).show().fadeOut( 900000 );
	    		 //document.getElementById("email").readOnly = true;
                 //getAllContacts();
	    	 }
	    	 else {
	    		 $( "span" ).text( "No Record found " ).show().fadeOut( 900000 );
	    		
	    		 //$('input:hidden[name="methodtype"]').val('PUT');
	    		// document.getElementById("email").readOnly = false;
	    		 // $('#submits').val('Update Contact ');
	    		 }
	    	 
	    	 
	     },  
	     error : function(e) { $( "span" ).text('Error: ' + e).show().fadeOut( 900000 );} ,
	     "Cancel" : function() {(this).dialog("close");}
	    }); 
	 	
    }
}
 


 
 
</script>
 

 
</body>
</html>