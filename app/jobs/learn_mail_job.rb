class LearnMailJob < ApplicationJob
  queue_as :default

  def perform(mail)
    begin
      LearnMailer.learn_send(mail).deliver_now
      mail.update_attribute(:is_send, 1) #0未发送，1发送成功，2发送失败
    rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e

      Rails.logger.info("####__________#######{e}")
      mail.update_attribute(:is_send, 2)
    end
    # Do something later
  end
end
