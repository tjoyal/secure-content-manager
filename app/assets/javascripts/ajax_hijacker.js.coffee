$(document).ready ->

  $('.ajax-hijacker').on 'click', 'a', (e) ->

    target = $(this).closest('.ajax-hijacker').data('target')

    href = $(this).attr('href')

    if href == '#'
      return

    e.preventDefault()
    e.stopPropagation()

    options = {
      url: href
      complete: (result) ->
        $(target).html(result.responseText)
        $(document).trigger('ajaxAction')
    }

    if type = $(this).data('method')
      options.type = type

    $.ajax options

  $('.ajax-hijacker').on 'submit', 'form', (e) ->
    e.preventDefault()
    e.stopPropagation()

    target = $(this).closest('.ajax-hijacker').data('target')

    action = $(this).attr('action')
    method = $(this).attr('method')

    data = $(this).serialize()

    options = {
      type: method
      url: action
      data: data
      complete: (result) ->
        $(target).html(result.responseText)
        $(document).trigger('ajaxAction')
    }

    $.ajax(options)
