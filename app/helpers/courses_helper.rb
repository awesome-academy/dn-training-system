module CoursesHelper
  def map_status
    Course.statuses.keys.map{|w| [w.humanize, w]}
  end

  def option_key_value subjects
    subjects.map do |subject|
      [subject.name_subject, subject.id]
    end
  end
end
