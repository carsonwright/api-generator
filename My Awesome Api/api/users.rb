class Api < Grape::API
  format :json

  namespace :users do
    desc "Create users"
    params do
      requires :user, type: Hash do
        requires :first_name, type: String, desc: "returns first_name."
        requires :last_name, type: String, desc: "returns last_name."
        requires :email, type: String, desc: "returns email."
        requires :password, type: String, desc: "returns password."
        requires :password_confirmation, type: String, desc: "returns password_confirmation."
      end
    end
    post "/" do
      user = User.create(declared_params[:user])
      user.attributes
    end
    
    desc "Update user by :id"
    params do
      requires :user, type: Hash do
        requires :first_name, type: String, desc: "returns first_name."
        requires :last_name, type: String, desc: "returns last_name."
        requires :email, type: String, desc: "returns email."
        requires :password, type: String, desc: "returns password."
        requires :password_confirmation, type: String, desc: "returns password_confirmation."
      end
    end
    put "/:id" do
      user = User.find(params[:id]).update_attributes(declared_params[:user])
      user.attributes
    end
    
    desc "Delete user by :id"
    delete "/:id" do
      user = User.find(params[:id]).destroy
    end
    
    desc "Get all users or search"
    params do
      optional :user, type: Hash do
        optional :first_name, type: String, desc: "returns first_name."
        optional :last_name, type: String, desc: "returns last_name."
        optional :email, type: String, desc: "returns email."
        optional :password, type: String, desc: "returns password."
        optional :password_confirmation, type: String, desc: "returns password_confirmation."
      end
    end
    get "/" do
      if declared_params[:user] 
        users = User.where(declared_params)
      else 
        users = User.all
      end 
      
      users.collect do |user|
        user.attributes
      end
    end
    
    desc "Get user by :id"
    get "/:id" do
      user = User.find(params[:id])
      user.attributes
    end
  end
end
