class Contents::Item::Cell < Cell::Concept
  def show
    render
  end

  private

    def update_date
      I18n.l(model.updated_at, format: :short)
    end
end
