module Api::V1
  class ExerciseRepresenter < Roar::Decorator
    include Roar::Representer::JSON

    property :id, 
             type: Integer,
             writeable: false,
             schema_info: {
               required: true
             }

    property :number, 
             type: Integer,
             writeable: false

    property :version, 
             type: Integer,
             writeable: false

    property :background, 
             class: Content, 
             decorator: ContentRepresenter, 
             parse_strategy: :sync

    collection :parts, 
               class: Part, 
               decorator: PartRepresenter, 
               parse_strategy: :sync,
               schema_info: {
                 minItems: 0
               }

  end
end