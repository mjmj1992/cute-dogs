namespace :doggos do
    desc "Get 100 newest doggos from Flickr"
    task get: :environment do
      FlickrService.get_new_doggos
    end
  
  end
  