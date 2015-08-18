class OrderMailer < ApplicationMailer

  def order_invoice(user, order)
    @order = order
    mail(:to => user.email, :subject => "Order Confirmation")
  end
end
