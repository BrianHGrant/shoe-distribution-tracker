require('spec_helper')

describe('path through the brands pages', {:type => :feature}) do
  it("shows message when no brands are in the database") do
    visit('/')
    click_link('Brands')
    expect(page).to have_content("There are no brands in the database. Add a brand now.")
  end

  it('allows user to add a store to database and lists it') do
    visit('/')
    click_link('Brands')
    fill_in('brand_name', :with => 'Siddartha Sandels')
    click_button('Add Brand')
    expect(page).to have_content("Siddartha Sandels")
  end


end
