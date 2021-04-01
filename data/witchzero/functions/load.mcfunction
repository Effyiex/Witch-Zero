
# Scoreboard Objectives
scoreboard objectives add WiZe.Received dummy
scoreboard objectives add WiZe.Values dummy
scoreboard objectives add WiZe.DeathEvent deathCount
scoreboard objectives add WiZe.LecternUse minecraft.used:minecraft.lectern
scoreboard objectives add WiZe.LecternDel minecraft.mined:minecraft.lectern

# General Definitions (Keywords)
scoreboard players set Null WiZe.Values 0
scoreboard players set False WiZe.Values 0
scoreboard players set True WiZe.Values 1

# General Definitions (Datapack)
scoreboard players set IsBossSpawned WiZe.Values 0
scoreboard players set Debugging WiZe.Values 1
scoreboard players set IsAltarBuilt WiZe.Values 0

# General Definitions (Timers)
scoreboard players set BossSpawning WiZe.Values 0
scoreboard players set MaxBossSpawning WiZe.Values 420
scoreboard players set AmbientTick WiZe.Values 0
scoreboard players set MaxAmbientTick WiZe.Values 120

# Definitions of Altar Ingredients
function witchzero:load_potions

# Custom Execution Message
gamerule sendCommandFeedback false
execute if score Debugging WiZe.Values = True WiZe.Values run tellraw @a {"text":"§6[WiZe]: §rSuccessfully (Re-)loaded Datapack!"}
