# Changelog — Felix Classic

## v2.0.0 (2025) — First Classic release

First release of Felix Classic, the maintained fork of the original Felix CAT tool.
All translator-facing features from v1.7.3 are preserved exactly. Changes are
limited to the toolchain, build system, and runtime dependencies.

### What's new vs. original v1.7.3
- **Compiler:** Visual Studio 2013 → Visual Studio 2022 (toolset v143)
- **C++ standard:** C++11 → C++17
- **Python components:** Python 2.7 → Python 3.11+
- **Installer:** InnoSetup 5 → InnoSetup 6
- **WebView:** IE-based → WebView2 (Edge)
- **Build system:** VS2013 `.vcxproj` → VS2022 `.vcxproj`
- **64-bit Office support:** All three COM add-ins (Word, Excel, PowerPoint) now have
  proper `Release|x64` and `Debug|x64` build configurations. Install the x64 DLLs
  when running 64-bit Microsoft 365 / Office 2019+. The Felix core app remains x86.
- **Office compatibility:** Tested with Office 2016, 2019, 2021, and Microsoft 365 (32-bit and 64-bit)
- **Windows compatibility:** Tested on Windows 10 and Windows 11

### Features (unchanged from original)
- Translation memory with fuzzy and exact matching
- Placement feature — auto-insertion of numbers, glossary terms, and regex-defined patterns
- Microsoft Word add-in (Word Assist) — translation and review modes
- Microsoft Excel add-in (Excel Assist) — translation and review modes
- Microsoft PowerPoint add-in (PowerPoint Assist)
- COM scripting API — scriptable from VBA in Word, Excel, PowerPoint
- MemoryServes — networked shared translation memory server
- Multi-format segmenter — Word, Excel, PPT, HTML, XML, PDF, RTF, CSV
- Terminology Aligner — bilingual glossary extraction
- Rule Manager — custom Placement rules via regex
- Lua scripting support
- Japanese and English UI

### Known issues
- ALT+key shortcuts in Office 365 may need to be re-assigned if they conflict with ribbon shortcuts
- Install the x64 add-in DLLs when running 64-bit Office; install x86 DLLs for 32-bit Office

---
Original project by Ryan Ginstrom. Fork maintained by Ernst van Gassen. MIT licensed.
