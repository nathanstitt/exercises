require "rails_helper"

RSpec.describe LogicVariableValue, :type => :model do

  subject { FactoryGirl.create(:logic_variable_value) }

  it { is_expected.to belong_to(:logic_variable) }

  it { is_expected.to validate_presence_of(:logic_variable) }
  it { is_expected.to validate_presence_of(:seed) }
  it { is_expected.to validate_presence_of(:value) }

  it { is_expected.to validate_uniqueness_of(:seed)
                        .scoped_to(:logic_variable_id) }

end
