class DoggosService

    def self.getDoggosByTerm(term)
      case term
      when 'week'
        CuteDoggo.where("dateupload >= ? AND dateupload <= ?", DateTime.now.beginning_of_week, DateTime.now.end_of_week)
      when 'month'
        CuteDoggo.where("dateupload >= ? AND dateupload <= ?", DateTime.now.beginning_of_month, DateTime.now.end_of_month)
      when 'overall'
        CuteDoggo.all
      else
        CuteDoggo.where("dateupload >= ? AND dateupload <= ?", DateTime.now.beginning_of_day, DateTime.now.end_of_day)
      end
    end

end
  