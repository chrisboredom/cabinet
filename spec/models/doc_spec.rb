require 'rails_helper'

RSpec.describe Doc, type: :model do
  before do
    @doc = FactoryGirl.create(:doc)
  end
  describe 'creation' do
    it 'can be created' do
      expect(@doc).to be_valid
    end
  end

  describe 'validations' do
    it 'can not be created without a title' do
      @doc.title = nil
      expect(@doc).to_not be_valid
    end

    it 'can not be created without content' do
      @doc.content = nil
      expect(@doc).to_not be_valid
    end
  end
end
