module Api
  module V1
    class ApiController < ::ApplicationController
      skip_before_action :verify_authenticity_token, unless: :user_signed_in?

      private

      def current_resource_owner
        if doorkeeper_token
                            User.find(doorkeeper_token.resource_owner_id)
                          else
                            warden.authenticate(scope: :user)
                          end
      end
      helper_method :current_resource_owner
    end
  end
end
