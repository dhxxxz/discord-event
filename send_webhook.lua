local url = "https://discord.com/api/webhooks/1437420931122331658/RUzvQ9fJIxDg53nKuzWVBsPUjNT1M5FO-q3KePcD0bD-D2gRbLR3msCkWK8lcyvSbXU4"

local schedule = {
    ["06:00"] = {"Server Restart"},
    ["12:30"] = {"ชิงธง"},
    ["15:30"] = {"ชิงธง", "กองปูนใหญ่"},
    ["14:00"] = {"Paintball"},
    ["16:00"] = {"Airdrop"},
    ["17:00"] = {"Loot Box"},
    ["18:00"] = {"Server Restart"},
    ["18:30"] = {"ชิงธง"},
    ["19:00"] = {"Paintball"},
    ["19:30"] = {"กองปูนใหญ่"},
    ["20:00"] = {"Airdrop"},
    ["20:30"] = {"Loot Box"},
    ["21:30"] = {"ชิงธง"},
    ["22:00"] = {"กองปูนใหญ่"},
    ["22:30"] = {"Paintball"},
    ["23:00"] = {"Airdrop"},
    ["00:00"] = {"Loot Box"},
    ["00:30"] = {"ชิงธง"},
    ["01:00"] = {"Paintball"},
    ["02:00"] = {"Paintball"},
    ["03:30"] = {"Loot Box"},
    ["04:30"] = {"กองปูนใหญ่"},
    ["06:30"] = {"กองปูนใหญ่"},
}

local json = require("dkjson")

local function sendWebhook(eventName)
    local data = {
        username = "Xin Town",
        content = "@everyone",
        embeds = {{
            title = "**กิจกรรมเริ่มแล้ว!**",
            description = "**" .. eventName .. "**",
            color = 0x00FFAA,
            footer = { text = "By Xin Town" },
            timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
        }},
    }

    local body = json.encode(data)
    os.execute(string.format(
        'curl -H "Content-Type: application/json" -X POST -d \'%s\' "%s"',
        body, url
    ))
end

sendWebhook("สคริปต์กำลังทำงาน ✅")

while true do
    local currentTime = os.date("%H:%M")
    local events = schedule[currentTime]
    if events then
        for _, eventName in ipairs(events) do
            sendWebhook(eventName)
        end
        os.execute("sleep 60")
    end
    os.execute("sleep 60")
end
