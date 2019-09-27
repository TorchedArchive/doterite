player = require("player")

function love.load()
    love.window.setTitle("doterite prototype")

    state = "menu"
end

function love.draw()
    -- Main Menu
    if state == "menu" then
        love.graphics.print("Press \"Enter to start\"!", 350, 300)
    else
        player.draw()
        love.graphics.print("FPS: "..tostring(love.timer.getFPS()))
    end
end

function love.update(dt)
    -- Updates the player
    player.update(dt)
end

function love.keypressed(key)
    if key == "return" then state = "game" end

    if key == "e" then love.event.quit() end
end
