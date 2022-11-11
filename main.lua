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

-- Assuming a = {x = ..., y = ..., width = ..., height = ...}
-- Assuming b = {x = ..., y = ..., width = ..., height = ...}

function collide(a,b)
    if ((b.x >= a.x + a.w) or
        (b.x + b.w <= a.x) or
        (b.y >= a.y + a.h) or
        (b.y + b.h <= a.y)) then
           return false 
    else return true
        end
 end

function enemyHit(player, enemy)
    for i, b in pairs(player.bullets) do 
        for j, e in pairs(enemy.list) do 
            if collide(b, e) then 
                print('herereer')
                player.bullets[i] = nil
                enemy.list[j] = nil
            end
        end
    end
end

function love.update(dt)
    player:move(dt)
    enemy:move(dt)
    enemyHit(player, enemy)
end 