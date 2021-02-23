class PetApplication < ApplicationRecord
  belongs_to :pet
  belongs_to :application

  after_initialize :default, unless: :persisted?

  def default
    self.status = "In Progress"
  end

  def in_progress?
    status == 'In Progress'
  end

  def approved?
    status == 'Approved'
  end

  def rejected?
    status == 'Rejected'
  end

  def approve!
    update status: 'Approved'
    pet.update adoptable: true
  end

  def reject!
    update status: 'Rejected'
  end

end
