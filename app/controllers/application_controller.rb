class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def feedback
    message = {
      :name => params[:name],
      :email => params[:email],
      :phone => params[:phone],
      :message => params[:message]
    }
    Feedback.push_message(message).deliver
    redirect_to root_path, :notice => "Сообщение отправлено!"
  end
  

end