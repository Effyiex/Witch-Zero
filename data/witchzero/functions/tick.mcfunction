
# Reset of Gamerules
gamerule sendCommandFeedback true

# Scoreboard Values != Undefined
scoreboard players add @a WiZe.Received 0

# Spreading the manual onto players without any book
give @a[scores={WiZe.Received=0}] written_book{pages:['{"text":"\\n\\n\\n\\n\\n   §0A guide to spawn:\\n      §6§kWitch §6§lZero"}', '{"text":"\\n§nTo be collected:§r\\n\\n - a Lectern\\n - a Cauldron\\n - a Water Bucket\\n    or 3 Water Bottles "}'],title:"§6§kWitch §6Zero / Manual",author:Effyiex}
scoreboard players add @a[scores={WiZe.Received=0}] WiZe.Received 1

# Player Death Listener
execute if score IsBossSpawned WiZe.Values = True WiZe.Values as @a[tag=WiZe.PlayerAlive,scores={WiZe.DeathEvent=1..}] run tellraw @a ["",{"selector":"@s","color":"green"},{"text":" died in a fight with "},{"text":"Witch Zero","color":"gold"},{"text":"."}]
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
