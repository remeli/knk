class Feedback < ActionMailer::Base
  default :to => "lagox@mail.ru"
  
  def push_message(message)
    @message = message
    mail(:from => @message[:email], :subject => "КНК-электро. Обратная связь")
  end
end
