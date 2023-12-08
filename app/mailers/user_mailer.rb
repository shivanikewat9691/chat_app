class UserMailer < ApplicationMailer
  def signup_confirmation(to_email, user)

    # byebug
    @data = user 
    @email = @data.email
    @pin = @data.pin
    mail(to: user.email,
    from: ("shivanisolanki9691@gmail.com"),
    subject: "signup", 
    body: "@user") do |format|
      format.html { render 'user_mailer/signup_confirmation'}
      # format.html { render 'send_mailer/send_page'}
    end
  end
end
