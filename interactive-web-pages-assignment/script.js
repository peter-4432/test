// Simple click event for the message button
const clickButton = document.getElementById('showMessageBtn');
const messageArea = document.getElementById('messageText');

clickButton.addEventListener('click', function() {
  messageArea.textContent = 'Button clicked! JavaScript is working correctly.';
});

// Dark and light mode switcher
const themeSwitcher = document.getElementById('themeSwitch');
let darkThemeOn = false;

themeSwitcher.addEventListener('click', function() {
  darkThemeOn = !darkThemeOn;
  document.body.classList.toggle('dark-theme');
  
  if (darkThemeOn) {
    themeSwitcher.textContent = 'Switch to light mode';
  } else {
    themeSwitcher.textContent = 'Switch to dark mode';
  }
});

// Number counter with three buttons
const numberDisplay = document.getElementById('countNumber');
const addButton = document.getElementById('plusBtn');
const subtractButton = document.getElementById('minusBtn');
const resetButton = document.getElementById('zeroBtn');
let currentNumber = 0;

addButton.addEventListener('click', function() {
  currentNumber = currentNumber + 1;
  numberDisplay.textContent = currentNumber;
  checkNumberStyle();
});

subtractButton.addEventListener('click', function() {
  currentNumber = currentNumber - 1;
  numberDisplay.textContent = currentNumber;
  checkNumberStyle();
});

resetButton.addEventListener('click', function() {
  currentNumber = 0;
  numberDisplay.textContent = currentNumber;
  checkNumberStyle();
});

function checkNumberStyle() {
  if (currentNumber !== 0) {
    numberDisplay.style.fontWeight = 'bold';
  } else {
    numberDisplay.style.fontWeight = 'normal';
  }
}

// Form checking when user submits
const userForm = document.getElementById('userForm');
const formOutput = document.getElementById('formResult');
const nameField = document.getElementById('userName');
const emailField = document.getElementById('userEmail');
const passwordField = document.getElementById('userPassword');

userForm.addEventListener('submit', function(event) {
  // Stop the form from refreshing the page
  event.preventDefault();
  
  // Get the values from the form fields
  const userName = nameField.value.trim();
  const userEmail = emailField.value.trim();
  const userPassword = passwordField.value;
  
  let errorList = [];
  
  // Check if name is filled out properly
  if (userName === '') {
    errorList.push('Please enter your name');
    nameField.style.borderColor = '#000';
    nameField.style.borderWidth = '3px';
  } else if (userName.length < 2) {
    errorList.push('Name should be at least 2 letters long');
    nameField.style.borderColor = '#000';
    nameField.style.borderWidth = '3px';
  } else {
    nameField.style.borderColor = '#000';
    nameField.style.borderWidth = '1px';
  }
  
  // Check if email looks right
  if (userEmail === '') {
    errorList.push('Please enter your email address');
    emailField.style.borderColor = '#000';
    emailField.style.borderWidth = '3px';
  } else {
    // Basic email format check
    const atSymbol = userEmail.indexOf('@');
    const dotSymbol = userEmail.lastIndexOf('.');
    
    if (atSymbol < 1 || dotSymbol < atSymbol + 2 || dotSymbol + 2 >= userEmail.length) {
      errorList.push('Please enter a valid email address (like name@example.com)');
      emailField.style.borderColor = '#000';
      emailField.style.borderWidth = '3px';
    } else {
      emailField.style.borderColor = '#000';
      emailField.style.borderWidth = '1px';
    }
  }
  
  // Check password length
  if (userPassword === '') {
    errorList.push('Please create a password');
    passwordField.style.borderColor = '#000';
    passwordField.style.borderWidth = '3px';
  } else if (userPassword.length < 6) {
    errorList.push('Password should be at least 6 characters long');
    passwordField.style.borderColor = '#000';
    passwordField.style.borderWidth = '3px';
  } else {
    passwordField.style.borderColor = '#000';
    passwordField.style.borderWidth = '1px';
  }
  
  // Show results to user
  if (errorList.length > 0) {
    formOutput.innerHTML = '<strong>Please fix these issues:</strong><br>' + 
                          errorList.join('<br>• ');
    formOutput.style.fontWeight = 'bold';
  } else {
    formOutput.textContent = 'Success! Your form has been submitted.';
    formOutput.style.fontWeight = 'bold';
    
    // Clear the form after successful submission
    setTimeout(function() {
      userForm.reset();
      formOutput.textContent = 'The form results will show up here';
      formOutput.style.fontWeight = 'normal';
      nameField.style.borderColor = '';
      nameField.style.borderWidth = '';
      emailField.style.borderColor = '';
      emailField.style.borderWidth = '';
      passwordField.style.borderColor = '';
      passwordField.style.borderWidth = '';
    }, 2000);
  }
});

// Real-time form checking as user types
nameField.addEventListener('input', function() {
  if (nameField.value.length >= 2) {
    nameField.style.borderColor = '#000';
    nameField.style.borderWidth = '1px';
  }
});

emailField.addEventListener('input', function() {
  const emailValue = emailField.value;
  const atSymbol = emailValue.indexOf('@');
  const dotSymbol = emailValue.lastIndexOf('.');
  
  if (atSymbol > 0 && dotSymbol > atSymbol + 1 && dotSymbol + 1 < emailValue.length) {
    emailField.style.borderColor = '#000';
    emailField.style.borderWidth = '1px';
  }
});

passwordField.addEventListener('input', function() {
  if (passwordField.value.length >= 6) {
    passwordField.style.borderColor = '#000';
    passwordField.style.borderWidth = '1px';
  }
});