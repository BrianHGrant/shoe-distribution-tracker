require('spec_helper')

describe('path through the brands pages', {:type => :feature}) do
  it("shows message when no brands are in the database") do
    visit('/')
    click_link('Brands')
    expect(page).to have_content("There are no brands in the database. Add a brand now.")
  end
end
