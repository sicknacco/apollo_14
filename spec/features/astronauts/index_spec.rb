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
      
      expect(page).to have_content("Average Age: 48")
    end
    
    it 'shows missions for each astronaut in alphabetical order' do
      visit '/astronauts'
save_and_open_page
      within "#astronauts_#{@tim.id}" do
        expect(page).to have_content(@mission1.title)
        expect(page).to have_content(@mission2.title)
        
        expect(@mission1.title).to appear_before(@mission2.title)
        expect(@mission2.title).to_not appear_before(@mission1.title)
      end
      
      within "#astronauts_#{@al.id}" do
        expect(page).to have_content(@mission1.title)
        expect(page).to have_content(@mission2.title)
        expect(page).to have_content(@mission3.title)
        expect(page).to have_content(@mission4.title)

        expect(@mission1.title).to appear_before(@mission2.title)
        expect(@mission2.title).to appear_before(@mission3.title)
        expect(@mission3.title).to appear_before(@mission4.title)
        expect(@mission4.title).to_not appear_before(@mission2.title)
      end
    end
  end
end