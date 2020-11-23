function keyDown.register(key)
	if key=="return"then
		local username=	WIDGET.active.username.value
		local email=	WIDGET.active.email.value
		local password=	WIDGET.active.password.value
		local password2=WIDGET.active.password2.value
		if #username==0 then
			LOG.print(text.noUsername)return
		elseif not email:match("^[a-zA-Z0-9_]+@[a-zA-Z0-9_-]+%.[a-zA-Z0-9_]+$")then
			LOG.print(text.wrongEmail)return
		elseif #password==0 or #password2==0 then
			LOG.print(text.noPassword)return
		elseif password~=password2 then
			LOG.print(text.diffPassword)return
		end
		local data=urlencode.encode{
			username=username,
			email=email,
			password=password,
		}
		httpRequest(
			TICK.httpREQ_register,
			"api/account/register",
			"POST",
			{["Content-Type"]="application/x-www-form-urlencoded"},
			data
		)
	elseif key=="escape"then
		SCN.back()
	else
		WIDGET.keyPressed(key)
	end
end

WIDGET.init("register",{
	WIDGET.newText{name="title",		x=80,	y=50,font=70,align="L"},
	WIDGET.newButton{name="login",		x=1140,	y=100,w=170,h=80,color="green",code=function()SCN.swapTo("login","swipeL")end},
	WIDGET.newTextBox{name="username",	x=380,	y=200,w=500,h=60,regex="[0-9A-Za-z_]"},
	WIDGET.newTextBox{name="email",		x=380,	y=300,w=626,h=60,regex="[0-9A-Za-z@._-]"},
	WIDGET.newTextBox{name="password",	x=380,	y=400,w=626,h=60,secret=true,regex="[ -~]"},
	WIDGET.newTextBox{name="password2",	x=380,	y=500,w=626,h=60,secret=true,regex="[ -~]"},
	WIDGET.newButton{name="back",		x=1140,	y=640,w=170,h=80,font=40,code=WIDGET.lnk_BACK},
})