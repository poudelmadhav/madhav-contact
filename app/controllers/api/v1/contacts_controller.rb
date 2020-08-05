class Api::V1::ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    if contact_params[:_email].present?
      ContactMailer.execute(contact_params).deliver
      json_response(status: :success)
    else
      json_response({status: :error}, :unprocessable_entity)
    end
  end

  private
    def contact_params
      params.require(:contact).permit(:_email, :_subject, :name, :email, :website, :subject, :message)
    end
end
