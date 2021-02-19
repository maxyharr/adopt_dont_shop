class Shelter < ApplicationRecord
  has_many :pets

  def self.reverse_order
    Shelter.find_by_sql("SELECT name, id FROM shelters ORDER BY shelters.name desc")
  end

  def self.show_info(id)
    Shelter.find_by_sql("SELECT name, address, city, state, zip FROM shelters WHERE shelters.id = #{id}").first
  end

  def self.with_pending_apps
    Shelter.joins(pets: :applications).where(applications: {status: "Pending"}).select(:name).distinct.select(:id).order(:name)
  end

  def avg_age
    pets.average(:approximate_age).to_i
  end

  def num_adoptable
    pets.where("adoptable = true").count
  end
end
