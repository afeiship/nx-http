#!/usr/bin/env ruby
require "open-uri"
require "uri"
require "base64"
require "json"
require "net/http"
require "formdata"

# new
require "rest-client"
require "http"

POST_URL = "https://picupload.weibo.com/interface/pic_upload.php"
tempfile1 = open("https://tva1.sinaimg.cn/large/da432263gy1gcj74ifcokj205f06gjre.jpg")
tempfile2 = open("https://tva1.sinaimg.cn/large/da432263gy1gck7gvo1uvj205f06g0sk.jpg")
# p tempfile.class

headers = {
  'Content-Type': "multipart/form-data",
  "Cookie": "SUB=_2A25zW6CKDeRhGeVI7VMZ8yzEyz-IHXVQEJVCrDV8PUNbmtAKLXD7kW9NTBpP0XLSa8hbBJPRXfLo8iEoY3rbDnm1; Path=/; Domain=.weibo.com; HttpOnly",
}

url = URI("http://httpbin.org/post")
http = Net::HTTP.new(url.host, url.port)

# 设置请求参数
data = [
  ["name", "test"],
  ["image", open("test.jpg"],
]
request = Net::HTTP::Post.new(url.path)
request.set_form(data, "multipart/form-data")
response = http.request(request)
puts response.body
