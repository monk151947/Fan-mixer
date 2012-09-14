class NotificationsMailer < ActionMailer::Base
   default :from => "support@inventory.com"
    default :to => "jagdish151947@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[YourWebsite.tld] #{message.subject}")
  end

end

