require "open-uri"
require_relative "../lib/nx-http"

# p Nx::ContentType::JSON
cookie = "PANWEB=1; csrfToken=HGPEF5J4BMUKDsBEOzo8FNRr; recommendTime=mac2020-03-06%2016%3A33%3A00; BAIDUID=0FEE32A9EDE9E7AA4EFBDC31B4C77E13:FG=1; PSTM=1583562584; H_PS_PSSID=30963_1445_21112_30999_30824_30717; BIDUPSID=33A5F43CBC872598047FC87C5873703E; BDORZ=B490B5EBF6F3CD402E515D22BCDA1598; SIGNIN_UC=70a2711cf1d3d9b1a82d2f87d633bd8a03335825322; BDCLND=dfnU1OnEre564hYcmekBl73OTHnblXDwrOfClJGfkSI%3D; BDUSS=2l6cmprVUJ2N0xHdml-cDByRktMV2JuMGlnOFNRcEhWMm1xWFkyN2NNaFpISXhlRUFBQUFBJCQAAAAAAAAAAAEAAAC-ENsAR19obWxzAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFmPZF5Zj2ReT; STOKEN=6eed028cbe604e168a978284a4e5ada0d2fb5ad02559cd8568eaddc0d6ac7e17; SCRC=abae33dddbd039188dfca44946e36bc6; Hm_lvt_7a3960b6f067eb0085b7f96ff5e660b0=1583507142,1583570220,1583648604,1583692043; delPer=0; PSINO=3; cflag=13%3A3; Hm_lpvt_7a3960b6f067eb0085b7f96ff5e660b0=1583697935; PANPSC=1634889871415495715%3AZdTG9lVgpntugIGw18cSZVcS2d9ns3O5UnffaEdZJMioCxQgjGERckHdjv8XIXMbF%2FYxkwK%2FsNyX7wZMFzyi3WtpABU2m%2FElQjQ1mFHTd8V1tt%2Bk9Cane%2BomA%2FKeZTApdS8c7ndIzLGm7Wp98loeBrZmQ9Xq9%2FjrmC0l4QVrtZD2VG7Ee3wInG344ihw4UqP9iEEfXjbSguSsVZaqyA8TA%3D%3D; HttpOnly"

url = URI("https://pan.baidu.com/api/precreate")
http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true

request = Net::HTTP::Post.new(url.path)
request["Content-Type"] = "application/x-www-form-urlencoded"
request["Cookie"] = cookie
request["User-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.132 Safari/537.36"
request.body = "path=/db.file&autoinit=1&block_list=%5B%225910a591dd8fc18c32a8f3df4fdc1761%22%5D"

response = http.request(request)

# response = http.post(url, { pic1: HTTP::FormData::File.new(tempfile) }, headers)
puts response.body
