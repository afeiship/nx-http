require "open-uri"
require_relative "../lib/nx-http"

# p Nx::ContentType::JSON
tempfile = open("https://tva1.sinaimg.cn/large/da432263gy1gcj74ifcokj205f06gjre.jpg")
res = Nx::Http.upload("https://picupload.weibo.com/interface/pic_upload.php", { pic1: tempfile }) do |http, request|
  request["Cookie"] = "SUB=_2A25zYkVLDeRhGeVI7VMZ8yzEyz-IHXVQFjGDrDV8PUNbmtAKLXLQkW9NTBpP0Tnizi_36CKgyQIO4Vzqxh9l_8Q2; Path=/; Domain=.weibo.com; HttpOnly"
end

p res.body
