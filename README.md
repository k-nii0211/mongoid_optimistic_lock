# MongoidOptimisticLock

Mongoid Optimistic Lock supports simple optimistic lock via dirty tracking.

## Status

[![Circle CI](https://circleci.com/gh/k-nii0211/mongoid_optimistic_lock.svg?style=svg)](https://circleci.com/gh/k-nii0211/mongoid_optimistic_lock)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mongoid_optimistic_lock', github: 'k-nii0211/mongoid_optimistic_lock'
```

And then execute:

    $ bundle

## Usage

Include `Mongoid::OptimisticLock` in your class and set hidden field `version` in form.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
