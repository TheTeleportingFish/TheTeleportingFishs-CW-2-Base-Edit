AddCSLuaFile()
AddCSLuaFile("sh_sounds.lua")
include("sh_sounds.lua")

resource.AddFile( "particles/customfraggrenadeexplose.pcf" )
resource.AddFile( "particles/heibullet_explosion.pcf" )
resource.AddFile( "particles/apfsdsdirthit.pcf" )

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
PrecacheParticleSystem( "FragExplose" )
