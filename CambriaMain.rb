# Name:    Cambria Main
# Version: .10
# Date:    7/01/13
# Author:  Scott Wolf
#
# Purpose:  The purpose of this script is to visit the main CambriaUSA site and to verify the header/footer links
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


	it 'should confirm all Purchasing upper nav links exist' do
    	@browser.a(:text => /Purchasing/).click
    	sleep 1
       	@browser.text.should include("Dealer Locator")
    	@browser.text.should include("Finance")
    	@browser.text.should include("Getting an Estimate")
    	@browser.text.should include("Buy Samples & Accessories")
    	@browser.text.should include("Designer Resource Kit")
    end

	it 'should confirm all Customer Care upper nav links exist' do
    	@browser.a(:text => /Customer Care/).click
    	sleep 1
       	@browser.text.should include("Warranty & Registration")
    	@browser.text.should include("Care & Maintenance")
    	@browser.text.should include("Installation FAQ")
    	@browser.text.should include("Request Information")
    	@browser.text.should include("Customer Support")
    end

	it 'should confirm all Professionals Care upper nav links exist' do
    	@browser.a(:text => /Professionals/).click
    	sleep 1
       	@browser.text.should include("Our Dedication to You")
    	@browser.text.should include("Featured Designers")
    	@browser.text.should include("Designer Resource Kit")
    	@browser.text.should include("Commercial")
    	@browser.text.should include("Partner Locator")
    	@browser.text.should include("Commercial Representative")
    	@browser.text.should include("Partner Portal")
    end


	it 'should confirm all main body links are clickable' do
		@browser.a(:text => /Find Your Design/).click
		puts "Browser URL = #{@browser.url}"
		puts "<br>"
		puts "Browser Title= #{@browser.title}"
		@browser.back
		@browser.a(:text => /View Our Gallery/).click
		puts "Browser URL = #{@browser.url}"
		puts "<br>"
		puts "Browser Title= #{@browser.title}"
		@browser.back
	end


	it 'should confirm Design without Limits content exists' do
		@browser.text.should include("Unequaled in beauty and durability, Cambria is fast becoming the preferred natural stone of many")
		@browser.a(:text => /Discover the Cambria Difference/).click
		puts "Browser URL = #{@browser.url}"
		puts "<br>"
		puts "Browser Title= #{@browser.title}"
		@browser.back
	end

	it 'should confirm Secrets in Stone content exists' do
		@browser.text.should include("Discover our two newest designs. The sandy riverbed swirls of")
		@browser.a(:text => /See new designs.../).click
		puts "Browser URL = #{@browser.url}"
		puts "<br>"
		puts "Browser Title= #{@browser.title}"
		@browser.back
	end

	it 'should confirm Natural Attaction content exists' do
		@browser.text.should include("Discover our two newest designs. The sandy riverbed swirls of")
		@browser.a(:text => /Read more.../).click
		puts "Browser URL = #{@browser.url}"
		puts "<br>"
		puts "Browser Title= #{@browser.title}"
		@browser.back
	end



	it 'should confirm all Cambria Style footer links exist' do
		@browser.text.should include("Cambria Style")
		@browser.text.should include("Lifestyle")
		@browser.text.should include("Style + Design")
		@browser.text.should include("Eat + Drink")
		@browser.text.should include("Featured Profiles")
		@browser.text.should include("Travel + Leisure")
		@browser.text.should include("Subscribe")
	end

	it 'should confirm all About Cambria footer links exist' do
		@browser.text.should include("Legacy")
		@browser.text.should include("Philanthropy")
		@browser.text.should include("Partnership")
		@browser.text.should include("Media Information")
		@browser.text.should include("News & Events")
		@browser.text.should include("Careers")		
	end


	it 'should validate social assets are visible' do
		@browser.img(:src, /facebook/).exists?
		@browser.img(:src, /twitter/).exists?
		@browser.img(:src, /flickr/).exists?
		@browser.img(:src, /youtube/).exists?
		@browser.img(:src, /pintrest/).exists?
		@browser.img(:src, /houzz/).exists?
	end
end





#  Close the browser instance
after :all do
		
	@browser.close

end

end # end of CambriaMain
