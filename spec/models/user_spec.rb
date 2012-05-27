require 'spec_helper'

describe User do

	before do
	@user = User.new(name: "Example User", email: "user@email.com",
					password: "foobar", password_confirmation: "foobar") 
	end

	subject { @user }

	it { should respond_to(:name) }
	it { should respond_to(:email) }
	it { should respond_to(:password_digest) }
	it { should respond_to(:password) }
	it { should respond_to(:password_confirmation) }



	it { should be_valid }

	describe "when name is not present" do
		before { @user.name = "" }
		it { should_not be_valid }
	end

	describe "when email is not present" do
		before { @user.email = " " }
		it { should_not be_valid }
	end

	describe "when name is too long" do
		before { @user.name = "a" * 51 }
		it { should_not be_valid }
	end

	describe "when email formate is invalid" do
		it "should be invalid" do
			address = %w[user@foo,com user_@fo_o.org example.user@foo. THE_USE-R@foo.bar,jp]
			address.each do |invalid_address|
				@user.email = invalid_address
				@user.should_not be_valid
			end
		end
	end

	describe "when email format is valid" do
		it "should be valid" do
			address = %w[user@foo.COM A_Us-er@f.b.org first.1st@foo.jp a+b@baz.cn]
			address.each do |valid_address|
				@user.email = valid_address
				@user.should be_valid
			end
		end
	end

	describe "when email address is already taken" do
		before do
			user_with_same_email = @user.dup
			user_with_same_email.email = @user.email.upcase
			user_with_same_email.save
		end

		it { should_not be_valid }
	end

	describe "when password is not present" do
		before { @user.password = @user.password_confirmation = " " }
		it { should_not be_valid }
	end

	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "missmatch" }
		it { should_not be_valid }
	end
	
	describe "when password confirmation is nil" do
		before { @user.password_confirmation = nil }
		it { should_not be_valid }
	end

	describe "when password is too short" do
		before { @user.password = @user.password_confirmation = "aaaaa" }
		it { should_not be_valid }
	end
end




