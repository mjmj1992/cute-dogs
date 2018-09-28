$ ->
  if $('#photos').length > 0

    bindVoteBtn = ->
        $('#photos .photo').on 'click', (e) ->
            e.preventDefault()
            target = $(e.currentTarget)
            id = target.attr('data-id')
            $.post '/vote', {photo_id: id}, (response) ->
                response_html = $(response.html)
                $('#photos').html(response_html.html())
                bindVoteBtn()

    bindVoteBtn()
    