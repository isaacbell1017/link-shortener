$ ->
  $('.click_counter').on('click', (e) ->
    e.preventDefault()
    console.log(this)
    id = $(this).data(id)
    console.log(id)
    $.post('/clicked-count', id, data: { authenticity_token: window._token })
    window.open(this.href, '_blank')
  )
