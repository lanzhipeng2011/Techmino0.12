local gc=love.graphics
local int,ceil,rnd,abs=math.floor,math.ceil,math.random,math.abs
local max,min,sin,cos=math.max,math.min,math.sin,math.cos

local BG
local scr=scr
local BGvars={_G=_G,SHADER=SHADER}

local back={}
back.none={
	draw=function()
		gc.clear(.15,.15,.15)
	end,
}
back.grey={
	draw=function()
		gc.clear(.3,.3,.3)
	end,
}
back.glow={
	init=function()
		t=0
	end,
	update=function(dt)
		t=t+dt
	end,
	draw=function()
		local t=(sin(t*.5)+sin(t*.7)+sin(t*.9+1)+sin(t*1.5)+sin(t*2+10))*.08
		gc.clear(t,t,t)
	end,
}--Light-dark
back.rgb={
	init=function()
		t=0
	end,
	update=function(dt)
		t=t+dt
	end,
	draw=function()
		gc.clear(
			sin(t*1.2)*.15+.2,
			sin(t*1.5)*.15+.2,
			sin(t*1.9)*.15+.2
		)
	end,
}--Changing pure color
back.flink={
	init=function()
		t=0
	end,
	update=function(dt)
		t=t+dt
	end,
	draw=function()
		local t=.13-t%3%1.7
		if t<.2 then gc.clear(t,t,t)
		else gc.clear(0,0,0)
		end
	end,
}--Flash after random time
back.aura={
	init=function()
		t=rnd()*3600
		BG.resize(scr.w,scr.h)
	end,
	resize=function(w,h)
		SHADER.aura:send("w",w*scr.dpi)
		SHADER.aura:send("h",h*scr.dpi)
	end,
	update=function(dt)
		t=t+dt
	end,
	draw=function()
		SHADER.aura:send("t",t)
		gc.setShader(SHADER.aura)
		gc.rectangle("fill",0,0,scr.w,scr.h)
		gc.setShader()
	end,
}--Cool liquid background
back.game1={
	init=function()
		t=0
		BG.resize(scr.w)
	end,
	resize=function(w)
		SHADER.gradient1:send("w",w*scr.dpi)
	end,
	update=function(dt)
		t=t+dt
	end,
	draw=function()
		SHADER.gradient1:send("t",t)
		gc.setShader(SHADER.gradient1)
		gc.rectangle("fill",0,0,scr.w,scr.h)
		gc.setShader()
	end,
}--Horizonal red-blue gradient
back.game2={
	init=function()
		t=0
		BG.resize(nil,scr.h)
	end,
	resize=function(w,h)
		SHADER.gradient2:send("h",h*scr.dpi)
	end,
	update=function(dt)
		t=t+dt
	end,
	draw=function()
		SHADER.gradient2:send("t",t)
		gc.setShader(SHADER.gradient2)
		gc.rectangle("fill",0,0,scr.w,scr.h)
		gc.setShader()
	end,
}--Vertical red-green gradient
back.game3={
	init=function()
		t=0
		BG.resize(scr.w,scr.h)
	end,
	resize=function(w,h)
		SHADER.rgb1:send("w",w*scr.dpi)
		SHADER.rgb1:send("h",h*scr.dpi)
	end,
	update=function(dt)
		t=t+dt
	end,
	draw=function()
		SHADER.rgb1:send("t",t)
		gc.setShader(SHADER.rgb1)
		gc.rectangle("fill",0,0,scr.w,scr.h)
		gc.setShader()
	end,
}--Colorful RGB
back.game4={
	init=function()
		t=0
		BG.resize(scr.w,scr.h)
	end,
	resize=function(w,h)
		SHADER.rgb2:send("w",w*scr.dpi)
		SHADER.rgb2:send("h",h*scr.dpi)
	end,
	update=function(dt)
		t=t+dt
	end,
	draw=function()
		SHADER.rgb2:send("t",t)
		gc.setShader(SHADER.rgb2)
		gc.rectangle("fill",0,0,scr.w,scr.h)
		gc.setShader()
	end,
}--Blue RGB
back.game5={
	init=function()
		t=0
	end,
	update=function(dt)
		t=t+dt
	end,
	draw=function()
		local t=2.5-t%20%6%2.5
		if t<.3 then gc.clear(t,t,t)
		else gc.clear(0,0,0)
		end
	end,
}--Lightning

local blocks=require("parts/mino")
local scs=require("parts/spinCenters")
back.game6={
	init=function()
		t=0
		colorLib=_G.SKIN.libColor
		colorSet=_G.setting.skin
		blockImg=_G.TEXTURE.miniBlock
	end,
	update=function(dt)
		t=t+dt
	end,
	draw=function()
		local t=1.2-t%10%3%1.2
		if t<.3 then gc.clear(t,t,t)
		else gc.clear(0,0,0)
		end
		local R=7-int(t*.5)%7
		local _=colorLib[colorSet[R]]
		gc.setColor(_[1],_[2],_[3],.1)
		gc.draw(blockImg[R],640,360,t%3.1416*6,400,400,scs[R][0][2]-.5,#blocks[R][0]-scs[R][0][1]+.5)
	end,
}--Fast lightning + spining tetromino

local matrixT={}for i=1,50 do matrixT[i]={}for j=1,50 do matrixT[i][j]=love.math.noise(i,j)+2 end end
back.matrix={
	init=function()
		t=rnd()*3600
	end,
	update=function(dt)
		t=t+dt
	end,
	draw=function()
		gc.scale(scr.k)
		gc.clear(.15,.15,.15)
		local Y=ceil(scr.h*scr.dpi/80)
		for x=1,ceil(scr.w*scr.dpi/80)do
			for y=1,Y do
				gc.setColor(1,1,1,sin(x+matrixT[x][y]*t)*.1+.1)
				gc.rectangle("fill",80*x,80*y,-80,-80)
			end
		end
		gc.scale(1/scr.k)
	end,
}

back.space={
	init=function()
		stars={}
		W,H=scr.w+20,scr.h+20
		BG.resize(scr.w,scr.h)
	end,
	resize=function(w,h)
		local S=stars
		for i=1,1260,5 do
			local s=rnd(26,40)*.1
			S[i]=s*scr.k			--Size
			S[i+1]=rnd(W)-10		--X
			S[i+2]=rnd(H)-10		--Y
			S[i+3]=(rnd()-.5)*.01*s	--Vx
			S[i+4]=(rnd()-.5)*.01*s	--Vy
		end
	end,
	update=function(dt)
		local S=stars
		--Star moving
		for i=1,1260,5 do
			S[i+1]=(S[i+1]+S[i+3])%W
			S[i+2]=(S[i+2]+S[i+4])%H
		end
	end,
	draw=function()
		gc.clear(.2,.2,.2)
		if not stars[1]then return end
		gc.translate(-10,-10)
		gc.setColor(.8,.8,.8)
		for i=1,1260,5 do
			local s=stars
			local x,y=s[i+1],s[i+2]
			s=s[i]
			gc.rectangle("fill",x,y,s,s)
		end
		gc.translate(10,10)
	end,
	discard=function()
		stars={}
	end,
}

--Make BG vars invisible
for _,bg in next,back do
	if not bg.init		then bg.init=	NULL end setfenv(bg.init	,BGvars)
	if not bg.resize	then bg.resize=	NULL end setfenv(bg.resize	,BGvars)
	if not bg.update	then bg.update=	NULL end setfenv(bg.update	,BGvars)
	if not bg.discard	then bg.discard=NULL end setfenv(bg.discard	,BGvars)
	if not bg.draw		then bg.draw=	NULL end setfenv(bg.draw	,BGvars)
end

BG={
	cur="none",
	resize=NULL,
	update=NULL,
	draw=back.none.draw,
}
function BG.set(bg,data)
	if bg==BG.cur or not setting.bg then return end
	if BG.discard then
		BG.discard()
		collectgarbage()
	end
	BG.cur=bg
	bg=back[bg]

	BG.init=bg.init or NULL
	BG.resize=bg.resize or NULL
	BG.update=bg.update or NULL
	BG.discard=bg.discard or NULL
	BG.draw=bg.draw or NULL
	BG.init()
end
return BG