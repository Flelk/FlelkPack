# FlelkPack

Packages the R.E.P.O. mods in `..\EnemyHP`, `..\MoreUpgrades`, `..\LootScanner` and `..\RepoCoins` into one r2modman zip. The mods stay separate projects, and each keeps its own DLL and config file.

`.\build.ps1` packs each mod's built zip for the version in its manifest into `dist\FlelkPack-x.y.z.zip`, so build a mod first if you changed it. `.\build.ps1 -Install` also copies the result into the `repo` r2modman profile. To release a change, bump `thunderstore\manifest.json` and add it to the changelog.
