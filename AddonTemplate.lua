
------------------------------
--      Util Functions      --
------------------------------

local function Print(...) ChatFrame1:AddMessage(string.join(" ", "|cFF33FF99Addon Template|r:", ...)) end

local debugf = tekDebug and tekDebug:GetFrame("AddonTemplate")
local function Debug(...) if debugf then debugf:AddMessage(string.join(", ", ...)) end end


-----------------------------
--      Event Handler      --
-----------------------------

local f = CreateFrame("frame")
f:SetScript("OnEvent", function(self, event, ...) if self[event] then return self[event](self, event, ...) end end)
f:RegisterEvent("ADDON_LOADED")


function f:ADDON_LOADED(event, addon)
	if addon ~= "AddonTemplate" then return end

	AddonTemplateDB = AddonTemplateDB or {}
	AddonTemplateDBPC = AddonTemplateDBPC or {}

	-- Do anything you need to do after addon has loaded

	LibStub("tekKonfig-AboutPanel").new("AddonTemplate", "AddonTemplate") -- Remove first arg if no parent config panel

	f:UnregisterEvent("ADDON_LOADED")
	f.ADDON_LOADED = nil

	if IsLoggedIn() then self:PLAYER_LOGIN() else self:RegisterEvent("PLAYER_LOGIN") end
end


function f:PLAYER_LOGIN()
	self:RegisterEvent("PLAYER_LOGOUT")

	-- Do anything you need to do after the player has entered the world

	self:UnregisterEvent("PLAYER_LOGIN")
	self.PLAYER_LOGIN = nil
end


function f:PLAYER_LOGOUT()
	-- Do anything you need to do as the player logs out
end


-----------------------------
--      Slash Handler      --
-----------------------------

SLASH_ADDONTEMPLATE1 = "/addontemplate"
SlashCmdList.ADDONTEMPLATE = function(msg)
	-- Do crap here
end
