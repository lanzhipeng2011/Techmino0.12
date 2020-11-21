return{
	cmb={nil,"1连击","2连击","3连击","4连击","5连击","6连击","7连击","8连击","9连击","10连击!","11连击!","12连击!","13连击!","14连击!","15连击!","16连击!","17连击!","18连击!","19连击!","巨型连击"},
	spin="型回旋",
	clear={"单清","双清","三清","四清","五清","六清"},
	mini="迷你",b2b="满贯",b3b="大满贯",
	PC="场地全清",HPC="场地半清",

	great="不错!",
	awesome="精彩。",
	almost="差一点!",
	continue="继续。",

	speedLV="速度等级",
	line="行数",atk="攻击",eff="效率",
	rpm="收每分",tsd="T2",
	grade="段位",techrash="消四",
	wave="波数",nextWave="下一波",
	combo="连击",maxcmb="最大连击",
	pc="全清",ko="淘汰",

	finesse_ap="完美极简",
	finesse_fc="全连击",

	ai_fixed="不能同时开启电脑玩家和固定序列",
	ai_prebag="不能同时开启电脑玩家和自定义序列",
	ai_mission="不能同时开启电脑玩家和自定义任务",

	ranks={"差","可","中","良","优"},

	modInstruction="选择你要使用的模组!\n不同的模组会用不同的方式改变游戏规则,来开发新玩法挑战自我吧!\n提醒:开启一些模组会让成绩无效  你可以用键盘开关模组,按tab重置",
	modInfo={
		noNext="无预览:\n禁用预览",
		hideNext="隐藏预览:\n隐藏前几个预览",
		fullNext="全预览:\n强制打开6预览",
		noHold="无暂存:\n禁用暂存",
		hideBlock="隐藏方块:\n隐藏当前方块",
		hideGhost="隐藏阴影:\n隐藏提示阴影",
		hidden="隐形:\n方块将会在锁定之后隐形",
		coverBoard="遮挡:\n遮挡部分/全部场地",
		maxG="20G:\n强制启用最高下落速度",
		suddenLock="0锁延:\n强制启用0锁定延迟",
		oneLife="一命:\n只有一条生命!",
		noTele="简单操作:\n禁用10个高级操作按键",
		forceB2B="禁断满贯:\n满贯点数掉到启动线以下就会结束游戏",
		forceFinesse="禁非极简:\n非极简操作将强制结束游戏",
		mirror="镜像:\n场地左右颠倒",
		flip="翻转:\n场地上下颠倒",
		minG="0G:\n关闭重力",
		infLock="无限锁延:\n方块将不会锁定",
		infLife="不死:\n无限生命数",
		teleMove="瞬移:\n强制启用0DAS和0ARR",
		randSeq="随机序列:\n强制使用随机序列",
		noRotation="无旋转:\n禁用旋转按键",
		noMove="无移动:\n禁用移动按键",
	},
	pauseStat={
		"时间:",
		"按键/旋转/暂存:",
		"落块:",
		"消行/挖掘:",
		"攻击/挖掘攻击:",
		"上涨/接收/抵消:",
		"消除:",
		"回旋:",
		"(大)满贯/全(半)清:",
		"非极简操作:",
	},
	radar={"防","守","攻","送","速","挖"},
	radarData={
		"防/分",
		"综/分",
		"攻/分",
		"送/分",
		"行/分",
		"挖/分",
	},
	WidgetText={
		mode={
			mod="模组(F1)",
		},
		mod={
			title="模组",
		},
		setting_control={
			das="首次移动延迟",arr="移动重复延迟",
			sddas="首次软降延迟",sdarr="软降重复延迟",
			ihs="提前暂存",
		},
		setting_skin={
			spin1="转",
			spin2="转",
			spin3="转",
			spin4="转",
			spin5="转",
			spin6="转",
			spin7="转",
		},
		custom_advance={
			nextCount="Next个数",
			holdCount="暂存个数",
			infHold="无限暂存",

			mindas="最小首次移动延迟",
			minarr="最小移动重复延迟",
			minsdarr="最小软降重复延迟",
		},
		music={
			bgm="音乐",
		},
		sound={
			clear1="消一",
			clear2="消二",
			clear3="消三",
			clear4="消四",
			spin0="空旋转",
			spin1="旋转消一",
			spin2="旋转消二",
			spin3="旋转消三",

			_1="消一",
			_2="消二",
			_3="消三",
			_4="消四",
			z0="Z旋",
			z1="Z旋消一",
			z2="Z旋消二",
			z3="Z旋消三",
			s0="S旋",
			s1="S旋消一",
			s2="S旋消二",
			s3="S旋消三",

			j0="J旋",
			j1="J旋消一",
			j2="J旋消二",
			j3="J旋消三",
			l0="L旋",
			l1="L旋消一",
			l2="L旋消二",
			l3="L旋消三",

			t0="T旋",
			t1="T旋消一",
			t2="T旋消二",
			t3="T旋消三",
			o0="O旋",
			o1="O旋消一",
			o2="O旋消二",
			o3="O旋消三",

			i0="I旋",
			i1="I旋消一",
			i2="I旋消二",
			i3="I旋消三",

			mini="迷你",
			b2b="满贯",
			b3b="大满贯",
			pc="全清",
		},
		minigame={
			mg_15p="数字华容道",
			mg_schulteG="舒尔特方格",
			mg_pong="弹球",
			mg_AtoZ="打字游戏",
			mg_UTTT="战略井字棋",
		},
	},
	modes={
		["sprint_10"]=			{"竞速",		"10行",		"消除10行"},
		["sprint_20"]=			{"竞速",		"20行",		"消除20行"},
		["sprint_40"]=			{"竞速",		"40行",		"消除40行"},
		["dig_10"]=				{"挖掘",		"10L",		"挖掘10行"},
		["dig_40"]=				{"挖掘",		"40L",		"挖掘40行"},
		["dig_100"]=			{"挖掘",		"100L",		"挖掘100行"},
		["dig_400"]=			{"挖掘",		"400L",		"挖掘400行"},
		["dig_1000"]=			{"挖掘",		"1000L",	"挖掘1000行"},
		["sprint_100"]=			{"竞速",		"100行",	"消除100行"},
		["sprint_400"]=			{"竞速",		"400行",	"消除400行"},
		["sprint_1000"]=		{"竞速",		"1000行",	"消除1000行"},
		["drought_normal"]=		{"干旱",		"100行",	"你I没了"},
		["drought_lunatic"]=	{"干旱",		"100行",	"后 妈 发 牌"},
		["marathon_normal"]=	{"马拉松",		"普通",		"200行加速马拉松"},
		["marathon_hard"]=		{"马拉松",		"困难",		"200行高速马拉松"},
		["marathon_ultimate"]=	{"马拉松",		"极限",		"禁止0连击单消之外的任何操作"},
		["solo_1"]=				{"单挑",		"简单",		"打败机器人"},
		["solo_2"]=				{"单挑",		"普通",		"打败机器人"},
		["solo_3"]=				{"单挑",		"困难",		"打败机器人"},
		["solo_4"]=				{"单挑",		"疯狂",		"打败机器人"},
		["solo_5"]=				{"单挑",		"极限",		"打败机器人"},
		["techmino49_easy"]=	{"49人混战",	"简单",		"49人混战,活到最后"},
		["techmino49_hard"]=	{"49人混战",	"困难",		"49人混战,活到最后"},
		["techmino49_ultimate"]={"49人混战",	"极限",		"49人混战,活到最后"},
		["techmino99_easy"]=	{"99人混战",	"简单",		"99人混战,活到最后"},
		["techmino99_hard"]=	{"99人混战",	"困难",		"99人混战,活到最后"},
		["techmino99_ultimate"]={"99人混战",	"极限",		"99人混战,活到最后"},
		["round_1"]=			{"回合制",		"简单",		"下棋模式"},
		["round_2"]=			{"回合制",		"普通",		"下棋模式"},
		["round_3"]=			{"回合制",		"困难",		"下棋模式"},
		["round_4"]=			{"回合制",		"疯狂",		"下棋模式"},
		["round_5"]=			{"回合制",		"极限",		"下棋模式"},
		["master_beginner"]=	{"大师",		"疯狂",		"20G初心者练习"},
		["master_advance"]=		{"大师",		"极限",		"上级者20G挑战"},
		["master_final"]=		{"大师",		"终点",		"究极20G:无法触及的终点"},
		["master_phantasm"]=	{"大师",		"虚幻",		"虚幻20G:???"},
		["GM"]=					{"宗师",		"GM",		"成为方块大师"},
		["blind_easy"]=			{"隐形",		"半隐",		"不强大脑"},
		["blind_normal"]=		{"隐形",		"全隐",		"挺强大脑"},
		["blind_hard"]=			{"隐形",		"瞬隐",		"很强大脑"},
		["blind_lunatic"]=		{"隐形",		"瞬隐+",	"超强大脑"},
		["blind_ultimate"]=		{"隐形",		"啊这",		"你准备好了吗"},
		["blind_wtf"]=			{"隐形",		"不会吧",	"还没准备好"},
		["classic_fast"]=		{"高速经典",	"CTWC",		"高速经典"},
		["survivor_easy"]=		{"生存",		"简单",		"你能存活多久?"},
		["survivor_normal"]=	{"生存",		"普通",		"你能存活多久?"},
		["survivor_hard"]=		{"生存",		"困难",		"你能存活多久?"},
		["survivor_lunatic"]=	{"生存",		"疯狂",		"你能存活多久?"},
		["survivor_ultimate"]=	{"生存",		"极限",		"你能存活多久?"},
		["attacker_hard"]=		{"进攻",		"困难",		"进攻练习"},
		["attacker_ultimate"]=	{"进攻",		"极限",		"进攻练习"},
		["defender_normal"]=	{"防守",		"普通",		"防守练习"},
		["defender_lunatic"]=	{"防守",		"疯狂",		"防守练习"},
		["dig_hard"]=			{"挖掘",		"困难",		"挖掘练习"},
		["dig_ultimate"]=		{"挖掘",		"极限",		"挖掘练习"},
		["bigbang"]=			{"大爆炸",		"简单",		"All-spin 入门教程\n未制作完成,落块即通"},
		["c4wtrain_normal"]=	{"中四宽练习",	"普通",		"无 限 连 击"},
		["c4wtrain_lunatic"]=	{"中四宽练习",	"疯狂",		"无 限 连 击"},
		["pctrain_normal"]=		{"全清训练",	"普通",		"简易全清题库,熟悉全清定式的组合"},
		["pctrain_lunatic"]=	{"全清训练",	"疯狂",		"简易全清题库,熟悉全清定式的组合"},
		["pcchallenge_normal"]=	{"全清挑战",	"普通",		"100行内刷全清"},
		["pcchallenge_hard"]=	{"全清挑战",	"困难",		"100行内刷全清"},
		["pcchallenge_lunatic"]={"全清挑战",	"疯狂",		"100行内刷全清"},
		["tech_normal"]=		{"科研",		"普通",		"禁止断B2B"},
		["tech_normal2"]=		{"科研",		"普通+",	"仅允许回旋与全清"},
		["tech_hard"]=			{"科研",		"困难",		"禁止断B2B"},
		["tech_hard2"]=			{"科研",		"困难+",	"仅允许回旋与全清"},
		["tech_lunatic"]=		{"科研",		"疯狂",		"禁止断B2B"},
		["tech_lunatic2"]=		{"科研",		"疯狂+",	"仅允许spin与PC"},
		["tech_finesse"]=		{"科研",		"极简",		"强制最简操作"},
		["tech_finesse2"]=		{"科研",		"极简+",	"禁止普通消除,强制最简操作"},
		["tsd_easy"]=			{"T2挑战",		"简单",		"你能连续做几个T旋双清?"},
		["tsd_hard"]=			{"T2挑战",		"困难",		"你能连续做几个T旋双清?"},
		["tsd_ultimate"]=		{"T2挑战",		"极限",		"你能连续做几个T旋双清?"},
		["zen"]=				{"禅",			"200",		"不限时200行"},
		["ultra"]=				{"限时打分",	"挑战",		"在两分钟内尽可能拿到最多的分数"},
		["infinite"]=			{"无尽",		"",			"沙盒"},
		["infinite_dig"]=		{"无尽:挖掘",	"",			"挖呀挖呀挖"},
		["custom_clear"]=		{"自定义",		"普通",		"画点什么然后把它消除!"},
		["custom_puzzle"]=		{"自定义",		"拼图",		"画点什么然后把它拼出来吧!"},
		["sprintFix"]=			{"竞速",		"无移动",	"这是可能的。"},
		["sprintLock"]=			{"竞速",		"无旋转",	"这不可能。"},
		["sprintPenta"]=		{"竞速",		"五连块",	"伤脑筋十八块"},
		["sprintMPH"]=			{"竞速",		"纯净",		"纯随机\n无预览\n无暂存"},
	},
	getTip=nil,
}