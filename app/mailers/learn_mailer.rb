class LearnMailer < ApplicationMailer

  def learn_send(mail)
    @mail = mail
    receive_mail = mail.receiver
    subject = mail.subject
    mail from: mail.sender, to: receive_mail, subject: subject
  end
end
