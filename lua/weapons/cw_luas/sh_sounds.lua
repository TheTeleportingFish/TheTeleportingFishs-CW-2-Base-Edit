CustomizableWeaponry:addFireSound("CW_LUAS_FIRE", "npc/manhack/mh_blade_snick1.wav", 1, 140, CHAN_STATIC)

CustomizableWeaponry:addFireSound("CW_LUAS_FIRE_SUPPRESSED", {
"weapons/cw_l96/riflehit01.wav",
"weapons/cw_l96/riflehit02.wav",
"weapons/cw_l96/riflehit03.wav",
"weapons/cw_l96/riflehit04.wav"
}, 1, 140, CHAN_STATIC, 100,100)

CustomizableWeaponry:addRegularSound("CW_LUAS_M203_SOUNDS", {
"vo/k_lab/kl_mygoodness02.wav",
"vo/npc/male01/docfreeman02.wav",
"vo/npc/male01/gordead_ques03b.wav",
"vo/citadel/br_guest_a.wav",
--"vo/citadel/br_no.wav",
"vo/citadel/br_youfool.wav",
"vo/citadel/gman_exit01.wav",
--"vo/citadel/gman_exit09.wav",
"vo/citadel/gman_exit10.wav",
--"vo/eli_lab/eli_thing.wav",
"vo/npc/vortigaunt/freeman.wav"
--"vo/npc/vortigaunt/vanswer03.wav",
--"vo/npc/vortigaunt/vmono_03.wav",
--"vo/npc/vortigaunt/vques09.wav"

}, 80)

CustomizableWeaponry:addReloadSound("CW_LUAS_MAGOUT", {
"npc/strider/strider_step1.wav",
"npc/strider/strider_step2.wav",
"npc/strider/strider_step3.wav",
"npc/strider/strider_step4.wav",
"npc/strider/strider_step5.wav",
"npc/strider/strider_step6.wav"
})


CustomizableWeaponry:addReloadSound("CW_LUAS_MAGIN", "npc/strider/strider_skewer1.wav")
CustomizableWeaponry:addReloadSound("CW_LUAS_BOLTUP", "weapons/cw_l96/open.mp3")
CustomizableWeaponry:addReloadSound("CW_LUAS_BOLTDOWN", "weapons/cw_l96/close.mp3")

CustomizableWeaponry:addRegularSound("CW_LUAS_DRAW", "vo/npc/male01/abouttime01.wav")
CustomizableWeaponry:addRegularSound("CW_LUAS_BOLTEND", "weapons/cw_l96/beep.mp3")

CustomizableWeaponry:addReloadSound("CW_LUAS_BOLTPULL", "weapons/cw_l96/ptrs_bolt.wav")
CustomizableWeaponry:addReloadSound("CW_LUAS_BOLTPUSH", "weapons/cw_l96/ptrs_bolt.wav")


