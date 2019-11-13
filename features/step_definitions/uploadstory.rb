require 'watir'

# having issues getting watir working on c9...mostly related to needing a chrome binary
args = %w[headless disable-gpu disable-dev-shm-usage disable-software-rasterizer no-sandbox]
browser = Watir::Browser.new :chrome, args: args

Given (/^I am on the upload story page$/) do
    
    # this is temporary since we haven't deployed this to heroku...replace this with
    # an actual page address eventually
    browser.goto "https://e724577f316a4043aaa23e80f54588fa.vfs.cloud9.us-east-2.amazonaws.com/"
end

When (/^I select a file$/) do
    
    # this is also a test that we need to discuss...need a location to host the
    # test file here...
    # browser.file("SomeFile.txt") 
end

When (/^I have a filename$/) do
    browser.text_field(name: "title").set("MyFirstStory")
end

When (/^I have a first name$/) do
    
end
    
When (/^I have a last name$/) do
    
end
    
When (/^I click submit$/) do
    
end
    
Then (/^I upload a file$/) do
    
end