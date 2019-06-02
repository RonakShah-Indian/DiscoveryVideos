descriptionList=[]
titleList=[]
descriptionListVerify=[]
titleListVerify=[]
Given (/^a user goes to discovery homepage$/) do
  # open the discovery page
    @discovery_home_page = @browser.open_page('https://www.discovery.com')
  sleep(10)
end
When (/^a user adds videos to favourite$/) do
  # scroll to the recommended videos
  recommendedVideos = @browser.driver.find_element(xpath: 	"//div[contains(text(),'Recommended')]")
  @browser.driver.execute_script("arguments[0].scrollIntoView(true);", recommendedVideos)
  sleep(3)
  hoverOnVideo = @browser.driver.find_elements(class: "showTileSquare__contentBox")

  for i in 0..1
    # hover on the 2 videos
    @browser.driver.action.move_to(hoverOnVideo[i]).perform
    # get the descripton and title
    description=@browser.driver.find_elements(xpath:"//div[@class='showTileSquare__description']/div[1]")
    descriptionList << description[i].text
    title=@browser.driver.find_elements(xpath:"//div[@class='showTileSquare__content']/h3/div[1]")
    titleList << title[i].text
    # click on the add to favourite
    addToFav = @browser.driver.find_elements(class:"my-favorites-button-container")
    addToFav[i].click
    sleep(5)
  end
end

  Then (/^the videos should be visible in my videos section$/) do
    # go to my videos
    @browser.driver.get("https://www.discovery.com/my-videos")
    sleep(20)
    # scroll to favourite shows
    favouriteShows = @browser.driver.find_element(xpath: 	"//div[@class='localStorageCarousel__wrapper']")
    sleep(5)
    @browser.driver.execute_script("arguments[0].scrollIntoView(true);", favouriteShows)
    sleep(10)
    hoverOnShows = @browser.driver.find_elements(class: "showTileSquare__contentBox")
    for i in 0..1
      # hover on the favourite shows added
      sleep(2)
      @browser.driver.action.move_to(hoverOnShows[1-i]).perform
      sleep(2)
      # get the descripton and title
      descriptionVerify=@browser.driver.find_elements(xpath: "//div[@class='showTileSquare__description']/div[1]")
      descriptionListVerify << descriptionVerify[1-i].text
      titleVerify=@browser.driver.find_elements(xpath: "//div[@class='showTileSquare__content']/h3/div[1]")
      titleListVerify << titleVerify[1-i].text
      # verify the titles and description
      puts titleListVerify[i].include?(titleList[i]),"Page contains the text Title which was added to favourite"
      puts descriptionListVerify[i].include?(descriptionList[i]),"Page contains the text Description which was added to favourite"
      sleep(5)
    end
  end

