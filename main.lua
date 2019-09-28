-- Code with everything based on player
player = require("player")

-- Load a font
font = love.graphics.newFont("assets/m5x7.ttf", 55)

function love.load()
    -- Set a window title
    love.window.setTitle("doterite prototype")
    
    -- The state of the game which determines what to display
    state = "menu"

    -- Actually load the font in the game
    love.graphics.setFont(font)
end

function love.draw()
    -- Main Menu
    if state == "menu" then
        love.graphics.print("Press \"Enter to start\"!", 200, 300)
    else
        -- Draws the player's character
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
