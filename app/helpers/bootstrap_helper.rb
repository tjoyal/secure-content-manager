module BootstrapHelper

  def bootstrap_header(header = nil)

    unless header
      case action_name.to_sym
        when :index
          header = resource_class.model_name.human.pluralize
        when :show
          header = t '.title', :default => resource_class.model_name.human
        when :edit
          header = t '.title', :default => [:'helpers.titles.edit', 'Edit %{model}'], :model => resource_class.model_name.human
        when :new
          header = t '.title', :default => [:'helpers.titles.new', 'New %{model}'], :model => resource_class.model_name.human
        else
          raise "Undefined action named '#{action_name}'"
      end
    end

    content_tag :div, :class => 'page-header' do
      content_tag :h1 do
        header
      end
    end

  end


end