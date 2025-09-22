local Fioso = {}
local CONFIG = {
    repo = "https://raw.githubusercontent.com/fioso-cat/Fioso_Database/refs/heads/main/Voidware/99NightForest/",
    tab = {
        Characters = "Characters.json",
        Items = "Items.json",
        Trees = "Trees.json",
    }
}

for key, Fetch in pairs(CONFIG.tab) do
    local success, response = pcall(function()
        return game:HttpGet(CONFIG.repo .. Fetch)
    end)
    if success then
        local data = game:GetService("HttpService"):JSONDecode(response)
        Fioso[key] = data -- save with key instead of array
    else
        warn("Failed to fetch " .. Fetch .. ": " .. tostring(response))
    end
end

return Fioso
