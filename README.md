# Robjc

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/robjc`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'robjc'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install robjc

## Xcode Integration
This script was designed to be easily integrated into your Xcode project workflow.

Begin by adding a Run Script to your Build Phases. For the script portion, enter:

    $ /your/path/to/robjc --prefix <your class prefix>

_Ensure that this Run Script is moved before the Compile Sources step. Otherwise, your new changes won't get compiled!_

Build the project and open your source folder. By default, at the root of that folder there should be two new files: `<Prefix>Resources.h` and `<Prefix>Resources.m`. Add these files to the Xcode project, ensuring "Copy Files" is _not_ selected.

From now on, when you make changes in your Storyboard files, they will be reflected in the source files upon compiling.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/dynamit/robjc/fork )
2. Create your feature branch (`git checkout -b feature/my-new-feature`)
3. Ensure you adhere to the style guidelines (run `rubocop`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin feature/my-new-feature`)
6. Create a new Pull Request
