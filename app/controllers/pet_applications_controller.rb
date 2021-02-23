class PetApplicationsController < ApplicationController

  def create
    @pet_app = PetApplication.create(pet_id: params[:pet_id], application_id: params[:application_id])
    redirect_to  "/applications/#{params[:application_id]}"
  end

  def approve
    @pet_application = PetApplication.find(params[:id])
    @pet_application.approve!
    redirect_to "/admin/applications#{@pet_application.application_id}"
  end

  def reject
    @pet_application = PetApplication.find(params[:id])
    @pet_application.reject!
    redirect_to "/admin/applications#{@pet_application.application_id}"
  end

end
