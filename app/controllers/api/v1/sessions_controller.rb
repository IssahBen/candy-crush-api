class Api::V1::SessionsController < ApplicationController
 def new 
     parameter= params[:user]

     password = parameter[:password]
     email = parameter[:email]
    
    user =User.where(email:email).first

    puts(password)
   
   
 
    if user 
    
        if user.valid_password?(password)
           
            return render json: user.as_json(only:[:id,:email,:authentication_token]),status: :created
        else
            
            message_obj = {message: "Wrong Password"}
          return  render json:  message_obj.as_json()
        end 
    else
        message_obj = {message:"Sign Up OR Check your email and password "}
        render json:  message_obj.as_json()
    end

 end

 def destroy 
   
    puts(current_user)
    current_user.authentication_token = Devise.friendly_token 
    current_user.save
   
    return render json: {message:"Success"}
 end
 
 def signup
 end 
end