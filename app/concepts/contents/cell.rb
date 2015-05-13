class Contents::Cell < Application::Cell
  def show
    render
  end

  private

    def control
      render 'control'
    end

    def upload_file
      render 'partials/upload_file'
    end

    def create_folder
      render 'partials/create_folder'
    end

    def files
      model[:files]
    end

    def folders
      model[:folders]
    end

    def current_folder
      options[:folder]
    end

    def create_url
      if current_folder.present?
        folder_contents_url current_folder
      else
        contents_url
      end
    end

    def mkcol_url
      if current_folder.present?
        mkcol_folder_contents_url current_folder
      else
        mkcol_contents_url
      end
    end

    def back
      render 'back' if current_folder.present?
    end
end
