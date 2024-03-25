/**
 * 
 */
 // validation.js

function validateForm() {
    var s_name = document.forms["registrationForm"]["s_name"].value;
    var s_id = document.forms["registrationForm"]["s_id"].value;
    var s_pwd = document.forms["registrationForm"]["s_pwd"].value;
    var s_cpwd = document.forms["registrationForm"]["s_cpwd"].value;
    var s_dept = document.forms["registrationForm"]["s_dept"].value;
    var s_mail = document.forms["registrationForm"]["s_mail"].value;


    if (s_name == "" || s_id == "" || s_pwd == "" || s_cpwd == "" || s_dept == "" || s_mail == "") {
        alert("All fields must be filled out");
        return false;
    }

    if (s_pwd !== s_cpwd) {
        alert("Passwords do not match");
        return false;
    }

    return true;
}
/**
 * 
 */