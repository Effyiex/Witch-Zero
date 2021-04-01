
# Resetting Gamerules
gamerule doDaylightCycle true
gamerule doWeatherCycle true
gamerule doFireTick true

# Resetting Mood
weather clear
time set day

# Resetting Boss-Mode
scoreboard players set IsBossSpawned WiZe.Values 0
scoreboard players set BossSpawning WiZe.Values 0

# Cancel Ambient Sounds
stopsound @a ambient minecraft:ambient.soul_sand_valley.mood

# Custom Execution Message
gamerule sendCommandFeedback false
