class ReceiptMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.receipt_mailer.email_receipt.subject
  #
  def email_receipt(order)
    @order = order
    puts "Are we here?"
    mail to: @order.email, subject: "Order Number: #{@order.id}"
  end
end
