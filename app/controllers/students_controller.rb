class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end 

  def new
    @student = Student.new
  end 

  def create
    student = Student.create(form_params)
    if student.invalid?
        flash[:errors] = student.errors.full_messages
        redirect_to new_student_path
    else
        redirect_to student_path(student)
    end     
  end

  def edit
    @student = Student.find(params[:id])
  end 

  def update
    student = Student.find(params[:id])
    student.update(form_params)
    if student.valid?
        redirect_to student_path(student)
    else 
        flash[:errors] = student.errors.full_messages
        redirect_to edit_student_path
    end 
  end 

  private

  def form_params
    params.require(:student).permit(:name, :mod)
  end 

end
