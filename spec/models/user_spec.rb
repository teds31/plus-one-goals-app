require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_valid(:first_name).when('Carmen', 'John') }
  it { should_not have_valid(:first_name).when(nil, '')}

  it { should have_valid(:first_name).when('Martinez', 'Mendes') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:email).when('user@example.com', 'example@gmail.com')}
  it { should_not have_valid(:email).when(nil, 'urser', 'urser@com', 'user.com', 'urser@email')}

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
    
  end
end
