local MOD_PATH = quiz.MOD_PATH
local S = quiz.get_translator

local callChatCmd = dofile(MOD_PATH.."call_chat_cmd.lua")

local function givemeItem(playerName, item)
  local name = item.id
  local modName = item.mod or "default"
  local count = item.count or 1
  local title = item.title or name or ""
  local T = minetest.get_translator(modName) or S

  -- local player = minetest.get_player_by_name(playerName)
  -- player:get_inventory():add_item('main', 'default:mese 1')

  -- print("giveme Item:", modName, name, dump(item))
  local result = callChatCmd("giveme", playerName, {modName .. ":" .. name, count})
  if not result then
    minetest.chat_send_player(playerName, S("Can't get '@1'", T(title)))
  else
    minetest.chat_send_player(playerName, S("You get the @1, count: @2.", T(title), count))
  end
  return result
end

return givemeItem
