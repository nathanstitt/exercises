require 'rails_helper'

RSpec.describe CopyrightHolder, :type => :model do

  subject { FactoryGirl.create(:copyright_holder) }

  it { is_expected.to belong_to(:publication) }
  it { is_expected.to belong_to(:user) }

  it { is_expected.to validate_presence_of(:publication) }
  it { is_expected.to validate_presence_of(:user) }

  it { is_expected.to delegate_method(:name).to(:user) }

  let!(:ch) { FactoryGirl.create :copyright_holder }

  it 'requires a unique user for each publication' do
    ch_2 = FactoryGirl.build :copyright_holder, user: ch.user,
                                                publication: ch.publication
    expect(ch_2).not_to be_valid
    expect(ch_2.errors[:user]).to include('has already been taken')
  end

end
