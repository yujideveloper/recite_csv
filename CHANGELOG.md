## Unreleased

### Misc

* CI against for Ruby 3.4
* Use IRB console


## 2.1.0 (2023-12-25)

### Changes

* Add csv gem to runtime dependencies
* Drop Ruby 2.x support

### Misc

* Migrate CI from Travis CI to GitHub Actions
* CI against for Ruby 3.0, 3.1, 3.2, and 3.3
* Require MFA to release gem
* Change the default branch from master to main
* Correct RuboCop offenses
* Update dev dependencies


## 2.0.0 (2020-01-09)

### Breaking changes

* Chagne `Reader::Core#each` to return a receiver itself

### Changes

* Suppress warnings of keyword arguments in Ruby 2.7

### Misc

* Update gem metadata


## 1.0.0 (2019-05-29)

### Changes

* Drop Ruby 2.3 support

### Misc

* Introduce RuboCop Performance


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
