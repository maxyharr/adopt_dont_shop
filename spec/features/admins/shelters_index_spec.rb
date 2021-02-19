require "rails_helper" 

RSpec.describe "Visit  admin shelters index page and" do
  before :each do
    @shelter1 = Shelter.create!(name: "Shady Shelter", address: "123 Shady Ave", city: "Denver", state: "CO", zip: 80011)
    @shelter2 = Shelter.create!(name: "Homeless Animals", address: "789 Silly Ave", city: "Longmont", state: "AZ", zip: 78495)
    @shelter3 = Shelter.create!(name: "Pet Paradise", address: "954 Shelter Dr.", city: "Commerce City", state: "NM", zip: 24897)

    @pet1 = @shelter1.pets.create!(image:"", name: "Thor", description: "dog", approximate_age: 2, sex: "male")
    @pet2 = @shelter1.pets.create!(image:"", name: "Athena", description: "cat", approximate_age: 3, sex: "female")
    @pet3 = @shelter1.pets.create!(image:"", name: "Zeus", description: "dog", approximate_age: 4, sex: "male")
    @pet4 = @shelter2.pets.create!(image:"", name: "Cuatro", description: "cat", approximate_age: 7, sex: "male")
    @pet5 = @shelter2.pets.create!(image:"", name: "Callie", description: "cat", approximate_age: 10, sex: "female")
    @pet6 = @shelter2.pets.create!(image:"", name: "Anna", description: "dog", approximate_age: 5, sex: "female")

    @application1 = Application.create!(name: "Jake", street: "123 Main St", city: "Denver", state: "CO", zip: "80210", description: "I love animals", status: "In Progress")
    @application2 = Application.create!(name: "Bri", street: "456 Adams St", city: "Boulder", state: "CO", zip: "80235", description: "Cats rule", status: "In Progress")
    @application3 = Application.create!(name: "Adam", street: "789 Anfield Rd", city: "Liverpool", state: "EN", zip: "80235", description: "Cats rule", status: "Pending")
    @application3.update!(status: "Pending")
    
    @PetApp1 = PetApplication.create!(pet_id: @pet1.id, application_id: @application1.id)   
    @PetApp2 = PetApplication.create!(pet_id: @pet2.id, application_id: @application3.id)
    @PetApp3 = PetApplication.create!(pet_id: @pet5.id, application_id: @application3.id)
    @PetApp4 = PetApplication.create!(pet_id: @pet1.id, application_id: @application2.id)
  end

  it "lists all the shelters in reverse alphabetical order" do 
    visit '/admin/shelters'

    within "#adminShelters" do
      expect(page).to have_content("Shady Shelter")
      expect(page).to have_content("Homeless Animals")
      expect(page).to have_content("Pet Paradise")
    end
  end

  it "lists all the shelters with pending apps" do 
    visit '/admin/shelters'

    within "#sheltersPending" do 
      expect(page).to have_content("Shady Shelter")
      expect(page).to have_content("Homeless Animals")
    end

  end
end