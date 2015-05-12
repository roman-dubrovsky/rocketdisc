class Contents::Folder::Cell < Contents::Item::Cell
  private

    def actions_array
      %i(remove)
    end

    def item_id
      "folder-#{model.id}"
    end

    def name
      render('partials/name')
    end
end
