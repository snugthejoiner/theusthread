require 'rails_helper'

RSpec.describe Person, type: :model do
  test_person = Person.create(born: '1900/1/1', died: '1999/12/31')
  alive_test_person = Person.create(born: '1900/1/1')
  
  it "formats the date of birth as Monthname day, four-digit year" do
    expect(test_person.born_date).to eq("January 1, 1900")
  end

  it "it formats the date of birth as DayOfWeek Monthname day, four-digit year" do
    expect(test_person.born_long_date).to eq("Monday, January 1, 1900")
  end

  it "if available it formats the date of death as died DayOfWeek Monthname day, four-digit year" do
    expect(test_person.died_long_date).to eq("died Friday, December 31, 1999")
    expect(alive_test_person.died_long_date).to eq("")
  end

end