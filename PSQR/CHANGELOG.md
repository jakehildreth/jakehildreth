# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Calendar Versioning](https://calver.org/).

## [Unreleased]

### Fixed
- Complete rewrite to use qrencode utility for proper QR code generation
- QR codes now scan correctly with all standard QR code readers
- Removed non-functional custom QR code implementation

### Changed
- Module now requires qrencode utility to be installed
- Simplified implementation using battle-tested qrencode library
- Updated documentation to reflect qrencode requirement

## [2026.01.21] - 2026-01-21

### Added
- Initial release of PSQR module
- New-PSQR function for generating QR codes in the terminal
- Pipeline support for text input
- Comment-based help for all public functions
- Cross-platform compatibility (Windows, Linux, macOS)
- Unicode block character rendering for terminal output

[Unreleased]: https://github.com/jakehildreth/jakehildreth/compare/v2026.01.21...HEAD
[2026.01.21]: https://github.com/jakehildreth/jakehildreth/releases/tag/v2026.01.21
