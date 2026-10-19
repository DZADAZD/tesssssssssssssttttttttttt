-- Pile les scripts ici et n'oublie pas d'activer l'option "Force Order" ou d'utiliser l'outil de BlaNiKa
local executor = game:GetService("Workspace").Children:FindFirstChild("StarterGui"):FindFirstChild("ScreenGuis"):FindFirstChild("BlaNiKa") 
-- NOTE : Si tu utilises un autre法官 (script), ajuste cette ligne. Voici la structure standard :

-- Détaillons le script spécifique pour le boite "CommandList" ou "Item"

local function CreatePumpkinTeleporter()
	-- 1. Création de l'objet concret (La Citrouille)
	local Pumpkin = Instance.new("Model")
	Pumpkin.Name = "PumpkinTeleporter"
	Pumpkin.Parent = workspace
	
	-- La partie solide (pour bien cliquer)
	local Mesh = Instance.new("Part")
	Mesh.Size = Vector3.new(3, 4, 3)
	Mesh.Shape = Enum.PartType.Block -- Ou Enum.PartType.Ball
	Mesh.Color = Color3.fromRGB(255, 140, 0) -- Orange citrouille
	Mesh.Transparency = 0.6
	Mesh.Anchor = true
	Mesh.Parent = Pumpkin
	
	-- L'effet de "Glow" (Blob activer pour un look漫画/Anime)
	local Blob = Instance.new("ParticleEmitter")
	Blob.EmissionColor = Color3.fromRGB(255, 215, 0) -- Or
	Blob.Size = Range.new(3, 8)
	Blob.Speed = Range.new(10, 20)
	Blob.Lifetime = Range.new(2, 4)
	Blob.Rate = Range.new(5, 10)
	Blob.Burst = Range.new(30, 50)
	Blob.Parent = Mesh
	
	-- L'ombre ou le nom
	local Label = Instance.new("TextLabel")
	Label.Name = "Pumpkin"
	Label.Size = Vector2.new(2, 1)
	Label.Position = Vector2.new(0, -1)
	Label.BackgroundTransparency = 1
	Label.Text = "🎃 TAP TO FLY"
	Label.TextSize = 24
	Label.TextColor3 = Color3.new(1, 1, 1)
	Label.Parent = Mesh
	
	Pumpkin:SetPrimaryPartCFrame(CFrame.new(0, -2, 0)) -- Position par défaut

	-- 2. Le Script local pour gérer la téléportation
	local LocalScript = Instance.new("Script", Pumpkin)
	LocalScript.Language = "Luau"
	
	-- 3. L'Interface UI (Ce qu'on voit quand on double-clique ou via le menu)
	--[[ C'est ici que BlaNiKa va apparaître, mais précisons l'objet principal ]]
	
	local function TeleportToDoor(player)
		-- Calcul de la position magique (Devine la porte de ton event)
		-- Décommente et modifies ces CFrameX1 et Y selon ta porte
		local targetPos = CFrame.new(10, 5, 10) 
		
		-- Effet de saut (Jump Effect)
		player.HumanoidRootPart = player.HumanoidRootPart or player.Character:FindFirstChild("HumanoidRootPart")
		
		-- Reset de la taille pour l'effet de variation
		if player.HumanoidRootPart then
			player.HumanoidRootPart.Size = Vector3.new(4, 4, 4)
			player.HumanoidRootPart.Anchored = true
			player.Humanoid:ChangeSize(4, 4)
		end
		
		-- Démarrage de l'animation ou un simple CFrame
		player.HumanoidRootPart:CFrameTween(
			targetPos, 
			3, 
			function()
				if player.HumanoidRootPart then
					player.HumanoidRootPart.Anchored = false -- Revenir à la normale
					player.HumanoidRootPart.Size = Vector3.new(1.5, 3, 1.5) -- Taille normale
				end
			end
		)
	end

	-- Fonction appelée quand le joueur clique sur le modèle dans le menu ou le world
	local function OnClick(item)
		-- Si on clique dans le menu de BlaNiKa, on cible le joueur qui a lancé l'objet
		local player = Players[1] -- Assuming 1 player or the specific player in the list
		if item.Parent and item.Parent:IsA("Model") and item.Parent.Name == "PumpkinTeleporter" then
			-- Si l'objet est dans le monde, on s'assoit sur l'objet pour teleporter le joueur dedans
			player:LoadCharacter() -- Assimilation pour prendre la position
			item:Destroy() -- Optionnel : retirer l'objet si on veut juste un effleurement
			
			TeleportToDoor(player)
			wait(1)
			item:Clone().Parent = item.Parent -- Recréer l'objet ici si le joueur reste dedans
		end
	end

	-- Intégration avec BlaNiKa (Adapte selon ton type de menu)
	-- Généralement, on utilise la fonction "Run" dans BlaNiKa
	-- Mais pour un script autonome, voici une version optimisée :
	
	-- --- MAUVAISER VARIANTE : SCRIPT DIRECT POUR CLIMAT ---
	
	task.wait(0.5) -- Petit délai pour éviter les erreurs de load
	local function RunOnPumpkin()
		local player = Players:FindFirstChild("Player") -- Remplace "Player" par le nom de ton humain
		if player then
			-- Utiliser le transformé de la citrouille pour le joueur
			local pumpkin = workspace:FindFirstChild("PumpkinTeleporter")
			if pumpkin and pumpkin.PrimaryPart then
				pumpkin.PrimaryPart.CFrame = CFrame.new(0, -2, 0) -- Positioner la citrouille
			end
		end
	end
	
	-- Aggiungi la fonction "Logic" à BlaNiKa :
	--[[
	local Logic = {}
	Logic.OnClick = function()
		local pumpkin = workspace:FindFirstChild("PumpkinTeleporter")
		if pumpkin then
			-- Faire sauter le joueur
		end
	end
	]]

	Print("Pumpkin Teleporter Loaded !")
end

CreatePumpkinTeleporter()