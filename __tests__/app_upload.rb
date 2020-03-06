require "open-uri"
require_relative "../lib/nx-http"

# p Nx::ContentType::JSON
tempfile = open("https://tva1.sinaimg.cn/large/da432263gy1gcj74ifcokj205f06gjre.jpg")
res = Nx::Http.upload("https://picupload.weibo.com/interface/pic_upload.php", { pic1: tempfile }) do |http, request|
  request["Cookie"] = "SUB=_2A25zZYAzDeRhGeVI7VMZ8yzEyz-IHXVQEvb7rDV8PUNbmtAKLVPMkW9NTBpP0VsITWW-3vSzKJ0qcv_7qLmry_H2; Path=/; Domain=.weibo.com; HttpOnly"
end

p res.body
