
# Reset of Gamerules
gamerule sendCommandFeedback true

# Scoreboard Values != Undefined
scoreboard players add @a WiZe.Received 0

# Spreading the manual onto players without any book
give @a[scores={WiZe.Received=0}] written_book{pages:['{"text":"\\n\\n\\n\\n\\n   §0A guide to spawn:\\n      §6§kWitch §6§lZero"}', '{"text":"\\n§nTo be collected:§r\\n\\n - a Lectern\\n - a Cauldron\\n - a Water Bucket\\n    or 3 Water Bottles "}'],title:"§6§kWitch §6Zero / Manual",author:Effyiex}
scoreboard players add @a[scores={WiZe.Received=0}] WiZe.Received 1

# Player Death Listener
execute if score IsBossSpawned WiZe.Values = True WiZe.Values as @a[tag=WiZe.PlayerAlive,scores={WiZe.DeathEvent=1..}] run tellraw @a ["",{"selector":"@s","color":"green"},{"text":" died trying to defeat "},{"text":"Witch Zero","color":"gold"},{"text":"."}]
execute as @a[tag=WiZe.PlayerAlive,scores={WiZe.DeathEvent=1..}] run function witchzero:reset_boss
execute if entity @a[tag=WiZe.PlayerAlive,scores={WiZe.DeathEvent=1..}] run function witchzero:clear_books
tag @a[scores={WiZe.DeathEvent=1..}] remove WiZe.PlayerAlive
tag @e[type=player] add WiZe.PlayerAlive
scoreboard players reset @a[tag=WiZe.PlayerAlive,scores={WiZe.DeathEvent=1..}] WiZe.Received
scoreboard players reset @a[tag=WiZe.PlayerAlive] WiZe.DeathEvent

# Switch Vanilla Death Messages
execute if score IsBossSpawned WiZe.Values = True WiZe.Values run gamerule showDeathMessages false
execute if score IsBossSpawned WiZe.Values = False WiZe.Values run gamerule showDeathMessages true

# Await Lectern Place Event
execute as @a if score @s WiZe.LecternUse > Null WiZe.Values run function witchzero:spawn_observer
scoreboard players reset @a WiZe.LecternUse

# Await Lectern Destroy Event
execute if entity @a[scores={WiZe.LecternDel=1..}] run kill @e[tag=WiZe.Observer,distance=..16]
scoreboard players reset @a WiZe.LecternDel

# Check for Altar being built
scoreboard players set LecternHasBook WiZe.Values 0
scoreboard players set CauldronFilled WiZe.Values 0
execute as @e[tag=WiZe.Observer] at @s if block ~ ~ ~ lectern[has_book=true] run scoreboard players set LecternHasBook WiZe.Values 1
execute if score LecternHasBook WiZe.Values = True WiZe.Values as @e[tag=WiZe.Observer] at @s if block ~-1 ~ ~ cauldron[level=3] run scoreboard players set CauldronFilled WiZe.Values 1
execute if score LecternHasBook WiZe.Values = True WiZe.Values as @e[tag=WiZe.Observer] at @s if block ~1 ~ ~ cauldron[level=3] run scoreboard players set CauldronFilled WiZe.Values 1
execute if score LecternHasBook WiZe.Values = True WiZe.Values as @e[tag=WiZe.Observer] at @s if block ~ ~ ~-1 cauldron[level=3] run scoreboard players set CauldronFilled WiZe.Values 1
execute if score LecternHasBook WiZe.Values = True WiZe.Values as @e[tag=WiZe.Observer] at @s if block ~ ~ ~1 cauldron[level=3] run scoreboard players set CauldronFilled WiZe.Values 1
execute if score LecternHasBook WiZe.Values = True WiZe.Values if score CauldronFilled WiZe.Values = True WiZe.Values if score IsAltarBuilt WiZe.Values = False WiZe.Values run tellraw @a {"text":"§6[WiZe]:§r You successfully built the Altar!"}
scoreboard players set IsAltarBuilt WiZe.Values 0
execute if score LecternHasBook WiZe.Values = True WiZe.Values if score CauldronFilled WiZe.Values = True WiZe.Values run scoreboard players set IsAltarBuilt WiZe.Values 1
scoreboard players reset LecternHasBook WiZe.Values
scoreboard players reset CauldronFilled WiZe.Values

# Spawn Cauldron Particles
execute if score IsAltarBuilt WiZe.Values = True WiZe.Values as @e[tag=WiZe.Observer] at @s if block ~1 ~ ~ cauldron[level=3] run particle bubble_pop ~1.1 ~0.8 ~-0.1 0.2 0.2 0.2 0.01 8 normal
execute if score IsAltarBuilt WiZe.Values = True WiZe.Values as @e[tag=WiZe.Observer] at @s if block ~-1 ~ ~ cauldron[level=3] run particle bubble_pop ~-0.9 ~0.8 ~0.1 0.2 0.2 0.2 0.01 8 normal
execute if score IsAltarBuilt WiZe.Values = True WiZe.Values as @e[tag=WiZe.Observer] at @s if block ~ ~ ~1 cauldron[level=3] run particle bubble_pop ~0.2 ~0.8 ~1.1 0.2 0.2 0.2 0.01 8 normal
execute if score IsAltarBuilt WiZe.Values = True WiZe.Values as @e[tag=WiZe.Observer] at @s if block ~ ~ ~-1 cauldron[level=3] run particle bubble_pop ~0.2 ~0.8 ~-1.1 0.2 0.2 0.2 0.01 8 normal

# Check for Potions
execute if score IsAltarBuilt WiZe.Values = True WiZe.Values run function witchzero:check_potions
execute if score IsBossSpawned WiZe.Values = False WiZe.Values if score PotionCount WiZe.Values >= PotionLimit WiZe.Values run function witchzero:spawn_boss

# Play scary Sounds
execute if score IsBossSpawned WiZe.Values = True WiZe.Values if score AmbientTick WiZe.Values <= Null WiZe.Values as @a at @s run playsound minecraft:ambient.soul_sand_valley.mood ambient @s ~ ~ ~ 0.5 0.25
execute if score IsBossSpawned WiZe.Values = True WiZe.Values if score AmbientTick WiZe.Values <= Null WiZe.Values as @a at @s run playsound minecraft:ambient.soul_sand_valley.mood ambient @s ~ ~ ~ 0.5 0.25
execute if score BossSpawning WiZe.Values = MaxBossSpawning WiZe.Values as @a at @s run playsound minecraft:entity.witch.celebrate voice @s ~ ~ ~ 1 1.75

# Struck Lightning
execute if score BossSpawning WiZe.Values = MaxBossSpawning WiZe.Values if score IsAltarBuilt WiZe.Values = True WiZe.Values as @e[tag=WiZe.Observer] at @s if block ~1 ~ ~ cauldron[level=3] run summon lightning_bolt ~1 ~ ~
execute if score BossSpawning WiZe.Values = MaxBossSpawning WiZe.Values if score IsAltarBuilt WiZe.Values = True WiZe.Values as @e[tag=WiZe.Observer] at @s if block ~-1 ~ ~ cauldron[level=3] run summon lightning_bolt ~-1 ~ ~
execute if score BossSpawning WiZe.Values = MaxBossSpawning WiZe.Values if score IsAltarBuilt WiZe.Values = True WiZe.Values as @e[tag=WiZe.Observer] at @s if block ~ ~ ~1 cauldron[level=3] run summon lightning_bolt ~ ~ ~1
execute if score BossSpawning WiZe.Values = MaxBossSpawning WiZe.Values if score IsAltarBuilt WiZe.Values = True WiZe.Values as @e[tag=WiZe.Observer] at @s if block ~ ~ ~-1 cauldron[level=3] run summon lightning_bolt ~ ~ ~-1

# Handling Timers
execute if score IsBossSpawned WiZe.Values = True WiZe.Values if score BossSpawning WiZe.Values <= MaxBossSpawning WiZe.Values run scoreboard players add BossSpawning WiZe.Values 1
scoreboard players add AmbientTick WiZe.Values 1
execute if score AmbientTick WiZe.Values > MaxAmbientTick WiZe.Values run scoreboard players set AmbientTick WiZe.Values 0
