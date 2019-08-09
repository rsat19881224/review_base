$(document).on 'turbolinks:load', ->
  $('#formTagInput').tagsInput
    'autocomplete_url': '/tags/autocomplete.json'
    'autocomplete':
      focus: (event, ui) ->
        $('#formTagInput_tag').val ui.item.name
        false
      select: (event, ui) ->
        $('#formTagInput').addTag ui.item.name
        false
    'onAddTag': ->
      $('#formTagInput_tag').removeClass 'not_valid'
      $('#formTagInput_tag').focus()
      false
    'height:': 'calc(2.25rem + 2px)'
    'width': '100%'
    'defaultText': ''
    
  if $('#formTagInput_tag').length
    $('#formTagInput_tag').data('ui-autocomplete')._renderItem = (ul, item) ->
      $('<li class="w-100">').data('item.autocomplete', item).append('<a class="w-100 d-flex">' + item.name + '</a>').appendTo ul

  return