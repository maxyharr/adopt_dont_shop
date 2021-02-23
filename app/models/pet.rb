class Pet < ApplicationRecord
  belongs_to :shelter
  has_many :pet_applications
  has_many :applications, through: :pet_applications
  validates_presence_of :name, :description, :approximate_age, :sex

  validates :approximate_age, numericality: {
              greater_than_or_equal_to: 0
            }

  enum sex: [:female, :male]

  def self.change_adopt_status(app_id)
    application = Application.find(app_id)
    if application.status == "Approved"
      application.pets.update_all(adoptable: false)
    end
  end

  def not_adoptable?
    !adoptable?
  end
end
