// Fullscreen
/atom/movable/screen/atrakor_background
	name = "skeuomorphism"
	icon = 'icons/hud_atrakor/fullscreen.dmi'
	icon_state = "background"
	plane = FULLSCREEN_PLANE
	layer = FULLSCREEN_HUD_LAYER

// Combat Switch
/atom/movable/screen/combattoggle/aircraft
	name = "toggle combat mode"
	icon = 'icons/hud_atrakor/combat_section.dmi'
	icon_state = "not_combat"
	screen_loc = "CENTER+5,SOUTH+0"
	mouse_over_pointer = MOUSE_HAND_POINTER

// Movement speed
/atom/movable/screen/mov_intent_bar
	name = "movement speed"
	icon = 'icons/hud_atrakor/the_speed_is_a_lot.dmi'
	icon_state = "running"

/atom/movable/screen/mov_intent/update_icon_state()
	if(!hud || !hud.mymob || !isliving(hud.mymob))
		return
	var/mob/living/living_hud_owner = hud.mymob
	switch(living_hud_owner.move_intent)
		if(MOVE_INTENT_WALK)
			icon_state = "walking"
		if(MOVE_INTENT_RUN)
			icon_state = "running"
	return ..()

// Health Check Button
/atom/movable/screen/healthchecker
	name = "health status"
	icon = 'icons/hud_atrakor/hud_buttons.dmi'
	icon_state = "health_off"
	mouse_over_pointer = MOUSE_HAND_POINTER

/atom/movable/screen/healthchecker/Click()
	if (iscarbon(usr))
		var/mob/living/carbon/C = usr
		C.check_self_for_injuries()

/atom/movable/screen/healthchecker/update_icon_state()
	var/mob/living/carbon/user = hud?.mymob
	if(!istype(user))
		return ..()
	if(length(user.all_wounds))
		icon_state = "health_wound"
	else
		icon_state = "health_off"
	return ..()

// Healthbar
/atom/movable/screen/healthbar
	name = "health"
	icon = 'icons/hud_atrakor/stat_bars_x96.dmi'
	icon_state = "health_14"

/atom/movable/screen/healthbar/update_icon_state()
	var/mob/living/carbon/user = hud?.mymob
	if(!istype(user))
		return ..()
	if(user.health <= HEALTH_THRESHOLD_DEAD)
		icon_state = "health_dead"
		return ..()
	if(user.health <= HEALTH_THRESHOLD_FULLCRIT)
		icon_state = "health_crit_deep"
		return ..()
	if(user.health <= HEALTH_THRESHOLD_CRIT)
		icon_state = "health_crit"
		return ..()
	var/number_of_bars = ceil(user.health / (MAX_HEALTH_REAL / 14)) // 14 bars in the thing
	icon_state = "health_[number_of_bars]"
	return ..()

// Stambar
/atom/movable/screen/stambar
	name = "stamina"
	icon = 'icons/hud_atrakor/stat_bars_x96.dmi'
	icon_state = "stam_14"

/atom/movable/screen/stambar/update_icon_state(shown_stamina_loss)
	var/mob/living/carbon/user = hud?.mymob
	if(!istype(user))
		return ..()
	if(shown_stamina_loss >= HEALTH_THRESHOLD_CRIT)
		icon_state = "stam_crit"
		return ..()
	var/number_of_bars = min(1, ceil((MAX_STAMINA_REAL - shown_stamina_loss) / (MAX_STAMINA_REAL / 14))) // 14 bars in the thing
	icon_state = "stam_[number_of_bars]"
	return ..()
