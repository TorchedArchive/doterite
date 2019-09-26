local player = {}
scale = 4
-- The player's "model", so to say.
player.image = 0
player.width = 16 * scale
player.height = 16 * scale

-- Player coords
player.coords = {}
player.coords.x = 10
player.coords.y = 20

function player.draw()
    love.graphics.rectangle("fill", player.coords.x, player.coords.y, player.width, player.height)
end

return player
