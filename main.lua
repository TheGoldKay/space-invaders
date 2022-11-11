Player = require('player')
Enemy = require('enemy')

function love.load()
    love.graphics.setBackgroundColor(0.2, 0, 0.5)
    player = Player:new()
    enemy = Enemy:new()
end

function love.keypressed(key)
    if key == 'escape' then 
        love.event.quit()
    elseif key == 'space' then 
        player:fire()
    end 
end 

function love.draw()
    player:draw()
    enemy:draw()
end

function love.update(dt)
    player:move(dt)
    enemy:move(dt)
end 