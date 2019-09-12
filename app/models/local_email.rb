class LocalEmail < ApplicationRecord
  validate :same_email
  validates :sender, presence: {message: "发送邮箱不能空"}
  validates :receiver, presence: {message: "接收邮箱不能空"}
  validates :subject, presence: {message: "邮件主题不能空"}
  validates :body, presence: {message: "邮件内容不能空"}

  private

  def same_email
    if self.receiver == self.sender
      errors.add(:base, "发送邮箱和接收邮箱不能一样")
    end
  end
end
