
gamerule sendCommandFeedback false
kill @e[type=item,nbt={Item:{id:"minecraft:written_book"}}]
execute if score Debugging WiZe.Values = True WiZe.Values run tellraw @s {"text":"§6[WiZe]: §rSuccessfully killed all Book-Entities!"}
