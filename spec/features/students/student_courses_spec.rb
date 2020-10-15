require 'rails_helper'

describe "As a visitor" do
  describe "When I visit '/students/:id'" do
    it "I see a list of the students' courses." do
      course_1 = Course.create!(name: "Defense against the Dark Arts")
      course_2 = Course.create!(name: "Herbology")
      course_3 = Course.create!(name: "Potions")

      visit "/students/#{:id}"

      expect(page).to have_content("#{course_1.name}")
      expect(page).to have_content("#{course_2.name}")
      expect(page).to have_content("#{course_3.name}")
    end
  end
end