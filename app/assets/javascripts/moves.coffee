# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#jstree').jstree(
    'core':
      'multiple': false
      'check_callback' : true      
      'data':
        'url': 'moves.json'
        'dataType': 'json'
      'themes':
        'theme': 'classic'
        'stripes': false
        'icons': true
        'dots': true
    'contextmenu':
      'select_node': false
      'items': (node) ->
        tree = $('#jstree').jstree(true)
        {
          'Create':
            'label': 'New Child'
            'action': (obj) ->
              console.log(obj)
              parent_id = obj.reference[0].id.replace('_anchor','')
              url = obj.reference[0].baseURI + '/new?parent_id=' + parent_id
              console.log(url)
              window.location.assign url
              return
          'Delete':
            'label': 'Delete'
            'action': (obj) ->
              tree.delete_node node
              return        
        }
    'types':
      'default': 'icon': 'folder'
      'file':
        'valid_children': []
        'icon': 'file'
    'plugins': [
      'themes'
      'json_data'
      'contextmenu'
      'ui'
      'wholerow'
      'state'
    ])
    .on 'changed.jstree', (e, data) ->
      # console.log('changed event')
      # console.log(data)
      # console.log(e)
      if data and data.selected and data.selected.length and data.event
        href_address = undefined
        href_address = data.instance.get_node(data.selected[0]).a_attr.href
        window.location.assign href_address
    .on 'create_node.jstree', (e, data) ->
      console.log('create event')
    .on 'delete_node.jstree', (e, data) ->
      if confirm('Are you sure?')
        # console.log('delete event')
        # console.log(data)
        href_address = undefined
        href_address = data.node.a_attr.href
        $.ajax
          url: href_address
          type: 'DELETE'
          success: (result) ->
            console.log('delete success')
        return
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

datediff = (date1, date2, interval) ->
  second = 1000
  minute = second * 60
  hour = minute * 60
  day = hour * 24
  week = day * 7
  date1 = new Date(date1)
  date2 = new Date(date2)
  timediff = date2 - date1
  if isNaN(timediff)
    return NaN
  switch interval
    when 'years'
      return date2.getFullYear() - date1.getFullYear()
    when 'months'
      return date2.getFullYear() * 12 + date2.getMonth() - (date1.getFullYear() * 12 + date1.getMonth())
    when 'weeks'
      return Math.floor(timediff / week)
    when 'days'
      return Math.floor(timediff / day)
    when 'hours'
      return Math.floor(timediff / hour)
    when 'minutes'
      return Math.floor(timediff / minute)
    when 'seconds'
      return Math.floor(timediff / second)
    else
      return undefined
  return
  
@refresh_lengths = ->
  sy = $('#move_start_date_1i').val()
  sm = $('#move_start_date_2i').val()-1 
  sd = $('#move_start_date_3i').val()
  ey = $('#move_end_date_1i').val()
  em = $('#move_end_date_2i').val()-1
  ed = $('#move_end_date_3i').val()
  startdate = new Date(sy,sm,sd)
  enddate = new Date(ey,em,ed)
  difday = datediff(startdate,enddate,'days')
  difweek = datediff(startdate,enddate,'weeks')
  $('#period_length_days').text(difday) 
  $('#period_length_weeks').text(difweek)
  return