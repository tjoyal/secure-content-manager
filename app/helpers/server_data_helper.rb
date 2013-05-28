module ServerDataHelper

  def server_hidden_data resource_url, *args

    options = args.extract_options!

    options[:visual] ||= true
    options[:copy] ||= true
    options[:copy_delay] ||= 10

    if resource_url.empty?
      raise 'Unable to create server hidden data section without a valid resource url'
    end

    content_tag :div, :class => 'server-hidden-data', 'data-resource-url' => resource_url do

      html = []

      html << content_tag(:button, :type => :button, :class => %w(btn btn-success btn-mini toggle)) do
        'Toggle'
      end

      html << content_tag(:button, :title => :button, :class => %w(btn btn-success btn-mini copy)) do
        'Copy'
      end

      html.join('&nbsp;').html_safe
    end

  end

end