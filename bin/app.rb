#!/usr/bin/env ruby
# coding: utf-8

require 'sinatra'
require "sinatra/namespace"
require 'sinatra/reloader'
require 'test_gem'
require 'sugar_models'

get '/' do
  'this is sinatform いいい'
end

namespace '/api/v1' do
  get '/' do
    'this is api v1 root'
  end
end
