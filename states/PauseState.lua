--[[
    PauseState Class
]]

PauseState = Class{__includes = BaseState}

function PauseState:init()

end

function PauseState:update(dt)
    if love.keyboard.wasPressed('p') or love.keyboard.wasPressed('P') then
        gStateMachine:change('play', {
            pipePairs = self.pipePairs,
            score = self.score,
            bird = self.bird
        })
    end
end

function PauseState:render()
    love.graphics.setFont(hugeFont)
    love.graphics.printf('| |', 0, 100, VIRTUAL_WIDTH, 'center')

    for k, pair in pairs(self.pipePairs) do
        pair:render()
    end

    love.graphics.setFont(flappyFont)
    love.graphics.print('Score: ' .. tostring(self.score), 8, 8)

    self.bird:render()
end

function PauseState:enter(params)
    self.score = params.score
    self.pipePairs = params.pipePairs
    self.bird = params.bird
    
    sounds['music']:pause()
end

function PauseState:exit()
    sounds['music']:play()
end