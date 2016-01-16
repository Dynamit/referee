# Referee

[![Build Status](https://travis-ci.org/Dynamit/referee.svg?branch=master)](https://travis-ci.org/Dynamit/referee) [![Gem Version](https://badge.fury.io/rb/objc-referee.svg)](http://badge.fury.io/rb/objc-referee)

Referee is a script that generates Objective-C or Swift objects for easily referencing your resources in code, providing IDE auto-complete and compile-time safety for your app.

The currently supported resource types are:

- Storyboards
- View Controllers
- Segue Identifiers
- Table View Cell Identifiers
- Collection View Cell Identifiers

The inspiration for this script was provided by [R.swift](https://github.com/mac-cain13/R.swift).

## Demo

Without `referee`, you can either maintain your own constants file in parallel with your storyboards or write code as such:

```objc
UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
SomeViewController *someViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"Some View Controller"];
[someViewController performSegue:@"Some Segue"];
```

With `referee`, you can replace this with references to a few automatically generated classes:

```objc
SomeViewController *someViewController = TSTResources.viewControllers.SomeViewController;
[someViewController performSegue:TSTResources.segues.SomeSegue];
```

Using Swift, this code will look like:

```swift
let someViewController = Resources.ViewControllers.SomeViewController()
someViewController.performSegue(Resources.Segues.SomeSegue)
```

Now, if you change an identifier in your storyboard, your code won't compile unless it matches as well, providing you with the confidence that your code and UI are in sync.

## Installation

`referee` is distributed through [RubyGems](https://rubygems.org/). To install it, execute the following command:

    $ gem install objc-referee

As a reminder, if you are using [rbenv](https://github.com/sstephenson/rbenv) to manage your Gems, you may additionally need to run:

    $ rbenv rehash

Note that Xcode does not use your standard user `$PATH`, so we'll need to place `referee` in a standard place that we can reference in our build scripts. `/usr/local/bin/` is a good place for this executable:

    $ ln -sf $(which referee) /usr/local/bin/referee

Or if you'd rather do the above manually, here is an example using `rbenv`:

    $ which referee
    /Users/colindrake/.rbenv/shims/referee
    $ ln -sf /Users/colindrake/.rbenv/shims/referee /usr/local/bin/referee

Finally, if you are using a `Gemfile` to manage Ruby dependencies for your app or build system, make sure to add the following:

    source 'https://rubygems.org'
    gem 'objc-referee'

## Xcode Integration
This script was designed to be easily integrated into your Xcode project workflow.

Begin by adding a Run Script to your Build Phases. For the script portion, enter one of the following:

    /usr/local/bin/referee --prefix <your class prefix>   # for Objective-C
    /usr/local/bin/referee --language swift               # for Swift

_**Ensure that this Run Script runs before the Compile Sources step. Otherwise, your new changes won't get compiled!**_

Build the project and open your source folder. When using Objective-C, there should be two new files at the root of that folder: `<Prefix>Resources.h` and `<Prefix>Resources.m`. Add these files to the Xcode project, ensuring "Copy Files" is _not_ selected. When using Swift, a single file called `Resources.swift` will be generated. Follow the same steps to add the files to Xcode.

From now on, when you make changes in your Storyboard files, they will be reflected in these source files upon compiling.

If you need to setup different paths or configure `referee` further, check the `--help` flag for more information and documentation.

## Custom Frameworks
It is possible to generate resource accessors for a custom `.framework` with embedded resources simply by switching the generated code's accessed Bundle.

By default, all resources will be accessed from the Main Bundle, however, the `--bundle-id com.example.bundle-id` flag allows setting a custom Bundle Identifier. This allows you to access resources inside of a custom, third-party framework.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

## Todos

- [ ] Add in Image support
- [ ] More robust method name generation
- [ ] NIB support
- [ ] Localized Strings?
- [ ] Per-category toggle flags, i.e. something to the effect of `--table-cells=NO`

## Caveats

A word of caution: using Referee on your project can make your project's binary size balloon. This is a consequence of what Referee does for you - it creates convenience classes for you, thus increasing your symbol count. On most smaller projects, this won't matter. On large ones, however, please be cautious.

## Contributing

1. Fork it ( https://github.com/dynamit/referee/fork )
2. Create your feature branch (`git checkout -b feature/my-new-feature`)
3. Ensure you adhere to the style guidelines (run `rubocop`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin feature/my-new-feature`)
6. Create a new Pull Request

Note: The [Rubocop](https://github.com/bbatsov/rubocop) adherence can always be improved! Please see `.rubocop_todo.yml` for areas that need improvement.

## License

This project is MIT licensed. Please see `LICENSE.txt` for details.

## Sponsorship

This project is sponsored by the iOS Mobile group at [Dynamit, LLC](http://dynamit.com).
