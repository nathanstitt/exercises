require "rails_helper"

RSpec.describe Solution, :type => :model do

  it { is_expected.to belong_to(:question) }

  it { is_expected.to validate_presence_of(:question) }
  it { is_expected.to validate_presence_of(:solution_type) }
  it { is_expected.to validate_presence_of(:content) }

  it { is_expected.to validate_inclusion_of(:solution_type)
                        .in_array(SolutionType.all) }

end
