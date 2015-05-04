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
end
