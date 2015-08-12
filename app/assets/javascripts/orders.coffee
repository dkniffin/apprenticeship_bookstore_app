# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  quantityForms.setup()
  order.placeOrderForm()

quantityForms =
  setup: ->
    $('input#line_item_quantity').change ->
      $.ajax
            url     : $(this.form).attr('action')
            type    : $(this.form).attr('method')
            dataType: 'json'
            data    : $(this.form).serialize()
            error   : ( xhr, err ) ->
                alert('Error', err)
order =
  placeOrderForm: ->
    $('#payment_form').submit ->
      $('input[type=submit]').attr('disabled', true)
      if $('#card_number').length
        order.processCard()
        false
  processCard: ->
    card =
      number: $('#card_number').val()
      cvc: $('#card_code').val()
      expMonth: $('#card_month').val()
      expYear: $('#card_year').val()
    Stripe.createToken(card, order.handleStripeResponse)
  handleStripeResponse: (status, response) ->
    if status == 200
      $('#user_stripe_card_token').val(response.id)
      false
      $('#payment_form')[0].submit()
    else
      $('#stripe_error').text(response.error.message)
      $('input[type=submit]').attr('disabled', false)
