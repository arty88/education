module EducationProgramStudentable
  extend ActiveSupport::Concern

  included do
    has_many :education_program_students, as: :student, dependent: :destroy
    has_many :education_programs, through: :education_program_students
  end
end