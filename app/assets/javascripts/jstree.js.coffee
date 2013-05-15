
$(document).ready ->


  $('.treeGroup').each ->

    treeGroup = $(this)
    tree = $(this).find('.tree')

    tree.jstree
      plugins:
        [ "themes", "html_data", "ui", "core", "types", "search", "adv_search" ]
      search:
        case_insensitive: true
        show_only_matches: true
      themes:
        theme: 'classic'

      types:
        types:
          root:
            icon:
              image: "/assets/jstree/static/root.png"
          file:
            icon:
              image: "/assets/jstree/static/file.png"
          folder:
            icon:
              image: "/assets/jstree/static/folder.png"


    tree.on 'click', "li[rel=folder] a", ->
      tree.jstree('toggle_node', $(this).parent())

    tree.on 'click', "li[rel=file] a", ->
      path = $(this).attr('href')
      alert path


    treeGroup.on 'keypress keydown keyup blur', 'input.search', ->
      search = $(this)

      value = search.val()

      # Skip if no change
      if search.data('last') == value
        return

      search.data('last', value)

      if value == ''
        tree.jstree('clear_search')
      else if value.length >= 2
        tree.jstree('search', value, true)
      else
        # Ignore if less than 2 characters