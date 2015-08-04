FactoryGirl.define do
  factory :user do
    email { ['test@nowhere.com','abc@xyz.net','joe.schmoe@somewhere.edu'].sample }
    password { ['password','password123','qwerty123!','$Up3|^$3(uR3'].sample }
  end

end
