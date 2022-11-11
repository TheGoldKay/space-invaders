Enemy = {}
Enemy.__index = Enemy

function Enemy:new()
    self = setmetatable({}, self)
    self.row = 3
    self.col = 6
    self.size = 40
    self.gap = 50
    self.list = {}
    for r = 1, self.row do 
        for c = 2, self.col do 
            x = c * self.size + self.gap * c
            y = r * self.size + self.gap * r / 2
            table.insert(self.list, {x=x, y=y})
        end
    end
    return self
end

function Enemy:draw()
    for i, v in pairs(self.list) do 
        love.graphics.rectangle('line', v.x, v.y, self.size, self.size)
    end
end

return Enemy