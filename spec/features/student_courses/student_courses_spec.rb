require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/students/:id'" do
    it "I see a list of the students' courses." do
      student_1 = Student.create!(name: "Harry",
                                   age: 15,
                                 house: "Gryffindor")

      student_2 = Student.create!(name: "Hermione",
                                   age: 15,
                                 house: "Gryffindor")
      student_3 = Student.create!(name: "Draco",
                                   age: 14,
                                 house: "Slytherin")
      course_1 = Course.create!(name: "Defense against the Dark Arts")
      course_2 = Course.create!(name: "Herbology")
      course_3 = Course.create!(name: "Potions")
      course_4 = Course.create!(name: "Happiness")

      visit "/students/#{:id}"

      within "#course-#{course_1.id}" do
        expect(page).to have_content("#{course_1.name}")
      end
      within "#course-#{course_4.id}" do
        expect(page).to have_content("#{course_4.name}")
      end
      within "#course-#{course_2.id}" do
        expect(page).to have_content("#{course_2.name}")
      end
      within "#course-#{course_3.id}" do
        expect(page).to have_content("#{course_3.name}")
      end
    end
  end
end
