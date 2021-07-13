module CoursesHelper
  def map_status
    Course.statuses.keys.map{|w| [w.humanize, w]}
  end
end
