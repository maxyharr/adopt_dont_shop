class AdminsController < ApplicationController
  def show
    @application = Application.find(params[:id])
    @pet_applications = @application.pet_applications.includes(:pet)
  end

  def update_pet_app
    @application = Application.find(params[:id])
    @application.change_pet_status(params[:commit], params[:pet_id], params[:id])
    @application.change_status(params[:id])
    Pet.change_adopt_status(params[:id])
    redirect_to "/admin/applications/#{params[:id]}"
  end

  def shelters_index
    @shelters = Shelter.reverse_order
    @shelt = Shelter.with_pending_apps
  end

  def shelters_show
    @shelter = Shelter.show_info(params[:id])
    shelt = Shelter.find(params[:id])
    @avg_age_adoptable = shelt.avg_age
    @num_adoptable_pets = shelt.num_adoptable
  end
end
