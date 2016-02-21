# coding: utf-8
require 'redis'
require 'hiredis'
require 'digest/sha1'
require 'msgpack'

namespace :redis do
  desc "Redis exec lua script by file path"
  task :exec_by_file_path, [:script_path] do |task, args|
    lua_script_body = File.read(args[:script_path])
    lua_script_sha1 = Digest::SHA1.hexdigest(lua_script_body)
    p lua_script_sha1
    redis = Redis.new(:path => "/tmp/redis.sock", :driver => :hiredis)
    p redis.eval(lua_script_body)
  end

  desc "Redis exec lua script by sha1 string"
  task :exec_by_sha1, [:sha1] do |task, args|
    redis = Redis.new(:path => "/tmp/redis.sock", :driver => :hiredis)
    p redis.evalsha args[:sha1]
  end

  desc "Redis import placements"
  task :import_placements, [:json_file] do |task, args|
    redis = Redis.new(:path => "/tmp/redis.sock", :driver => :hiredis)
    data  = JSON.parse(File.read(args[:json_file]))
    data.each do |k,v|
      redis.set k, MessagePack.pack(v)
    end
  end

  desc "Redis get placement ids"
  task :get_placement_ids do |task, args|
    redis = Redis.new(:path => "/tmp/redis.sock", :driver => :hiredis)
    p redis.keys 'p*'
  end

  desc "Redis determine placements"
  task :determine_placements, [:script_path, :count] do |task, args|
    lua_script_body = File.read(args[:script_path])
    lua_script_sha1 = Digest::SHA1.hexdigest(lua_script_body)
    p lua_script_sha1
    redis = Redis.new(:path => "/tmp/redis.sock", :driver => :hiredis)
    p redis.eval(lua_script_body, [], [args[:count].to_i])
  end
end
