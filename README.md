# RObjc

## Description

`RObjc` is a script that generates Objective-C classes and macros for easily referencing your resources in code, providing IDE auto-complete and compile-time safety for your app.

The currently supported resource types are:

- Storyboards
- View Controllers
- Segue Identifiers
- Table View Cell Identifiers
- Collection View Cell Identifiers

The inspiration for this script was provided by [R.swift](https://github.com/mac-cain13/R.swift).

## Demo

Without `RObjc`, you can either maintain your own constants file in parallel with your storyboards or write code as such:

```objc
UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
UIViewController *someViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"Some View Controller"];
[someViewController performSegue:@"Some Segue"];
```

With `RObjc`, you can replace this with references to a few automatically generated classes:

```objc
UIViewController *someViewController = TSTResources.viewControllers.SomeViewController;
[someViewController performSegue:TSTResources.segues.SomeSegue];
```

Now, if you change an identifier in your storyboard, your code won't compile unless it matches as well, providing you with the confidence that your code and UI are in sync.

## Installation

`RObjc` is distributed through [RubyGems](https://rubygems.org/). To install it, execute the following command:

    $ gem install robjc

As a reminder, if you are using [rbenv](https://github.com/sstephenson/rbenv) to manage your Gems, you may additionally need to run:

    $ rbenv rehash

Note that Xcode does not use your standard user `$PATH`, so we'll need to place `robjc` in a standard place that we can reference in our build scripts. `/usr/local/bin/` is a good place for this executable:

    $ ln -s $(which robjc) /usr/local/bin/robjc

Or if you'd rather do the above manually, here is an example using `rbenv`:

    $ which robjc
    /Users/colindrake/.rbenv/shims/robjc
    $ ln -s /Users/colindrake/.rbenv/shims/robjc /usr/local/bin/robjc

Finally, if you are using a `Gemfile` to manage Ruby dependencies for your app or build system, make sure to add the following:

    source 'https://rubygems.org'
    gem 'robjc'

## Xcode Integration
This script was designed to be easily integrated into your Xcode project workflow.

Begin by adding a Run Script to your Build Phases. For the script portion, enter:

    /usr/local/bin/robjc --prefix <your class prefix>

_Ensure that this Run Script runs before the Compile Sources step. Otherwise, your new changes won't get compiled!_

Build the project and open your source folder. By default, at the root of that folder there should be two new files: `<Prefix>Resources.h` and `<Prefix>Resources.m`. Add these files to the Xcode project, ensuring "Copy Files" is _not_ selected.

From now on, when you make changes in your Storyboard files, they will be reflected in these source files upon compiling.

If you need to setup different paths or configure `RObjc` further, check the `--help` flag for more information and documentation.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

## Todos

- Add in Image support
- More robust method name generation
- NIB support

## Contributing

1. Fork it ( https://github.com/dynamit/robjc/fork )
2. Create your feature branch (`git checkout -b feature/my-new-feature`)
3. Ensure you adhere to the style guidelines (run `rubocop`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin feature/my-new-feature`)
6. Create a new Pull Request

Note: The Rubocop adherence can always be improved!
