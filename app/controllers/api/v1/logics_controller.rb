module Api::V1
  class LogicsController < OpenStax::Api::V1::ApiController

    resource_description do
      api_versions "v1"
      short_description 'A block of code used to create dynamically-generated variations of Exercises and Solutions.'
      description <<-EOS
        #{SITE_NAME} uses Javascript to make logics "dynamic".  Authors write
        small bits of Javascript to compute variables that are substituted into special
        placeholders in the logic content.  When the Javascript uses the available 
        randomization routines, different students will see different computer-generated
        permutations of the exericse.

        For a number of reasons, we do not run the author's Javascript in a student's browser
        when they view the logic &ndash; instead, the Javascript is run in the author's browser
        (during the authoring process).  When a "Logic" attached to an Exercise is saved,
        the client is responsible for sending along a number of output runs of the code,
        called "Logic Variable Value"s.  With, say, 100 of these Logic Variable Values,
        we can safely provide a number of permutations to a group of students.

        A Logic consists of some "code" as well as a list of exported variables.  These
        explicitly listed variables tell us which of the many variables available in the code
        the author wants to have available in the Logic content.  There are several 
        restrictions on the code and variables saved:

        1. The "code" data cannot contain the following standard Javascript reserved words: 
           > #{LogicVariable::RESERVED_WORDS.join(', ')}
        3. The "variables" data must be a JSON stringified array of string objects, each of
           which must match the following regular expression: #{LogicVariable::VARIABLE_REGEX.inspect}
      EOS
    end

    ########
    # seed #
    ########

    api :POST, '/logics/:id/seeds/:seed',
               'Adds a seed with variations to the specified Logic'
    description <<-EOS
      Adds a seed with variations to the specified Logic.

      TBD
    EOS
    def seed
    end

    ########
    # seed #
    ########

    api :DELETE, '/logics/:logic_id/seeds/:seed',
                 'Deletes a seed from the specified Logic'
    description <<-EOS
      Deletes a seed from the specified Logic.

      TBD
    EOS
    def seed
    end
    
  end
end
