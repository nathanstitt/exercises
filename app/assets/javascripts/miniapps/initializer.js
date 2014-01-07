var sync = Backbone.sync;
Backbone.sync = function(method, model, options) {
  options.beforeSend = function (xhr) {
    console.log('about to sync' + model.cid);
    xhr.setRequestHeader('Accept', 'application/vnd.exercises.openstax.v1');
  };

  // Update other options here.

  sync(method, model, options);
};

// https://github.com/marionettejs/backbone.marionette/wiki/Using-jst-templates-with-marionette
Backbone.Marionette.Renderer.render = function(template, data){
  var theTemplate = JST['miniapps/exercise_editor/templates/' + template];
  if (!theTemplate) throw "Template '" + template + "' not found!";
  return theTemplate(data);
}

var apiGet = function(url) {
  jQuery.ajax({
    url:url,
    beforeSend: function(xhr) { 
      xhr.setRequestHeader('Accept','application/vnd.exercises.openstax.v1');
    },
    success: function(data,textStatus,xhr) { 
      console.log(xhr.responseText); 
      console.log(data);
    }
  });
};