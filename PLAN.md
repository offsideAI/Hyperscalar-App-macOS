# Plan

 Plan: Rename "Macabolic" → "Hyperbolic"

 Context

 The project is currently branded as "Macabolic" throughout source code, config files, browser extensions, and documentation. The user wants to rebrand
 the entire project to "Hyperbolic". The .xcodeproj directory is already named Hyperbolic.xcodeproj.

 Scope of Changes

 1. Rename Directories

 - Macabolic/ → Hyperbolic/
 - MacabolicExtension_Chrome/ → HyperbolicExtension_Chrome/
 - MacabolicExtension_Firefox/ → HyperbolicExtension_Firefox/

 2. Rename Files

 - Macabolic/MacabolicApp.swift → Hyperbolic/HyperbolicApp.swift
 - Macabolic/Macabolic.entitlements → Hyperbolic/Hyperbolic.entitlements
 - Macabolic.dmg → Hyperbolic.dmg (just rename, it's a distributable)

 3. Update Xcode Project (Macabolic.xcodeproj/project.pbxproj)

 - All file/group references: MacabolicApp.swift → HyperbolicApp.swift
 - Entitlements refs: Macabolic.entitlements → Hyperbolic.entitlements
 - Group path: path = Macabolic → path = Hyperbolic
 - productName = Macabolic → productName = Hyperbolic
 - CODE_SIGN_ENTITLEMENTS paths (Debug & Release)
 - INFOPLIST_FILE paths (Debug & Release)
 - INFOPLIST_KEY_CFBundleDisplayName (Debug & Release)
 - PRODUCT_BUNDLE_IDENTIFIER: com.bytemeowster.macabolic → com.bytemeowster.hyperbolic

 4. Update Info.plist (Macabolic/Info.plist)

 - Bundle URL name: com.bytemeowster.macabolic → com.bytemeowster.hyperbolic
 - URL scheme: macabolic → hyperbolic

 5. Update Localization Files

 - en.lproj/InfoPlist.strings: Display name, bundle name, copyright
 - tr.lproj/InfoPlist.strings: Display name, bundle name, copyright

 6. Update Swift Source Files

 - MacabolicApp.swift: Struct name MacabolicApp → HyperbolicApp, URL scheme refs, repo name, update script paths, all UI strings
 - MenuBarView.swift: Display text, URL scheme
 - ContentView.swift: .macabolicSidebarWidth() → .hyperbolicSidebarWidth()
 - PreferencesView.swift: .macabolicFormStyle() → .hyperbolicFormStyle(), test notification text, GitHub URL, app support directory name
 - YtdlpService.swift: Queue label, app support directory name
 - MenuBarManager.swift: Accessibility description
 - LanguageService.swift: All localization strings (~20+ occurrences)
 - View+Compatibility.swift: Function name macabolicFormStyle → hyperbolicFormStyle

 7. Update Browser Extensions

 Chrome (MacabolicExtension_Chrome/):
 - _locales/en/messages.json & _locales/tr/messages.json: extension name, description
 - background.js: menu item IDs, URL scheme

 Firefox (MacabolicExtension_Firefox/):
 - manifest.json: addon ID macabolic@... → hyperbolic@...
 - _locales/en/messages.json & _locales/tr/messages.json: same as Chrome
 - background.js: same as Chrome

 8. Update Documentation & Config

 - README.md: Title, descriptions, Homebrew tap refs, install instructions, GitHub URLs → offsideai/Hyperbolic
 - docs/index.html: Page title, all URLs, install instructions, GitHub API calls → offsideai/Hyperbolic
 - Credits.rtf: Title, legal text, GitHub URL → offsideai/Hyperbolic
 - .github/workflows/update-homebrew.yml: GitHub URLs → offsideai/Hyperbolic, DMG filename → Hyperbolic-*.dmg, Homebrew tap → offsideai/hyperbolic

 9. Update Xcode Scheme Files

 - Scheme management plists under xcuserdata/

 Execution Order

 1. Rename directories and files first (using git mv)
 2. Update all file contents (can be parallelized by file)
 3. Verify build compiles

 Verification

 - grep -ri "macabolic" . should return zero results (excluding binary files and git history)
 - Open Hyperbolic.xcodeproj in Xcode and verify it builds (Cmd+B)
 - Verify the app launches and displays "Hyperbolic" branding
