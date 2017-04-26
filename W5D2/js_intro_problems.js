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


// Callbacks:
function printCallBack(name_array) {
  name_array.forEach(function(name){
    return console.log(name);
  });
}
function titleize(name_array, callBack) {
  let new_names = name_array.map(function(name) {
    return `Mx. ${name} Jingleheimer Schmidt`;
  });
  callBack(new_names);
}
titleize(["Mary", "Brian", "Leo"], printCallBack);

// constructors, etc:
function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() { console.log(`${this.name} the elephant goes phhRRRRRR`); };
Elephant.prototype.grow = function () { this.height += 12; };
Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
 };

Elephant.prototype.play = function(){
  let i = Math.random(0, this.tricks.length );
  return this.tricks[i];
};

let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

let herd = [ellie, charlie, kate, micah];

// Why doesn't this work?
Elephant.prototype.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

herd.forEach(function(elephant) {
   return elephant.paradeHelper(elephant);
});

// herd.forEach(paradeHelper);

// console.log(ellie.trumpet());
// console.log(ellie.height);
// ellie.grow();
// console.log(ellie.height);
//
// console.log(ellie.tricks);
// ellie.addTrick("rap");
// console.log(ellie.tricks);

function dinerBreakfast(orderItem) {
  let order = "I'd like scrambled eggs and bacon";

  function addOrder(orderItem) {
    order += ` and ${orderItem}`;
    console.log(order);
  }
  return addOrder;
}
let bfastOrder = dinerBreakfast();
bfastOrder("chocolate chip pancakes");
bfastOrder("grits");
