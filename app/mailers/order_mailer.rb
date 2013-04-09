class OrderMailer < ActionMailer::Base
  default from: "orders@catsrcool.com"
  def order_confirmation(user_id)
    user = User.find(user_id)
    @url = "http://catsrcool.com/order"
    mail(to: user.email, subject: 'CATS ARE EN ROUTE')
  end
end
