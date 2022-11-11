Enemy = {}
Enemy.__index = Enemy

function Enemy:new()
    self = setmetatable({}, self)
    self.row = 3
    self.col = 6
    self.size = 40
    self.w = self.size
    self.h = self.size
    self.gap = 50
    self.dir = 'left'
    self.vel = 100
    self.list = {}
    for r = 1, self.row do 
        for c = 2, self.col do 
            x = c * self.size + self.gap * c
            y = r * self.size + self.gap * r / 2
            table.insert(self.list, {x=x, y=y, w=self.w, h=self.h})
        end
    end
    self.middle = self.list[3]
    return self
end

function Enemy:move(dt)
    if self.dir == 'left' then 
        for i, k in pairs(self.list) do 
            self.list[i].x = self.list[i].x - self.vel * dt
            --self.middle.x = self.middle.x - self.vel * dt 
        end
    elseif self.dir == 'right' then 
        for i, k in pairs(self.list) do 
            self.list[i].x = self.list[i].x + self.vel * dt
            --self.middle.x = self.middle.x + self.vel * dt 
        end   
    end
    if self.list[3].x < 0 then 
        self.dir = 'right' 
        self:moveDown()
    elseif self.list[3].x > love.graphics.getWidth() then 
        self.dir = 'left'
        self:moveDown()
    end 
end

function Enemy:moveDown()
    self.middle.y = self.middle.y + 10
    for i, k in pairs(self.list) do 
        self.list[i].y = self.list[i].y + 10
    end
end

function Enemy:draw()
    for i, v in pairs(self.list) do 
        love.graphics.rectangle('line', v.x, v.y, self.size, self.size)
    end
end

return Enemy