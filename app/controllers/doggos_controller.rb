class DoggosController < ApplicationController
    before_action :authenticate_admin!
    
    def index
      if date = params[:date]
        doggos = case date
        when 'week'
          CuteDoggo.where("dateupload >= ? AND dateupload <= ?", DateTime.now.beginning_of_week, DateTime.now.end_of_week)
        when 'month'
          CuteDoggo.where("dateupload >= ? AND dateupload <= ?", DateTime.now.beginning_of_month, DateTime.now.end_of_month)
        when 'overall'
          CuteDoggo
        else
          CuteDoggo.where("dateupload >= ? AND dateupload <= ?", DateTime.now.beginning_of_day, DateTime.now.end_of_day)
        end
        doggos = doggos.limit(10).order('cuteness_score DESC')
        @view = DoggosPresenter.new(doggos)
        render :json => {html: render_to_string(partial: 'table_rows')}
      else
        doggos = CuteDoggo.limit(10).order('cuteness_score DESC')
        @view = DoggosPresenter.new(doggos)
      end
    end
  
  end
  