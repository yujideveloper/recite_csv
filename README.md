# ReciteCSV

ReciteCSV helps to build a class for CSV reader.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'recite_csv'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install recite_csv

## Usage

The following is a sample csv file.

``` csv
COL1,COL2
VALUE1,VALUE2
VALUE3,VALUE4
```

Specify header definition using hash object.

``` ruby
class Foo
  include ReciteCSV::Reader::Builder.new(col1: "COL1", col2: "COL2")
end

Foo.new("./sample.csv").each do |row|
  row.class # => Foo::Row
  row.col1
  row.col2
end
```

Specify header definition using array object.

``` ruby
class Bar
  include ReciteCSV::Reader::Builder.new(%w[col1 col2])
end

Bar.new("./sample.csv").each do |row|
  row.class # => Bar::Row
  row.col1
  row.col2
end
```

Define custom methods of row object.

``` ruby
class Baz
  include(
    ReciteCSV::Reader::Builder.new(col1: "COL1", col2: "COL2") do
      # define methods of Row class
      def col1
        "override #{super}"
      end

      def custom_method
        # do somethings..
      end
    end
  )
end

Baz.new("./sample.csv").each do |row|
  row.class # => Baz::Row
  row.col1
  row.col2
  row.custom_method
end
```

Define custom methods of row object using `row_methods`.

``` ruby
class Quz
  include ReciteCSV::Reader::Builder.new(%w[col1 col2])

  row_methods do
    def col1
      "override #{super}"
    end

    def custom_method
      # do somethings..
    end
  end
end

Quz.new("./sample.csv").each do |row|
  row.class # => Quz::Row
  row.col1
  row.col2
  row.custom_method
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/yujideveloper/recite_csv.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

