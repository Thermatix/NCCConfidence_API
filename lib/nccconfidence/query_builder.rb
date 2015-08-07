module NCCConfidence
	class Query
		class << self
			attr_accessor :queries
			def make query, &filters
				new_query = self.new
				new_query.instance_eval(&filters)
				self.queries[query] = new_query
			end
		end

		self.queries = {}

		def test_filter &filter
			if filter
				@test_filter = Proc.new &filter
			else
				@test_filter
			end
		end

		def data_filter &filter
			if filter
				@data_filter = Proc.new &filter
			else
				@data_filter
			end
		end
	end
end
