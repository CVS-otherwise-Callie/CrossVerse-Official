--[[
So, simply put, the first line should have this setup:

Mode 1 should be this…

	local entities = {{Name=”NAME1”,Anm2=”folder/name_of_effect.anm2”, CollisionRadius=(1 for yes, 0 for no),ShadowSize=(Size of Shadow you want),NumGridCollisionPoints=(This is self-explanatory… for npcs it should be 0), Type=(Whatever TYPE you put for type in the XML should be put HERE),Variant=(Whatever VARIANT you put in the XML should be put HERE),},}

Mode 2 should be…
	return {["NAME1"]=entities[Variable 1 (whatever you want, this will be it’s calling number for the next part)],}

Mode 3 should be…

return {[THE TYPE OF ENTITY]={[THE VARIANT OF THE ENTITY]={[0]=entities[Variable 1 (this will be the entity you called by name!!!)],},},}

]]
local mod = CrossVerse