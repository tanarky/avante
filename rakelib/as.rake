# coding: utf-8
require 'aerospike'

namespace :as do
  include Aerospike

  desc "Aerospike create task"
  task :create, ['name', 'description'] do |task, args|
    p args
  end

  desc "Aerospike seed task"
  task :seed, [] do |task, args|
    p 'as seed'
  end
end
