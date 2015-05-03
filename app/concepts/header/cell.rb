class Header::Cell < Application::Cell
  def show
    render
  end

  private
    def user_info
      if user_signed_in?
        render('profile')
      else
        render('sign_links')
      end
    end
end
