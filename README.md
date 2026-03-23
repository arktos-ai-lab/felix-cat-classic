# Felix Classic

**Felix Classic** is a maintained fork of the original [Felix CAT System](https://github.com/arktos-ai-lab/felix-cat-original) by Ryan Ginstrom, updated to build and run on the modern Windows toolchain while preserving everything that made Felix great.

> This repository directly propagates the ideas, architecture, and philosophy of the original Felix codebase. All original design decisions — translation memory, the Placement feature, COM integration with Office, and the lightweight translator-first workflow — are carried forward intact. Only the toolchain and compatibility layers are updated.

## What is Felix?

Felix is a computer-assisted translation (CAT) tool for Windows. It stores previously translated segments in a translation memory, suggests matches when new source text is similar to past work, and integrates natively into Microsoft Word, Excel, and PowerPoint via COM add-ins.

Key features preserved from the original:
- **Translation Memory** — fuzzy and exact matching across projects
- **Placement** — auto-insertion of numbers, glossary terms, and regex-defined patterns into translations
- **Office integration** — Word, Excel, and PowerPoint add-ins via COM
- **COM scripting API** — scriptable from VBA in any Office application
- **MemoryServes** — networked shared translation memory server
- **Multi-format segmenter** — Word, Excel, PPT, HTML, XML, PDF, RTF, CSV

## Relationship to the Original

This fork is built directly on the original Felix source code, which was released by Ryan Ginstrom under the MIT license. The original repository is archived at [felix-cat-original](https://github.com/arktos-ai-lab/felix-cat-original).

Changes made in this fork are limited to toolchain and compatibility updates — no features have been removed and no architectural changes have been made. The translator experience is identical to the original.

## What's Updated

| Area | Original | Classic |
|------|----------|---------|
| Compiler | Visual Studio 2013 | Visual Studio 2022 |
| C++ standard | C++11 | C++17 |
| Python components | Python 2.7 | Python 3.11+ |
| Installer | InnoSetup 5 | InnoSetup 6 |
| WebView | IE-based | WebView2 |
| Build system | MSBuild (VS2013 .vcxproj) | MSBuild (VS2022 .vcxproj) |

## Components

| Component | Description |
|-----------|-------------|
| Felix | Main CAT application (C++) |
| Word Assist | MS Word COM add-in |
| Excel Assist | MS Excel COM add-in |
| PowerPoint Assist | MS PowerPoint COM add-in |
| MemoryServes | Networked TM server (Python) |
| Segmenter | Multi-format text segmenter (Python) |
| TerminologyAligner | Bilingual glossary extractor (Python) |

## Documentation

The full Felix Manual 1.7.1.1 is available in two forms:

| Format | Location | Use |
|--------|----------|-----|
| HTML (rendered) | [`docs/`](docs/) — via [GitHub Pages](https://arktos-ai-lab.github.io/felix-cat-classic/) | Browse in a browser |
| Markdown | [`manual/`](manual/) | Read on GitHub / machine-readable |

The [`docs/index.html`](docs/index.html) is the GitHub Pages entry point with a full table of contents.
The original manual is preserved in its entirety — no content has been changed.

## Build Requirements

Requires **Visual Studio 2022** (Community Edition or higher).

Required libraries:
- [Windows Template Library (WTL)](http://sourceforge.net/projects/wtl/)
- [Boost](https://www.boost.org/)
- [Lua](http://www.lua.org/)
- [LuaBridge](https://github.com/vinniefalco/LuaBridge)
- [Python 3.11+](https://www.python.org/)

Additional runtime dependencies:
- `SciLexer.dll` from [Scintilla](http://www.scintilla.org/)
- `DbgHelp.dll`
- Visual C++ Redistributable for VS 2022

## Source Layout

```
src/
├── Felix/              Main application (C++)
├── WordAssist/         Word COM add-in
├── ExcelAssist/        Excel COM add-in
├── PowerPointAssist/   PowerPoint COM add-in
├── common/             Shared third-party libraries
├── python_tools/       Helper scripts
├── manual/             Sphinx RST documentation source (original)
├── settings/           Default configuration
├── setup/              InnoSetup installer scripts
└── Test_*/             Unit tests
docs/
    index.html          GitHub Pages table of contents
    about.html
    getting-started.html
    ... (41 pages total, see index)
manual/
    about.md
    getting-started.md
    ... (41 pages total, Markdown)
```

## Contributing

Contributions that fix build issues, update dependencies, or improve compatibility are welcome.
Contributions that change translator-facing behaviour or remove features should be discussed first — the goal of this fork is faithful preservation of the Felix workflow, not feature drift.

Please read the original [`CONTRIBUTING.rst`](src/CONTRIBUTING.rst) for coding style and conventions.

## License

MIT License — see [LICENSE](LICENSE).

Original copyright: Ryan Ginstrom, 1999–2015.
This fork is maintained under the same MIT license, with the original copyright notice preserved in full.

## Acknowledgements

Felix was designed and built by **Ryan Ginstrom**. This project exists because of his work.
The original source was published on Bitbucket under the MIT license and is archived at [felix-cat-original](https://github.com/arktos-ai-lab/felix-cat-original).

This fork was created and is maintained by **Ernst van Gassen**.

## Support & Thanks

If you find Felix Classic useful, consider supporting ongoing development:

[![Donate via PayPal](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://paypal.me/VanGassen)

All original credit goes to **Ryan Ginstrom** who designed and built Felix and released it as open source.
