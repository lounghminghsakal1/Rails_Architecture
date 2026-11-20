module Students
  class CreateService
    def initialize(params)
      @params = params
    end

    def call
      # first create user
      ActiveRecord::Base.transaction do
        user = User.create!(name: @params[:name], password_hash: "sakal@123", role: 1, college_id: @params[:college_id], hostel_id: @params[:hostel_id])
        StudentProfile.create!(roll_number: @params[:roll_number], department: @params[:department], hostel_id: @params[:hostel_id], college_id: @params[:college_id], cgpa: @params[:cgpa], user_id: user.id)
      end
    end
  end
end
