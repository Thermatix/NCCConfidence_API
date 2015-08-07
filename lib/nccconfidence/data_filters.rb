#takes in return filters as a hash and returns a data-filter string
module NCCConfidence
    class D_Filters
        class << self
            def build filter_object
                "[#{make_filter(filter_object)}]" 
            end

            def make_filter items
                items.map do |item|
                    if item.class == Hash
                        item.each do |key,value|
                            break "#{key.to_s}[#{make_filter(value)}]"
                        end
                    else
                        item.to_s #ensures symbols are correctly formated if and when used
                    end
                end.join(',') 
            end

        end
    end

end
