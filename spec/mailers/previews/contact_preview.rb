# Preview all emails at http://localhost:3000/rails/mailers/contact
class ContactPreview < ActionMailer::Preview
  def execute
    data = {
      name: "Madhav Paudel",
      email: "madhav@namespace.jp",
      _email: "poudelmadhav143@gmail.com"
    }
    ContactMailer.execute(data)
  end
end
