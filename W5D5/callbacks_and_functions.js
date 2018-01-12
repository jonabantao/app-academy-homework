//Simple Timeout

window.setTimeout(() => alert('HAMMERTIME'), 5000);

//Timeout Plus Closure

function hammerTime(time) {
  window.setTimeout(() => alert(`${time} is hammertime!`), time);
}

// Biscuits or tea?

const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout,
});

function teaAndBiscuits() {
  reader.question(`Would you like some tea? `, (tea) => {
    reader.question(`Would you like some biscuits? `, (biscuits) => {
      const firstRes = (tea === 'yes') ? 'do' : 'don\'t';
      const secondRes = (biscuits === 'yes') ? 'do' : 'don\'t';

      console.log(`So you ${firstRes} want tea and you ${secondRes} want biscuits.`);
      reader.close();
    });
  });
}

teaAndBiscuits();

//Ways to Call a Function

function Cat() {
  this.name = 'Markov';
  this.age = 3;
}

function Dog() {
  this.name = 'Noodles';
  this.age = 4;
}

Dog.prototype.chase = function (cat) {
  console.log(`My name is ${this.name} and I'm chasing ${cat.name}! Woof!`);
};

const Markov = new Cat();
const Noodles = new Dog();

Noodles.chase(Markov);
Noodles.chase.call(Markov, Noodles);
Noodles.chase.apply(Markov, [Noodles]);