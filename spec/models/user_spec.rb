require 'rails_helper'

RSpec.describe User, type: :model do

    let!(:user) {User.new}

    context 'Validations' do
        it '1. Is not valid without first name' do
            user.first_name = nil

        expect(user).to_not be_valid
        expect(user.errors).to be_present
        end

        it '2. Is not valid without last name' do
            user.last_name = nil

        expect(user).to_not be_valid
        expect(user.errors).to be_present
        end

        it '1. User status is Pending by default' do
            user.user_status = "Approved"

        expect(user).to_not be_valid
        expect(user.errors).to be_present
        end
    end

end