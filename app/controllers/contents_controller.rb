class ContentsController < ApplicationController
  before_action :set_user
  before_action :find_content, only: [:show, :proppatch, :destroy]

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
    @content = Contents::File.create(content_params)
    redirect_to :back
  end

  def proppatch
    @content.update(content_params)
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
      content = params.require(:contents_file).permit(:file, :name)
      content.merge!({ name: content[:file].original_filename }) if content[:file].present?
      content.merge!({ user: current_user })
      content
    end

    def find_content
      params[:id] = "#{params[:id]}.#{params[:format]}" if params[:format].present?
      @content = Content.where(user: @user, name: params[:id]).first
    end
end
