module NCCConfidence
	module Builder
		class Test
			attr_reader :attributes
			
			class << self
				def make &script
					t = self.new
					t.instance_eval(&script)
					t.attributes["Format"] = 'JSON'
					t.attributes
				end
			end

			def initialize
				@attributes = {}
			end

			def account_id value
				@attributes["AccountId"] = value
			end

			def id value
				@attributes["Id"] = value
			end

			def start_date value
				@attributes["StartDate"] = value
			end

			def start_time value
				@attributes["StartTime"] = value
			end

			def end_date value
				@attributes["EndDate"] = value
			end

			def end_time value
				@attributes["EndTime"] = value
			end

			def start_timestamp value
				@attributes["StartTimestamp"] = value
			end

			def end_time_stamp value
				@attributes["EndTimestamp"] = value
			end

			def script_type value
				@attributes["ScriptType"] = value
			end

			def show_steps value
				@attributes["ShowSteps"] = value
			end

			def limit_errors_open value
				@attributes["LimitErrorsOpen"] = value
			end

			def offset_errors_open value
				@attributes["OffsetErrorsOpen"] = value
			end

			def limit_errors_closed value
				@attributes["LimitErrorsClosed"] = value
			end

			def offset_errors_closed value
				@attributes["OffsetErrorsClosed"] = value
			end

			def limit_test_results value
				@attributes["LimitTestResults"] = value
			end

			def offset_test_results value
				@attributes["OffsetTestResults"] = value
			end

			def up_time_min value
				@attributes["UptimeMin"] = value
			end

			def up_time_max value
				@attributes["UptimeMax"] = value
			end

			def kpi_min value
				@attributes["KPIMin"] = value
			end

			def kpi_max value
				@attributes["KPIMax"] = value
			end

			def status_code value
				@attributes["StatusCode"] = value
			end

			def result_code value
				@attributes["ResultCode"] = value
			end

			def exclude_re_test value
				@attributes["ExcludeRetest"] = value
			end

			def format value
				@attributes["Format"] = value
			end


		end
	end
end