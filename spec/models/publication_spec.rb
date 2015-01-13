require "rails_helper"

RSpec.describe Publication, :type => :model do

  subject { FactoryGirl.create :publication }

  it { is_expected.to belong_to(:publishable) }
  it { is_expected.to belong_to(:license) }

  it { is_expected.to have_many(:authors).dependent(:destroy) }
  it { is_expected.to have_many(:copyright_holders).dependent(:destroy) }
  it { is_expected.to have_many(:editors).dependent(:destroy) }

  it { is_expected.to have_many(:sources).dependent(:destroy) }
  it { is_expected.to have_many(:derivations).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:publishable) }

  it { is_expected.to validate_presence_of(:number) }
  it { is_expected.to validate_presence_of(:version) }

  let!(:publication) { FactoryGirl.build :publication }

  it 'requires a unique publishable' do
    publication.save!
    publication_2 = FactoryGirl.build :publication,
                                      publishable: publication.publishable
    expect(publication_2).not_to be_valid
    expect(publication_2.errors[:publishable_id]).to(
      include('has already been taken'))

    publication_2.publishable = FactoryGirl.build :exercise
    expect(publication_2).to be_valid
  end

  it 'requires a valid license or nil' do
    expect(publication).to be_valid

    publication.license = FactoryGirl.build :license, licensed_classes: []
    expect(publication).not_to be_valid
    expect(publication.errors[:license]).to(
      include('is not valid for Exercise'))

    publication.license = nil
    expect(publication).to be_valid
  end

  it 'automatically assigns number and version on creation' do
    p = Exercise.create.publication
    expect(p).to be_valid
    expect(p.number).to be > 0
    expect(p.version).to eq 1
    expect(p.uid).to eq "#{p.number}@1"

    p_2 = FactoryGirl.create :publication, number: p.number
    expect(p_2).to be_valid
    expect(p_2.number).to eq p.number
    expect(p_2.version).to eq 2
    expect(p_2.uid).to eq "#{p.number}@2"
  end

  it 'defaults to ordering by number ASC and version DESC' do
    publication.save!
    publication_2 = FactoryGirl.create :publication,
                                       number: publication.number,
                                       version: publication.version + 1
    publication_3 = FactoryGirl.create :publication,
                                       number: publication.number + 1,
                                       version: publication.version
    publication_4 = FactoryGirl.create :publication,
                                       number: publication.number + 1,
                                       version: publication.version + 1
    expect(Publication.all).to eq [publication_2.reload, publication.reload,
                                   publication_4.reload, publication_3.reload]
  end

  it 'knows if it is published and/or public or not' do
    expect(publication.status).to eq 'unpublished'
    publication.published_at = Time.now
    publication.embargoed_until = Time.now + 1.year
    expect(publication.status).to eq 'embargoed'
    publication.embargoed_until = nil
    expect(publication.status).to eq 'published'
    publication.yanked_at = Time.now
    expect(publication.status).to eq 'yanked'
  end

end
