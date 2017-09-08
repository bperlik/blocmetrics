
var blocmetrics = {};
 blocmetrics.report = function(eventName) {
   # create an event JSON object and send to blocmetrics analytics service
   var event = {event: { name: eventName}};
   # initialize a new XML Http Request(), an AJAX request
   var request = new XMLHttpRequest();
   # set the HTTP method to POST, use the url ofthe event endpoint and
   # allow the request to run asynchronously
   request.open("POST", "http://localhost:300/api/events", true);
   # set the request Content-Type header to 'application.json', so
   # that the API:events controller would not know how to process the request as a json
   request.setRequestHeader('Content-Type', 'application/json');
   # send the request
   request.send(JSON.stringify(event));
  }

// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap
//= require_tree .
