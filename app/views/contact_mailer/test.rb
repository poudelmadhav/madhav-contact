require 'json'
require 'aws-sdk'

def lambda_handler(event:, context:)
  customer_details = {
    email: event["customer_detail"]["email"]
  }

  mail_to_client(
    recipient: customer_details[:email]
  )

  {
    statusCode: 200,
    body: JSON.generate({customer_details: customer_details}),
    headers: { "Content-Type": "application/json", "Access-Control-Allow-Origin": "*"}
  }
end

def mail_to_client(recipient:)
  sender = "aadesh@namespace.jp"
  awsregion = "ap-southeast-1"
  subject = "Wizdom Booking Details"

  # The HTML body of the email.
  htmlbody =
    '<h4>Your Booking Details are:</h4>'\
    '<table>'\
    '  <tbody width="100%">'\
    '    <tr>'\
    '      <td><strong>Email</strong></td>'\
    "      <td>#{recipient}</td>"\
    '    </tr>'\
    '  </tbody>'\
    '</table>'

  # The email body for recipients with non-HTML email clients.
  textbody = "This email was sent with Amazon SES using the AWS SDK for Ruby."

  # Specify the text encoding scheme.
  encoding = "UTF-8"

  # Create a new SES resource and specify a region
  ses = Aws::SES::Client.new(region: awsregion)

  # Create a new SES resource and specify a region
  ses = Aws::SES::Client.new(region: awsregion)

  # Try to send the email.
  begin
    # Provide the contents of the email.
    resp = ses.send_email({
      destination: {
        to_addresses: [
          recipient,
        ],
      },
      message: {
        body: {
          html: {
            charset: encoding,
            data: htmlbody,
          },
          text: {
            charset: encoding,
            data: textbody,
          },
        },
        subject: {
          charset: encoding,
          data: subject,
        },
      },
      source: sender,
    })
    puts "Email sent!"

    # If something goes wrong, display an error message.
  rescue Aws::SES::Errors::ServiceError => error
    puts "Email not sent. Error message: #{error}"
  end
end

