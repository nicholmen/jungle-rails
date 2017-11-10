class ReceiptMailer < ApplicationMailer
  def receipt_email(order)
    @order = order
    mail(to: order.email, subject: "Thank you for your Jungle purchase, order ID: #{order.id}")
  end
end
