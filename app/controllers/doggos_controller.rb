class DoggosController < ApplicationController
    before_action :authenticate_admin!
    
    def index
      if date = params[:date]
        doggos = DoggosService.getDoggosByTerm(date)
        doggos = doggos.order('cuteness_score DESC').limit(10)
        @view = DoggosPresenter.new(doggos)
        render :json => {html: render_to_string(partial: 'table_rows')}
      else
        doggos = DoggosService.getDoggosByTerm('today')
        doggos = doggos.order('cuteness_score DESC').limit(10)
        @view = DoggosPresenter.new(doggos)
      end
    end

    def load_more_doggos
      date = params[:date]
      page = params[:page].to_i
      offset = (page - 1) * 20 + 10
      return unless offset >= 0
      doggos = DoggosService.getDoggosByTerm(date)
      doggos = doggos.order('cuteness_score DESC').offset(offset).limit(20)
      @view = DoggosPresenter.new(doggos)
      render :json => {html: render_to_string(partial: 'table_rows')}
    end
  
  end
  