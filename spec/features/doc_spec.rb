require 'rails_helper'

RSpec.feature do

  before do
    @user = FactoryGirl.create(:user)
    login_as(@user)
  end

  describe 'index' do
    before do
      visit docs_path
    end

    it 'can be reached succesfully' do
      expect(page.status_code).to eq(200)
    end

    it 'has a title of Documents' do
      expect(page).to have_content(/Document/)
    end

    it 'has a list of of documents' do
      doc = FactoryGirl.create(:doc)
      second_doc = FactoryGirl.create(:second_doc)

      visit docs_path

      expect(page).to have_text(doc.title)
      expect(page).to have_content(second_doc.title)
    end
  end

  describe 'creation' do
    before do
      visit new_doc_path
    end

    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from the new doc page' do
      fill_in "Title", with: "RSpec cheat sheet"
      fill_in "Content", with: "Things to remember about RSpec"
      click_on "Create Doc"

      expect(page).to have_content("Document has been created successfully")
    end
  end

  describe 'edit' do

    it 'can be edited' do
      doc = FactoryGirl.create(:doc)

      visit edit_doc_path(doc)

      fill_in "Title", with: "Edited document"
      fill_in "Content", with: "This document has been edited"
      click_on "Update Doc"

      expect(page).to have_content("This document has been edited")
    end
  end

  describe 'destroy' do
    it 'can be destroyed' do

      doc_to_delete = Doc.create(title: "This will be deleted", content: "This document will be deleted", user: @user)

      visit docs_path
      click_link("This will be deleted")
      click_link("Trash it")
      expect(page.status_code).to eq(200)
    end
  end
end