module Api::V1
  class ComboChoiceRepresenter < Roar::Decorator
    include Roar::Representer::JSON

    property :id, 
             type: Integer,
             writeable: false,
             schema_info: {
               required: true
             }

    property :correctness,
             type: Float
    
    #collection :answer_ids,
    #           schema_info: {
    #             items: Integer
    #           }

  end
end
