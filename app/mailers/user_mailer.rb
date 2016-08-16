class UserMailer < ApplicationMailer
  default from: "savanin.tanja@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'savanin.tanja@gmail.com',
        :subject => "A new contact form message from #{name}")
  end
end