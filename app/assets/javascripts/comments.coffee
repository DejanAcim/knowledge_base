$(document).on "turbolinks:load", ->
  $('#comments-link').click (e)->
    e.preventDefault()
    $('#comments-section').fadeToggle()
    $('#comment_body').focus()
