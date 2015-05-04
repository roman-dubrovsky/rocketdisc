class ContentsController < ApplicationController
  before_action :set_user

  def index
    @contents = Content.where(user: @user)
  end

  def download
  end

  private

    def set_user
      @user = User.find_by(name: params[:user])
      @user ||= current_user
    end
end
