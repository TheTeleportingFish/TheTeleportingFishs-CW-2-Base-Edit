AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")


game.AddParticles("particles/muzzleflashes_test.pcf")
game.AddParticles("particles/muzzleflashes_test_b.pcf")
game.AddParticles("particles/cstm_muzzleflashes.pcf")
game.AddParticles( "particles/customfraggrenadeexplose.pcf" )
game.AddParticles( "particles/heibullet_explosion.pcf" )
game.AddParticles( "particles/apfsdsdirthit.pcf" )

PrecacheParticleSystem( "SABOTHIT" )
PrecacheParticleSystem( "SABOTPEN" )
PrecacheParticleSystem( "AMMOCOOKEXPLODE" )
PrecacheParticleSystem( "AMMOCOOKOFF" )
PrecacheParticleSystem( "DirtExplode" )
PrecacheParticleSystem( "GroundExplode" )
PrecacheParticleSystem( "fragExplose" )

resource.AddFile( "particles/customfraggrenadeexplose.pcf" )
resource.AddFile( "particles/heibullet_explosion.pcf" )
resource.AddFile( "particles/apfsdsdirthit.pcf" )

CustomizableWeaponry:addReloadSound("CW_MAIN_SABOT_SLIDEIN", "ammunition/sabotin.wav")
CustomizableWeaponry:addReloadSound("CW_MAIN_SABOT_SLIDEOUT", "ammunition/sabotin.wav")

CustomizableWeaponry:addReloadSound("CW_MAIN_50CAL_SLIDEIN", "ammunition/50calin.mp3")
CustomizableWeaponry:addReloadSound("CW_MAIN_50CAL_SLIDEOUT", "ammunition/50calout.wav")

CustomizableWeaponry:addReloadSound("CW_MAIN_22LRR_SLIDEIN", "ammunition/22lrrin.wav")
CustomizableWeaponry:addReloadSound("CW_MAIN_22LRR_SLIDEOUT", "ammunition/22lrrout.wav")

CustomizableWeaponry:addRegularSound("CW_HEI_Explose", {
"main/groundslicklight1.wav",
"main/groundslicklight2.wav",
"main/groundslicklight3.wav"}, 80)

CustomizableWeaponry:addRegularSound("CW_APFSDS_Explose_Close", {
"main/bomb_explosion_1.wav",
"main/bomb_explosion_2.wav",
"main/bomb_explosion_3.wav"}, 130)

CustomizableWeaponry:addRegularSound("CW_AMMOMETALEXPLODE", {
"main/tank_hit_med_01.wav",
"main/tank_hit_med_02.wav",
"main/tank_hit_med_04.wav"}, 80)

CustomizableWeaponry:addRegularSound("CW_AMMOCOOKOFF", {
"main/explodeair0_1.wav",
"main/explodeair0_2.wav",
"main/explodeair0_3.wav",
"main/explodeair0_4.wav"}, 80)

CustomizableWeaponry:addRegularSound("CW_APFSDS_Explose_Far", {
"main/shell_explosion_1.wav",
"main/shell_explosion_2.wav",
"main/shell_explosion_3.wav"}, 150)

CustomizableWeaponry:addFireSound("CW_APFSDS_Ignite", {
"main/explodeair0_1.wav",
"main/explodeair0_2.wav",
"main/explodeair0_3.wav",
"main/explodeair0_4.wav"}, 1, 110, CHAN_STATIC,40,50)



CustomizableWeaponry:addRegularSound("CW_HEI_Ignite", {
"main/explodeair0_1.wav",
"main/explodeair0_2.wav",
"main/explodeair0_3.wav",
"main/explodeair0_4.wav"}, 80)

CustomizableWeaponry:addRegularSound("CW_HEI_MetalSlam", {
"main/tank_hit_med_01.wav",
"main/tank_hit_med_02.wav",
"main/tank_hit_med_04.wav"}, 75)

CustomizableWeaponry:addRegularSound("CW_API_objecthit", {
"main/tanks_explosion_01.wav",
"main/tanks_explosion_02.wav",
"main/tanks_explosion_03.wav"}, 90)

CustomizableWeaponry:addRegularSound("CW_APFSDS_PIERCE", {
"main/tank_hit_med_01.wav",
"main/tank_hit_med_02.wav",
"main/tank_hit_med_04.wav"}, 120)

CustomizableWeaponry:addFireSound("CW_APFSDS_PIERCEEMBER", {
"main/embersounds.wav"}, 1, 140, CHAN_STATIC,100,110)



CustomizableWeaponry:addRegularSound("CW_Incendiary_Sizzle", {
"main/incendiarysizzle.wav"}, 76)



CustomizableWeaponry:addRegularSound("CW_fragGrenade_Explode", {
"main/fragex1.wav",
"main/fragex2.wav"
}, 140)

CustomizableWeaponry:addRegularSound("CW_fragGrenade_Explode_Back", {
"main/fragexplose1.wav",
"main/fragexplose2.wav",
"main/fragexplose3.wav"
}, 75)














