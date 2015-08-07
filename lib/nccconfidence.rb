require 'rest-client'
require 'json'
require_relative "nccconfidence/version"
require_relative "nccconfidence/url_builder"
require_relative "nccconfidence/http_client"


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
 				puts request[:url]
 				http = Http.request do
 					set_uri request[:url]
 				end

 				http.make_request_of request[:method]
 				JSON.parse(http.body)
			end

 	end
end

