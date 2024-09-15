local function play_sound_for_all(sound_name, message, player_name)
    local players = minetest.get_connected_players()
    for _, player in ipairs(players) do
        local name = player:get_player_name()
        if name ~= player_name and string.find(message, "%f[%w]" .. name .. "%f[%W]", 1, true) then
            minetest.sound_play(sound_name, {
                to_player = name,
                gain = 0.05,
                max_hear_distance = 5,
            })
        elseif name == player_name then
            minetest.sound_play("system-notification-199277", {
                to_player = name,
                gain = 0.05,
                max_hear_distance = 5,
            })
        else
            minetest.sound_play(sound_name, {
                to_player = name,
                gain = 0.05,
                max_hear_distance = 5,
            })
        end
    end
end

local function on_player_chat(message, player_name)
    play_sound_for_all("message-124468", message, player_name)
    return false
end

minetest.register_on_chat_message(on_player_chat)
