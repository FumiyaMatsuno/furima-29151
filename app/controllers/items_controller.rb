class ItemsController < ApplicationController
  before_action :move_to_new, except: [:index]

  def index
  end


  private

  def move_to_new
    redirect_to new_user_session_path unless user_signed_in?
  end
end
