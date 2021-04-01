
# Creating Temp Values to check for changes
scoreboard players operation TempHarming WiZe.Values = HasHarming WiZe.Values
scoreboard players operation TempPoison WiZe.Values = HasPoison WiZe.Values
scoreboard players operation TempSlowness WiZe.Values = HasSlowness WiZe.Values
scoreboard players operation TempWeakness WiZe.Values = HasWeakness WiZe.Values
scoreboard players set TempReset WiZe.Values 0

# Adding potions to criteria
execute as @e[type=item,nbt={Item:{id:"minecraft:splash_potion",tag:{Potion:"minecraft:slowness"}}}] at @s if block ~ ~ ~ cauldron[level=3] run scoreboard players set HasSlowness WiZe.Values 1
execute as @e[type=item,nbt={Item:{id:"minecraft:splash_potion",tag:{Potion:"minecraft:harming"}}}] at @s if block ~ ~ ~ cauldron[level=3] run scoreboard players set HasHarming WiZe.Values 1
execute as @e[type=item,nbt={Item:{id:"minecraft:splash_potion",tag:{Potion:"minecraft:poison"}}}] at @s if block ~ ~ ~ cauldron[level=3] run scoreboard players set HasPoison WiZe.Values 1
execute as @e[type=item,nbt={Item:{id:"minecraft:splash_potion",tag:{Potion:"minecraft:weakness"}}}] at @s if block ~ ~ ~ cauldron[level=3] run scoreboard players set HasWeakness WiZe.Values 1

# Looking for changes to fulfil Potion-Addition
execute if score TempHarming WiZe.Values = False WiZe.Values unless score TempHarming WiZe.Values = HasHarming WiZe.Values run scoreboard players set TempReset WiZe.Values 1
execute if score TempSlowness WiZe.Values = False WiZe.Values unless score TempSlowness WiZe.Values = HasSlowness WiZe.Values run scoreboard players set TempReset WiZe.Values 1
execute if score TempPoison WiZe.Values = False WiZe.Values unless score TempPoison WiZe.Values = HasPoison WiZe.Values run scoreboard players set TempReset WiZe.Values 1
execute if score TempWeakness WiZe.Values = False WiZe.Values unless score TempWeakness WiZe.Values = HasWeakness WiZe.Values run scoreboard players set TempReset WiZe.Values 1

# Fulfilling Potion Addition
execute if score TempReset WiZe.Values = True WiZe.Values run kill @e[type=item,nbt={Item:{id:"minecraft:splash_potion"}}]
execute if score TempReset WiZe.Values = True WiZe.Values as @a at @s run playsound minecraft:block.beacon.power_select player @s ~ ~ ~ 1 1
execute if score TempReset WiZe.Values = True WiZe.Values if score PotionCount WiZe.Values < PotionLimit WiZe.Values run scoreboard players add PotionCount WiZe.Values 1

# Potions Left Output
scoreboard players operation TempPotions WiZe.Values = PotionLimit WiZe.Values
scoreboard players operation TempPotions WiZe.Values -= PotionCount WiZe.Values
execute if score TempReset WiZe.Values = True WiZe.Values if score TempPotions WiZe.Values > Null WiZe.Values run tellraw @a ["",{"text":"[WiZe]: ","color":"gold"},{"text":"Potions left: "},{"score":{"name":"TempPotions","objective":"WiZe.Values"},"color":"green"}]
scoreboard players reset TempPotions

# Resetting Temp Values
scoreboard players reset TempHarming WiZe.Values
scoreboard players reset TempPoison WiZe.Values
scoreboard players reset TempSlowness WiZe.Values
scoreboard players reset TempWeakness WiZe.Values
scoreboard players reset TempReset WiZe.Values
