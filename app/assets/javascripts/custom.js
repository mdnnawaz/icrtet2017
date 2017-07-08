$(window).scroll(function() {
  if ($(document).scrollTop() > 50) {
    $('header').addClass('navbar-fixed-top');
    $('#navHeader').removeClass('hidden');
  } 
  else {
    $('header').removeClass('navbar-fixed-top');
    $('#navHeader').addClass('hidden');
  }
});

updateStaff = function(){
  var staff = document.getElementById('staffs');
  var students = document.getElementById('students');
  console.log(staff.value);
  document.getElementById('sta').innerHTML = "Rs. "+ parseInt(staff.value) * 1500 + "";
  document.getElementById('total').innerHTML = "Rs. "+ ((parseInt(staff.value) * 1500)+(parseInt(students.value) * 1000))  + "";
}

updateStud = function(){
  var staff = document.getElementById('staffs');
  var students = document.getElementById('students');
  console.log(staff.value);
  document.getElementById('stud').innerHTML = "Rs. "+ parseInt(students.value) * 1000 + "";
  document.getElementById('total').innerHTML = "Rs. "+ ((parseInt(staff.value) * 1500)+(parseInt(students.value) * 1000))  + "";
}

updateCert = function(){
  var staff = document.getElementById('staffs');
  var students = document.getElementById('students');
  var cert = document.getElementById('certs');
  console.log(cert.value);
  document.getElementById('ce').innerHTML = "Rs. "+parseInt(cert.value) * 250 + "";
  document.getElementById('total').innerHTML = "Rs. "+ ((parseInt(staff.value) * 1500)+(parseInt(students.value) * 1000)+(parseInt(cert.value) * 250))  + "";
}

function certName()
{
  var fname = document.getElementById('fname'); 
  var lname = document.getElementById('lname');
  console.log(lname.value);
  document.getElementById("fullName").innerHTML = fname.value.toUpperCase() + ' ' + lname.value.toUpperCase();

}