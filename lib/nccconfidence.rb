require 'rest-client'
require 'json'
lib_root = File.expand_path('.',File.dirname(__FILE__))


require "#{lib_root}/nccconfidence/version"
require "#{lib_root}/nccconfidence/url_builder"
require "#{lib_root}/nccconfidence/http_client"


module NCCConfidence
 	class << self
 		def api_key= key
 			URL.api_key = key
 		end

 		def query
 			test_filter,data_filter = yield(Builder::Test,Builder::Data)
 			request = { 	
 				method: 'GET',
 				url: URL.build(test_filter,data_filter)
 			}
 			make_request(request)
 		end

 		private 
 			def make_request request
 				http = Http.request do
 					set_uri request[:url]
 				end

 				http.make_request_of request[:method]
 				JSON.parse(http.body)
			end

 	end
end

