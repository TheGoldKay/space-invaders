Player = require('player')

function love.load()
    love.graphics.setBackgroundColor(0.2, 0, 0.5)
    player = Player:new()
end

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    end 
end 

function love.draw()
    player:draw()
end

function love.update(dt)
    player:move(dt)
end 