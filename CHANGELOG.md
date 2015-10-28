# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/) and this file attempts to follow the guidelines provided by [Keep a CHANGELOG](http://keepachangelog.com/).

## [Unreleased][unreleased]
### Added
- Ensures Gemspec has a minimum Ruby version. Choosing 2.x, as this is default on Yosemite machines.
- Adds in Swift code generation via `--language swift`. To keep compatibility with older versions, the default is still `objc`. Swift code generation will output a file `Resources.swift`.
- An autogeneration warning has been added to the output files. Notes that changes to the given files will eventually be lost.

## [0.1.1] - 2015-09-02
Initial public release.

[unreleased]: https://github.com/dynamit/referee/compare/0.1.1...HEAD
[0.1.1]: https://github.com/Dynamit/referee/tree/0.1.1
