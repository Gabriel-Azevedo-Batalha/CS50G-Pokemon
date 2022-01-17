LevelUpState = Class{__includes = BaseState}

function LevelUpState:init(TakeTurnState, pokemon)
    local hp, attack, defense, speed = pokemon:levelUp()
    self.StatsMenu = Menu {
        x = 0,
        y = VIRTUAL_HEIGHT - 128,
        width = VIRTUAL_WIDTH,
        height = 128,
        hideCursor = function() 
            gStateStack:pop()
            TakeTurnState:fadeOutWhite()
        end,
        items = {
            {
                text = 'Hp increase: ' .. tostring(pokemon.HP) .. '->' .. tostring(pokemon.HP + hp),
            },
            {
                text = 'Attack increase: ' .. tostring(pokemon.attack) .. '->' .. tostring(pokemon.attack + attack),
            },
            {
                text = 'Defense increase: ' .. tostring(pokemon.defense) .. '->' .. tostring(pokemon.defense + defense),
            },
            {
                text = 'Speed increase: ' .. tostring(pokemon.speed) .. '->' .. tostring(pokemon.speed + speed),
            },
        }
    }
end

function LevelUpState:update(dt)
    self.StatsMenu:update(dt)
end

function LevelUpState:render()
    self.StatsMenu:render()
end