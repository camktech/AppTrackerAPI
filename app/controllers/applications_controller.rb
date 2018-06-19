class ApplicationsController < ApplicationController
  require_relative '../presenters/application_presenter.rb'
  before_action :set_application, only: [:show, :update, :destroy]

  # GET /applications
  def index
    @applications = current_user.applications.includes(:application_skills, :skills, :resume)
    apps = @applications.map{|app| ApplicationPresenter.new(app).present}
    render json: apps
  end

  # GET /applications/1
  def show
    render json: @application
  end

  # POST /applications
  def create
    @application = Application.new(application_params)

    if @application.save
      render json: @application, status: :created, location: @application
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /applications/1
  def update
    if @application.update(application_params)
      render json: @application
    else
      render json: @application.errors, status: :unprocessable_entity
    end
  end

  # DELETE /applications/1
  def destroy
    @application.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def application_params
      params.require(:application).permit(:company_name, :position, :date, application_skills_attributes: [:skill_id, :experience])
    end
end
