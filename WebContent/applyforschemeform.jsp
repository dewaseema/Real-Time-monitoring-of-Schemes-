<!DOCTYPE html>
<html>
<head>
    <title>Schemes</title>
     <meta charset="utf-8"> 
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>	
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
body {


background-image: url('image//bakcground.jpg');
font-family: "Times New Roman", Times, serif;
  color: black;   
}

input[type=text], select, textarea, [text=integer], [text=date]{
    width: 100%;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
    margin-top: 6px;
    margin-bottom: 16px;
    resize: vertical;
}

input[type=submit] {
    background-color: blue;
    color: white;
    padding: 12px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

.container {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>
</head>
<body>

<center>
<h3 style="color:blue;"><marquee>Apply for Scheme Here! </marquee></h3>
</center>
<div class="container">
  <form action="BenificaryRegistrationController" method="post" enctype="MULTIPART/FORM-DATA" >
  	<div class="row">
  <div class="col-sm-8">
   <label for="fname">District Name</label>
    <input type="text" id="dname" name="dname"  value="ambikapur" placeholder="Your district name..">
	
	 <label for="fname">Block Name</label>
    <input type="text" id="bname" name="bname" value="rajpur" placeholder="Your block name..">
	
	 <label for="fname">Village Panchayat</label>
    <input type="text" id="vp" name="vp"  value="rajpur" placeholder="Your village panchayat..">
  </div>
  
  <div class="col-sm-4">

  <br><br><br><br><br><br><br><br><br>
  <center>
 adhhar <input type="file" name="adhhar" accept="image/*">
  resident proof<input type="file" name="resident" accept="image/*">
  </center>
  </div>
  </div>
   <label for="hospital">Hospital</label>
    <input type="text" id="hospital" name="hospital"  value="ramkrishna" placeholder="Hospital Name">
    
    <label for="fname">Name of applicant</label>
    <input type="text" id="name" name="name"  value="sita" placeholder="Your name..">

    <label for="lname">Father/Husband's Name</label>
    <input type="text" id="fhname" name="fhname" value="ram" placeholder="Your father/husband's name..">
    
     <label for="schemeCode">SchemeCode</label>
    <input type="text" id="schemeCode" name="schemeCode" value="12" placeholder="Your scheme code..">
    

    <label for="gender">Gender</label>
    <select id="gender" name="gender">
      <option value="male">Male</option>
      <option value="female">Female</option>
      <option value="other">Other</option>
    </select>

    <label for="address">Permanent Residential Address</label>
    <textarea id="address" name="address" placeholder="Address.." value="itanagar" style="height:100px"></textarea>
 
 
	<label for="contact">Contact Number</label>
    <input type="text" id="contact" name="contact" value="9644436139" placeholder="Your contact name..">
	
	
	<label for="date">Date of Birth</label><br>
    <input type="date" id="date" name="date" value="10/06/1996" placeholder="Your date of birth..">
	
	<br><br>
	<label for="contact">Aadhar Number</label>
    <input type="text" id="contact" name="addhar" value="256146531" placeholder="Aadhar number..">
	
	
	<label for="status">Marital Status</label>
    <select id="status" name="maritial_status">
      <option value="married">Married</option>
      <option value="unmarried">Unmarried</option>
      <option value="widow">Widow</option>
	  <option value="divorced">Divorced</option>
    </select>

	<br>
	
    <input type="submit" value="Submit">
  </form>
</div>

</body>
</html>
