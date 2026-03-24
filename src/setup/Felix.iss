; Felix Classic — InnoSetup 6 installer script
; Built by GitHub Actions; all paths are relative to this .iss file (src/setup/).
; Defines injected by CI:
;   /DMyAppVersion="v2.0.0"
;   /DOutputDir="<absolute-path>\installer"

#ifndef MyAppVersion
  #define MyAppVersion "2.0.0"
#endif
#ifndef OutputDir
  #define OutputDir SourcePath + "\..\..\installer"
#endif

#define AppName "Felix Classic"
#define AppExe "Felix.exe"
#define AppURL "https://github.com/arktos-ai-lab/felix-cat-classic"

[Setup]
AppName={#AppName}
AppVersion={#MyAppVersion}
AppVerName={#AppName} {#MyAppVersion}
AppPublisher=Ernst van Gassen
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}/issues
AppUpdatesURL={#AppURL}/releases
AppCopyright=Original work (c) 2008-2015 Ryan Ginstrom. Fork maintained by Ernst van Gassen.

DefaultDirName={autopf}\Felix Classic
DefaultGroupName=Felix Classic
UninstallDisplayName=Felix Classic
UninstallDisplayIcon={app}\Felix.exe
SetupIconFile=..\Felix\res\Felix.ico

PrivilegesRequired=admin
ArchitecturesInstallIn64BitMode=x64os

OutputDir={#OutputDir}
OutputBaseFilename=Felix-Classic-Setup-{#MyAppVersion}

Compression=lzma2
SolidCompression=yes
WizardStyle=modern
ShowLanguageDialog=no
MinVersion=10.0

LicenseFile=..\..\LICENSE

[Languages]
Name: en; MessagesFile: "compiler:English.isl"

[Types]
Name: full;    Description: "Full installation (64-bit Office add-ins)"
Name: full32;  Description: "Full installation (32-bit Office add-ins)"
Name: custom;  Description: "Custom installation"; Flags: iscustom

[Components]
Name: Main;         Description: "Felix Classic core application";  Types: full full32 custom; Flags: fixed
Name: WordIF;       Description: "Microsoft Word add-in";           Types: full full32
Name: WordIF\x64;   Description: "64-bit (Office 365 / modern Office)"; Types: full;  Flags: exclusive
Name: WordIF\x86;   Description: "32-bit (legacy Office)";          Types: full32;   Flags: exclusive
Name: ExcelIF;      Description: "Microsoft Excel add-in";          Types: full full32
Name: ExcelIF\x64;  Description: "64-bit";                          Types: full;     Flags: exclusive
Name: ExcelIF\x86;  Description: "32-bit";                          Types: full32;   Flags: exclusive
Name: PowerPointIF; Description: "Microsoft PowerPoint add-in";     Types: full full32
Name: PowerPointIF\x64; Description: "64-bit";                      Types: full;     Flags: exclusive
Name: PowerPointIF\x86; Description: "32-bit";                      Types: full32;   Flags: exclusive

[Files]
; -----------------------------------------------------------------------
; Felix core
Source: "..\Felix\Unicode_Release\Felix.exe";                DestDir: "{app}"; Components: Main; Flags: ignoreversion
Source: "..\Felix\Unicode_Release\lang\EngResource.dll";     DestDir: "{app}\lang"; Components: Main; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\Felix\Unicode_Release\lang\JpnResource.dll";     DestDir: "{app}\lang"; Components: Main; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\Felix\SciLexer.dll";                             DestDir: "{app}"; Components: Main; Flags: ignoreversion skipifsourcedoesntexist

; HTML UI templates
Source: "..\Felix\html\*";  DestDir: "{app}\html"; Components: Main; Flags: ignoreversion recursesubdirs createallsubdirs

; Default prefs and rules (only if not already present)
Source: "..\python_tools\prefs\stringres.database";                   DestDir: "{localappdata}\Felix\prefs"; Components: Main; Flags: ignoreversion onlyifdoesntexist skipifsourcedoesntexist
Source: "..\python_tools\RuleManager\default\felix_rules.frules";     DestDir: "{localappdata}\Felix\prefs"; Components: Main; Flags: ignoreversion onlyifdoesntexist skipifsourcedoesntexist

; License
Source: "..\..\LICENSE"; DestDir: "{app}"; DestName: "LICENSE.txt"; Components: Main; Flags: ignoreversion

; -----------------------------------------------------------------------
; Word add-in — x64 and x86
Source: "..\WordAssist\WordAssist\Release64\WordAssist.dll"; DestDir: "{app}"; Components: WordIF\x64; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\WordAssist\WordAssist\Release\WordAssist.dll";   DestDir: "{app}"; Components: WordIF\x86; Flags: ignoreversion skipifsourcedoesntexist

; Excel add-in — x64 and x86
Source: "..\ExcelAssist\ExcelAssist\Release64\ExcelAssist.dll"; DestDir: "{app}"; Components: ExcelIF\x64; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\ExcelAssist\ExcelAssist\Release\ExcelAssist.dll";   DestDir: "{app}"; Components: ExcelIF\x86; Flags: ignoreversion skipifsourcedoesntexist

; PowerPoint add-in — x64 and x86
Source: "..\PowerPointAssist\PowerPointAssist\Release64\PowerPointAssist.dll"; DestDir: "{app}"; Components: PowerPointIF\x64; Flags: ignoreversion skipifsourcedoesntexist
Source: "..\PowerPointAssist\PowerPointAssist\Release\PowerPointAssist.dll";   DestDir: "{app}"; Components: PowerPointIF\x86; Flags: ignoreversion skipifsourcedoesntexist

[Registry]
; Felix application settings (cleaned up on uninstall)
Root: HKCU; Subkey: "Software\AssistantSuite\Felix";              Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\AssistantSuite\FelixWordInterface"; Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\AssistantSuite\FelixExcelInterface";Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\AssistantSuite\FelixPptInterface";  Flags: uninsdeletekey
Root: HKCU; Subkey: "Software\AssistantSuite";                    Flags: uninsdeletekeyifempty

; File associations
Root: HKCR; Subkey: ".ftm";   ValueType: string; ValueName: ""; ValueData: "FelixTMFile";       Flags: uninsdeletevalue
Root: HKCR; Subkey: "FelixTMFile"; ValueType: string; ValueName: ""; ValueData: "Felix TM File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "FelixTMFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\Felix.exe"" ""%1"""

Root: HKCR; Subkey: ".fgloss"; ValueType: string; ValueName: ""; ValueData: "FelixGlossaryFile"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "FelixGlossaryFile"; ValueType: string; ValueName: ""; ValueData: "Felix Glossary File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "FelixGlossaryFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\Felix.exe"" ""%1"""

Root: HKCR; Subkey: ".fprefs"; ValueType: string; ValueName: ""; ValueData: "FelixPreferenceFile"; Flags: uninsdeletevalue
Root: HKCR; Subkey: "FelixPreferenceFile"; ValueType: string; ValueName: ""; ValueData: "Felix Preference File"; Flags: uninsdeletekey
Root: HKCR; Subkey: "FelixPreferenceFile\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\Felix.exe"" ""%1"""

[Run]
; Register Felix COM server
Filename: "{app}\Felix.exe"; Parameters: "/RegServer"; StatusMsg: "Registering Felix COM server..."; Components: Main; Flags: runhidden

; Register 64-bit add-in DLLs (use System32 regsvr32)
Filename: "{sys}\regsvr32.exe"; Parameters: "/s ""{app}\WordAssist.dll""";       StatusMsg: "Registering Word add-in...";        Components: WordIF\x64;       Flags: runhidden
Filename: "{sys}\regsvr32.exe"; Parameters: "/s ""{app}\ExcelAssist.dll""";      StatusMsg: "Registering Excel add-in...";       Components: ExcelIF\x64;      Flags: runhidden
Filename: "{sys}\regsvr32.exe"; Parameters: "/s ""{app}\PowerPointAssist.dll"""; StatusMsg: "Registering PowerPoint add-in...";  Components: PowerPointIF\x64; Flags: runhidden

; Register 32-bit add-in DLLs (use SysWow64 regsvr32 on 64-bit Windows)
Filename: "{syswow64}\regsvr32.exe"; Parameters: "/s ""{app}\WordAssist.dll""";       StatusMsg: "Registering Word add-in (32-bit)...";        Components: WordIF\x86;       Flags: runhidden
Filename: "{syswow64}\regsvr32.exe"; Parameters: "/s ""{app}\ExcelAssist.dll""";      StatusMsg: "Registering Excel add-in (32-bit)...";       Components: ExcelIF\x86;      Flags: runhidden
Filename: "{syswow64}\regsvr32.exe"; Parameters: "/s ""{app}\PowerPointAssist.dll"""; StatusMsg: "Registering PowerPoint add-in (32-bit)...";  Components: PowerPointIF\x86; Flags: runhidden

; Launch Felix after install
Filename: "{app}\Felix.exe"; Description: "Launch Felix Classic"; WorkingDir: "{app}"; Components: Main; Flags: nowait postinstall skipifsilent

[UninstallRun]
Filename: "{sys}\regsvr32.exe";    Parameters: "/s /u ""{app}\WordAssist.dll""";       RunOnceId: "UnregWord";   Flags: runhidden
Filename: "{sys}\regsvr32.exe";    Parameters: "/s /u ""{app}\ExcelAssist.dll""";      RunOnceId: "UnregExcel";  Flags: runhidden
Filename: "{sys}\regsvr32.exe";    Parameters: "/s /u ""{app}\PowerPointAssist.dll"""; RunOnceId: "UnregPPT";    Flags: runhidden
Filename: "{syswow64}\regsvr32.exe"; Parameters: "/s /u ""{app}\WordAssist.dll""";     RunOnceId: "UnregWord32"; Flags: runhidden
Filename: "{app}\Felix.exe"; Parameters: "/UnRegServer"; RunOnceId: "UnregFelix"; Flags: runhidden

[Tasks]
Name: desktopicon; Description: "Create a desktop shortcut"; GroupDescription: "Additional icons"; Components: Main

[Icons]
Name: "{group}\Felix Classic"; Filename: "{app}\Felix.exe"; WorkingDir: "{app}"
Name: "{group}\Uninstall Felix Classic"; Filename: "{uninstallexe}"
Name: "{userdesktop}\Felix Classic"; Filename: "{app}\Felix.exe"; Tasks: desktopicon

[Dirs]
Name: "{app}\lang"
Name: "{app}\html"
Name: "{localappdata}\Felix"
Name: "{localappdata}\Felix\prefs"
Name: "{localappdata}\Felix\logs"

[UninstallDelete]
Type: filesandordirs; Name: "{localappdata}\Felix"
