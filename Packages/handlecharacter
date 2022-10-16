local Players = game:GetService("Players");
local LocalPlayer = Players.LocalPlayer;

local function HandleCharacter(EnableBodyParts)
    local genv = getgenv()
    local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait();
    
    genv.Character = Character;
    
    if EnableBodyParts then
        local Humanoid = Character:WaitForChild("Humanoid");
        local HumanoidRootPart = Character:WaitForChild("HumanoidRootPart")
        
        genv.Humanoid = Humanoid
        genv.HumanoidRootPart = HumanoidRootPart
    end
    
    LocalPlayer.CharacterAdded:Once(function() 
        HandleCharacter(EnableBodyParts);
    end)
end


return HandleCharacter
