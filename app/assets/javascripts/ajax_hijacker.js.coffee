$(document).ready ->

  $('.ajax-hijacker').on 'click', 'a', (e) ->

    e.preventDefault()
    e.stopPropagation()

    target = $(this).closest('.ajax-hijacker').data('target')

    href = $(this).attr('href')

    options = {
      url: href,
      success: (result) ->
        $(target).html(result)
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
      type: method,
      url: action,
      data: data,
      success: (response) ->
        $(target).html(response)
        $(document).trigger('ajaxAction')
    }

    $.ajax(options)
