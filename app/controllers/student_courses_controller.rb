class StudentCoursesController <ApplicationController
  def index
    @courses = Course.all
  end

end
