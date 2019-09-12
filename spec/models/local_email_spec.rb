require 'rails_helper'

RSpec.describe LocalEmail, type: :model do

  it "sender can be nil?" do
    params = { sender: "", receiver: "test1@126.com" , subject: "test email", body: "test email body"}
    email = LocalEmail.new(params)
    expect(email.save).to eq(true)
  end

  it "receiver can be nil?" do
    params = { sender: "test1@126.com", receiver: "" , subject: "test email", body: "test email body"}
    email = LocalEmail.new(params)
    expect(email.save).to eq(true)
  end

  it "sender and receiver can be the same?" do
    params = { sender: "test1@126.com", receiver: "test1@126.com" , subject: "test email", body: "test email body"}
    email = LocalEmail.new(params)
    expect(email.save).to eq(true)
  end

  it "subjective can be nil?" do
    params = { sender: "test2@126.com", receiver: "test1@126.com" , subject: "", body: "test email body"}
    email = LocalEmail.new(params)
    expect(email.save).to eq(true)
  end

  it "body can be nil?" do
    params = { sender: "test2@126.com", receiver: "test1@126.com" , subject: "test email", body: ""}
    email = LocalEmail.new(params)
    expect(email.save).to eq(true)
  end

  it "Is LocalEmail create success?" do
    params = { sender: "test2@126.com", receiver: "test1@126.com" , subject: "test email", body: "test email body"}
    email = LocalEmail.new(params)
    expect(email.save).to eq(true)
  end


end
