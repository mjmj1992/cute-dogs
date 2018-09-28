class HomeController < ApplicationController
  include AccountsHelper
  before_action :authenticate_user!
  
  def index
    photos = CuteDoggo.limit(2).order('RANDOM()')
    @view = HomePresenter.new(photos, current_member)
  end

  def vote
    photo = CuteDoggo.find_by(flickr_id: params[:photo_id])
    photo.increment!(:cuteness_score, 1)
    photos = CuteDoggo.limit(2).order('RANDOM()')
    @view = HomePresenter.new(photos, current_member)
    render :json => {html: render_to_string(partial: 'photos')}
  end

end
