#controller cf app optimal solution
class PaymentsController < ApplicationController

def create
	token = params[:stripeToken]
	@product = Product.find(params[:product_id])
	@user = current_user
	# Create the charge on Stripe's servers - this will charge the user's card
	begin
		charge = Stripe::Charge.create(
			:amount => (@product.price*100).to_i, # amount in cents, again
			:currency => "usd",
			:source => token,
			:description => params[:stripeEmail]
		)

		if charge.paid
			Order.create!(:product_id => @product_id, :user_id => @user_id, :total => @product.price)
		end

		flash[:success] = "Payment processed successfully"
	rescue Stripe::CardError => e
		# The card has been declined
		body = e.json_body
		err  = body[:error]
		flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
	end
	redirect_to ('/static_pages/payment_successful')
end

end


#My controller
# class PaymentsController < ApplicationController

# # POST payments
#   def create
#     token = params[:stripeToken]
#     @product = Product.find(params[:product_id])
#     @user = current_user
    
#     begin
#       charge = Stripe::Charge.create(
#        #Amount in cents
#         :amount => (@product.price*100).to_i, 
#         :currency => "usd",
#         :source => token,
#         :description => params[:stripeEmail]
#         )

#       if charge.paid
#         Order.create!(:product_id => @product.id, :user_id => @user.id, :total => @product.price)
#         flash[:success] = "Payment processed successfully"
#       end
      
#       rescue Stripe::CardError => e
#       body = e.json_body
#       err = body[:error]
#       flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
#       end

#     redirect_to product_path(@product)
#   end
# end

