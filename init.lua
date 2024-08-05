minetest.register_on_receiving_chat_message(function(message)
	local name = minetest.localplayer and minetest.localplayer:get_name()
	if not (name and message) then return end
	local sender, text = message:match("<?(%S+)[:?>?]%s?(.+)")
	if sender and sender == name then return end
	local msg, matched = message:gsub(name, minetest.colorize("#F00",name))
	if matched and matched > 0 then
		minetest.display_chat_message(msg)
		return true
	end
end)
