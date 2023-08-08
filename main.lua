-- Carga los recursos al inicio
function love.load()
    -- Carga las imágenes de las baldosas
    tileImages = {
        love.graphics.newImage("assets/grass1.png"),
        love.graphics.newImage("assets/grass2.png"),
        -- ...otras imágenes...
    }

    -- Crea un Batch para dibujar las baldosas eficientemente
    tilesetBatch = love.graphics.newSpriteBatch(tileImages[1], 1000)

    -- Tamaño de las baldosas
    tileWidth = 32
    tileHeight = 32

    -- Define el mapa del suelo utilizando números que representan las baldosas
    tileMap = {
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 2, 2, 2, 2, 1, 1, 2, 2, 1, 1, 1},
        {1, 1, 1, 1, 2, 1, 2, 2, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 2, 2, 2, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
        -- ...otras filas...
    }

    -- Llena el SpriteBatch con las baldosas del mapa
    for y = 1, #tileMap do
        for x = 1, #tileMap[y] do
            local tile = tileMap[y][x]
            tilesetBatch:setColor(1, 1, 1, 1) -- Restaurar el color blanco antes de cambiar la imagen
            tilesetBatch:add(tileImages[tile], (x - 1) * tileWidth, (y - 1) * tileHeight)
        end
    end

    tilesetBatch:flush() -- ¡Asegúrate de agregar esto para finalizar la creación del SpriteBatch!
end

-- Dibuja los recursos en la pantalla
function love.draw()
    love.graphics.draw(tilesetBatch)
end
