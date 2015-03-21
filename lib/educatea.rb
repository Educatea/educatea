require "educatea/version"
require "net/http"
require "uri"
require "json"
require 'ostruct'
require 'active_support/core_ext/hash'

module Educatea

	def self.exercise(id, options={})
		options = {level: 3}.merge(options)
		level = options[:level] || 3
		uri = URI.parse("http://educatea.com.ar/api/v2/exercises/#{id}")
		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Get.new(uri.request_uri)
		request.set_form_data({"id" => id, "level" => level})
		request.basic_auth(ENV['EDUCATEA_APPID'], ENV['EDUCATEA_TOKEN'])
		response = http.request(request)
		response = JSON.parse(response.body)
		response = OpenStruct.new(response)
	end
  
	def self.random
		uri = URI.parse("http://educatea.com.ar/api/v2/exercises/random")
		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Get.new(uri.request_uri)
		request.basic_auth(ENV['EDUCATEA_APPID'], ENV['EDUCATEA_TOKEN'])
		response = http.request(request)
		response = JSON.parse(response.body)
		response = OpenStruct.new(response)
	end

	def self.solve(answer, ex_token, name, level)
		uri = URI.parse("http://educatea.com.ar/api/v2/exercises/solve")
		http = Net::HTTP.new(uri.host, uri.port)
		request = Net::HTTP::Post.new(uri.request_uri)
		request.set_form_data({"answer" => answer, "level" => level, "ex_token" => ex_token, "name" => name})
		request.basic_auth(ENV['EDUCATEA_APPID'], ENV['EDUCATEA_TOKEN'])
		response = http.request(request)
		response = JSON.parse(response.body)
		response = OpenStruct.new(response)
	end

end
