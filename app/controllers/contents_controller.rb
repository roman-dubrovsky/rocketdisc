class ContentsController < ApplicationController
  before_action :set_params
  before_action :find_content, only: [:show, :proppatch, :destroy]

  def index
    @contents = Content.where(user: @user)
    @contents = {files: @contents.files,
      folders: @contents.folders}
  end

  def show
    if @content.present?
      send_file @content.file.path, :url_based_filename => true
    else
      render nothing: true, status: 404
    end
  end

  def create
    @content = Contents::File.create(file_params)
    redirect_to :back
  end

  def proppatch
    @content.update(file_params)
    redirect_to :back
  end

  def destroy
    @content.destroy
    redirect_to :back
  end

  def mkcol
    @content = Contents::Folder.create(folder_params)
    redirect_to :back
  end

  private

    def set_params
      @user = User.find_by(name: params[:user])
      @user ||= current_user

      @folder = @user.folders.where(name: params[:folder]) if params[:folder].present?
    end

    def file_params
      content = params.require(:contents_file).permit(:file, :name)
      content.merge!({ name: content[:file].original_filename }) if content[:file].present?
      content.merge!({ user: current_user })
      content
    end

    def folder_params
      content = params.require(:contents_folder).permit(:name)
      content.merge!(user: current_user)
    end

    def find_content
      params[:id] = "#{params[:id]}.#{params[:format]}" if params[:format].present?
      @content = Content.where(user: @user, name: params[:id]).first
    end
end
