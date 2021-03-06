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

  it('allows the user to update the name of a store in the database') do
    visit('/')
    click_link('Stores')
    fill_in('store_name', :with => 'Portland Ped')
    click_button('Add Store')
    click_link('Portland Ped')
    save_and_open_page
    fill_in('new_store_name', :with => 'portland zapateria')
    click_button('Update Store')
    expect(page).to have_content('Portland Zapateria')
  end

  it('allows the user to delete a store from the database') do
    visit('/')
    click_link('Stores')
    fill_in('store_name', :with => 'Portland Ped')
    click_button('Add Store')
    click_link('Portland Ped')
    click_button('Delete Store')
    expect(page).to have_no_content('Portland Ped')
  end

  it('allows the user to add shoe brands to a store that sells them') do
    Brand.create({:name => 'Siddartha Sandels'})
    visit('/')
    click_link('Stores')
    fill_in('store_name', :with => 'Portland Ped')
    click_button('Add Store')
    click_link('Portland Ped')
    select('Siddartha Sandels', :from => 'brand_select')
    click_button('Add Brand')
    expect(page).to have_content('Siddartha Sandels')
  end

  it('allows the user to remove a shoe brand from a store') do
    Brand.create({:name => 'Siddartha Sandels'})
    visit('/')
    click_link('Stores')
    fill_in('store_name', :with => 'Portland Ped')
    click_button('Add Store')
    click_link('Portland Ped')
    select('Siddartha Sandels', :from => 'brand_select')
    click_button('Add Brand')
    select('Siddartha Sandels', :from => 'brand_remove')
    click_button('Remove Brand')
    expect(page).to have_content("No brands entered for this store currently")
  end

end
