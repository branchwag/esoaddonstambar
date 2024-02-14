MyFirstAddon = {}

-------------------------------------------------------------------------------------------------
--  Initialize Variables --
-------------------------------------------------------------------------------------------------
MyFirstAddon.name = "MyFirstAddon" 
MyFirstAddon.version = 1
 
-------------------------------------------------------------------------------------------------
--  OnAddOnLoaded  --
-------------------------------------------------------------------------------------------------
function MyFirstAddon.OnAddOnLoaded(event, addonName)
    if addonName ~= MyFirstAddon.name then return end
  
     MyFirstAddon:Initialize()
 end

 -------------------------------------------------------------------------------------------------
--  Other Functions --
-------------------------------------------------------------------------------------------------
function MyFirstAddon.UpdateStamina()
	-- Call the GetUnitPower function to get our current and max stamina
	local current, max, effectiveMax = GetUnitPower("player", POWERTYPE_STAMINA)
 
	--Add this line: Sets the minimum and maximum values for our status bar
	MyFirstAddonWindowStatusBar:SetMinMax(0, max)
 
	-- Sets the value for our status bar (how much it is filled in)
	MyFirstAddonWindowStatusBar:SetValue(current)
end
 -------------------------------------------------------------------------------------------------
--  Initialize Function --
-------------------------------------------------------------------------------------------------
function MyFirstAddon:Initialize()
	-- Sets the value of our status bar to 50
	--MyFirstAddonWindowStatusBar:SetValue(50)
	MyFirstAddon.UpdateStamina()
 
	-- Gets our characters name
	local ourName = GetUnitName("player")
 
	-- Sets the text for our label to ourName
	MyFirstAddonWindowLabel:SetText(ourName)
 
EVENT_MANAGER:UnregisterForEvent(MyFirstAddon.name, EVENT_ADD_ON_LOADED)
end
 
-------------------------------------------------------------------------------------------------
--  Register Events --
-------------------------------------------------------------------------------------------------
EVENT_MANAGER:RegisterForEvent(MyFirstAddon.name, EVENT_ADD_ON_LOADED, MyFirstAddon.OnAddOnLoaded)
EVENT_MANAGER:RegisterForEvent(MyFirstAddon.name, EVENT_POWER_UPDATE, MyFirstAddon.UpdateStamina)

