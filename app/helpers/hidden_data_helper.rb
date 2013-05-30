module HiddenDataHelper

  def hidden_data *args

    options = args.extract_options!

    options[:visual] = true if options[:visual].nil?
    options[:copy] = true if options[:copy].nil?
    options[:copy_delay] ||= 10

    unless options[:resource_url] || options[:data]
      raise 'Unable to create hidden data section without data or a valid resource url'
    end

    content_tag :div, :class => 'hidden-data', 'data-resource-url' => options[:resource_url] do

      html = []

      if options[:visual]
        html << content_tag(:button, :type => :button, :class => %w(btn btn-success btn-mini toggle)) do
          'Toggle'
        end
      end

      if options[:copy]
        html << content_tag(:button, :title => :button, :class => %w(btn btn-success btn-mini copy)) do
          'Copy'
        end
      end

      if options[:data]
        html << content_tag(:pre, :class => :data, :style => 'display: none') do
          options[:data]
        end
      end

      html.join('&nbsp;').html_safe
    end

  end

end