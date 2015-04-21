# MongoidOptimisticLock

Mongoid Optimistic Lock supports simple optimistic lock.

## Status

[![wercker status](https://app.wercker.com/status/9a5dd7d860a3b386fc2ed5506cede266/m "wercker status")](https://app.wercker.com/project/bykey/9a5dd7d860a3b386fc2ed5506cede266)

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
