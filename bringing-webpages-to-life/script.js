// ---------------------------------------------
// Part 2: JavaScript Functions — Parameters & Return Values
// ---------------------------------------------

// This function adds two numbers and returns the total
function addNumbers(a, b) {
  return a + b;
}

// This function multiplies a number by a given factor
function multiplyNumber(num, factor) {
  return num * factor;
}

// This demonstrates local vs global scope
let globalDiscount = 10; // global variable

function calculateTotal(price, quantity) {
  // local variable only accessible inside this function
  let subtotal = addNumbers(price, 0) * quantity;
  let total = subtotal - globalDiscount;
  return total;
}

// Event listener for the "Calculate Total" button
const result = document.getElementById('result');
const calculateBtn = document.getElementById('calculateBtn');

calculateBtn.addEventListener('click', () => {
  let total = calculateTotal(50, 3); // Example: 50 per item, 3 items
  result.textContent = "Total after discount: $" + total;
});


// ---------------------------------------------
// Part 3: Combining CSS and JavaScript Animations
// ---------------------------------------------

const box = document.getElementById('box');
const animateBtn = document.getElementById('animateBtn');

animateBtn.addEventListener('click', () => {
  // Toggle the class to start or stop the animation
  box.classList.toggle('move');
});
