module RightExtraIconHelper

  def right_extra_icons(icons = {}, &block)

    content_tag :div, :class => 'right-extra-icons' do
      builder = RightExtraIconApi.new(self)

      capture(builder, &block)
    end

  end

  class RightExtraIconApi

    def initialize(context)
      @context = context
    end

    def api_url(url)

      options = {}
      options[:class] = 'extra-icon icon-share'
      options['data-toggle'] = 'popover'
      options['data-content'] = 'Click to copy to clipboard'
      options['data-original-title'] = 'Api Url'
      options['data-copy'] = url

      @context.content_tag(:i, '', options)
    end

  end

end