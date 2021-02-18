require 'rails_helper'

RSpec.describe "Visit  admin shelters show page and" do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Homeless Animals", address: "789 Silly Ave", city: "Longmont", state: "AZ", zip: 78495)
    @shelter3 = Shelter.create!(name: "Pet Paradise", address: "954 Shelter Dr.", city: "Commerce City", state: "NM", zip: 24897)
  end

  it "lists the shelters name and address" do 
    visit '/admin/shelters'

    click_link("Shady Shelter")

    expect(current_path).to eq("/admin/shelters/#{@shelter1.id}")
    
    expect(page).to have_content("Shady Shelter")
    expect(page).to have_content("123 Shady Ave")


  end
end