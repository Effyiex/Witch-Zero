
# Clear old Observer
kill @e[tag=WiZe.Observer]

# Spawn Observer on the Lectern as a Base
execute as @a[scores={WiZe.LecternUse=1..}] at @s if block ~-1 ~ ~ lectern run summon armor_stand ~-1 ~ ~ {NoGravity:1b,Small:1b,Invisible:1b,Tags:["WiZe.Observer"]}
execute as @a[scores={WiZe.LecternUse=1..}] at @s if block ~-1 ~ ~-1 lectern run summon armor_stand ~-1 ~ ~-1 {NoGravity:1b,Small:1b,Invisible:1b,Tags:["WiZe.Observer"]}
execute as @a[scores={WiZe.LecternUse=1..}] at @s if block ~-1 ~ ~1 lectern run summon armor_stand ~-1 ~ ~1 {NoGravity:1b,Small:1b,Invisible:1b,Tags:["WiZe.Observer"]}
execute as @a[scores={WiZe.LecternUse=1..}] at @s if block ~1 ~ ~-1 lectern run summon armor_stand ~1 ~ ~-1 {NoGravity:1b,Small:1b,Invisible:1b,Tags:["WiZe.Observer"]}
execute as @a[scores={WiZe.LecternUse=1..}] at @s if block ~1 ~ ~ lectern run summon armor_stand ~1 ~ ~ {NoGravity:1b,Small:1b,Invisible:1b,Tags:["WiZe.Observer"]}
execute as @a[scores={WiZe.LecternUse=1..}] at @s if block ~1 ~ ~1 lectern run summon armor_stand ~1 ~ ~1 {NoGravity:1b,Small:1b,Invisible:1b,Tags:["WiZe.Observer"]}
execute as @a[scores={WiZe.LecternUse=1..}] at @s if block ~ ~ ~-1 lectern run summon armor_stand ~ ~ ~-1 {NoGravity:1b,Small:1b,Invisible:1b,Tags:["WiZe.Observer"]}
execute as @a[scores={WiZe.LecternUse=1..}] at @s if block ~ ~ ~1 lectern run summon armor_stand ~ ~ ~1 {NoGravity:1b,Small:1b,Invisible:1b,Tags:["WiZe.Observer"]}
