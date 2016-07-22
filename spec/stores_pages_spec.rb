require('spec_helper')

describe('path through the stores pages', {:type => :feature}) do
  it('shows message when no stores are in database') do
    visit('/')
    click_link('Stores')
    expect(page).to have_content("There are no stores in the database. Add a store now.")
  end
  it('allows user to add a store to database and lists it') do
    visit('/')
    click_link('Stores')
    fill_in('store_name', :with => 'Portland Ped')
    click_button('Add Store')
    expect(page).to have_content("Portland Ped")
  end

end
