class Api < Grape::API
  format :json

  namespace :goals do
    desc "Create goals"
    params do
      requires :goal, type: Hash do
        requires :definition, type: String, desc: "returns definition."
        requires :honest, type: String, desc: "returns honest."
        requires :plate, type: String, desc: "returns plate."
        requires :space_id, type: Integer, desc: "returns space_id."
      end
    end
    post "/" do
      goal = Goal.create(declared_params[:goal])
      goal.attributes
    end
    
    desc "Update goal by :id"
    params do
      requires :goal, type: Hash do
        requires :definition, type: String, desc: "returns definition."
        requires :honest, type: String, desc: "returns honest."
        requires :plate, type: String, desc: "returns plate."
        requires :space_id, type: Integer, desc: "returns space_id."
      end
    end
    put "/:id" do
      goal = Goal.find(params[:id]).update_attributes(declared_params[:goal])
      goal.attributes
    end
    
    desc "Delete goal by :id"
    delete "/:id" do
      goal = Goal.find(params[:id]).destroy
    end
    
    desc "Get all goals or search"
    params do
      optional :goal, type: Hash do
        optional :definition, type: String, desc: "returns definition."
        optional :honest, type: String, desc: "returns honest."
        optional :plate, type: String, desc: "returns plate."
        optional :space_id, type: Integer, desc: "returns space_id."
      end
    end
    get "/" do
      if declared_params[:goal] 
        goals = Goal.where(declared_params)
      else 
        goals = Goal.all
      end 
      
      goals.collect do |goal|
        goal.attributes
      end
    end
    
    desc "Get goal by :id"
    get "/:id" do
      goal = Goal.find(params[:id])
      goal.attributes
    end
  end
end
