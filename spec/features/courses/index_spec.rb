require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/courses'" do
    it "I see a list of courses and the number of students enrolled in each course. (e.g. 'Defense Against the Dark Arts: 5',  'Herbology: 10')" do
      student_1 = Student.create!(name: "Harry",
                                   age: 15,
                                 house: "Gryffindor")

      student_2 = Student.create!(name: "Hermione",
                                   age: 15,
                                 house: "Gryffindor")
      student_3 = Student.create!(name: "Draco",
                                   age: 14,
                                 house: "Slytherin")
      course_1 = student_1.courses.create!(name: "Defense against the Dark Arts")
      course_1 = student_2.courses.create!(name: "Defense against the Dark Arts")
      course_2 = student_2.courses.create!(name: "Herbology")
      course_3 = student_3.courses.create!(name: "Potions")

      visit '/courses'

      expect(page).to have_content("Defense against the Dark Arts: 2")
      expect(page).to have_content("Herbology: 1")
      expect(page).to have_content("Potions: 1")
    end
  end
end
