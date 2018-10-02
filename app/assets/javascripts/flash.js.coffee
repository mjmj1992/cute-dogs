$ ->
  $('#flash-cnt .close').on 'click', (e) ->
    $('#flash-cnt').hide()
    e.preventDefault()
