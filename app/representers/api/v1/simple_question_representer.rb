module Api::V1
  class SimpleQuestionRepresenter < Roar::Decorator

    include Roar::Representer::JSON

    property :stimulus,
             as: :stimulus_html,
             type: String,
             writeable: true,
             readable: true

    property :stem,
             as: :stem_html,
             type: String,
             writeable: true,
             readable: true,
             getter: lambda { |args| stems.first.content },
             setter: lambda { |value, args|
               stems << Stem.new(question: self) if stems.empty?
               stems.first.content = value },
             schema_info: {
               required: true
             }

    collection :answers,
               class: Answer,
               decorator: SimpleAnswerRepresenter,
               writeable: true,
               readable: true,
               schema_info: {
                 required: true
               }

    collection :hints,
               type: String,
               writeable: true,
               readable: true,
               getter: lambda { |args| hints.collect{|h| h.content} },
               setter: lambda { |values, args|
                 values.each do |v|
                   hint = hints.find_or_initialize_by(content: v)
                   hints << hint unless hint.persisted?
                 end
               },
               schema_info: {
                 required: true,
                 description: 'Author-supplied hints for the question'
               }

    collection :formats,
               type: String,
               writeable: true,
               readable: true,
               getter: lambda { |args| stems.first.stylings.collect{ |s|
                                         s.style } },
               setter: lambda { |values, args|
                 values.each do |value|
                   styling = stems.first.stylings
                                  .find_or_initialize_by(style: value)
                   styling.stylable = stems.first
                   stems.first.stylings << styling unless styling.persisted?
                 end
               },
               schema_info: {
                 required: true,
                 description: 'The formats allowed for this object'
               }

    collection :combo_choices,
               class: ComboChoice,
               decorator: ComboChoiceRepresenter,
               writeable: true,
               readable: true,
               getter: lambda { |args| stems.first.try(:combo_choices) },
               setter: lambda { |value, args| stems.first.combo_choices = value }

  end
end
