class Api::SubjectController < ApplicationController

  before_action :find_subject, only: [:show, :update, :destroy]

  def index
    render json: Subject.all
  end

  def show
    render json: @subject
  end

  def create
    subject = Subject.new(create_params)
    if subject.save
      render json: subject, status: :created
    else
      render json: {errors: subject.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @subject.update(update_params)
      render json: @subject, status: :ok
    else
      render json: {errors: @subject.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @subject.destroy
    head :no_content
  end

  private

  def find_subject
    @subject = Subject.find_by(params[:id])
  end

  def create_params
    params.permit(:email)
  end

  def update_params
    params.permit(:score)
  end
end
