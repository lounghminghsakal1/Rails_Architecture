class Api::StudentsController < ApplicationController
  def create
    student = Students::CreateService.new(student_params).call
    render json: { message: "student created successfully", student: student }, status: :created

  rescue RuntimeError => e
    render json: { errors: e.message }
  end

  def index
    StudentProfile.all
  end


  private

  def student_params
    params.require(:student).permit(:name, :roll_number, :department, :hostel_id, :college_id, :cgpa)
  end
end

# {
#   "student": {
#     "name": "sakal",
#     "roll_number": "24pca147",
#     "department": "CS",
#     "hostel_id": 1,
#     "college_id": 1,
#     "cgpa": 9
#     # user has to be created as  a part of transaction and use that created user's id and get details from here to create user record also

#   }
# }
