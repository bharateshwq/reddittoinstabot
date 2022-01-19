import sys
from instabot import Bot
bot = Bot()
bot.login(username = "test.er951",
          password = "thisismyinstabotpassword" )
bot.upload_photo("imagetest.jpg",caption =sys.argv[1])
