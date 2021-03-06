local gc=love.graphics

local function tick_httpREQ_checkAccessToken(task)
	local time=0
	while true do
		coroutine.yield()
		local response,request_error=client.poll(task)
		if response then
			if response.code==200 then
				LOG.print(text.accessSuccessed)
				SCN.go("netgame")
			elseif response.code==403 or response.code==401 then
				httpRequest(
					TICK.httpREQ_getAccessToken,
					PATH.api..PATH.access,
					"POST",
					{["Content-Type"]="application/json"},
					json.encode{
						email=ACCOUNT.email,
						auth_token=ACCOUNT.auth_token,
					}
				)
			else
				local err=json.decode(response.body)
				if err then
					LOG.print(text.netErrorCode..response.code..": "..err.message,"warn")
				end
			end
			return
		elseif request_error then
			LOG.print(text.loginFailed..": "..request_error,"warn")
			return
		end
		time=time+1
		if time>360 then
			LOG.print(text.httpTimeout,"message")
			return
		end
	end
end

local scene={}

function scene.sceneInit()
	sceneTemp={
		tip=text.getTip(),
	}
	BG.set("space")

	GAME.modeEnv=NONE
	--Create demo player
	destroyPlayers()
	GAME.frame=0
	GAME.seed=math.random(2e6)
	PLY.newDemoPlayer(1,900,35,1.1)
end

function scene.update(dt)
	GAME.frame=GAME.frame+1
	PLAYERS[1]:update(dt)
end

function scene.draw()
	gc.setColor(1,1,1)
	gc.draw(IMG.title_color,60,30,nil,1.3)
	setFont(30)
	gc.print(SYSTEM,610,50)
	gc.print(VERSION_NAME,610,90)
	gc.print(sceneTemp.tip,50,660)
	local L=text.modes[STAT.lastPlay]
	setFont(25)
	gc.print(L[1],700,390)
	gc.print(L[2],700,420)
	PLAYERS[1]:draw()
end

scene.widgetList={
	WIDGET.newButton{name="offline",x=150,y=220,w=200,h=140,color="lRed",	font=40,code=WIDGET.lnk_goScene("mode")},
	WIDGET.newButton{name="online",	x=370,y=220,w=200,h=140,color="lCyan",	font=40,code=function()
		if LOGIN then
			if ACCOUNT.access_token then
				httpRequest(
					tick_httpREQ_checkAccessToken,
					PATH.api..PATH.access,
					"GET",
					{["Content-Type"]="application/json"},
					json.encode{
						email=ACCOUNT.email,
						access_token=ACCOUNT.access_token,
					}
				)
			else
				httpRequest(
					TICK.httpREQ_getAccessToken,
					PATH.api..PATH.access,
					"POST",
					{["Content-Type"]="application/json"},
					json.encode{
						email=ACCOUNT.email,
						auth_token=ACCOUNT.auth_token,
					}
				)
			end
		else
			SCN.go("login")
		end
	end},
	WIDGET.newButton{name="custom",	x=590,y=220,w=200,h=140,color="lBlue",	font=40,code=WIDGET.lnk_goScene("customGame")},
	WIDGET.newButton{name="setting",x=150,y=380,w=200,h=140,color="lOrange",font=40,code=WIDGET.lnk_goScene("setting_game")},
	WIDGET.newButton{name="stat",	x=370,y=380,w=200,h=140,color="lGreen",	font=40,code=WIDGET.lnk_goScene("stat")},
	WIDGET.newButton{name="qplay",	x=590,y=380,w=200,h=140,color="white",	font=40,code=function()loadGame(STAT.lastPlay,true)end},
	WIDGET.newButton{name="lang",	x=150,y=515,w=200,h=90,color="lYellow",	font=40,code=WIDGET.lnk_goScene("lang")},
	WIDGET.newButton{name="help",	x=370,y=515,w=200,h=90,color="dGreen",	font=40,code=WIDGET.lnk_goScene("help")},
	WIDGET.newButton{name="quit",	x=590,y=515,w=200,h=90,color="grey",	font=40,code=function()VOC.play("bye")SCN.swapTo("quit","slowFade")end},
	WIDGET.newKey{name="music",		x=150,y=610,w=200,h=60,color="red",				code=WIDGET.lnk_goScene("music")},
	WIDGET.newKey{name="sound",		x=370,y=610,w=200,h=60,color="green",			code=WIDGET.lnk_goScene("sound")},
	WIDGET.newKey{name="minigame",	x=590,y=610,w=200,h=60,color="blue",			code=WIDGET.lnk_goScene("minigame")},
}

return scene