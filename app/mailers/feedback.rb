class Feedback < ActionMailer::Base
  default :to => "knk-electro@yandex.kz"
  
  def push_message(message)
    @message = message
    mail(:from => @message[:email], :subject => "КНК-электро. Обратная связь")
  end
end
