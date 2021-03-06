require "rails_helper"

RSpec.describe ClassLicense, :type => :model do

  subject { FactoryGirl.create(:class_license) }

  it { is_expected.to belong_to(:license) }

  it { is_expected.to validate_presence_of(:license) }
  it { is_expected.to validate_presence_of(:class_name) }

  it { is_expected.to validate_uniqueness_of(:class_name)
                        .scoped_to(:license_id) }

end
