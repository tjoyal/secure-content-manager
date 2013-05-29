module NestedViewHelper

  def link_to_remove_fields(name, f)

    html = []

    html << f.hidden_field(:_destroy)

    html << content_tag(:button, :type => :button, :class => ['btn', 'btn-danger', 'btn-mini'], :onclick => "remove_fields(this)") do
      "Remove"
    end.html_safe

    html.join.html_safe
  end

  def link_to_add_fields(name, f, association, *args)

    options = args.extract_options!

    partial      = options.delete(:partial)      || association.to_s.singularize + "_fields"
    container    = options.delete(:container)    || ''
    html_options = options.delete(:html_options) || {}

    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(partial, :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\", \"#{container}\")", html_options)
  end

end
