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

 		def query query_object=nil
 			if query_object
 					make_query(
 						Builder::Test.make(&query_object.test_filter),
 						Builder::Data.make(&query_object.data_filter)
 					)
 			elsif Query.queries.first
 				Query.queries.inject({}) do |result,(name,query)|
 					result[name] = make_query(
 						Builder::Test.make(&query.test_filter),
 						Builder::Data.make(&query.data_filter)
 					)
 					result
 				end
 			else
 				make_query(*yield(Builder::Test,Builder::Data))
 			end
 		end

 		private
 		def make_query test_filter,data_filter
 			request = { 	
 				method: 'GET',
 				url: URL.build(test_filter,data_filter)
 			}
 			make_request(request)
 		end
 			def make_request request
 				http = Http.request do
 					set_uri request[:url]
 				end

 				http.make_request_of request[:method]
 				JSON.parse(http.body)
			end

 	end
end

