class ExerciseEditor.SimpleChoice extends Backbone.AssociatedModel
  urlRoot: '/api/simple_choices'

  relations: [
    {
      type: Backbone.One,
      key: 'content',
      relatedModel: 'ExerciseEditor.Content',
    }
  ]

  question: () ->
    @collection.parents[0]

  letter: () ->
    String.fromCharCode(96 + @get('position'))