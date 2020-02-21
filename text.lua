local gc=love.graphics
local rnd=math.random
local mStr=mStr
local rem=table.remove

local textFX={}
function textFX.appear(t)
	mStr(t.text,t.x,t.y-t.font*.7)
end
function textFX.fly(t)
	mStr(t.text,t.x+(t.c-.5)^3*300,t.y-t.font*.7)
end
function textFX.stretch(t)
	gc.push("transform")
		gc.translate(t.x,t.y)
		if t.c<.3 then gc.scale((.3-t.c)*1.6+1,1)end
		mStr(t.text,0,-t.font*.7)
	gc.pop()
end
function textFX.drive(t)
	gc.push("transform")
		gc.translate(t.x,t.y)
		if t.c<.3 then gc.shear((.3-t.c)*2,0)end
		mStr(t.text,0,-t.font*.7)
	gc.pop()
end
function textFX.spin(t)
	gc.push("transform")
		gc.translate(t.x,t.y)
		if t.c<.3 then
			gc.rotate((.3-t.c)^2*4)
		end
		mStr(t.text,0,-t.font*.7)
	gc.pop()
end
function textFX.flicker(t)
	local _,τ,T,Τ=gc.getColor()
	gc.setColor(_,τ,T,Τ*(rnd()+.5))
	mStr(t.text,t.x,t.y-t.font*.7)
end
function textFX.zoomout(t)
	gc.push("transform")
		local k=t.c^.5*.1+1
		gc.translate(t.x,t.y)
		gc.scale(k,k)
		mStr(t.text,0,-t.font*.7)
	gc.pop()
end
function textFX.beat(t)
	gc.push("transform")
		gc.translate(t.x,t.y)
		if t.c<.3 then
			local k=1.3-t.c^2/.3
			gc.scale(k,k)
		end
		mStr(t.text,0,-t.font*.7)
	gc.pop()
end
function getTEXT(text,x,y,font,style,spd,stop)
	return{
		c=0,
		text=text,
		x=x or 0,
		y=y or 0,
		font=font or 40,
		spd=(spd or 1)/60,
		stop=stop,
		draw=textFX[style]or error("unavailable type:"..style),
	}
end--another version of TEXT()
function TEXT(text,x,y,font,style,spd,stop)
	texts[#texts+1]={
		c=0,				--timer
		text=text,			--string
		x=x or 0,			--x
		y=y or 0,			--y
		font=font or 40,	--font
		spd=(spd or 1)/60,	--timing speed(1=last 1 sec)
		stop=stop,			--stop time(sustained text)
		draw=textFX[style]or error("unavailable type:"..style),	--draw method
	}
end
function updateText(list)
	for i=#list,1,-1 do
		local t=list[i]
		t.c=t.c+t.spd
		if t.stop then
			if t.c>t.stop then
				t.c=t.stop
			end
		end
		if t.c>60 then
			rem(list,i)
		end
	end
end
function drawTexts(list)
	for i=1,#list do
		local t=list[i]
		local p=t.c
		gc.setColor(1,1,1,p<.2 and p*5 or p<.8 and 1 or 5-p*5)
		setFont(t.font)
		t:draw()
	end
end