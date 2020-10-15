require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/students'" do
    it "I see a list of students with the following information: Name, Age, and House (e.g. 'Name: Casseopia Black, Age: 14, House: Slytherin')" do
      student_1 = Student.create!(name: "Harry",
                                   age: 15,
                                 house: "Gryffindor")

      student_2 = Student.create!(name: "Hermione",
                                   age: 15,
                                 house: "Gryffindor")
      student_3 = Student.create!(name: "Draco",
                                   age: 14,
                                 house: "Slytherin")

      visit '/students'

      expect(page).to have_content("#{student_1.name}")
      expect(page).to have_content("#{student_1.age}")
      expect(page).to have_content("#{student_1.house}")
      expect(page).to have_content("#{student_2.name}")
      expect(page).to have_content("#{student_2.age}")
      expect(page).to have_content("#{student_2.house}")
      expect(page).to have_content("#{student_3.name}")
      expect(page).to have_content("#{student_3.age}")
      expect(page).to have_content("#{student_3.house}")
    end

    it "I see the average age of all students. (e.g. 'Average Age: 14.5')" do
      student_1 = Student.create!(name: "Harry",
                                   age: 15,
                                 house: "Gryffindor")

      student_2 = Student.create!(name: "Hermione",
                                   age: 15,
                                 house: "Gryffindor")
      student_3 = Student.create!(name: "Draco",
                                   age: 14,
                                 house: "Slytherin")

      visit '/students'

      expect(page).to have_content("Average Age: #{Student.average_age}")

    end
  end
end
