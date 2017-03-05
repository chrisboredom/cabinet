require 'rails_helper'

RSpec.describe Doc, type: :model do
  before do
    @doc = FactoryGirl.create(:doc)
  end

  it 'can be created' do
    expect(@doc).to be_valid
  end
end
