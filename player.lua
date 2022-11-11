Player = {}
Player.__index = Player

function Player:new()
    self = setmetatable({}, self)
    self.w = 40
    self.h = self.w / 2
    self.x = love.graphics.getWidth() / 2
    self.y = love.graphics.getHeight()  - self.h
    self.vel = 500
    self.bullets = {}
    return self 
end 

function Player:draw()
    love.graphics.rectangle('fill', self.x, self.y, self.w, self.h)
end 

function Player:move(dt)
    if love.keyboard.isDown('a', 'left') and self.x > 0 then 
        self.x = self.x - self.vel * dt 
    elseif love.keyboard.isDown('d', 'right') and self.x < love.graphics.getWidth() - self.w then 
        self.x = self.x + self.vel * dt  
    end     
end 

return Player