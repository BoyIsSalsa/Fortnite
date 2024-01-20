local player = { x = 400, y = 500, speed = 200 }
local bullets = {}

-- Load assets
function love.load()
    player.image = love.graphics.newImage("player.png")
    bulletImage = love.graphics.newImage("bullet.png")
end

-- Update function
function love.update(dt)
    -- Move player
    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed * dt
    elseif love.keyboard.isDown("right") then
        player.x = player.x + player.speed * dt
    end

    -- Shoot bullets
    if love.keyboard.isDown("space") then
        local bullet = { x = player.x + player.image:getWidth() / 2, y = player.y, speed = 500 }
        table.insert(bullets, bullet)
    end

    -- Update bullets
    for i, bullet in ipairs(bullets) do
        bullet.y = bullet.y - bullet.speed * dt

        -- Remove bullets that go off-screen
        if bullet.y < 0 then
            table.remove(bullets, i)
        end
    end
end

-- Draw function
function love.draw()
    -- Draw player
    love.graphics.draw(player.image, player.x, player.y)

    -- Draw bullets
    for _, bullet in ipairs(bullets) do
        love.graphics.draw(bulletImage, bullet.x, bullet.y)
    end
end
