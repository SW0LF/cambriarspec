# Name:    Cambria Main
# Version: .01
# Date:    6/21/13
# Author:  Scott Wolf
#
# Purpose:  The purpose of this script is to visit the main CambriaUSA site and navigate the links at the top
# 			level.
# 			There will be other scripts that will check deeper pages in the site, confirm the tiles are correct etc.
#
# Call the program with the following command:  "BROWSER=chrome rspec cambriamain.rb --format h > CambriaMain.html"


require 'rspec'
require 'watir' 
require 'rubygems'


describe 'CambriaMain' do

# Added the ENV so we could pass in the browser as a parm
# at this time both firefox and chrome work.  Safari and IE support will be added

before :all do
	browser_type = ENV["BROWSER"] || "firefox"
    @browser = Watir::Browser.new(browser_type)
end

describe '(Check CambriaUSA main site)' do

	it 'should navigate to CambriaUSA.com' do
		@browser.goto('http://www.CambriaUSA.com')
		@browser.title.include?("Quartz Countertops | Stone Surfaces for the Kitchen, Bath & more | Cambria")
		puts "Browser URL = #{@browser.url}"
		puts "<br>"
		puts "Browser Title= #{@browser.title}"
	end

	it 'should confirm all Design upper nav links exist' do
    	@browser.a(:text => /Designs/).click
    	sleep 1
    	@browser.text.should include("Design Palette")
    	@browser.text.should include("Edge Profiles")
    	@browser.text.should include("Photos & Video")
    	@browser.text.should include("Dream Board")
    	@browser.text.should include("Paint Match Tool")
    	@browser.text.should include("Studios & Galleries")
	end

	it 'should confirm all Advantages upper nav links exist' do
    	@browser.a(:text => /Advantages/).click
    	sleep 1
       	@browser.text.should include("Cambria Difference")
    	@browser.text.should include("Performance Benefits")
    	@browser.text.should include("Common Questions")
    	@browser.text.should include("We are Green")
    	@browser.text.should include("Certifications")
    end

	it 'should confirm all main body links are clickable' do
		
	end

	it 'should confirm all footer links are clickable' do
 		
	end

	it 'should validate social assets are clickable' do
		
	end
end


#  Close the browser instance
after :all do
		
	@browser.close

end

end # end of CambriaMain
