const madLib = (verb, adj, noun) => {
  return `We shall ${verb} the ${adj} ${noun}`;
};

console.log(madLib('make', 'best', 'guac'));

function isSubstring(searchString, subString) {
  for (let i = 0; i < searchString.length; i++) {
    if (searchString[i] == subString[0]) {
      if (searchString.slice(i, i + subString.length) == subString) {
        return true;
      }
    }
  }
  return false;
}

console.log("Substring " + isSubstring("time to program", "time"));
// true

console.log("Substring " + isSubstring("Jump for joy", "joys"));
// false

const fizzBuzz = (array) => {
  let res = [];
  for (let i = 0; i < array.length; i++){
    if (i % 3 == 0 || i % 3 == 5) {
      continue;
    }
    else {
      res.push(array[i]);
    }
  }
  return res;
};

function isPrime(num) {
  for (let i = 2; i <= Math.sqrt(num); i++) {
    if (num % i == 0) {
      return false;
    }
  }
  return true;
}
console.log("Prime " + isPrime(2));
// true;

console.log("Prime " + isPrime(10));
// false

console.log("Prime " + isPrime(15485863));
// true

console.log("Prime " + isPrime(3548563));
// false

const firstNPrimes = (n) => {
  let res = [];
  let i = 2;

  while (res.length != n) {
    if (isPrime(i)) {
      res.push(i);
    }
    i += 1;
  }
  return res;
};

function sumOfNPrimes(num) {
  let res = firstNPrimes(num);
  let sum = 0;
  // res.forEach(el => { sum += el } );
  res.forEach(function(el) {
    sum += el;
  }
);
  return sum;
}

console.log(sumOfNPrimes(0));
// 0

console.log(sumOfNPrimes(1));
// 2

console.log(sumOfNPrimes(4));
// 17
