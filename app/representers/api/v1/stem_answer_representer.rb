module Api::V1
  class StemAnswerRepresenter < Roar::Decorator

    include Roar::Representer::JSON

    property :answer_id,
             type: Integer,
             writeable: true,
             readable: true,
             setter: lambda { |val|
               self.answer = question.answers.select{|i| (i.id || i.temp_id) == val}.first
             },
             schema_info: {
               required: true
             }

    property :correctness,
             type: Float,
             writeable: true,
             readable: true,
             getter: lambda { |*| @correctness.to_f },
             schema_info: {
               type: 'number'
             }

  end
end
