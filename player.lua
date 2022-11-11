Player = {}
Player.__index = Player

function Player:new()
    self = setmetatable({}, self)
    self.w = 40
    self.h = self.w / 2
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight()  - self.h
    self.vel = 500
    self.bvel = 200
    self.bullets = {}
    return self 
end 

function Player:fire()
    local bullet = {}
    bullet.x = self.x + self.w / 2 
    bullet.y = self.y 
    bullet.w = 5
    bullet.h = 20
    table.insert(self.bullets, bullet)
end 

function Player:draw()
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
    for i, b in pairs(self.bullets) do 
        love.graphics.rectangle('fill', b.x, b.y, b.w, b.h)
    end 
end 

function Player:move(dt)
    if love.keyboard.isDown('a', 'left') and self.x > 0 then 
        self.x = self.x - self.vel * dt 
    elseif love.keyboard.isDown('d', 'right') and self.x < love.graphics.getWidth() - self.w then 
        self.x = self.x + self.vel * dt  
    end
    for i, b in pairs(self.bullets) do 
        self.bullets[i].y = self.bullets[i].y - self.bvel * dt
        if self.bullets[i].y < 0 then 
            self.bullets[i] = nil
        end 
    end 
end 

return Player