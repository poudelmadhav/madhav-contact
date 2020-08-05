# Preview all emails at http://localhost:3000/rails/mailers/contact
class ContactPreview < ActionMailer::Preview
  def execute
    data = {
      _email: "poudelmadhav143@gmail.com",
      _subject: "poudelmadhav143@gmail.com",
      name: "Madhav Paudel",
      email: "madhav@namespace.jp",
      subject: "How are you doing?",
      message: "Hellow there, Are you fine?"
    }
    ContactMailer.execute(data)
  end
end
