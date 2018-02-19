module Admin
  class UploadsController < ApplicationController
    before_action :authorize!

    def new; end

    private

    def authorize!
      raise(ActionController::RoutingError, 'Not Found') unless admin?
    end
  end
end
