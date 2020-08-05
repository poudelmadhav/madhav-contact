class ContactMailer < ApplicationMailer
  def execute(data)
    @name = data[:name]
    @email = data[:email]
    @subject = data[:subject]
    @website = data[:website]
    @message = data[:message]
    if data[:_subject].present?
      mail(from: "Madhav Paudel <noreply@paudelm.com.np>", to: data[:_email], subject: data[:_subject])
    else
      mail(from: "Madhav Paudel <noreply@paudelm.com.np>", to: data[:_email], subject: "You have a new message in your website")
    end
  end
end
