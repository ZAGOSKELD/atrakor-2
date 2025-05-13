/atom/movable/screen/human
	icon = 'icons/hud/screen_midnight.dmi'

/atom/movable/screen/human/toggle
	name = "toggle"
	icon_state = "toggle"
	base_icon_state = "toggle"
	mouse_over_pointer = MOUSE_HAND_POINTER

/atom/movable/screen/human/toggle/Click()

	var/mob/targetmob = usr

	if(isobserver(usr))
		if(ishuman(usr.client.eye) && (usr.client.eye != usr))
			var/mob/M = usr.client.eye
			targetmob = M

	if(usr.hud_used.inventory_shown && targetmob.hud_used)
		usr.hud_used.inventory_shown = FALSE
		usr.client.screen -= targetmob.hud_used.toggleable_inventory
	else
		usr.hud_used.inventory_shown = TRUE
		usr.client.screen += targetmob.hud_used.toggleable_inventory

	targetmob.hud_used.hidden_inventory_update(usr)
	update_appearance()

/atom/movable/screen/human/toggle/update_icon_state()
	icon_state = "[base_icon_state][hud?.inventory_shown ? "_active" : ""]"
	return ..()

/atom/movable/screen/ling
	icon = 'icons/hud/screen_changeling.dmi'

/atom/movable/screen/ling/chems
	name = "chemical storage"
	icon_state = "power_display"
	screen_loc = ui_lingchemdisplay

/atom/movable/screen/ling/sting
	name = "current sting"
	screen_loc = ui_lingstingdisplay
	invisibility = INVISIBILITY_ABSTRACT
	mouse_over_pointer = MOUSE_HAND_POINTER

/atom/movable/screen/ling/sting/Click()
	if(isobserver(usr))
		return
	var/mob/living/carbon/carbon_user = usr
	carbon_user.unset_sting()

/datum/hud/human/New(mob/living/carbon/human/owner)
	..()

	var/atom/movable/screen/using
	var/atom/movable/screen/inventory/inv_box

	using = new /atom/movable/screen/atrakor_background(null, src)
	using.screen_loc = "WEST+0,SOUTH+0"
	static_inventory += using

	using = new /atom/movable/screen/language_menu(null, src)
	using.screen_loc = "EAST-1:-16,SOUTH+5:16"
	static_inventory += using

	action_intent = new /atom/movable/screen/combattoggle/aircraft(null, src)
	action_intent.screen_loc = "CENTER+5,SOUTH+0"
	static_inventory += action_intent

	floor_change = new /atom/movable/screen/floor_changer/vertical(null, src)
	floor_change.screen_loc = "CENTER+7:2,SOUTH+1:16"
	static_inventory += floor_change

	using = new /atom/movable/screen/mov_intent(null, src)
	using.icon_state = (owner.move_intent == MOVE_INTENT_RUN ? "running" : "walking")
	using.screen_loc = "CENTER+7:2,SOUTH+0:16"
	static_inventory += using

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "uniform"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.slot_id = ITEM_SLOT_ICLOTHING
	inv_box.icon_state = "under"
	inv_box.icon_full = "clothes_full"
	inv_box.screen_loc = "LEFT+1:16,SOUTH:16"
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "armor"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.slot_id = ITEM_SLOT_ARMOR
	inv_box.icon_state = "vest"
	inv_box.icon_full = "clothes_full"
	inv_box.screen_loc = "LEFT+1:16,SOUTH+1:16"
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "suit"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.slot_id = ITEM_SLOT_OCLOTHING
	inv_box.icon_state = "jacket"
	inv_box.icon_full = "clothes_full"
	inv_box.screen_loc = "LEFT+1:16,SOUTH+2:16"
	static_inventory += inv_box

	build_hand_slots()

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "mask"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.icon_state = "mask"
	inv_box.icon_full = "clothes_full"
	inv_box.screen_loc = "LEFT+2:16,SOUTH+2:16"
	inv_box.slot_id = ITEM_SLOT_MASK
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "neck"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.icon_state = "neck"
	inv_box.icon_full = "clothes_full"
	inv_box.screen_loc = "LEFT+2:16,SOUTH+1:16"
	inv_box.slot_id = ITEM_SLOT_NECK
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "special"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.icon_state = "store_spec"
	inv_box.icon_full = "clothes_full"
	inv_box.screen_loc = "LEFT+0:16,SOUTH+5:16"
	inv_box.slot_id = ITEM_SLOT_SPEC_STORAGE
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "backpack"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.icon_state = "store_back"
	inv_box.icon_full = "clothes_full"
	inv_box.screen_loc = "LEFT+0:16,SOUTH+6:16"
	inv_box.slot_id = ITEM_SLOT_BACK
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "belt"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.icon_state = "store_belt"
	inv_box.icon_full = "clothes_full"
	inv_box.screen_loc = "LEFT+0:16,SOUTH+7:16"
	inv_box.slot_id = ITEM_SLOT_BELT_STORAGE
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "chest"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.icon_state = "store_chest"
	inv_box.icon_full = "clothes_full"
	inv_box.screen_loc = "LEFT+0:16,SOUTH+8:16"
	inv_box.slot_id = ITEM_SLOT_CHEST_STORAGE
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "left pocket"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.icon_state = "leftpocket"
	inv_box.icon_full = "leftpocket_full"
	inv_box.screen_loc = "CENTER-3,SOUTH+0:16"
	inv_box.slot_id = ITEM_SLOT_LPOCKET
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "right pocket"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.icon_state = "rightpocket"
	inv_box.icon_full = "rightpocket_full"
	inv_box.screen_loc = "CENTER-2,SOUTH+0:16"
	inv_box.slot_id = ITEM_SLOT_RPOCKET
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "sling"
	inv_box.icon = 'icons/hud_atrakor/hud_x48.dmi'
	inv_box.icon_state = "sling"
	inv_box.icon_full = "sling_full"
	inv_box.screen_loc = "CENTER+3,SOUTH+0:16"
	inv_box.slot_id = ITEM_SLOT_SUITSTORE
	static_inventory += inv_box

	resist_icon = new /atom/movable/screen/resist(null, src)
	resist_icon.screen_loc = "EAST-1:-16,SOUTH+4"
	hotkeybuttons += resist_icon

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "gloves"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.icon_state = "gloves"
	inv_box.icon_full = "clothes_full"
	inv_box.screen_loc = "LEFT+0:16,SOUTH+1:16"
	inv_box.slot_id = ITEM_SLOT_GLOVES
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "eyes"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.icon_state = "glasses"
	inv_box.icon_full = "clothes_full"
	inv_box.screen_loc = "LEFT+0:16,SOUTH+2:16"
	inv_box.slot_id = ITEM_SLOT_EYES
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "ears"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.icon_state = "ears"
	inv_box.icon_full = "clothes_full"
	inv_box.screen_loc = "LEFT+2:16,SOUTH+3:16"
	inv_box.slot_id = ITEM_SLOT_EARS
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "head"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.icon_state = "hat"
	inv_box.icon_full = "clothes_full"
	inv_box.screen_loc = "LEFT+1:16,SOUTH+3:16"
	inv_box.slot_id = ITEM_SLOT_HEAD
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "shoes"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.icon_state = "shoes"
	inv_box.icon_full = "clothes_full"
	inv_box.screen_loc = "LEFT+0:16,SOUTH+0:16"
	inv_box.slot_id = ITEM_SLOT_FEET
	static_inventory += inv_box

	inv_box = new /atom/movable/screen/inventory(null, src)
	inv_box.name = "holster"
	inv_box.icon = 'icons/hud_atrakor/hud_x32.dmi'
	inv_box.icon_state = "holster"
	inv_box.icon_full = "holster_full"
	inv_box.screen_loc = "CENTER+2,SOUTH+0:16"
	inv_box.slot_id = ITEM_SLOT_BELT
	static_inventory += inv_box

	throw_icon = new /atom/movable/screen/throw_catch(null, src)
	throw_icon.screen_loc = "EAST-1:-16,SOUTH+5"
	hotkeybuttons += throw_icon

	rest_icon = new /atom/movable/screen/rest(null, src)
	rest_icon.screen_loc = "EAST-1:-16,SOUTH+4:16"
	rest_icon.update_appearance()
	static_inventory += rest_icon

	//spacesuit = new /atom/movable/screen/spacesuit(null, src)
	//infodisplay += spacesuit

	//healths = new /atom/movable/screen/healths(null, src)
	//infodisplay += healths

	//hunger = new /atom/movable/screen/hunger(null, src)
	//infodisplay += hunger

	//healthdoll = new /atom/movable/screen/healthdoll/human(null, src)
	//infodisplay += healthdoll

	//stamina = new /atom/movable/screen/stamina(null, src)
	//infodisplay += stamina

	healthbutton = new /atom/movable/screen/healthchecker(null, src)
	healthbutton.screen_loc = "EAST-1:-16,SOUTH+6"
	infodisplay += healthbutton

	healthbar = new /atom/movable/screen/healthbar(null, src)
	healthbar.screen_loc = "CENTER-1,SOUTH+1:16"
	infodisplay += healthbar

	stambar = new /atom/movable/screen/stambar(null, src)
	stambar.screen_loc = "CENTER-1,SOUTH+1:16"
	infodisplay += stambar

	pull_icon = new /atom/movable/screen/pull(null, src)
	pull_icon.screen_loc = "EAST-2:-16,SOUTH+3:16"
	pull_icon.update_appearance()
	static_inventory += pull_icon

	zone_select = new /atom/movable/screen/zone_sel(null, src)
	zone_select.update_appearance()
	static_inventory += zone_select

	for(var/atom/movable/screen/inventory/inv in (static_inventory + toggleable_inventory))
		if(inv.slot_id)
			inv_slots[TOBITSHIFT(inv.slot_id) + 1] = inv
			inv.update_appearance()

	update_locked_slots()

/datum/hud/human/update_locked_slots()
	if(!mymob)
		return
	var/blocked_slots = NONE

	var/mob/living/carbon/human/human_mob = mymob
	if(istype(human_mob))
		blocked_slots |= human_mob.dna?.species?.no_equip_flags
		if(isnull(human_mob.w_uniform) && !HAS_TRAIT(human_mob, TRAIT_NO_JUMPSUIT))
			var/obj/item/bodypart/chest = human_mob.get_bodypart(BODY_ZONE_CHEST)
			if(isnull(chest) || IS_ORGANIC_LIMB(chest))
				blocked_slots |= ITEM_SLOT_ID|ITEM_SLOT_BELT
			var/obj/item/bodypart/left_leg = human_mob.get_bodypart(BODY_ZONE_L_LEG)
			if(isnull(left_leg) || IS_ORGANIC_LIMB(left_leg))
				blocked_slots |= ITEM_SLOT_LPOCKET
			var/obj/item/bodypart/right_leg = human_mob.get_bodypart(BODY_ZONE_R_LEG)
			if(isnull(right_leg) || IS_ORGANIC_LIMB(right_leg))
				blocked_slots |= ITEM_SLOT_RPOCKET
		if(isnull(human_mob.wear_suit))
			blocked_slots |= ITEM_SLOT_SUITSTORE
		if(human_mob.num_hands <= 0)
			blocked_slots |= ITEM_SLOT_GLOVES
		if(human_mob.num_legs < 2) // update this when you can wear shoes on one foot
			blocked_slots |= ITEM_SLOT_FEET
		var/obj/item/bodypart/head/head = human_mob.get_bodypart(BODY_ZONE_HEAD)
		if(isnull(head))
			blocked_slots |= ITEM_SLOT_HEAD|ITEM_SLOT_EARS|ITEM_SLOT_EYES|ITEM_SLOT_MASK
		var/obj/item/organ/eyes/eyes = human_mob.get_organ_slot(ORGAN_SLOT_EYES)
		if(eyes?.no_glasses)
			blocked_slots |= ITEM_SLOT_EYES

	for(var/atom/movable/screen/inventory/inv in (static_inventory + toggleable_inventory))
		if(!inv.slot_id)
			continue
		inv.alpha = (blocked_slots & inv.slot_id) ? 128 : initial(inv.alpha)

/datum/hud/human/hidden_inventory_update(mob/viewer)
	if(!mymob)
		return
	var/mob/living/carbon/human/H = mymob

	var/mob/screenmob = viewer || H

	if(screenmob.hud_used.inventory_shown && screenmob.hud_used.hud_shown)
		if(H.shoes)
			H.shoes.screen_loc = ui_shoes
			screenmob.client.screen += H.shoes
		if(H.gloves)
			H.gloves.screen_loc = ui_gloves
			screenmob.client.screen += H.gloves
		if(H.ears)
			H.ears.screen_loc = ui_ears
			screenmob.client.screen += H.ears
		if(H.glasses)
			H.glasses.screen_loc = ui_glasses
			screenmob.client.screen += H.glasses
		if(H.w_uniform)
			H.w_uniform.screen_loc = ui_iclothing
			screenmob.client.screen += H.w_uniform
		if(H.wear_suit)
			H.wear_suit.screen_loc = ui_oclothing
			screenmob.client.screen += H.wear_suit
		if(H.wear_mask)
			H.wear_mask.screen_loc = ui_mask
			screenmob.client.screen += H.wear_mask
		if(H.wear_neck)
			H.wear_neck.screen_loc = ui_neck
			screenmob.client.screen += H.wear_neck
		if(H.head)
			H.head.screen_loc = ui_head
			screenmob.client.screen += H.head
	else
		if(H.shoes)
			screenmob.client.screen -= H.shoes
		if(H.gloves)
			screenmob.client.screen -= H.gloves
		if(H.ears)
			screenmob.client.screen -= H.ears
		if(H.glasses)
			screenmob.client.screen -= H.glasses
		if(H.w_uniform)
			screenmob.client.screen -= H.w_uniform
		if(H.wear_suit)
			screenmob.client.screen -= H.wear_suit
		if(H.wear_mask)
			screenmob.client.screen -= H.wear_mask
		if(H.wear_neck)
			screenmob.client.screen -= H.wear_neck
		if(H.head)
			screenmob.client.screen -= H.head



/datum/hud/human/persistent_inventory_update(mob/viewer)
	if(!mymob)
		return
	..()
	var/mob/living/carbon/human/H = mymob

	var/mob/screenmob = viewer || H

	if(screenmob.hud_used)
		if(screenmob.hud_used.hud_shown)
			if(H.s_store)
				H.s_store.screen_loc = ui_sstore1
				screenmob.client.screen += H.s_store
			if(H.wear_id)
				H.wear_id.screen_loc = ui_id
				screenmob.client.screen += H.wear_id
			if(H.belt)
				H.belt.screen_loc = ui_belt
				screenmob.client.screen += H.belt
			if(H.back)
				H.back.screen_loc = ui_back
				screenmob.client.screen += H.back
			if(H.l_store)
				H.l_store.screen_loc = ui_storage1
				screenmob.client.screen += H.l_store
			if(H.r_store)
				H.r_store.screen_loc = ui_storage2
				screenmob.client.screen += H.r_store
		else
			if(H.s_store)
				screenmob.client.screen -= H.s_store
			if(H.wear_id)
				screenmob.client.screen -= H.wear_id
			if(H.belt)
				screenmob.client.screen -= H.belt
			if(H.back)
				screenmob.client.screen -= H.back
			if(H.l_store)
				screenmob.client.screen -= H.l_store
			if(H.r_store)
				screenmob.client.screen -= H.r_store

	if(hud_version != HUD_STYLE_NOHUD)
		for(var/obj/item/I in H.held_items)
			I.screen_loc = ui_hand_position(H.get_held_index_of_item(I))
			screenmob.client.screen += I
	else
		for(var/obj/item/I in H.held_items)
			I.screen_loc = null
			screenmob.client.screen -= I


/mob/living/carbon/human/verb/toggle_hotkey_verbs()
	set category = "OOC"
	set name = "Toggle hotkey buttons"
	set desc = "This disables or enables the user interface buttons which can be used with hotkeys."

	if(hud_used.hotkey_ui_hidden)
		client.screen += hud_used.hotkeybuttons
		hud_used.hotkey_ui_hidden = FALSE
	else
		client.screen -= hud_used.hotkeybuttons
		hud_used.hotkey_ui_hidden = TRUE
