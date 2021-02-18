class Shelter < ApplicationRecord
  has_many :pets

  def self.reverse_order
    Shelter.find_by_sql("SELECT name, id FROM shelters ORDER BY shelters.name desc")
  end

  def self.show_info(id)
    Shelter.find_by_sql("SELECT name, address, city, state, zip FROM shelters WHERE shelters.id = #{id}").first
  end
end
