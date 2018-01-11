function titleize(array, callBack) {
  let daSchmidtz = array.map(name => `Mx. ${name} Jingleheimer Schmidt`);

  return callBack(daSchmidtz);
}

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function () {
  console.log(`${this.name} goes BRRRRRRTTTT!`);
};

Elephant.prototype.grow = function () {
  this.height += 12;
  console.log(`${this.name} grew to ${this.height} inches!`);
};

Elephant.prototype.addTrick = function (trick) {
  this.tricks.push(trick);
};

Elephant.prototype.play = function () {
  let trickIndex = Math.floor((Math.random() * this.tricks.length));
  console.log(`${this.name} is ${this.tricks[trickIndex]}!`);
};

// let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
// let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
// let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
// let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);
//
// let herd = [ellie, charlie, kate, micah];

Elephant.paradeHelper = function(elephant) {
  console.log(`${elephant.name} is trotting by!`);
};

// herd.forEach(Elephant.paradeHelper);

function dinerBreakfast() {
  let order = "I'd like some bacon pancakes please.";
  console.log(order);

  return function (food) {
    order = order.replace(/ please.$/, '');
    order = `${order} and ${food} please.`;
    console.log(order);
  };
}
