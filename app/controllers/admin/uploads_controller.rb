module Admin
  class UploadsController < ApplicationController
    def new
      redirect_to('/') unless current_user.admin
    end

    def create
      uploaded_io = params[:inventory_file]
      inventory_file = File.open(uploaded_io)
      File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
        file.write(uploaded_io.read)
      end
      binding.pry
    end
  end
end
