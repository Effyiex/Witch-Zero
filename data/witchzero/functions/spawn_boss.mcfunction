
# Setup of gamerules
gamerule doDaylightCycle false
gamerule doWeatherCycle false
gamerule doFireTick false

# Setup of Mood
time set midnight
weather thunder

# Resetting the Potion-Checking-System
function witchzero:load_potions

# Switching to Boss-Mode
scoreboard players set IsBossSpawned WiZe.Values 1
tellraw @a {"text":"§6[WiZe]: §rSpawning Boss..."}

# Custom Execution Message
gamerule sendCommandFeedback false
