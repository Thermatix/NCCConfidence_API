require "curb"

module NCCConfidence
	class Http
		class << self
		

			def request  &scipt
				t = self.new
				t.instance_eval(&scipt)
				t
			end

		end
		attr_accessor :curl, :headers,:payload, :username, :password, :auth_type, :uri, :ssl, :redirects
		[:get, :post, :put, :delete, :head, :options, :patch, :link, :unlink].each do |func_name|
			define_method func_name do 
				make_request_of func_name.to_s.upcase
			end
		end

		def initialize
			self.headers = {}
		end

		def header name, content
			self.headers[name] = content
		end

		[:set_password,:set_username,:set_payload, :set_auth_type, :set_uri, :set_ssl, :set_redirects].each do |func_name|
			define_method func_name do |value|
				self.send("#{func_name.to_s.gsub('set_','')}=",value)
			end
		end

		def make_request_of (request_method)
			self.curl = Curl::Easy.new(self.uri) do |http|
				setup_request request_method, http
			end
			self.curl.ssl_verify_peer =  self.ssl ||false
			self.curl.http request_method
			if self.curl.response_code == 301
				self.uri =  self.curl.redirect_url
				make_request_of request_method
			end
		end

		def response
			self.curl.response_code
		end

		def body
			self.curl.body_str
		end

		def setup_request method,http
			http.headers['request-method'] = method.to_s
			http.headers.update(headers)
			http.max_redirects = self.redirects || 3
			http.post_body = self.payload || nil
			http.http_auth_types = self.auth_type || nil
			http.username = self.username || nil
			http.password = self.password || nil
			http.useragent = "curb"
			http
		end

		# def self.get url, keys
		# 	Curl::Easy.perform(url) do |curl|
		# 		curl.headers["User-Agent"] = "#{VCK::Info[:name]}-#{VCK::Info[:version]}"
		# 	end.body_str
		# end

		# def self.post data,url
		# 	headers ={
		# 		'Content-Type' => 'application/json',
		# 		'X-Requested-With' => 'XMLHttpRequest',
		# 		'Accept' => 'application/json'
		# 	}
		# 	client = Curl::Easy.new
		# 	client.url = url
		# 	client.headers = headers
		# 	client.http_post(payload)

		# end
	end
end