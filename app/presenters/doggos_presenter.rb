class DoggosPresenter < BasePresenter
  
    def initialize(doggos)
        @doggos = doggos
    end

    def doggos
        @doggos.map {|doggo| {url_m: doggo.url_m, cuteness_score: doggo.cuteness_score, dateupload: human_dateupload(doggo.dateupload)} }
    end

    private

    def human_dateupload(dateupload)
        Time.at(dateupload).to_formatted_s(:short) 
    end
  
  end
  