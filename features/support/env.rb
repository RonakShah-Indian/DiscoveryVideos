require 'selenium-webdriver'
require 'cucumber'
require 'require_all'

require_all 'lib'

Before do
    @browser = Browser.new(ENV['DRIVER'])
    @browser.delete_cookies
end

After do
    @browser.driver.quit
end
