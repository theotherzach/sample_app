require 'spec_helper'

describe "UserPages" do
	subject { page }
	describe "signup page" do
		before { visit signup_path }

		it "should have the header Sign Up" do
			page.should have_selector('h1', text: 'Sign up')
		end
		
		it "should have the right title" do
			page.should have_selector('title', text: full_title('Sign up'))	
		end
			
	end
end
