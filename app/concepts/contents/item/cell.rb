class Contents::Item::Cell < Application::Cell
  def show
    render
  end

  private

    def update_date
      I18n.l(model.updated_at, format: :short)
    end

    def actions
      actions_array.map do |action|
        render "actions/#{action}"
      end.join
    end

    def icon
      render 'icon'
    end
end
