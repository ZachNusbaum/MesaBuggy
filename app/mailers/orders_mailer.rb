class OrdersMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.orders_mailer.success.subject
  #
  def success(order)
    @order = order
    mail to: order.email,
      subject: 'Thanks for your order!',
      from: 'Pet Shop <orders@zachapps.com>'

  end
end
