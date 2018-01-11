function madLib(verb, adjective, noun) {
  return `We shall ${verb.toUpperCase()} the ${adjective.toUpperCase()}`+
  ` ${noun.toUpperCase()}.`;
}

function isSubstring(searchString, subString) {
  return searchString.includes(subString);
}

function fizzBuzz(array) {
  return array.filter(num =>
    (num % 3 === 0 || num % 5 === 0) && (num % 15 !== 0));
}

function isPrime(num) {
  if (num < 2) {
    return false;
  }

  for (let i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }

  return true;
}

function sumOfNPrimes(n) {
  let sum = 0;
  let i = 2;
  let count = 0;

  while (count < n) {
    if (isPrime(i)) {
      sum += i;
      count++;
    }

    i++;
  }

  return sum;
}
