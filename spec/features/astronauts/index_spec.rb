require 'rails_helper'

RSpec.describe "Astronauts Index Page", type: :feature do
  before(:each) do
    test_data
  end

  describe "'/astronauts" do
    it 'shows a list of astronauts and their attributes' do
      visit '/astronauts'
      
      within "#astronauts_#{@tim.id}" do
        expect(page).to have_content(@tim.name)
        expect(page).to have_content(@tim.age)
        expect(page).to have_content(@tim.job)
      end
      
      within "#astronauts_#{@frank.id}" do
        expect(page).to have_content(@frank.name)
        expect(page).to have_content(@frank.age)
        expect(page).to have_content(@frank.job)
      end
    end
    
    it 'can show the average age of all astronauts' do
      visit '/astronauts'
save_and_open_page
      expect(page).to have_content("Average Age: 48")
    end
  end
end