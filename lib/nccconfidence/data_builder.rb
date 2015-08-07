module NCCConfidence
	module Builder
		class Data
			attr_reader :attributes
			
			class << self
				def make &script
					t = self.new
					t.instance_eval(&script)
					t.attributes
				end
			end

			def initialize
				@attributes = []
			end

			def item value
				@attributes << value
			end

			def object key, &value
				@attributes << {key => self.class.make(&value)}
			end
		end
	end
end