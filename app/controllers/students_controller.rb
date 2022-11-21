class StudentsController < ApplicationController

  def index
    students = if params[:name]
                #  Student.by_name(params[:name])
               #return student with the same name as (matching first or last name)
               Student.where('lower(last_name) = ? OR lower(first_name) = ?', params[:name].downcase, params[:name].downcase)
               else
                 Student.all
               end    
    render json: students
  end

  def show
    students = Student.find(params[:id])
    render json: students
  end

end
