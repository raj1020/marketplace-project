class OrdersController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:webhook]
    
    def success
        
        order = Order.new(
            user_id: params[:user_id],
            cook_id: params[:cook_id],
            #stripe_id: payment_id
        )


    end

    def webhook
        payment_id = params[:data][:object][:payment_intent]
        payment = Stripe::PaymentIntent.retrieve(payment_id)
        cook_id = payment.metadata.cook_id
        user_id = payment.metadata.user_id
        
        # order = Order.new(
        #     user_id: user_id,
        #     cook_id: cook_id,
        #     stripe_id: payment_id
        # )

        unless order.save
            puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
            puts params
            puts "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
        else
            puts "Order #{order.id} successfully created"
        end
    end
end