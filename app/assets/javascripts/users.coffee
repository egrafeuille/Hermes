# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $(document).on 'change', '#user_type', (e) ->
    e.preventDefault()
    value = $(this).val()
    # console.log('user type changed:'+value)
    $('div#player_fields').toggle()
    return
  return
