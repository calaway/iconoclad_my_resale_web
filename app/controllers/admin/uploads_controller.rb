module Admin
  class UploadsController < ApplicationController
    before_action :authorize!

    def new; end

    def create
      consign_mdb = Mdb.open(params[:upload].tempfile)
      errors = Upload.import(consign_mdb)
      if errors.empty?
        flash[:notice] = "Success! You're the best!"
      else
        flash[:alert] = 'ERROR: Records not successfully imported'
      end
      redirect_to action: 'new'
    end

    private

    def authorize!
      raise(ActionController::RoutingError, 'Not Found') unless admin?
    end
  end
end
