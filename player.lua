local player = {}
scale = 4

-- Movement
player.speed = 42 * scale

-- The player's "model", so to say.
player.image = 0
player.width = 20 * scale
player.height = 4 * scale

-- Player coords
player.coords = {}
player.coords.x = 400 - (player.width / 2)
player.coords.y = 600 - (5 * scale)

-- Shooting
-- Cooldown
player.cooldown = 20
player.dots = {}
function player.launch()
    if player.cooldown <= 0 then
        player.cooldown = 20
        dot = {}
        dot.width = 8
        dot.height = 8
        dot.x = player.coords.x + 40
        dot.y = player.coords.y - 16
        table.insert(player.dots, dot)
    end
end
-- Functions
function player.draw()
    -- Draws the actual player
    love.graphics.rectangle("fill", player.coords.x, player.coords.y, player.width, player.height)
    
    -- Shooting
    for _, d in pairs(player.dots) do
        love.graphics.rectangle("fill", d.x, d.y, d.width, d.height)
    end
end

function player.update(dt)
    -- Movement
    if love.keyboard.isDown("left") or love.keyboard.isDown("a") then
        player.coords.x = player.coords.x - player.speed * dt
    end

    if love.keyboard.isDown("right") or love.keyboard.isDown("d") then
        player.coords.x = player.coords.x + player.speed * dt
    end
    -- Attack/Shooting
    if love.keyboard.isDown("space") then
        player.launch()
    end
end
return player
