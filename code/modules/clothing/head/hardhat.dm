
/obj/item/clothing/head/hardhat
	name = "hard hat"
	desc = "A piece of headgear used in dangerous working conditions to protect the head. Comes with a built-in flashlight."
	icon_state = "hardhat0_yellow"
	item_state = "hardhat0_yellow"
	var/brightness_on = 4 //luminosity when on
	var/on = FALSE
	item_color = "yellow" //Determines used sprites: hardhat[on]_[color] and hardhat[on]_[color]2 (lying down sprite)
	armor = list(MELEE = 10, BULLET = 5, LASER = 10, ENERGY = 5, BOMB = 10, RAD = 10, FIRE = INFINITY, ACID = 50)
	flags_inv = 0
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	resistance_flags = FIRE_PROOF
	dog_fashion = /datum/dog_fashion/head/hardhat
	sprite_sheets = list(
		"Grey" = 'icons/mob/clothing/species/grey/head.dmi',
		"Vox" = 'icons/mob/clothing/species/vox/head.dmi'
	)

/obj/item/clothing/head/hardhat/attack_self__legacy__attackchain(mob/living/user)
	toggle_helmet_light(user)

/obj/item/clothing/head/hardhat/proc/toggle_helmet_light(mob/living/user)
	on = !on
	if(on)
		turn_on(user)
	else
		turn_off(user)
	update_icon(UPDATE_ICON_STATE)

/obj/item/clothing/head/hardhat/update_icon_state()
	icon_state = "hardhat[on]_[item_color]"
	item_state = "hardhat[on]_[item_color]"
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		H.update_inv_head()
	update_action_buttons()

/obj/item/clothing/head/hardhat/proc/turn_on(mob/user)
	set_light(brightness_on)

/obj/item/clothing/head/hardhat/proc/turn_off(mob/user)
	set_light(0)

/obj/item/clothing/head/hardhat/extinguish_light(force = FALSE)
	if(on)
		on = FALSE
		turn_off()
		update_icon(UPDATE_ICON_STATE)
		visible_message("<span class='danger'>[src]'s light fades and turns off.</span>")

/obj/item/clothing/head/hardhat/orange
	name = "orange hard hat"
	icon_state = "hardhat0_orange"
	item_state = "hardhat0_orange"
	item_color = "orange"

/obj/item/clothing/head/hardhat/red
	name = "firefighter helmet"
	icon_state = "hardhat0_red"
	item_state = "hardhat0_red"
	item_color = "red"
	flags = STOPSPRESSUREDMAGE
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELM_MAX_TEMP_PROTECT
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT
	dog_fashion = /datum/dog_fashion/head/hardhat/red

/obj/item/clothing/head/hardhat/white
	name = "white hard hat"
	icon_state = "hardhat0_white"
	item_state = "hardhat0_white"
	item_color = "white"
	flags = STOPSPRESSUREDMAGE
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_HELM_MAX_TEMP_PROTECT
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT
	dog_fashion = /datum/dog_fashion/head/hardhat/white

/obj/item/clothing/head/hardhat/dblue
	name = "blue hard hat"
	icon_state = "hardhat0_dblue"
	item_state = "hardhat0_dblue"
	item_color = "dblue"

/obj/item/clothing/head/hardhat/atmos
	name = "atmospheric technician's firefighting helmet"
	desc = "A firefighter's helmet, able to keep the user cool in any situation."
	icon = 'icons/obj/clothing/head/utility.dmi'
	icon_override = 'icons/mob/clothing/head/utility.dmi'
	icon_state = "hardhat0_atmos"
	item_color = "atmos"
	item_state = 'icons/mob/clothing/head/utility.dmi'
	flags = STOPSPRESSUREDMAGE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	cold_protection = HEAD
	min_cold_protection_temperature = FIRE_HELM_MIN_TEMP_PROTECT
	dog_fashion = null
	sprite_sheets = list(
		"Vox" = 'icons/mob/clothing/species/vox/head/utility.dmi',
		"Unathi" = 'icons/mob/clothing/species/unathi/head/utility.dmi',
		"Tajaran" = 'icons/mob/clothing/species/tajaran/head/utility.dmi',
		"Vulpkanin" = 'icons/mob/clothing/species/vulpkanin/head/utility.dmi',
		"Grey" = 'icons/mob/clothing/species/grey/head/utility.dmi',
		"Drask" = 'icons/mob/clothing/species/drask/head/utility.dmi',
		"Kidan" = 'icons/mob/clothing/species/kidan/head/utility.dmi'
	)
