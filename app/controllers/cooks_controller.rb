class CooksController < ApplicationController
    before_action :authenticate_user!, except: [:home, :index]
    # before_action :set_cook, only: [:show, :edit, :update, :destroy]
    # before_action :authorize_user, [:edit, :update, :destroy]
    
    def index 
        @cooks = Cook.all

    end 

    def new 
        @cook = Cook.new  
        
    end 

    def create 
        
        @cook= current_user.cooks.create(cook_params)
        redirect_to cooks_path
        
        
    end 

    def show 
         
        @cooks = Cook.where(user_id: current_user.id)
        #@cooks = Cook.where(user_id: params[:user_id])
        #@cooks = current_user.cooks
        #@cook = Cook.find(id)
        

    end 

    def edit
        
        id = params[:id]
        @cook = Cook.find(id)
    end  

    def update 
        
        @cook = Cook.find(params[:id])
        @cook.update(street_address: params[:cook][:street_address], suburb: params[:cook][:suburb], postcode: params[:cook][:postcode], state: params[:cook][:state], category: params[:cook][:category], price: params[:cook][:price], cooking_time: params[:cook][:cooking_time], picture: params[:cook][:picture])
        redirect_to cook_path(@cook)
    end  

    
    def destroy
        
        id = params[:id]
        @cook = Cook.find(params[:id])
        redirect_to cook_path 

        

    end

    def order 

        id = params[:cook_ids]
        @cook= Cook.find(id)
       @quantity = params[:quantity]
        @quantity.delete('')
        @total = []
        line_items = []
        @cook.each_with_index do |cook, index|
            @total << ((cook.price).to_i*(@quantity[index].to_i))/100.0
            line_items << {
            name: cook.suburb,
            description: cook.category,
            amount: cook.price,
            currency: 'aud',
            quantity: @quantity[index]}
        end
        @grand_total =@total.sum  

        

session = Stripe::Checkout::Session.create(
  payment_method_types: ['card'],
  line_items: line_items,
  payment_intent_data: {
    metadata: {
        user_id: current_user.id,
        
    }
  },
  success_url: root_url + "orders/success?user_id=#{current_user.id}, cook_id=#{id}, ",
  cancel_url: root_url + "cook"

)
    @session_id = session.id     
    end  




    # def authorize_user
        
    
    #     if @cook.user_id != current_user.id
    #         redirect_to cooks_path
    #     end
    # end

    # def set_cook  
    #     id = params[:id]
    #     @cook = Cook.find(id)  

    # end   
    

    private 

    def cook_params
        params.require(:cook).permit(:street_address, :suburb, :postcode, :state, :user_id, :category, :price, :cooking_time, :picture)
    end


    
     
end