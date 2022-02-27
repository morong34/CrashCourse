class SessionsController < ApplicationController
  skip_before_action :require_user, only: [:new, :create]

  def new 
  end

  def create
    student = Student.find_by(email: params[:sessions][:email].downcase)
    if student && student.authenticate(params[:sessions][:password])
      session[:student_id] = student.id
      flash[:notice] ="you have successfully authenticated"
      redirect_to student
    else
      flash.now[:notice] = "Something was wrong with your credentials"
      render 'new'
    end
  end

  def destroy
    session[:student_id] = nil
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end
   
end