from selenium import webdriver
from selenium.webdriver.common.keys import Keys

# Path to your WebDriver executable
driver_path = 'path/to/chromedriver'
driver = webdriver.Chrome(executable_path=driver_path)

# Open the login page
driver.get("https://example.com/login")

# Fill in login details and submit
username = driver.find_element_by_name("username")
password = driver.find_element_by_name("password")
username.send_keys("your_username")
password.send_keys("your_password")
password.send_keys(Keys.RETURN)

# Optionally, wait for a while to ensure the login is complete
import time
time.sleep(10)

# Save cookies or perform other actions
cookies = driver.get_cookies()
# Save cookies to a file if needed

driver.quit()
