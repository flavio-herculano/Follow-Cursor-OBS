obs = obslua
local ffi = require("ffi")

-- Definir FFI para Windows
ffi.cdef[[
typedef struct {
    int x;
    int y;
} POINT;

int GetCursorPos(POINT *lpPoint);
]]

local win_point = ffi.new("POINT")

-- Variáveis para armazenar a posição do mouse e o alvo da fonte
local mouse_pos = { x = 0, y = 0 }
local target_pos_x = 0
local current_zone = nil  -- Variável para rastrear a zona atual (esquerda, centro, direita)

-- Função para obter a posição do mouse no Windows
function get_mouse_pos()
    if ffi.C.GetCursorPos(win_point) ~= 0 then
        mouse_pos.x = win_point.x
        mouse_pos.y = win_point.y
    end
end

-- Função para obter a cena e a fonte
function get_scene_and_source(scene_name, source_name)
    local scene = obs.obs_get_scene_by_name(scene_name)
    if not scene then
        return nil, nil
    end

    local scene_item = obs.obs_scene_find_source(scene, source_name)
    obs.obs_scene_release(scene)
    
    if not scene_item then
        return nil
    end

    return scene_item
end

-- Função para interpolar a posição da fonte
function interpolate_position(current_pos, target_pos, speed)
    return current_pos + (target_pos - current_pos) * speed
end

-- Função para atualizar a posição do mouse
function update_mouse_position()
    get_mouse_pos()
    local screen_width = 1920
    local left_threshold = screen_width / 4
    local right_threshold = 3 * screen_width / 4

    -- Determina a posição alvo da fonte com base na posição do mouse
    local new_zone
    if mouse_pos.x < left_threshold then
        new_zone = "esquerda"
        target_pos_x = 0
    elseif mouse_pos.x < right_threshold then
        new_zone = "centro"
        target_pos_x = -420
    else
        new_zone = "direita"
        target_pos_x = -840
    end

    -- Verifica se houve mudança na zona
    if new_zone ~= current_zone then
        current_zone = new_zone
        obs.timer_add(update_source_position, 30) -- Adiciona a atualização da posição da fonte
    end
end

-- Função para atualizar a posição da fonte com base na interpolação
function update_source_position()
    local scene_item = get_scene_and_source("gameplay", "tela")
    if not scene_item then
        return
    end

    local pos = obs.vec2()
    obs.obs_sceneitem_get_pos(scene_item, pos)

    -- Define a velocidade de interpolação
    local speed = 0.3

    -- Interpolação suave da posição da fonte
    pos.x = interpolate_position(pos.x, target_pos_x, speed)

    -- Atualizar a posição da fonte apenas se necessário
    if math.abs(pos.x - target_pos_x) > 1 then
        obs.obs_sceneitem_set_pos(scene_item, pos)
    else
        obs.timer_remove(update_source_position) -- Remove o timer se a posição estiver estável
    end
end

-- Função chamada ao carregar o script
function script_load(settings)
    obs.timer_add(update_mouse_position, 200) -- Atualiza a posição do mouse a cada 500 ms
end

-- Função chamada ao descarregar o script
function script_unload()
    obs.timer_remove(update_mouse_position)
    obs.timer_remove(update_source_position)
end
