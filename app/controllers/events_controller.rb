class EventsController < ResourceController
  def create
    params[resource_parameter][:user_id] = current_user.id
    if super
      EventMailer.event_submitted(@resource).deliver 
    end
  end

  def resource_class
    Event
  end
  
  def new_resource
    @resource = super
    @resource.food_sponsor = Rails.configuration.default_food_sponsor
    @resource
  end  
end