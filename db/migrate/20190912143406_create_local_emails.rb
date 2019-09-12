class CreateLocalEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :local_emails do |t|
      t.string :subject
      t.text :body
      t.string :receiver
      t.string :sender
      t.integer :is_send, default: 0   #0未发送，1发送成功，2发送失败
      t.timestamps
    end
  end
end
