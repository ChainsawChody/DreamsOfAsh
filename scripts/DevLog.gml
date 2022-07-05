/*
------------ Game change notes ------------------

---------------
-- Year 2018 -- 
---------------
8/9/18
✓   - rm_cabin: Complete walls and sprite for entering room
    - rm_cabin: Add windows to cabin with light effect
✓   - rm_cabin: Create indoor/outdoor mask (duplicate room)
✓   - Fix attacking sprites, left-right
✓   - Make boomstick swap-able
✓   - Create obj_enemy_parent
✓   - Create lantern effect
✓   - Create light pulse
    - Create pigmen direction sprites

8/10/2018
    - Create inventory system (wood logs to furnace, meat to furnace) time = room_speed*5, burntime = time*woodamt
✓   - Fix dash effect
    - Lock player
    - Add killer grandma *(Kowalski)
✓   - Create fist attack sprites, modify weapons for altering 'attack'

8/11/2018
    - Fix view when switching rooms (follow player/view[0]?)
✓   - Fix pause menu options
✓   - Create death/restart
X   - Fix player_stats attack with weapon attack

8/12/2018
    - Decide on view[0] to follow obj.player or obj.view
!   - Fix player sprites when walking/sprinting
    - Add "Mulligan Forest" story
✓   - Random event black cat appears for +1/2 hp regen, cat flees *(Temptingfate)
?   - Make NPCs inherit from 'lifeform' with/or obj_speaker 
    - Fix lantern when dropped (scr_swap_weapon/scr_move_state)
✓   - Fix pickup effect & add item sprite image *(Razputini)
✓   - Create (pickup) item parent
✓   - Fix obj_lanterntree depth/origin
8/13/2018
✓   - Add sneak state / Enemy detection reduced
8/14/2018
✓   - Create baby pig pen
✓   - if(sprint_key) -= obj_player_stats.stamina
✓   - Fix obj_lighting
8/16/2018
    - Skills or bigger inventory space on level up. *(Anthony_Torres)
    - Lantern light direction follows player move direction
8/17/2018
    - Create dialog sound object created with obj_speaker then destroyed *(KimmyChameleon)
✓   - Destroy dialog when player is out of range *(KimmyChameleon)
    - Tree health / 3 wood + random / 
✓   - Fix stamtimer/sprint in scr_move_state
    - Fix repeat spell_key (boomstick) on keypress
✓   - Fix lighting on pause/deathroom
    - Fix item drop (increase drop) 
8/18/2018
✓   - Fix lighting on fullscreen
    - Fix load function
*   - Updated blood effect on enemy death
*   - Changed summon/eye function
*   - Updated cabin textures
*   - Added tree tiling
*   - Fixed intro text and sounds
*   - Fixed fullscreen scaling
*   - Added villagers in rm_town
*   - Added level up sound
*   - Added level up/summon notification
*   - Added bridge monster
?   - Add player damage * weapon damage 
!   - Add current weapon on screen
✓   - Updated gui (items)
    - Add necronomicon / cutscene
    - Enemy Spawner different array for each room's enemies in creation code, not create event
*   - Added player steps based on current room.
!   - Add damage/expr/healthup texts
    - Add barn/log sprites
    - Add window frame shadow to window light *(jnkns_chrstphr)
X   - Add fog to graveyard, if(instance_exists(obj_tombstone) instance_create(x, y - 16, obj_fog) *(MSTie)
✓   - ADD PUN'KINS
8/19/2018
    - Added fog, tombstones, cabinswing
    - Added tombstone writtings
    - Fixed cabin awning
    - Redid cabin room switching
    - Added lake room
8/20/2018
✓   - Add corn field
    - Add pumpkin patch
8/21/2018
*   - Updated GUI
*   - Added room title notifaction
    - "You could also add some other quests. For example, get some materials for a potion that would help 
       someone with a sickness. Or in a town, a kid tells you that he heard someone screaming and that there 
       are lots of creatures lurking the place and the person is screaming and as you get closer, you get a 
       notification that the screaming is getting louder. And when you help that person it turns out to be a 
       mini boss." *(Anthony_Torres)
    - Add childred to rm_cornfield / Red eyes moving in corn
*   - Fixed player sprites on sprint/sneak
    - Fix step sound on player
    - Add timer to after death
    //Kurtzorz
        - Change dialog, add second input for whole text page
        - Fix enemy ai, if wall > move around
        - Text for dialog too big
8/24/2018
    - Fixed step image_index and volume
    - Added villagers
8/25/2018
    - Added cabin/vice/gf
    - Updated window lighting
    - Modified cabin room switching/lighting
    - Added custom cursor
    - Changed Bean's dialog/death
    - Added necronomicon pages/gui display
8/27/2018
    - Added P0cket npc
    - Added shadow man
?   - Fix necro pages showing after finding first page
   
9/11/2018
!   - Assign unique boss to each area (Fisherman, children of the corn, butcher, graveyard boss)
    - Add wall objects, farm houses, slaughterhouse, cabin, etc
    - Fix dialog states/check events
9/12/2018
    - FIX ROOM PERSISTENCE
    - FIX DIALOG STATES/CHECK EVENTS
    - Added scarecrow boss in cornfield
!   - Bats as starting enemy?
10/1/2018
*   - Fixed bosstracker
10/3/2018
    - Change lantern pick to permanent and change weapon attack value
!   - Add cellar darkness monsters
10/18/2018
!   - Add pig outside of butcher room, chained up, unleashed once close enough, page on death.
    - Added buck head movement (1 out of 10 chance to trigger)

---------------    
-- Year 2021 --
---------------
09/13/21
    - Fixed misreferenced audio bug by marking all sounds as "Compressed - Streamed"
    - Fixed obj_view jolt on new room (setting x & y to player on room end)
    - Increased attack animation from .2 to .8
09/14/21
    - Disable blood/gore alpha fade (stays on screen)
    - Changed inventory text color to white
    - Created obj_npc_lifeform for animal lifeforms (to follow player without creating damage object)
09/20/21
    - Added swing sound changes based on weapon held (by sprite ID)
    - [DizzyDratini] Finished damage modifiers based on weapon pickup
    - Added boomstick animation
09/22/21
    - Added gore animation on lifeform death
09/23/21
    - Added directional walk animation for piglet
    - Added low health alert pulse
    - Made edits to rm_lake (moving water)
    - Edits to spr_window and spr_bug
09/24/21
    - Darkened GUI bars, fixed bosslifeform undefeatable bug
09/25/21
    - Balanced level up stats
    - Added enemy blood effect
    - Recolored enemy blood (transparent black)

---------------    
-- Year 2022 --
---------------
06/29/22
    - Added mouse movement to obj_view
    - Added mb_left as additional attack button
    - Adjusted Old_Woman sound file
?   - Recreate/Condense map world

07/05/22
    - Replaced pigmen idle audio and fixed gain for multiple instances
    - Resized ALL cabin rooms + lighting
    - Added basement barrier unless page found
    - Added cabin wall cutaway, fixed depth (-y-100)
    - Game starts at day, turns to night upon first page pickup
