class CooksController < ApplicationController
    # before_action :authenticate_user!, except: [:home, :index]
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