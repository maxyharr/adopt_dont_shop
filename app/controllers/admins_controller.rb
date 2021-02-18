class AdminsController < ApplicationController
  def show 
    @application = Application.find(params[:id])
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
  end

  def shelters_show
    @shelter = Shelter.show_info(params[:id])
  end
end