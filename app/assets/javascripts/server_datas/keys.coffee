$(document).ready ->

  $(document).on 'click', ".server-data-key .toggle-key button", (e) ->

    e.preventDefault()
    e.stopPropagation()

    section = $(this).closest('.toggle-key')

    resourceUrl = section.data('resource-url')

    info = section.find('.info')

    if info.length == 0
      info = $('<pre />').addClass('info')

      section.append(info)

      info.load(resourceUrl)
    else
      info.toggle()
