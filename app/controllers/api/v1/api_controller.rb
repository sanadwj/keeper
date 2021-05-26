class Api::V1::ApiController < ApplicationController
  private

  def current_resource_owner
    if doorkeeper_token
      User.find(doorkeeper_token.resource_owner_id)
    else
      warden.authenticate(scope: :user)
    end
  end
  # helper_method :current_resource_owner
end
