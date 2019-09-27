player = require("player")

function love.load()
    love.window.setTitle("doterite prototype")
end

function love.draw()
    player.draw()
    love.graphics.print("FPS: "..tostring(love.timer.getFPS()))
end

function love.update(dt)
    player.cooldown = player.cooldown - 1
    
    -- Player shooting
    for _, d in pairs(player.dots) do
        d.y = d.y - 10
    end

    -- Updates the player
    player.update(dt)

end
