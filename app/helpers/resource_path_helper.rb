module ResourcePathHelper

  def edit_resource_button(resource = nil, *args)

    options = args.extract_options!

    klasses = ['btn']

    if options[:size] == :small
      klasses << 'btn-mini'
    end

    path = edit_resource_path(resource)

    link_to t('.edit', :default => t('helpers.links.edit')),
            path, :class => klasses
  end

  def delete_resource_button(resource = nil, *args)

    options = args.extract_options!

    klasses = ['btn', 'btn-danger']

    if options[:size] == :small
      klasses << 'btn-mini'
    end

    path = resource_path(resource)

    link_to t('.destroy', :default => t('helpers.links.destroy')), path, :method => :delete,
              :data => { :confirm => t('.confirm', :default => t('helpers.links.confirm', :default => 'Are you sure?')) },
              :class => klasses
  end

  def new_resource_button(resource = nil, *args)

    options = args.extract_options!

    klasses = ['btn', 'btn-primary']

    if options[:size] == :small
      klasses << 'btn-mini'
    end

    path = new_resource_path(resource)

    link_to t('.new', :default => t('helpers.links.new')), path, :class => 'btn btn-primary'
  end

  def back_resource_button(*args)

    options = args.extract_options!

    klasses = ['btn']

    if options[:size] == :small
      klasses << 'btn-mini'
    end

    path = collection_path

    link_to t('.back', :default => t("helpers.links.back")),
              path, :class => klasses
  end

  def cancel_resource_path(*args)

    options = args.extract_options!

    klasses = ['btn']

    if options[:size] == :small
      klasses << 'btn-mini'
    end

    path = collection_path

    link_to t('.cancel', :default => t("helpers.links.cancel")),
            path, :class => klasses
  end



end