# Contributing to Felix Classic

Thank you for your interest in contributing to Felix Classic. This is a maintained fork of Felix CAT by Ryan Ginstrom, updated for the modern Windows toolchain. Contributions that fix build issues, update dependencies, or improve compatibility are welcome.

## Before You Start

Felix Classic is a preservation-first fork. The goal is to keep Felix working on modern Windows, not to redesign it.

- **Welcome**: build fixes, dependency updates, compatibility improvements, documentation, bug fixes
- **Discuss first**: anything that changes translator-facing behaviour, adds new features, or removes existing functionality

Open an issue before starting significant work so we can align on scope.

## Getting Started

### Requirements

- Windows 10 or 11
- Visual Studio 2022 (Community Edition or higher) with the C++ desktop workload
- Python 3.11+ (32-bit, for embedded Python support)
- [vcpkg](https://vcpkg.io/) for Boost packages

### Dependencies

These are fetched automatically by CI, but for local builds you will need:

| Library | Source |
|---------|--------|
| Lua 5.2.4 | https://www.lua.org/ftp/ |
| LuaBridge | https://github.com/vinniefalco/LuaBridge |
| LuaWrapper | https://github.com/Enfis/luawrapper |
| WTL 10.0.10320 | https://github.com/Win32-WTL/WTL |
| Boost (via vcpkg) | algorithm, filesystem, regex, smart-ptr, test, and others |

### Building

1. Open `src/Felix/Felix.sln` in Visual Studio 2022
2. Set the configuration to **Unicode_Release / Win32**
3. Build the Felix target

The Office add-ins are in separate solutions under `src/WordAssist/`, `src/ExcelAssist/`, and `src/PowerPointAssist/`.

## Submitting Changes

1. Fork the repository
2. Create a branch from `master` (`git checkout -b fix/your-description`)
3. Make your changes
4. Test that the build completes and produces `Felix.exe`
5. Submit a pull request against `master`

### Commit Messages

Use clear, descriptive commit messages. Prefix with a category when appropriate:

- `fix:` for bug fixes
- `ci:` for build/CI changes
- `docs:` for documentation
- `chore:` for maintenance tasks

Example: `fix: resolve WTL include path for VS2022 17.9`

### Code Style

- Follow the existing code style in the file you are editing
- C++ code uses the conventions established by the original Felix codebase
- Do not reformat files you are not otherwise changing
- Keep changes focused — one fix per pull request when possible

## Project Structure

```
src/
  Felix/              Main application (C++)
  WordAssist/         Word COM add-in
  ExcelAssist/        Excel COM add-in
  PowerPointAssist/   PowerPoint COM add-in
  common/             Shared libraries
  setup/              InnoSetup installer scripts
  python_tools/       Helper scripts
  Test_*/             Unit tests
```

## CI / Releases

The GitHub Actions workflow (`.github/workflows/build-release.yml`) builds everything on `windows-2022` and creates a release with an InnoSetup installer when a version tag (`v*`) is pushed.

If your change affects the build, verify it works by triggering the workflow via `workflow_dispatch` on your fork.

## License

By contributing, you agree that your contributions will be licensed under the MIT License, consistent with the rest of the project.

## Questions?

Open an issue or start a discussion. We are happy to help.
