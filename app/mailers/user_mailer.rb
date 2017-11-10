class UserMailer < ApplicationMailer
  def welcome_email(order)
    @email = order.email
    mail(to: 'junglerails@gmail.com', subject: 'Welcome to My Awesome Site')
  end
end
