/*--------------------------------------------------
	=============== Autorun File ===============
	*** Copyright (c) 2018-2021 by Hirasmous, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
------------------ Addon Information ------------------
local PublicAddonName = "TESV: Skyrim SNPCs - Dragons"
local AddonName = "TESV: Skyrim"
local AddonType = "SNPC"
local AutorunFile = "autorun/vj_sky_dragons_autorun.lua"
-------------------------------------------------------

local VJExists = file.Exists("lua/autorun/vj_base_autorun.lua","GAME")
if VJExists == true then
	include('autorun/vj_controls.lua')

	local vCat = "TESV: Skyrim - Dragons"

    -- Dragons
	VJ.AddNPC("Dragon","npc_vj_sky_dragon",vCat)
	VJ.AddNPC("Ancient Dragon","npc_vj_sky_dragon_ancient",vCat)
	VJ.AddNPC("Elder Dragon","npc_vj_sky_dragon_elder",vCat)
	VJ.AddNPC("Blood Dragon","npc_vj_sky_dragon_blood",vCat)
	VJ.AddNPC("Frost Dragon","npc_vj_sky_dragon_frost",vCat)
	VJ.AddNPC("Legendary Dragon","npc_vj_sky_dragon_legendary",vCat)
	VJ.AddNPC("Revered Dragon","npc_vj_sky_dragon_revered",vCat)
	VJ.AddNPC("Serpentine Dragon","npc_vj_sky_dragon_serpentine",vCat)
	VJ.AddNPC("Skeletal Dragon","npc_vj_sky_dragon_skeletal",vCat)

	VJ.AddNPC("Alduin","npc_vj_sky_dragon_alduin",vCat)
	VJ.AddNPC("Odahviing","npc_vj_sky_dragon_odahviing",vCat)
	VJ.AddNPC("Parthurnax","npc_vj_sky_dragon_parthurnax",vCat)
-- !!!!!! DON'T TOUCH ANYTHING BELOW THIS !!!!!! -------------------------------------------------------------------------------------------------------------------------
	AddCSLuaFile(AutorunFile)
	VJ.AddAddonProperty(AddonName,AddonType)
else
	if (CLIENT) then
		chat.AddText(Color(0,200,200),PublicAddonName,
		Color(0,255,0)," was unable to install, you are missing ",
		Color(255,100,0),"VJ Base!")
	end
	timer.Simple(1,function()
		if not VJF then
			if (CLIENT) then
				VJF = vgui.Create("DFrame")
				VJF:SetTitle("ERROR!")
				VJF:SetSize(790,560)
				VJF:SetPos((ScrW()-VJF:GetWide())/2,(ScrH()-VJF:GetTall())/2)
				VJF:MakePopup()
				VJF.Paint = function()
					draw.RoundedBox(8,0,0,VJF:GetWide(),VJF:GetTall(),Color(200,0,0,150))
				end

				local VJURL = vgui.Create("DHTML",VJF)
				VJURL:SetPos(VJF:GetWide()*0.005, VJF:GetTall()*0.03)
				VJURL:Dock(FILL)
				VJURL:SetAllowLua(true)
				VJURL:OpenURL("https://sites.google.com/site/vrejgaming/vjbasemissing")
			elseif (SERVER) then
				timer.Create("VJBASEMissing",5,0,function() print("VJ Base is Missing! Download it from the workshop!") end)
			end
		end
	end)
end
