# FlelkPack

All of Flelk's R.E.P.O. mods in one install.

| Mod | What it does | Who needs it |
| --- | --- | --- |
| **EnemyHP** | Enemy health bars and floating damage numbers | Only you |
| **MoreUpgrades** | More upgrades and items in the shop, a taller upgrade shelf sorted by color, set prices, better shopkeeper discount odds, F8/F9 strength keys | The host, and everyone else should have it too |
| **LootScanner** | H scans your room and shows its loot and values, J toggles a loot checklist | Only you |
| **RepoCoins** | 1 cosmetic coin for each level you complete | Only you |

## Install
In r2modman: Settings → *Import local mod* → choose `FlelkPack-x.y.z.zip`, then *Start modded*.

**Already have any of these mods installed separately? Uninstall them first**, so each mod is only installed once. Your settings carry over.

## Settings
Each mod keeps its own config file, which you can edit in r2modman's Config editor:
`gabe.enemyhp.cfg`, `gabe.moreupgrades.cfg`, `gabe.lootscanner.cfg`, `gabe.repocoins.cfg`.

To turn off the F8/F9 strength keys, set `StrengthHotkeys` to false in `gabe.moreupgrades.cfg`.

## Good to know
- If the host doesn't have MoreUpgrades, its shop changes don't apply. If you have it and others don't, the host can set `ExtraShelfLevels` to 0 so upgrades don't look like they're floating for them.
- RepoCoins backs up your save before giving its first coin, to `MetaSave.es3.repocoins-backup` in `%USERPROFILE%\AppData\LocalLow\semiwork\Repo`.
