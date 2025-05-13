/datum/species/tajaran
	name = "\improper Tajaran"
	plural_form = "Tajaran"
	id = SPECIES_TAJARAN
	preview_outfit = /datum/outfit/anthro_preview
	inherent_traits = list(
		TRAIT_MUTANT_COLORS,
	)
	body_markings = list(/datum/bodypart_overlay/simple/body_marking/lizard = "Anthromorph Pattern")
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT
	digitigrade_customization = DIGITIGRADE_OPTIONAL
	bodypart_overrides = list(
		BODY_ZONE_HEAD = /obj/item/bodypart/head/anthromorph,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest/anthromorph,
		BODY_ZONE_L_ARM = /obj/item/bodypart/arm/left/anthromorph,
		BODY_ZONE_R_ARM = /obj/item/bodypart/arm/right/anthromorph,
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/anthromorph,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/anthromorph,
	)
	digi_leg_overrides = list(
		BODY_ZONE_L_LEG = /obj/item/bodypart/leg/left/digitigrade/anthromorph,
		BODY_ZONE_R_LEG = /obj/item/bodypart/leg/right/digitigrade/anthromorph,
	)
