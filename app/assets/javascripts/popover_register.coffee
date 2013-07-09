#$(document).ready ->
$(document).bind 'DOMNodeInserted', (e) ->

  $(this).find('[data-toggle=popover]').each ->

    $(this).popover(
      trigger: 'manual'
      placement: 'left'
    )

    $(this).not('.copy-binded').each (index) ->

      $(this).addClass('copy-binded')

      this.zeroDataRequested = ->
        clip.setText( $(this).data('copy') )

      this.zeroMouseover = ->
        $(this).popover('show')

      this.zeroMouseout = ->
        $(this).popover('hide')

      clip.glue( this )
