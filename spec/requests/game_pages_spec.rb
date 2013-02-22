require 'spec_helper'

describe "GamePages" do
	subject {page}

  describe "Go to Challenges Page" do

  	describe "not signed in" do
  		before {visit root_url}
  		it {should have_selector('h1', text: 'Sign in Page')}

  		describe "signing in should redirect back home" do
  			before {mock_auth_hash}
  			before {click_link "Login with Facebook"}
  			it {should have_selector('h1',text: 'Welcome')}
  		end
  	end

  	describe "as signed in" do
  		before {mock_auth_hash}
  		before {visit '/auth/facebook'}
  		it {should have_selector('h1',text: 'Welcome')}
  	end
  end
end
