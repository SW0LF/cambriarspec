# Name:    CambriaMain
# Version: .10
# Date:    7/01/13
# Author:  Scott
#
# Purpose:  The purpose of this script is to visit the main Cambri aUSA site and to verify the header/footer links
# 			and also some of the content on the page.
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
    	@browser.text.include?("Design Palette")
    	@browser.text.include?("Edge Profiles")
    	@browser.text.include?("Photos & Video")
    	@browser.text.include?("Dream Board")
    	@browser.text.include?("Paint Match Tool")
    	@browser.text.include?("Studios & Galleries")
	end

	it 'should confirm all Advantages upper nav links exist' do
		@browser.a(:text => /Advantages/).click
    	sleep 1
       	@browser.text.include?("Cambria Difference")
    	@browser.text.include?("Performance Benefits")
    	@browser.text.include?("Common Questions")
    	@browser.text.include?("We are Green")
    	@browser.text.include?("Certifications")
    end


	it 'should confirm all Purchasing upper nav links exist' do
    	@browser.a(:text => /Purchasing/).click
    	sleep 1
       	@browser.text.include?("Dealer Locator")
    	@browser.text.include?("Finance")
    	@browser.text.include?("Getting an Estimate")
    	@browser.text.include?("Buy Samples & Accessories")
    	@browser.text.include?("Designer Resource Kit")
    end

	it 'should confirm all Customer Care upper nav links exist' do
    	@browser.a(:text => /Customer Care/).click
    	sleep 1
       	@browser.text.include?("Warranty & Registration")
    	@browser.text.include?("Care & Maintenance")
    	@browser.text.include?("Installation FAQ")
    	@browser.text.include?("Request Information")
    	@browser.text.include?("Customer Support")
    end

	it 'should confirm all Professionals Care upper nav links exist' do
    	@browser.a(:text => /Professionals/).click
    	sleep 1
       	@browser.text.include?("Our Dedication to You")
    	@browser.text.include?("Featured Designers")
    	@browser.text.include?("Designer Resource Kit")
    	@browser.text.include?("Commercial")
    	@browser.text.include?("Partner Locator")
    	@browser.text.include?("Commercial Representative")
    	@browser.text.include?("Partner Portal")
    end


	it 'should confirm all main body links are clickable' do
		@browser.a(:text => /Find Your Design/).click
		@browser.back
		@browser.a(:text => /View Our Gallery/).click
		@browser.back
	end


	it 'should confirm Design without Limits content exists' do
		@browser.text.include?("Unequaled in beauty and durability, Cambria is fast becoming the preferred natural stone of many")
		@browser.a(:text => /Discover the Cambria Difference/).click
		@browser.back
	end

	it 'should confirm Secrets in Stone content exists' do
		@browser.text.include?("Discover our two newest designs. The sandy riverbed swirls of")
		@browser.a(:text => /See new designs.../).click
		@browser.back
	end

	it 'should confirm Natural Attaction content exists' do
		@browser.text.include?("Discover our two newest designs. The sandy riverbed swirls of")
		@browser.a(:text => /Read more.../).click
		@browser.back
	end



	it 'should confirm all Cambria Style footer links exist' do
		@browser.text.include?("Cambria Style")
		@browser.text.include?("Lifestyle")
		@browser.text.include?("Style + Design")
		@browser.text.include?("Eat + Drink")
		@browser.text.include?("Featured Profiles")
		@browser.text.include?("Travel + Leisure")
		@browser.text.include?("Subscribe")
	end

	it 'should confirm all About Cambria footer links exist' do
		@browser.text.include?("Legacy")
		@browser.text.include?("Philanthropy")
		@browser.text.include?("Partnership")
		@browser.text.include?("Media Information")
		@browser.text.include?("News & Events")
		@browser.text.include?("Careers")		
	end


	it 'should validate social assets links are visible and clickable' do
		@browser.img(:alt => "Facebook").click
		@browser.title.include?("Cambria | Facebook")
		@browser.back
		@browser.img(:alt => "Twitter").click
		@browser.title.include?("Cambria (CambriaQuartz) on Twitter")
		@browser.back
		@browser.img(:alt => "Flickr").click
		@browser.title.include?("Cambria Quartz's Photos")
		@browser.back
		@browser.img(:alt => "YouTube").click
		@browser.title.include?("Cambria - YouTube")
		@browser.back
		@browser.img(:alt => "Pinterest").click
		@browser.title.include?("Cambria (cambriaquartz) on Pinterest")
		@browser.back
		@browser.img(:alt => "Houzz").click
		@browser.title.include?("Cambria Tile, Stone & Countertops US")
		@browser.back
	end
end





#  Close the browser instance
after :all do
		
	@browser.close

end

end # end of CambriaMain
