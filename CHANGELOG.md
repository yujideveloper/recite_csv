## Unreleased


## 0.2.0 (2018-09-19)

### Changes

* Drop Ruby 2.2 support
* Change `Reader::Builder#included` to private method

### Misc

* Fix rubocop offence


## 0.1.2 (2018-02-23)

### Changes

* Change `Row::Base` to an abstract class
* Add support Ruby v2.5
* Add file options to `Reader::Core#each`

### Misc

* Change to use `Hash#each_pair` instead of `Hash#each`


## 0.1.1 (2017-12-03)

### Changes

* Rename the accessor for raw data of row from `raw_data` to `_raw_data`
* Add support Ruby 2.2

### Bug fixes

* Fix typo of constant for default csv options

### Misc

* Support Rubocop v0.50.0 or later
* Introduce pry


## 0.1.0 (2017-11-30)

* Initial release
