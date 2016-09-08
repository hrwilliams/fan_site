require 'rails_helper'

describe "the edit a work process" do
  it "edits a work" do
    subgenre = Subgenre.create(:description => 'Afrofuturism')
    visit subgenres_path(subgenre)
    click_link 'Afrofuturism'
    click_link 'Add a work'
    fill_in 'Title', :with => 'ArchAndroid'
    click_on 'Create Work'
    click_link 'Edit'
    fill_in 'Title', :with => 'Arch Android'
    click_on 'Update Work'
    expect(page).to have_content 'Arch Android'
  end
end
