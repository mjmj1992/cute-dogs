class CuteDoggo < ActiveRecord::Base
    validates :flickr_id, presence: true, uniqueness: true
    validates :flickr_owner, presence: true
    validates :dateupload, presence: true
    validates :url_o, presence: true
    validates :url_m, presence: true
    validates :url_s, presence: true
    validates :cuteness_score, presence: true
    
end
  