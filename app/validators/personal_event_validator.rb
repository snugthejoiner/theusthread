class PersonalEventValidator < ActiveModel::Validator
  def validate(record)
    if record.starting.nil? || record.person.born > record.starting || record.person.died < record.starting
      record.errors[:base] << "This date is before this person was born."
    end
  end
end