class ContentsController < ApplicationController
  before_action :set_user

  def index
    @contents = Content.where(user: @user)
  end

  def show
    @content = Content.where(user: @user, name: params[:id]).first
    if @content.present?
      send_file @content.file.path, :url_based_filename => true
    else
      render nothing: true, status: 404
    end
  end

  def create
    binding.pry
  end

  private

    def set_user
      @user = User.find_by(name: params[:user])
      @user ||= current_user
    end
end
