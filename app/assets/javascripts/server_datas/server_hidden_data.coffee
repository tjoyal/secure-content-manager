$(document).ready ->

  getServerHiddenData = (element) ->

    if !element.data('resource-data')
      resourceUrl = element.data('resource-url')

      if resourceUrl == undefined
        throw "Unable to get server data without a resource url"

      data = $.ajax({
        url: resourceUrl,
        async: false
      }).responseText

      element.data('resource-data', data)

    element.data('resource-data')


  $(document).on 'click', '.server-hidden-data button.toggle', (e) ->

    e.preventDefault()
    e.stopPropagation()

    section = $(this).closest('.server-hidden-data')

    data = section.find('.data')

    if data.length == 0
      data = $('<pre />').addClass('data')

      section.append(data)

      data.html( getServerHiddenData(section) )
    else
      data.toggle()


  $(document).bind 'DOMNodeInserted', (e) ->

    $(this).find('.server-hidden-data button.copy').not('.copy-binded').each (index) ->

      $(this).addClass('copy-binded')

      section = $(this).closest('.server-hidden-data')

      # https://github.com/zeroclipboard/ZeroClipboard
      ZeroClipboard.setDefaults(
        {
          moviePath: '/assets/zero_clipboard/ZeroClipboard.swf',
          hoverClass: "active"
        }
      );

      clip = new ZeroClipboard()

      clip.glue( $(this) )

      clip.on 'dataRequested', ( client, args ) ->
        data = getServerHiddenData(section)

        clip.setText(data)
