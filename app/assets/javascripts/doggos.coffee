$ ->
    # $('.container').infiniteScroll({
    #     path: '.pagination__next',
    #     append: '.post',
    #     history: false,
    # });

     $('.btns-cnt .btn').on 'click', (e) ->
        e.preventDefault()
        target = $(e.currentTarget)
        return if target.hasClass('active')
        $('.btns-cnt .btn.active').removeClass('active')
        target.addClass('active')
        date = target.attr('data-date')        
        $.get '/doggos/index', {date: date}, (response) ->
            response_html = $(response.html)
            $('#doggos tbody').html(response_html.html())