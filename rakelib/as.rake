# coding: utf-8
require 'aerospike'

namespace :as do
  include Aerospike
 
  task :seed do
    puts 'as seed'
  end
end
