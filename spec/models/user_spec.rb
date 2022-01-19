require 'rails_helper'

RSpec.describe User, type: :model do

    let!(:user) {User.new}

    context 'Validations' do
        it '1. Is not valid without first name' do
            user.first_name = nil

        expect(user).to_not be_valid
        expect(user.errors).to be_present
        end

        it '2. First name should have minimum of 3 characters' do
            user.first_name = 'xy'

        expect(user).to_not be_valid
        expect(user.errors).to be_present
        end

        it '3. Is not valid without last name' do
            user.last_name = nil

        expect(user).to_not be_valid
        expect(user.errors).to be_present
        end

        it '4. Last name should have minimum of 3 characters' do
            user.last_name = 'ab'

        expect(user).to_not be_valid
        expect(user.errors).to be_present
        end

        it '5. User status is Pending by default' do
            user.user_status = "Approved"

        expect(user).to_not be_valid
        expect(user.errors).to be_present
        end

        it '6. User password should have minimum of 6 characters' do
            user.password = '12345'

        expect(user).to_not be_valid
        expect(user.errors).to be_present
        end

        it '7. User password and confirm password should match' do
            user.password = '12345'
            user.password_confirmation = '12345667'

        expect(user).to_not be_valid
        expect(user.errors).to be_present
        end
        
        it '8. First name should not have special characters' do
            user.first_name = "!@#$%^&*"

        expect(user).to_not be_valid
        expect(user.errors).to be_present
        end

        it '9. Last name should not have special characters' do
            user.last_name = "!@#$%^&*"

        expect(user).to_not be_valid
        expect(user.errors).to be_present
        end
       
        
    
    end

end