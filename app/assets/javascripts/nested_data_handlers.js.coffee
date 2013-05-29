# http://railscasts.com/episodes/197-nested-model-form-part-2
# Thank you Ryan

window.remove_fields = (link) ->
  $(link).prev('input[type=hidden]').val('1')
  $(link).closest('.fields').hide()


window.add_fields = (link, association, content, parent) ->
  new_id = new Date().getTime()
  regexp = new RegExp('new_' + association, 'g')

  fields = content.replace(regexp, new_id)

  if (parent == '')
    $(link).parent().before(fields)
  else
    $(link).closest(parent).before(fields)
