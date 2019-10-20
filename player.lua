local player = {}
scale = 4

-- Movement
player.speed = 42 * scale

-- The player's "model", so to say.
player.image = love.graphics.newImage("assets/images/player.png")
player.width = 20 * scale
player.height = 4 * scale

-- Player coords
player.coords = {}
player.coords.x = 400 - (player.width / 2)
player.coords.y = 600 - (4 * scale)

-- Shooting
-- Cooldown
player.cooldown = 22
player.dots = {}
function player.launch()
    if player.cooldown <= 0 then
        player.cooldown = 22
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
    love.graphics.draw(player.image, player.coords.x, player.coords.y, math.rad(-45), 4, 4)
    -- Shooting
    for _, d in pairs(player.dots) do
        love.graphics.rectangle("fill", d.x, d.y, d.width, d.height)
    end
end

function player.update(dt)
    player.cooldown = player.cooldown - 1
    
    if player.coords.x < 0 then player.coords.x = 0 end
    if player.coords.x > 704 + (scale * 4) then player.coords.x = 704 + (scale * 4) end
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

    for _, d in pairs(player.dots) do
        d.y = d.y - 10
    end
end
return player
