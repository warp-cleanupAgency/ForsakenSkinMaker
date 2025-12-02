function CreateRig(userr, rig)
local player = game.Players.LocalPlayer
local char = userr
-- Wait for Humanoid
local humanoid = char:WaitForChild("Humanoid")

local clone = rig:Clone()
clone.Name = "Actor"
clone.HumanoidRootPart.CFrame = char.HumanoidRootPart.CFrame
clone.Parent = workspace

for _, v in ipairs(clone:GetDescendants()) do
	if v:IsA("Script") or v:IsA("LocalScript") then
		v:Destroy()
	end
end
task.spawn(function()
for _, v in char:GetDescendants() do
	if v:IsA("BasePart") or v:IsA("Decal") then
		if v.Transparency ~= 1 then v.Transparency = 1 v:SetAttribute("PreviouslyVisible", true) end
	elseif v:IsA("ParticleEmitter") or v:IsA("PointLight") or v:IsA("Beam") or v:IsA("Highlight") or v:IsA("Trail") then
		if v.Enabled then
		   v:SetAttribute("PreviouslyEnabled", true)
           v.Enabled = false
		end
	end
end
while clone do
task.wait()
for _, v in char:GetDescendants() do
	if v:IsA("BasePart") or v:IsA("Decal") then
		if v.Transparency ~= 1 then v.Transparency = 1 v:SetAttribute("PreviouslyVisible", true) end
	end
end
end
end)
for _, part in pairs(clone:GetDescendants()) do
	if part:IsA("BasePart") then
		part.CanCollide = false
		part.Anchored = false
		local real = char:FindFirstChild(part.Name)
		if real and real.Name == "HumanoidRootPart" then
			local weld = Instance.new("WeldConstraint")
			weld.Part0 = part
			weld.Part1 = real
			weld.Parent = part
		end
	end
end
clone.Humanoid.PlatformStand = true
clone.HumanoidRootPart.Massless = true
return clone
end
function Animate(userr, actor, data)
    local character = userr
	local animPlayed
	animPlayed = character.Humanoid.Animator.AnimationPlayed:Connect(function(anim)
	    local oldtrack = actor.Humanoid.Animator:LoadAnimation(anim.Animation)
		oldtrack:Play()
		task.spawn(function()
        while oldtrack.IsPlaying do
           oldtrack:AdjustSpeed(anim.Speed)
		   task.wait()
		end
		end)
		local func1
		local func2
		func1 = anim.Stopped:Connect(function()
		oldtrack:Stop()
        if func1 then func1:Disconnect() end
		if func2 then func2:Disconnect() end
		end)
		func2 = anim.Ended:Connect(function()
		oldtrack:Stop()
        if func1 then func1:Disconnect() end
		if func2 then func2:Disconnect() end
		end)
        for i,v in data do
           if v.Old == anim.Animation.AnimationId then
		       oldtrack:Stop()
			   local newAnim = Instance.new("Animation")
			   newAnim.AnimationId = v.New
			   local track = actor.Humanoid.Animator:LoadAnimation(newAnim)
			   if v.Priority then
				   track.Priority = v.Priority
			   end
			   track:Play()
			   if v.Callback then
				   v.Callback()
			   end
		local func3
		local func4
		func3 = anim.Stopped:Connect(function()
		oldtrack:Stop()
		track:Stop()
        if func3 then func3:Disconnect() end
		if func4 then func4:Disconnect() end
		end)
		func4 = anim.Ended:Connect(function()
        if func3 then func3:Disconnect() end
		if func4 then func4:Disconnect() end
		end)
		   end
		end
	end)
end
local RadiusDetection
function TerrorRadius(data)
  RadiusDetection = workspace.Themes.ChildAdded:Connect(function(v)
      for i,g in data do
         if g.Old == v.Name then
			 v.SoundId = getcustomasset("DustingOver-Assets/"..g.New)
		 end
	  end
  end)
end
