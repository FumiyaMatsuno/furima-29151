# 「Capfile」では、Capistrano関連のライブラリのうちどれを読み込むかを指定できます。
# Capistranoの機能を提供するコードはいくつかのライブラリ（Gem）に分かれています。
# そのため、Capistranoを動かすにはいくつかのライブラリを読み込む必要があります。

require "capistrano/setup"
require "capistrano/deploy"
require 'capistrano/rbenv'
require 'capistrano/bundler'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano3/unicorn'

Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }