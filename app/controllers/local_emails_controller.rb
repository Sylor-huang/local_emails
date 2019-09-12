class LocalEmailsController < ApplicationController

  before_action :find_mail, except: [:new, :create, :index]

  def index
    @mails = LocalEmail.all
  end

  def show

  end

  def new
    @mail = LocalEmail.new
  end

  def create
    ActiveRecord::Base.transaction do
      begin
        @mail = LocalEmail.new(mail_params)
        if @mail.save
          redirect_to @mail
        else
          render :new
        end
      rescue Exception => e
        Rails.logger.info(e)
      end
    end
  end

  def edit

  end

  def update
    ActiveRecord::Base.transaction do
      begin
        if @mail.update_attributes(mail_params)
          redirect_to @mail
        else
          render :edit
        end
      rescue Exception => e
        Rails.logger.info(e)
      end
    end
  end

  def destroy
    ActiveRecord::Base.transaction do
      begin
        if @mail.destroy
          redirect_to root_path
        else
          redirect_to @mail
        end
      rescue Exception => e
        Rails.logger.info(e)
      end
    end
  end

  def send_mail
    ActiveRecord::Base.transaction do
      begin
        LearnMailJob.perform_now(@mail)
        redirect_to @mail
      rescue Exception => e
        Rails.logger.info(e)
      end
    end
  end

  private

  def mail_params
    params.require(:local_email).permit(:subject, :body, :receiver, :sender)
  end

  def find_mail
    @mail = LocalEmail.find_by(id: params[:id])
  end
end
