player = require("player")

function love.load()
    love.window.setTitle("doterite prototype")
end

function love.draw()
    player.draw()
    love.graphics.print("FPS: "..tostring(love.timer.getFPS()))
end
