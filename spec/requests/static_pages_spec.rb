require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    before { visit root_path }

    it "should have the content 'Sample App'" do
  		page.should have_content('Sample App')
    end

    it "should have the header Ruby on Rails..." do
      page.should have_selector('title', text: full_title(''))
    end

    it "should not have a custom page title:" do
		  page.should_not have_selector('title', :text => '| Home')
    end
  end

  describe "Help page" do
    before { visit help_path }

  	it "should have the content 'Help'" do
  		page.should have_content('Help')
  	end

    it "should have the title 'Help'" do
  		page.should have_selector('title', text: full_title('Help'))
    end
  end

  describe "About page" do
    before { visit about_path }

    it "should have the content 'About Us'" do
  		page.should have_content('About Us')
	   end

	it "should have the title 'About Us'" do
      page.should have_selector('title', text: full_title('About Us'))
    end
  end

  describe "Contact page" do
    before { visit contact_path }

    it "should have the content 'Contact'" do
        page.should have_content('Contact')
    end

    it "should have the title 'Contact'" do
      page.should have_selector('title', text: full_title('Contact'))
    end
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    page.should have_selector 'title', text: full_title('About Us')
    click_link "Help"
    page.should have_selector 'title', text: full_title('Help')
    click_link "Contact"
    page.should have_selector 'title', text: full_title('Contact')
    click_link "Home"
    click_link "Sign up now"
    page.should have_selector 'title', text: full_title('Sign up')

    end  
end