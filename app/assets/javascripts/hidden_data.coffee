$(document).ready ->

  getHiddenData = (element) ->

    if !element.data('resource-data')
      resourceUrl = element.data('resource-url')

      if resourceUrl == undefined
        throw "Unable to get data without a resource url"

      data = $.ajax({
        url: resourceUrl,
        async: false
      }).responseText

      element.data('resource-data', data)

    element.data('resource-data')


  $(document).on 'click', '.hidden-data button.toggle', (e) ->

    e.preventDefault()
    e.stopPropagation()

    section = $(this).closest('.hidden-data')

    data = section.find('.data')

    if data.length == 0
      data = $('<pre />').addClass('data')

      section.append(data)

      data.html( getHiddenData(section) )
    else
      data.toggle()


  # https://github.com/zeroclipboard/ZeroClipboard
  ZeroClipboard.setDefaults {
    moviePath: '/assets/zero_clipboard/ZeroClipboard.swf',
    hoverClass: "active"
  }

  clip = new ZeroClipboard()

  clip.on 'dataRequested', ( client, args ) ->
    section = $(this).closest('.hidden-data')

    data = getHiddenData(section)

    clip.setText(data)

  $(document).bind 'DOMNodeInserted', (e) ->

    $(this).find('.hidden-data button.copy').not('.copy-binded').each (index) ->

      $(this).addClass('copy-binded')

      clip.glue( $(this).get(0) )
