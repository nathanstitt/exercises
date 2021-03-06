module HasLogic
  module ActiveRecord
    module Base
      def self.included(base)
        base.extend(ClassMethods)
      end
      
      module ClassMethods
        def has_logic(*languages)
          class_exec do
            has_one :logic, as: :parent, dependent: :destroy
          end
        end
      end
    end
  end

  module ActionDispatch
    module Routing
      module Mapper
        def has_logic
          resources :logics, only: [] do
            post 'seeds', on: :member
          end
        end
      end
    end
  end

  module Roar
    module Decorator
      def has_logic
        property :logic,
                 class: Logic,
                 decorator: Api::V1::LogicRepresenter,
                 writeable: true,
                 readable: true
      end
    end
  end
end

ActiveRecord::Base.send :include, HasLogic::ActiveRecord::Base
ActionDispatch::Routing::Mapper.send :include,
                                     HasLogic::ActionDispatch::Routing::Mapper
Roar::Decorator.extend HasLogic::Roar::Decorator
