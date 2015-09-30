class PersonalEventValidator < ActiveModel::Validator
  def validate(record)
    if record.starting.nil? || record.person.born > record.starting || (record.person.died.present? && record.person.died < record.starting)
      record.errors[:base]
    end
  end
end