class Contents::File::Cell < Contents::Item::Cell
  private

    def actions_array
      %i(download edit remove)
    end

    def item_id
      "file-#{model.id}"
    end
end
