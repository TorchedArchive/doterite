player = require("player")

function love.load()
    love.window.setTitle("doterite prototype")
end

function love.draw()
    player.draw()
    love.graphics.print("FPS: "..tostring(love.timer.getFPS()))
end

function love.update(dt)
    -- Updates the player
    player.update(dt)

end
