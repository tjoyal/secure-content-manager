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

    # todo : Map all cases on method

    options = {
      type: method,
      url: action,
      data: data,
      success: (response) ->
        $(target).html(response)
    }

    $.ajax(options)