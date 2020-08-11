class ContactMailer < ApplicationMailer
  def execute(data)
    @name = data[:name]
    @email = data[:email]
    @subject = data[:subject]
    @website = data[:website]
    @message = data[:message]
    mail(
      from: "Madhav Paudel <noreply@paudelm.com.np>",
      to: data[:_email],
      subject: data[:_subject],
      bcc: data[:_email] == "mail@paudelm.com.np" ? "" : "mail@paudelm.com.np"
    )
  end
end
