# nx-http
> Http for ruby gem.

## installation
```rb
# from gem
gem 'nx-http'
# from git
gem 'nx-http', git: 'git@github.com:afeiship/nx-http.git',ref:'a6b0a57acd05315f97a70c9b45ffbbb7405afa0c'
```

## usage
```rb
Nx::Http::request


## ContentType:
Nx::ContentType.constants
# [:JSON, :URLENCODED, :MULTIPART]

## DataTransform
Nx::DataTransform.multipart(name:'fei', age:100)
# [[:name, "fei"], [:age, 100]]
Nx::DataTransform.urlencoded(name:'fei', age:100)
# "name=fei&age=100"
Nx::DataTransform.json(name:'fei', age:100)
# "{\"name\":\"fei\",\"age\":100}"
```

## build/publish
```shell
# build
gem build nx-http.gemspec

# publish
gem push nx-http-0.1.0.gem
```
