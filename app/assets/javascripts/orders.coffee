# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  forms.setupQuantityForms()

forms =
  setupQuantityForms: ->
    $('input#line_item_quantity').change ->
      $.ajax
            url     : $(this.form).attr('action')
            type    : $(this.form).attr('method')
            dataType: 'json'
            data    : $(this.form).serialize()
            error   : ( xhr, err ) ->
                alert('Error', err)
