require('spec_helper')

describe('path through the stores pages', {:type => :feature}) do
  it('show message when no stores are in database') do
    visit('/')
    click_link('Stores')
    expect(page).to have_content("There are no stores in the database. Add a store now.")
  end

end
