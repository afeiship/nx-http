require "open-uri"
require "pathname"
require_relative "../lib/nx-http"

# p Nx::ContentType::JSON
cookie = "PANWEB=1; csrfToken=HGPEF5J4BMUKDsBEOzo8FNRr; recommendTime=mac2020-03-06%2016%3A33%3A00; BAIDUID=0FEE32A9EDE9E7AA4EFBDC31B4C77E13:FG=1; PSTM=1583562584; H_PS_PSSID=30963_1445_21112_30999_30824_30717; BIDUPSID=33A5F43CBC872598047FC87C5873703E; BDORZ=B490B5EBF6F3CD402E515D22BCDA1598; SIGNIN_UC=70a2711cf1d3d9b1a82d2f87d633bd8a03335825322; BDCLND=dfnU1OnEre564hYcmekBl73OTHnblXDwrOfClJGfkSI%3D; BDUSS=2l6cmprVUJ2N0xHdml-cDByRktMV2JuMGlnOFNRcEhWMm1xWFkyN2NNaFpISXhlRUFBQUFBJCQAAAAAAAAAAAEAAAC-ENsAR19obWxzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFmPZF5Zj2ReT; STOKEN=6eed028cbe604e168a978284a4e5ada0d2fb5ad02559cd8568eaddc0d6ac7e17; SCRC=abae33dddbd039188dfca44946e36bc6; Hm_lvt_7a3960b6f067eb0085b7f96ff5e660b0=1583507142,1583570220,1583648604,1583692043; delPer=0; PSINO=3; cflag=13%3A3; Hm_lpvt_7a3960b6f067eb0085b7f96ff5e660b0=1583697935; PANPSC=1634889871415495715%3AZdTG9lVgpntugIGw18cSZVcS2d9ns3O5UnffaEdZJMioCxQgjGERckHdjv8XIXMbF%2FYxkwK%2FsNyX7wZMFzyi3WtpABU2m%2FElQjQ1mFHTd8V1tt%2Bk9Cane%2BomA%2FKeZTApdS8c7ndIzLGm7Wp98loeBrZmQ9Xq9%2FjrmC0l4QVrtZD2VG7Ee3wInG344ihw4UqP9iEEfXjbSguSsVZaqyA8TA%3D%3D; HttpOnly"

tempfile = open("https://tva1.sinaimg.cn/large/da432263gy1gcj74ifcokj205f06gjre.jpg")
file2 = Pathname.new("/Users/feizheng/Downloads/analystai-pc/index.js").open
uploadid = "N1-MTE5LjM2LjEwLjIyMToxNTgzNzEwMzg3OjE1ODQ0MTAwMzc2OTQ3ODY4ODI="
url = URI("https://c3.pcs.baidu.com/rest/2.0/pcs/superfile2?method=upload&app_id=250528&path=/&uploadid=#{uploadid}&uploadsign=0&partseq=0")
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
# http.verify_mode = OpenSSL::SSL::VERIFY_NONE

data = [
  ["file", file2],
]

request = Net::HTTP::Post.new("https://c3.pcs.baidu.com/rest/2.0/pcs/superfile2?method=upload&app_id=250528&path=/db.file&uploadid=#{uploadid}&uploadsign=0&partseq=0")
request.set_form(data, "multipart/form-data")
request["Cookie"] = cookie
request["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36"
response = http.request(request)

# # # response = http.post(url, { pic1: HTTP::FormData::File.new(tempfile) }, headers)
puts response.body
# uploadid = "N1-MTE5LjM2LjEwLjIyMToxNTgzNzAwNjIzOjE1ODE3ODg5OTEyODAyMzQ0MzU="
# tempfile = open("https://tva1.sinaimg.cn/large/da432263gy1gcj74ifcokj205f06gjre.jpg")
# res = Nx::Http.upload("https://c3.pcs.baidu.com/rest/2.0/pcs/superfile2?method=upload&app_id=250528&path=/&uploadid=#{uploadid}&uploadsign=0&partseq=0", { file: tempfile }) do |http, request|
#   request["Cookie"] = cookie
#   request["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36"
# end

# p res.body
