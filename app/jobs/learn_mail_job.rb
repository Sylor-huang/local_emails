class LearnMailJob < ApplicationJob
  queue_as :default

  def perform(mail)
    begin
      LearnMailer.learn_send(mail).deliver_now
      mail.update_attribute(:is_send, true)
    rescue Net::SMTPAuthenticationError, Net::SMTPServerBusy, Net::SMTPSyntaxError, Net::SMTPFatalError, Net::SMTPUnknownError => e

      Rails.logger.info("####__________#######{e}")
      mail.update_attribute(:is_send, true)
    end
    # Do something later
  end
end
