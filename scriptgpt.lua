-- Script para adicionar ESP básico (caixas) para jogadores inimigos
local player = game.Players.LocalPlayer

-- Função para criar uma caixa em torno de um jogador inimigo
function createESP(enemy)
    local box = Instance.new("BoxHandleAdornment")
    box.Size = Vector3.new(4, 6, 2)  -- Tamanho do box
    box.Adornee = enemy:WaitForChild("HumanoidRootPart")
    box.Color3 = Color3.fromRGB(255, 0, 0)  -- Cor da caixa (vermelha para inimigos)
    box.Transparency = 0.5
    box.Parent = workspace
end

-- Função para percorrer todos os jogadores e verificar se são inimigos
function updateESP()
    for _, v in pairs(game.Players:GetPlayers()) do
        if v ~= player then  -- Exclui o jogador local
            if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                createESP(v.Character)
            end
        end
    end
end

-- Chama a função constantemente para atualizar a lista de inimigos
while true do
    updateESP()
    wait(1)  -- Atualiza a cada 1 segundo
end
-- Script para criar um sistema de mira simples
-- Função para detectar e mirar em inimigos
function checkAim()
    -- Raycast a partir da câmera do jogador para detectar objetos
    local ray = workspace.CurrentCamera:ScreenPointToRay(mouse.X, mouse.Y)
    local hitPart, hitPosition = workspace:FindPartOnRay(ray)
    
    -- Verifica se o Raycast atingiu algo e é um inimigo
    if hitPart and hitPart.Parent and hitPart.Parent:FindFirstChild("Humanoid") then
        local humanoid = hitPart.Parent.Humanoid
        if humanoid and humanoid.Health > 0 then
            -- Aqui você pode ajustar a lógica para realizar ações específicas, como "mira"
            print("Inimigo detectado!")
        end
    end
end

-- Verifique constantemente se há inimigos visíveis
while true do
    checkAim()
    wait(0.1)  -- Verifica a cada 0.1 segundos
end
