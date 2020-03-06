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

# res = RestClient.post(POST_URL, { pic1: HTTP::FormData::File.new(tempfile) }, headers)
# p JSON.parse res.body.split("\n")[2]

# url = URI(POST_URL)
# f = FormData.new
# f.append("pic1", tempfile)
# # filedata = [
# #   ["pic1", tempfile],
# # ]

# http = Net::HTTP.new(url.host, url.port)
# http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE
# response = http.post_form(url, f, headers)
# puts response.body

# multipart/form-data
url = URI(POST_URL)
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
# 设置请求参数
data = [
  ["pic1", tempfile1],
  ["pic2", tempfile2],
]
request = Net::HTTP::Post.new(url.path)
request.set_form(data, "multipart/form-data")
# p request.methods
request["Cookie"] = "SUB=_2A25zZYAzDeRhGeVI7VMZ8yzEyz-IHXVQEvb7rDV8PUNbmtAKLVPMkW9NTBpP0VsITWW-3vSzKJ0qcv_7qLmry_H2; Path=/; Domain=.weibo.com; HttpOnly"

response = http.request(request)
puts response.body
