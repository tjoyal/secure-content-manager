# http://railscasts.com/episodes/197-nested-model-form-part-2
# Thank you Ryan

window.remove_fields = (link) ->
  $(link).prev('input[type=hidden]').val('1')
  $(link).closest('.fields').hide()


window.add_fields = (link, association, content, container = '') ->
  new_id = new Date().getTime()
  regexp = new RegExp('new_' + association, 'g')

  fields = content.replace(regexp, new_id)

  if (container == '')
    $(link).parent().append(fields)
  else
    $(container).append(fields)
