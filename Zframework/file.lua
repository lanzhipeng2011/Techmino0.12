local fs=love.filesystem
local FILE={}
function FILE.load(name)
	name=name..".dat"
	local F=fs.newFile(name)
	if F:open("r")then
		local s=F:read()
		F:close()
		if s:sub(1,6)=="return"then
			s=loadstring(s)
			if s then
				setfenv(s,{})
				return s()
			end
		else
			local _,res=json.decode(s)
			if _ then
				return res
			else
				LOG.print(name.." "..text.loadError..(mes or"unknown error"),COLOR.red)
			end
		end
	end
end
function FILE.save(data,name,mode,luacode)
	if not mode then mode="m"end
	name=name..".dat"
	local _,mes
	if not luacode then
		_,data=json.encode(data)
		if not _ then
			LOG.print(name.." "..text.saveError..(mes or"json error"),"error")
			return
		end
	else
		data=dumpTable(data)
	end

	local F=fs.newFile(name)
	F:open("w")
	_,mes=F:write(data)
	F:flush()F:close()
<<<<<<< HEAD
	if not _ then
		LOG.print(text.statSavingError..(mes or"unknown error"),COLOR.red)
	end
end

function FILE.loadSetting()
	local F=files.setting
	if F:open("r")then
		local s=F:read()
		if s:sub(1,6)~="return"then
			s="return{"..s:gsub("\n",",").."}"
		end
		s=loadstring(s)
		F:close()
		if s then
			setfenv(s,{})
			addToTable(s(),SETTING)
		end
	end
end
function FILE.saveSetting()
	local F=files.setting
	F:open("w")
	local _,mes=F:write(dumpTable(SETTING))
	F:flush()F:close()
	if _ then LOG.print(text.settingSaved,COLOR.green)
	else LOG.print(text.settingSavingError..(mes or"unknown error"),COLOR.red)
	end
end

function FILE.loadAccount()
	local F=files.setting
	if F:open("r")then
		local s=F:read()
		if s:sub(1,6)~="return"then
			s="return{"..s:gsub("\n",",").."}"
		end
		s=loadstring(s)
		F:close()
		if s then
			setfenv(s,{})
			addToTable(s(),ACCOUNT)
		end
	end
end
function FILE.saveAccount()
	local F=files.setting
	F:open("w")
	F:write(dumpTable(ACCOUNT))
	F:flush()F:close()
end

function FILE.loadKeyMap()
	local F=files.keyMap
	if F:open("r")then
		local s=loadstring(F:read())
		F:close()
		if s then
			setfenv(s,{})
			addToTable(s(),keyMap)
=======
	if _ then
		if mode:find("m")then
			LOG.print(text.saveDone,COLOR.green)
>>>>>>> 4494dab7d33ea09fa6df435402921522a7895272
		end
	else
		LOG.print(text.saveError..(mes or"unknown error"),"error")
	end
end
return FILE