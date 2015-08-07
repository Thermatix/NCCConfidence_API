#takes in test_filters and returns a url_component
module NCCConfidence
	class T_Filters
		class << self
			def build filter_object
				filter_object.inject("") do |result,(filter_name,filter_value)|
					 "#{result}/#{filter_name}/#{filter_value}"
				end
			end
		end
	end

end