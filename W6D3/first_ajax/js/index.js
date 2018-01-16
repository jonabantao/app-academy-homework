console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  url: 'https://api.openweathermap.org/data/2.5/forecast?id=5391959&APPID=94e7492573b908d4f1c2644c97afeffb',
  type: 'GET',
  success(weatherData) {
    console.log(weatherData);
  },
});
// Add another console log here, outside your AJAX request

console.log("End of index.js");
