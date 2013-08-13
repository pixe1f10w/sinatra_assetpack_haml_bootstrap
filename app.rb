require 'sinatra/base'
require 'sinatra/assetpack'
require 'haml'

class App < Sinatra::Base
  set :root, File.dirname(__FILE__)
  Less.paths <<  "#{App.root}/assets/stylesheets"
  Less.paths <<  "#{App.root}/assets/stylesheets/bootstrap"

  register Sinatra::AssetPack

  assets do
    serve '/js',    from: 'assets/javascripts'
    serve '/css',   from: 'assets/stylesheets'
    serve '/images',from: 'assets/images'

    js :main, '/js/main.js', [
      '/js/jquery/jquery*.js',
      '/js/bootstrap/bootstrap-transition.js',
      '/js/bootstrap/bootstrap-alert.js',
      '/js/bootstrap/bootstrap-button.js',
      #'/js/bootstrap/bootstrap-carousel.js',
      '/js/bootstrap/bootstrap-collapse.js',
      '/js/bootstrap/bootstrap-dropdown.js',
      #'/js/bootstrap/bootstrap-modal.js',
      #'/js/bootstrap/bootstrap-tooltip.js',
      #'/js/bootstrap/bootstrap-popover.js',
      #'/js/bootstrap/bootstrap-scrollspy.js',
      #'/js/bootstrap/bootstrap-tab.js',
      #'/js/bootstrap/bootstrap-typeahead.js',
      #'/js/bootstrap/bootstrap-affix.js',
    ]

    css :bootstrap, [
      '/css/bootstrap/bootstrap.css',
      '/css/bootstrap/responsive.css'
    ]

    prebuild true

  end

  get '/' do
    haml :index
  end

  %w(container-app fluid hero starter-template).each do |view|
    get "/#{view}" do
      haml view.to_sym
    end
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
