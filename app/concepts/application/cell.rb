class Application::Cell < Cell::Concept
  abstract!

  include ApplicationHelper
  include ActionView::Helpers::FormHelper
  include ActionView::Helpers::FormOptionsHelper
  include ActionView::RecordIdentifier
  include SimpleForm::ActionViewExtensions::FormHelper
  #include Ransack::Helpers::FormHelper
  include Devise::Controllers::Helpers

  # In fact cells hardly depends on haml which defines Object#is_haml?
  def is_haml?
    false
  end

  private

    def scoped_translation(key)
      scope = self.class.name.sub(/::Cell$/, '').underscore.gsub('/', '.') + ".#{@view_path}"
      I18n.t("#{scope}.#{key}")
    end
    alias :st :scoped_translation
end
