#!/usr/bin/env ruby
require "open-uri"
require "uri"
require "base64"
require "json"
require "nx"

# new
require "rest-client"
require "http"

POST_URL = "https://picupload.weibo.com/interface/pic_upload.php"

# file_path = "./52doc_logo.png"
# res = File.read file_path
# p res.class

tempfile = open("https://tva1.sinaimg.cn/large/da432263gy1gcj74ifcokj205f06gjre.jpg")
formfile = HTTP::FormData::File.new(tempfile)
# f.append("pic1", tempfile)

headers = {
  'Content-Type': "multipart/form-data",
  "Cookie": "SUB=_2A25zZYAzDeRhGeVI7VMZ8yzEyz-IHXVQEvb7rDV8PUNbmtAKLVPMkW9NTBpP0VsITWW-3vSzKJ0qcv_7qLmry_H2; Path=/; Domain=.weibo.com; HttpOnly",
}

res = RestClient.post(POST_URL, { pic1: formfile }, headers)

data_mock = {
  "code" => "A00006",
  "data" => {
    "count" => 1,
    "data" => "eyJ1aWQiOjM2NjE4MzI4MDMsImFwcCI6Im1pbmlibG9nIiwiY291bnQiOjEsInRpbWUiOjE1ODM0MDc5MzUuNDI5LCJwaWNzIjp7InBpY18xIjp7IndpZHRoIjoxOTUsInNpemUiOjQxMjUsInJldCI6MSwiaGVpZ2h0IjoyMzIsIm5hbWUiOiJwaWNfMSIsInBpZCI6ImRhNDMyMjYzZ3kxZ2NqYTQyd3E1amoyMDVmMDZnMHNrIn19fQ==",
    "pics" => {
      "pic_1" => {
        "width" => 195,
        "size" => 4125,
        "ret" => 1,
        "height" => 232,
        "name" => "pic_1",
        "pid" => "da432263gy1gcja42wq5jj205f06g0sk",
      },
    },
  },
}

data = JSON.parse res.body.split("\n")[2]
name = data.get("data.pics.pic_1.pid")
p "https://tva1.sinaimg.cn/large/#{name}.jpg"

# http.use_ssl = true
# # 设置请求头
# header = {
#   'Content-Type': "multipart/form-data",
#   "Cookie": "SUB=_2A25zW6CKDeRhGeVI7VMZ8yzEyz-IHXVQEJVCrDV8PUNbmtAKLXD7kW9NTBpP0XLSa8hbBJPRXfLo8iEoY3rbDnm1; Path=/; Domain=.weibo.com; HttpOnly",
# }
# response = http.post(url, { pic1: f }, header)

# puts response.body
