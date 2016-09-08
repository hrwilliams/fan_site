require 'rails_helper'

describe "the add a work process" do
  it "adds a new work" do
    Subgenre.create(description: "Afrofuturism")
    visit subgenres_path
    click_link 'Afrofuturism'
    click_link 'Add a work'
    fill_in 'Title', :with => 'The ArchAndroid'
    fill_in 'Artist', :with => 'Janelle Monae'
    fill_in 'Year created', :with => '2010'
    fill_in 'Description', :with => 'studio album'
    click_on 'Create Work'
  expect(page).to have_content 'works'
  end

  it "gives error when no name is entered" do
    Subgenre.create(description: "Afrofuturism")
    visit subgenres_path
    click_link 'Afrofuturism'
    click_link 'Add a work'
    click_on 'Create Work'
    expect(page).to have_content 'errors'
  end
end
