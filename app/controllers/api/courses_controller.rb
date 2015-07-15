class Api::CoursesController < ApplicationController
  def index
    render json: Course.all
  end

  def show
    render json: Course.find(params[:id])
  end

  def update
    course = Course.find(params[:id])
    if course.update_attributes(course_params)
      render json: course, status: 201, location: [:api, course]
    else
      render json: { errors: course.errors }, status: 422
    end
  end

  def destroy
    course = Course.find(params[:id])
    if course.delete
      render json: course, status: 201, location: [:api, course]
    else
      render json: { errors: course.errors }, status: 422
    end
  end

  def create
    course = Course.new(course_params)
    if course.save
      render json: course, status: 201, location: [:api, course]
    else
      render json: { errors: course.errors }, status: 422
    end
  end

  private
  def course_params
    params.require(:course).permit(:name, :passed)
  end

end
