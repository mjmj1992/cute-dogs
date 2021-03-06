class FlickrService
    require 'flickraw'

    #move this to secrets?
    FlickRaw.api_key="308dc9662220d54e578dab350f272bde"
    FlickRaw.shared_secret="541eae58f10524e9"
    flickr.access_token = "72157701792316715-4ff1b95ce331aec3"
    flickr.access_secret = "ac365bc9c0d99a49"

    def self.get_new_doggos(opts = {})
        count = 100
        page = opts[:page] || 1
        valid_count = opts[:valid_count] || 0
        params = {
            text: 'dog',
            per_page: count,
            page: page,
            extras: 'url_o,url_m,url_s,date_upload',
            safe_search: 1,
            tags: 'dog,animal,cute'
        }
        photos = flickr.photos.search(params)
        photos.take(count).each do |photo|
            break if valid_count == count
            cute_doggo = CuteDoggo.new
            cute_doggo.flickr_id = photo.id
            cute_doggo.flickr_owner = photo.owner
            cute_doggo.title = photo.title
            cute_doggo.dateupload = to_dateupload(photo.dateupload)
            cute_doggo.url_o = photo['url_o']
            cute_doggo.url_m = photo['url_m']
            cute_doggo.url_s = photo['url_s']
            if cute_doggo.valid?
                cute_doggo.save
                valid_count += 1 
            end
        end
        unless valid_count == count
            page += 1
            get_new_doggos({page: page, valid_count: valid_count})
        end
        return true
    end 

    private 

    def self.to_dateupload(dateupload)
        Time.at(dateupload.to_i)
    end

end
  