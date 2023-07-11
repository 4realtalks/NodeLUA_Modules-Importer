local NodeLUA_Modules = script.Parent:WaitForChild("NodeLUA_Modules")

local Importer = {}
Importer.__index = Importer

--[=[
	Imports the NodeLUA module like NodeJS' ESModule

	example:
	```lua
	-- Requiring Services
	local ReplicatedStorage = game:GetService("ReplicatedStorage")

	-- Requires the importer
	local import = require(ReplicatedStorage:WaitForChild("Importer")).import

	-- Imports Promise as example
	local Promise = import("Promise")

	-- Your codes here
	```
]=]
function Importer.import(module: string): typeof(require(
	NodeLUA_Modules:WaitForChild(module):WaitForChild("dist"):WaitForChild("index")
))
	if NodeLUA_Modules:FindFirstChild(module) then
		if
			NodeLUA_Modules:FindFirstChild(module):FindFirstChild("dist")
			and NodeLUA_Modules:FindFirstChild(module):FindFirstChild("dist"):FindFirstChild("index")
		then
			return require(NodeLUA_Modules:WaitForChild(module):WaitForChild("dist"):WaitForChild("index"))
		else
			error(`{module} is missing folder "dist" or "dist.index"`)
		end
	else
		error(`{module} doesn't installed`, 0)
	end
end

return Importer
