nccc_root = File.expand_path('.',File.dirname(__FILE__))
require "#{nccc_root}/test_filters"
require "#{nccc_root}/test_builder"

require "#{nccc_root}/data_filters"
require "#{nccc_root}/data_builder"

require "#{nccc_root}/query_builder"

module NCCConfidence
	class URL
		class << self
			attr_accessor :api_key
			Base = "https://api.siteconfidence.co.uk/current"
			def build test_filters, data_filters
				t_filter = test_filters.class == String ? test_filters : T_Filters.build(test_filters)
				d_filter = data_filters.class == String ? data_filters : D_Filters.build(data_filters)	
				
				"#{Base}/#{self.api_key}/Return/#{d_filter}#{t_filter}"
			end	
		end
	end
end