class WelcomeController < ApplicationController
  def index
     @reads = Read.all 
  end
end
