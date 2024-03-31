function validateForm() {
    var username = document.getElementById("username").value;
    var debitCard = document.getElementById("debit").value;
    var creditCard = document.getElementById("credit").value;
    var phoneNumber = document.getElementById("phoneno").value;
    var email = document.getElementById("mail").value;
    var age = document.getElementById("age").value;
    var pin = document.getElementById("pin").value;
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirm_password").value;

    // Check if any field is empty
    if (username == "" || debitCard == "" || creditCard == "" || phoneNumber == "" || email == "" || age == "" || pin == "" || password == "" || confirmPassword == "") {
        alert("All fields are required.");
        return false;
    }

    // Check if passwords match
    if (password !== confirmPassword) {
        alert("Passwords do not match.");
        return false;
    }

    return true;
}
