FactoryGirl.define do
	factory :user do
		provider "facebook"
		uid "12345"
		name "John Doe"
		token "AAABBBCCC"
	end
end