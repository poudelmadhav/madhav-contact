class Api::V1::ContactsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    data = params.except(:controller, :action)
    json_response(contact_params)
  end

  private
    def contact_params
      params.require(:contact).permit(:recipient_email, :name, :email, :website, :subject, :message)
    end
end
