class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def main
    if user_signed_in?
      redirect_to contents_path
    end
  end
end
