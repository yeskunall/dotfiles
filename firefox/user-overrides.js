// __       __
// /  |     /  |
// __    __  _______  ______   ______          ______  __     __ ______   ______   ______ $$/  ____$$ | ______   _______       __  _______
// /  |  /  |/       |/      \ /      \ ______ /      \/  \   /  /      \ /      \ /      \/  |/    $$ |/      \ /       |     /  |/       |
// $$ |  $$ /$$$$$$$//$$$$$$  /$$$$$$  /      /$$$$$$  $$  \ /$$/$$$$$$  /$$$$$$  /$$$$$$  $$ /$$$$$$$ /$$$$$$  /$$$$$$$/      $$//$$$$$$$/
// $$ |  $$ $$      \$$    $$ $$ |  $$/$$$$$$/$$ |  $$ |$$  /$$/$$    $$ $$ |  $$/$$ |  $$/$$ $$ |  $$ $$    $$ $$      \      /  $$      \
// $$ \__$$ |$$$$$$  $$$$$$$$/$$ |            $$ \__$$ | $$ $$/ $$$$$$$$/$$ |     $$ |     $$ $$ \__$$ $$$$$$$$/ $$$$$$  __    $$ |$$$$$$  |
// $$    $$//     $$/$$       $$ |            $$    $$/   $$$/  $$       $$ |     $$ |     $$ $$    $$ $$       /     $$/  |   $$ /     $$/
// $$$$$$/ $$$$$$$/  $$$$$$$/$$/              $$$$$$/     $/    $$$$$$$/$$/      $$/      $$/ $$$$$$$/ $$$$$$$/$$$$$$$/$$__   $$ $$$$$$$/
//                               /  \__$$ |
//                               $$    $$/
//                                $$$$$$/
//
//
// https://github.com/arkenfox/user.js

// If not set, Firefox pins Google by default
user_pref("browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned", "ddg");

// Use CIRA as the default Trusted Recursive Resolver (TRR) for Firefox
// See https://blog.mozilla.org/mozilla/news/firefox-by-default-dns-over-https-rollout-in-canada/ for more.
user_pref("doh-rollout.home-region", "CA");

// Do not clear history when Firefox closes
user_pref("privacy.clearOnShutdown.history", false);

// Do not ask to save logins and passwords for websites
user_pref("signon.rememberSignons", false);

// Disable Container Tabs
user_pref("privacy.userContext.enabled", false);
