source :rubygems
gem "sinatra", :require => "sinatra/base"
gem 'sinatra-assetpack', :require => 'sinatra/assetpack'
gem "less", "~> 2.3.2"
gem "haml"

platforms :jruby do
  gem "therubyrhino"
end

platforms :ruby do
  gem "therubyracer"
  gem "thin"
end
