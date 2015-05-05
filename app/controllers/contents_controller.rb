class ContentsController < ApplicationController
  before_action :set_user
  before_action :find_content, only: [:show, :destroy]

  def index
    @contents = Content.where(user: @user)
  end

  def show
    if @content.present?
      send_file @content.file.path, :url_based_filename => true
    else
      render nothing: true, status: 404
    end
  end

  def create
    @content = current_user.contents.create(content_params)
    redirect_to :back
  end

  def destroy
    @content.destroy
    redirect_to :back
  end

  private

    def set_user
      @user = User.find_by(name: params[:user])
      @user ||= current_user
    end

    def content_params
      content = params.require(:content).permit(:file)
      content.merge({ name: content[:file].original_filename })
    end

    def find_content
      params[:id] = "#{params[:id]}.#{params[:format]}" if params[:format].present?
      @content = Content.where(user: @user, name: params[:id]).first
    end
end
