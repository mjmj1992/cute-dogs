$ ->
  if $('#doggos').length > 0 

    bindInfiniteScroll = (date) ->
        $(window).unbind('scroll')
        $('#doggos').infiniteScroll(itemSelector: 'tbody > tr', dataPath: '/doggos/load_more_doggos', currentDate: date)
		
    bindInfiniteScroll('today')

    $('#btns-cnt .btn').on 'click', (e) ->
        e.preventDefault()
        target = $(e.currentTarget)
        return if target.hasClass('active')
        $('#btns-cnt .btn.active').removeClass('active')
        target.addClass('active')
        date = target.attr('data-date')
        $.get '/doggos/index', {date: date}, (response) ->
            response_html = response.html
            $('#doggos tbody').html('')
            $('#doggos tbody').html(response_html)
            bindInfiniteScroll(date)