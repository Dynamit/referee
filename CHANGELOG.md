# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/) and this file attempts to follow the guidelines provided by [Keep a CHANGELOG](http://keepachangelog.com/).

## [Unreleased]
Forthcoming.

## [0.2.3] - 2015-11-19
### Fixed
- Ensures there are no empty `enum`s for Swift language when any cell, etc. types are missing.

## [0.2.2] - 2015-11-17
### Fixed
- Edge case fix: Invalid segue names such as " " no longer cause syntax errors.
- Fix for multiple segues in Swift language template ([#1](https://github.com/Dynamit/referee/issues/1)).

## [0.2.1] - 2015-11-04
### Added
- Immediate rollout bug fix for typo in Swift language `UIViewController` implementation.

## [0.2.0] - 2015-11-04
### Added
- Ensures Gemspec has a minimum Ruby version. Choosing 2.x, as this is default on Yosemite machines.
- Adds in Swift code generation via `--language swift`. To keep compatibility with older versions, the default is still `objc`. Swift code generation will output a file `Resources.swift`.
- An autogeneration warning has been added to the output files. Notes that changes to the given files will eventually be lost.
- Ability to specify the `NSBundle` the resources should be accessed from. Handy for developing frameworks with resources.
  - By default (if no bundle is specified) the main bundle will be used.
  - The `--bundle-id` flag can set a custom bundle ID.

## [0.1.1] - 2015-09-02
Initial public release.

[unreleased]: https://github.com/dynamit/referee/compare/v0.2.3...HEAD
[0.2.3]: https://github.com/Dynamit/referee/tree/v0.2.3
[0.2.2]: https://github.com/Dynamit/referee/tree/v0.2.2
[0.2.1]: https://github.com/Dynamit/referee/tree/v0.2.1
[0.2.0]: https://github.com/Dynamit/referee/tree/v0.2.0
[0.1.1]: https://github.com/Dynamit/referee/tree/0.1.1
