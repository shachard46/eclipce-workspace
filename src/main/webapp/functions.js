function checkPassword() {
  var password = document.register.password.value;
  var password_confirm = document.register.password_confirm.value;
  return password.length > 5 && password === password_confirm;
}
function checkUsername() {
  var username = document.register.username.value;
  var letter = 0;
  for (var i = 0; i < username.length; i++) {
    letter = isNaN(username[i]) ? letter + 1 : letter;
  }
  console.log(letter);
  return letter < username.length && letter !== 0;
}

function checkSelect(list_name) {
  return document.register[list_name].value !== "בחר מיקום";
}

function checkEmail() {
  var email = document.register.email.value;
  var email_confirm = document.register.email_confirm.value;
  return email === email_confirm && email !== null && email.includes("@");
}
function checkText(fieldName) {
  return document.register[fieldName].value !== "";
}
function checkPostPostText(fieldName) {
  return document.postPost[fieldName].value !== "";
}
function checkAll() {
  return (
    checkEmail() &&
    checkPassword() &&
    checkUsername() &&
    checkSelect("compType") &&
    checkSelect("country") &&
    checkText("teamNumber") &&
    checkText("teamJob")
  );
}
function checkPollQuestion(id) {
  var valid = 0;
  for (var i = 0; i < 4; i++) {
    valid += document.getElementsByName(id)[i].checked;
  }
  return valid == 1 ? true : false;
}
function checkAllPoll() {
  var valid = 1;
  for (var i = 5; i < 14; i++) {
    valid *= checkPollQuestion(i);
    console.log(valid);
  }
  if (valid == 0) {
    alert("fill all questions!");
    return false;
  }
  return true;
}
function checkPostPost() {
  return checkPostPostText("postName") && checkPostPostText("postText");
}
function openFirstPage() {
  var newWin = window.open("firstIsrael.jsp", "www.firstisrael.org.il/", "width=500px, height=500px");
}