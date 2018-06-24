SWEP.PrintName		= "InstaKill"
SWEP.Author			= "Dracus, under the excellent guidance of Fulcrum and code_gs from Facepunch Forums"
SWEP.Instructions	= "Kills the targeted entity or player by left-clicking"

SWEP.Spawnable	= true
SWEP.AdminOnly	= true

SWEP.Primary.ClipSize = -1
SWEP.Primary.DefaultClip = -1
SWEP.Primary.Automatic = true
SWEP.Primary.Ammo = "none"

SWEP.Weight = 5
SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.Slot = 1
SWEP.SlotPos = 2
SWEP.DrawAmmo = false
SWEP.DrawCrosshair = true

SWEP.ViewModel = "models/weapons/v_pistol.mdl"
SWEP.WorldModel = "models/weapons/w_pistol.mdl"

function SWEP:PrimaryAttack() --This function is run when the player left clicks.
	if ( CLIENT ) then return end --If the code is being run on the client then don't bother doing this stuff since the client (i.e. players computer) isn't allowed to decide who is dead.

	local owner = self:GetOwner()
	local eyetrace = owner:GetEyeTrace() --Draw a line from the user's eyes to where they're pointing the gun.
	local traceTarget = eyetrace.Entity --This is the entity the kill ray is hitting.

	if ( traceTarget:IsValid() ) then --Check if the entity exists.
		if ( traceTarget:IsPlayer() ) then --Check if the entity is a player.
			traceTarget:Kill() --Kill the target.
		else
			traceTarget:TakeDamage( traceTarget:Health(), owner, self ) --Destroy the entity.
		end
    end
end
