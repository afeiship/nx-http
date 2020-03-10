require "open-uri"
require_relative "../lib/nx-http"

# p Nx::ContentType::JSON
tempfile = open("https://tva1.sinaimg.cn/large/da432263gy1gcj74ifcokj205f06gjre.jpg")
res = Nx::Http.upload("https://picupload.weibo.com/interface/pic_upload.php", { pic1: tempfile }) do |http, request|
  request["Cookie"] = "SUB=_2A25zY-4vDeRhGeVI7VMZ8yzEyz-IHXVQGVjnrDV8PUNbmtAKLULmkW9NTBpP0XdxB7PNf9PhTe_HyO_VWEneHsw6; Path=/; Domain=.weibo.com; HttpOnly"
end

# hash = {
#   "code" => "A00006",
#   "data" => {
#     "count" => 1, "data" => "eyJ1aWQiOjM2NjE4MzI4MDMsImFwcCI6Im1pbmlibG9nIiwiY291bnQiOjEsInRpbWUiOjE1ODM4NDk0MzUuNDE2LCJwaWNzIjp7InBpY18xIjp7IndpZHRoIjoxOTUsInNpemUiOjQxMjUsInJldCI6MSwiaGVpZ2h0IjoyMzIsIm5hbWUiOiJwaWNfMSIsInBpZCI6ImRhNDMyMjYzZ3kxZ2NwNnNkNmV6cmoyMDVmMDZnMHNrIn19fQ==",
#     "pics" => {
#       "pic_1" => {
#         "width" => 195, "size" => 4125, "ret" => 1, "height" => 232, "name" => "pic_1",
#         "pid" => "da432263gy1gcp6sd6ezrj205f06g0sk",
#       },
#     },
#   },
# }
p JSON.parse res.body.split("\n")[2]
