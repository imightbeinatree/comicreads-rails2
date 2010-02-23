class WelcomeController < ApplicationController
  def index
    redirect_to reads_path
  end
end
