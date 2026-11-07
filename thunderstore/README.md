# FlelkPack

All of Flelk's R.E.P.O. mods in one install.

| Mod | What it does | Who needs it |
| --- | --- | --- |
| **EnemyHP** | Enemy health bars and floating damage numbers | Only you |
| **MoreUpgrades** | More upgrades and items in the shop, a taller upgrade shelf sorted by color, set prices, better shopkeeper discount odds, F8/F9 strength keys | The host, and everyone else should have it too |
| **LootScanner** | H scans your room and shows its loot and values, J toggles a loot checklist | Only you |
| **RepoCoins** | 1 cosmetic coin for each level you complete | Only you |
| **Skinwalker** | A monster that copies your team's voices, lures you around corners, drags you off and can walk back looking like you | Everyone in the lobby |

## Your voice
**Skinwalker records voice chat, so make sure everyone in your lobby knows and agrees.** Clips of what you say are sent to the other players in your lobby. They stay in memory and are never saved to disk. To opt out, set `ShareMyVoice` to false in `flelk.skinwalker.cfg`, and your mic isn't captured at all.

## Install
In r2modman: Settings → *Import local mod* → choose `FlelkPack-x.y.z.zip`, then *Start modded*.

**Already have any of these mods installed separately? Uninstall them first**, so each mod is only installed once. Your settings carry over, except that this update resets them once.

## Settings
Each mod keeps its own config file, which you can edit in r2modman's Config editor:
`flelk.enemyhp.cfg`, `flelk.moreupgrades.cfg`, `flelk.lootscanner.cfg`, `flelk.repocoins.cfg`, `flelk.skinwalker.cfg`.

To turn off the F8/F9 strength keys, set `StrengthHotkeys` to false in `flelk.moreupgrades.cfg`.

## Good to know
- If the host doesn't have MoreUpgrades, its shop changes don't apply. If you have it and others don't, the host can set `ExtraShelfLevels` to 0 so upgrades don't look like they're floating for them.
- RepoCoins backs up your save before giving its first coin, to `MetaSave.es3.repocoins-backup` in `%USERPROFILE%\AppData\LocalLow\semiwork\Repo`.
