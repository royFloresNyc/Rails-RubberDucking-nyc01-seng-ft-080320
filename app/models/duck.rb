class Duck < ApplicationRecord
    belongs_to :student
    validates :name, :description, :student_id, presence: true

    def student_attributes=(student_attributes)
        self.student = Student.create(student_attributes)
    end 
end
