# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#jstree').jstree(
    'core':
      'multiple': false
      'data':
        'url': 'moves.json'
        'dataType': 'json'
      'themes':
        'theme': 'classic'
        'stripes': false
        'icons': true
        'dots': true
    'types':
      'default': 'icon': 'folder'
      'file':
        'valid_children': []
        'icon': 'file'
    'plugins': [
      'themes'
      'json_data'
      'ui'
      'wholerow'
      'state'
    ]).on 'changed.jstree', (e, data) ->
    href_address = undefined
    href_address = data.instance.get_node(data.selected[0]).a_attr.href
    window.location.assign href_address
  return

$(document).ready ready
$(document).on 'page:load', ready

$ ->
  $(document).on 'click', '#remove_link', (e) ->
    e.preventDefault()
    link = $(this)
    remove_fields link
  return
$ ->  
  $(document).on 'click', 'a.link_to_add_fields', (e) ->
    e.preventDefault()
    link = $(this)
    association = $(this).data('association')
    content = $(this).data('content')
    add_fields link, association, content
  return