# NCCConfidence

This is a gem to allow you to make requests to NCC Confidence's API.

It provides mechanims to allow easier creation of API queries.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'NCCConfidence'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install NCCConfidence

## Usage

First set your current API key that you wish to use.

```ruby
    NCCConfidence.api_key = 's0as89234nj3jk4bjk23b4bhl4234'
```

And then make a query.

```ruby
result = NCCConfidence.query do |test_filter,data_filter|
    [test_filter.make do
        account_id "BN5A64933"
        id "MA2PG72611"
        start_date "2015-08-12"
        start_time "12:00:00"
        end_date "2015-08-07"
        end_time "07:05:05"
        status_code 1
    end,
    data_filter.make do
        object "Account" do
            item "AccountId"
            object "Pages" do 
                item "Page"
            end
            object "ServiceStatus" do 
                item "HighestStatusCode"
            end
        end
    end]

end
puts result

```

You can even store the filter blocks as `Procs` and pass them to the query block like this:

```ruby

t_filter = Proc.new do
     account_id "BN5A64933"
    id "MA2PG72611"
    start_date "2015-08-12"
    start_time "12:00:00"
    end_date "2015-08-07"
    end_time "07:05:05"
    status_code 1
end

d_filter = Proc.new do
    object "Account" do
        item "AccountId"
        object "Pages" do 
            item "Page"
        end
        object "ServiceStatus" do 
            item "HighestStatusCode"
        end
    end
end

result = NCCConfidence.query do |test_filter,data_filter|
    [test_filter.make(&t_filter),data_filter.make(&d_filter)]
end
puts result
```

That way you can make them re-usable or make the query easily changable by just switching which Procs you provide.

Please note you have to put both test_filter & data_filter into an array otherwise the client will only get one of the filters instead of an array of two two filters.

Here's a list of possible test filters:
+ account_id
+ id
+ start_date
+ start_time
+ end_date
+ end_time
+ start_timestamp
+ end_time_stamp
+ script_type
+ show_steps
+ limit_errors_open
+ offset_errors_open
+ limit_errors_closed
+ offset_errors_closed
+ limit_test_results
+ offset_test_results
+ up_time_min
+ up_time_max
+ kpi_min
+ kpi_max
+ status_code
+ result_code
+ exclude_re_test
+ format


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/NCCConfidence/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
