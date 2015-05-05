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
    @content = current_user.contents.create(content_params)
    if @content.present?
      respond_to do |format|
        format.html do
          redirect_to :back
        end
        format.js {}
      end
    end
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
end
