require "rails_helper" 

RSpec.describe "Visit  admin shelters index page and" do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Homeless Animals", address: "789 Silly Ave", city: "Longmont", state: "AZ", zip: 78495)
    @shelter3 = Shelter.create!(name: "Pet Paradise", address: "954 Shelter Dr.", city: "Commerce City", state: "NM", zip: 24897)
  end

  it "lists all the shelters in reverse alphabetical order" do 
    visit '/admin/shelters'

    within "#adminShelters" do
      expect(page).to have_content("Shady Shelter")
      expect(page).to have_content("Homeless Animals")
      expect(page).to have_content("Pet Paradise")
    end
  end
end