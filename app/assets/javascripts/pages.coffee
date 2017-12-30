# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->

	jQuery ->

    $('.open-modal').click (e) ->
      modalID = $(@).data('modal-id')
      $('#' + modalID).fadeIn()

    $('.modal-container').click (e) ->
      $(@).fadeOut()

    $('.modal-content').click (e) ->
      e.stopPropagation()

$(document).on('turbolinks:load', ready)
