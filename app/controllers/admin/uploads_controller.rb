module Admin
  class UploadsController < ApplicationController
    before_action :authorize!

    def new; end

    def create
      consign_mdb = Mdb.open(params[:upload].tempfile)
    end

    private

    def authorize!
      raise(ActionController::RoutingError, 'Not Found') unless admin?
    end
  end
end
