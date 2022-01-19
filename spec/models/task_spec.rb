require 'rails_helper'

RSpec.describe Task, type: :model do

  let!(:task) {Task.new}
  
  context 'Validations' do
    it '1. Is not valid without name' do
        task.name = nil

    expect(task).to_not be_valid
    expect(task.errors).to be_present
    end

    it '2. Task name should not have special characters' do

        task.name = "!@#$%^&*"

    expect(task).to_not be_valid
    expect(task.errors).to be_present
    end

    it '3. Task details should be present' do

      task.details = nil

    expect(task).to_not be_valid
    expect(task.errors).to be_present
    end

    it '4. Task date should be present' do

      task.date = nil

    expect(task).to_not be_valid
    expect(task.errors).to be_present
    end

    it '5. Task hourly rate should be present' do

      task.hourly_rate = nil

    expect(task).to_not be_valid
    expect(task.errors).to be_present
    end
  
  end

end
