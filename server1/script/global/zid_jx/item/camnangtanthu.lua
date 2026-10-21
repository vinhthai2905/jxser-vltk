IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\global\\zid_jx\\lib\\config.lua")
Include("\\script\\global\\zid_jx\\tinhnang\\baicao\\main.lua")
Include("\\script\\global\\zid_jx\\tinhnang\\oantuty\\main.lua")
Include("\\script\\global\\zid_jx\\global\\vongsangtanthu.lua")
Include("\\script\\global\\zid_jx\\giftcode\\gift.lua")
Include("\\script\\global\\zid_jx\\gm\\gm_lib.lua")
Include("\\script\\global\\zid_jx\\gm\\gm_support_tb_blue.lua")
Include("\\script\\global\\zid_jx\\gm\\gm_support.lua")
Include("\\script\\lib\\log.lua")
CAMNANG_TANTHU = "<#><link=image[0]:\\spr\\item\\camnangtanthu.spr>CÈm Nang T©n Thñ: <enter><link>"


function main()
	dofile("script/global/zid_jx/item/camnangtanthu.lua");
		local szTitlez =  CAMNANG_TANTHU.."Chµo mõng b¹n ®Õn víi m¸y chñ <color=green>"..Server_Name.."<color>.<enter>Chóc c¸c nh©n sü b«n tÈu giang hå vui vÎ t¹i. Xin ch©n thµnh c¶m ¬n quý nh©n sü... !"
		local tbOption = {};
		if (ScratchCards == 1) then
			tinsert(tbOption, {"Tham Gia - §¸nh Bµi Cµo", mainbaicao})
		end
		if (RockPaperScissors_Quest == 1) then
			tinsert(tbOption, {"Tham Gia - O¼n Tï T×", mainoantuti})
		end
		tinsert(tbOption, {"M¸u Hç Trî T©n Thñ", GetPoiNewR})
		tinsert(tbOption, {"NhËn Vßng S¸ng Hç Trî T©n Thñ", mainvongsang})
		tinsert(tbOption, {"KiÓm Tra Nh©n VËt(Ng­êi Ch¬i Kh¸c)", KiemTraTTNV})
		tinsert(tbOption, {"NhËp M· GIFTCODE NhËn Th­ëng", CodeStrings})
		tinsert(tbOption, {"Hñy VËt PhÈm", Disposeitem})
		tinsert(tbOption, {"Fix lag thÇn hµnh phï", fixphu})
		tinsert(tbOption, {"§ãng.", onCancel})
	CreateNewSayEx(szTitlez, tbOption)
	return 1
end

function ssjcj(nItemIdx)
	GiveItemUI("Nép Hoa NhËn Th­ëng","Trong Thêi Gian Ho¹t §éng Gom §ñ Sè L­îng Hoa Vµ Nép Cho Ta SÏ NhËn V« Sè PhÇn Th­ëng", "ssjcj_qu", "no" ,1 );
end

function ssjcj_qu(nCount)
	if (nCount ~= 1) then 
		Talk(1, "", "Ta ChØ CÇn 1 c¸i");
		return
	end
	local nItemIndex = GetGiveItemUnit(nCount)	
	local nBindState = GetItemBindState(nItemIndex)
	ItemName = GetItemName(nItemIndex)
	if (ItemName ~= "Cá T­¬i") then
		Talk(1, "", "Ta ChØ NhËn <color=yellow>Cá T­¬i<color> §õng Bá Thø Kh¸c Vµo §©y");
		return
	end
	local strItem = GetItemName(nItemIndex)
	RemoveItemByIndex(nItemIndex)
		CJ_SHASHOUJIAN = 
		{
			1000000,
			{0.1,{"§iÓm Kinh NghiÖm",}},	
			{0.3,{"HuyÒn Tinh Kho¸ng Th¹ch (CÊp 4)",6,1,147,4,}},	
			{0.3,{"HuyÒn Tinh Kho¸ng Th¹ch (CÊp 8)",6,1,147,8,}},	
			{0.2,{"HuyÒn Tinh Kho¸ng Th¹ch (CÊp 9)",6,1,147,9,}},	
			{0.2,{"Tiªn Th¶o Lé",6,1,71,1,}},	 	
			{0.2,{"Phóc Duyªn Lé(TiÓu)",6,1,122,1,}},	 	
			{0.2,{"Phóc Duyªn Lé(Trung)",6,1,123,1,}},	 	
			{0.2,{"Phóc Duyªn Lé(§¹i)",6,1,124,1,}},	 	
			{0.2,{"QuÕ Hoa Töu",6,1,125,1,}},
            {0.3,{"Tiªn Th¶o Lé §Æc BiÖt",6,1,1181,1,}},	 
		}
		TarName=GetName()
		local SumPe =  CJ_SHASHOUJIAN[1];
		local Rand = random(1,SumPe);
		local Sum = 0;
		for i=2,getn(CJ_SHASHOUJIAN) do
			local pnum = CJ_SHASHOUJIAN[i][1];
			local item = CJ_SHASHOUJIAN[i][2];
			Sum = Sum + pnum * SumPe;
				if Rand < Sum then
							if getn(item) == 1 then
									AddOwnExp(random(5000000, 10000000))
									Msg2Player("B¹n NhËn §­îc <color=green>"..item[1].."<color>!");
							elseif getn(item) == 5 then
									AddItem(item[2],item[3],item[4],item[5],0,0) 
									Msg2Player("B¹n NhËn §­îc <color=green>"..item[1].."<color>!");
							end
						break;
				end
		end
end;

function GetPoiNewR()
	if GetLevel() <= 79 then
		AskClientForNumber("numidr",1,60,"NhËp Sè L­îng")	
	else	
		Talk(1, "", "Chøc N¨ng NhËn M¸u ChØ Hç Trî Cho Ng­êi Ch¬i CÊp 79 Trë Xuèng")
	end
end
function numidr(nCount)
	if CalcFreeItemCellCount() < nCount then
		Talk(1, "", format("B¹n Kh«ng §ñ <color=yellow>%d<color> « Trèng", nCount))
		return
	end
	for i = 1,nCount do
		local ItemIdx = AddItem(1,2,0,5,0,0)
		BindItem(ItemIdx)
	end
	Msg2Player("B¹n NhËn §­îc "..nCount.." Ngò Hoa Ngäc Lé Hoµn")
end



function maintestdotim()
local szTitle = "<color=green>HÖ thèng Hç Trî §å TÝm , Ng­êi Muèn G×?<color>"
local tbOpt =
	{
		{"§å TÝm 6 Dßng", Gm_Support_TB_Violet},
		{"Kho¸ng Th¹ch Vµ HuyÒn Tinh.", TestKhoangThach},
		{"NhËn §å Xanh", Gm_Support_TB_Blue},
		{"Tho¸t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end

function mainoantuti()
PaiGowPoker:DialogMain()
end

function mainbaicao()
RockPaperScissors:DialogMain()
end
function mainvongsang()
FootNewbie:IsActivity()
end


function Disposeitem()
		Say(CAMNANG_TANTHU.."B¹n cã ch¾c muèn <color=red>hñy vËt phÈm<color> chø, h·y suy nghÜ kü!<enter><color=0xffff5f>TÊt c¶ c¸c vËt phÈm ®­îc yªu cÇu hñy sÏ bÞ hñy bá <enter>hoµn toµn bëi hÖ thèng, bÊt kÓ lµ vËt phÈm nµo!", 2, "Ta nghÜ kü råi!/DelItem_Sure", "Th«i, ta nhÇm!/Quit")
end
function DelItem_Sure()
	GiveItemUI("Hñy vËt phÈm", "§¹i hiÖp h·y cÈn träng trong   viÖc hñy vËt phÈm!", "DisposeConfirm", "Quit", 1);
end

function DisposeConfirm(nCount)
	local DelItemFileName = openfile("script/global/zid_jx/log/delete_item/del_item_"..date("%d_%m_%Y")..".log", "a");
	local G, D, P, L, S
	local Count_ItemRemove = 0
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		G, D, P, L, S = GetItemProp(nItemIndex)
		if (G == 4) and (D == 417) and (P == 1) then
			Msg2Player("vËt phÈm [<color=green>"..strItem.."<color>] Kh«ng ThÓ Huû Bá.")
		else
			
			RemoveItemByIndex(nItemIndex)
			Msg2Player("§· hñy vËt phÈm [<color=green>"..strItem.."<color>]")
			Count_ItemRemove = Count_ItemRemove + 1
		end
		if strItem ~= "TiÒn ®ång" then
		write(DelItemFileName, date("%H:%M:%S").."\t Account: "..GetAccount().."\tName: "..GetName().."\t DelItem: "..strItem, "\n")
		end
	end
	closefile(DelItemFileName)
	Msg2Player("Thao t¸c hñy vËt phÈm thµnh c«ng")
	Talk(1, "", "Thao t¸c thµnh c«ng, kiÓm tra l¹i!<enter>§· hñy<color=yellow> "..Count_ItemRemove.."<color> vËt phÈm!");	
end




function onCancel()
end
function fixphu()
	if GetTask(5718) >= 1 then
	return Talk(1,"","B¹n §ang NhËn NhiÖm Vô VËn L­¬ng\n Kh«ng ThÓ Söa Tr¹ng Th¸i ThÇn Hµnh Phï")
	end
	local nSubWorldID = GetWorldPos();
	if (nSubWorldID == 959) then
		Msg2Player("B¶n ®å hiÖn t¹i Kh«ng Hç trî Söa Lçi thÇn hµnh phï.");
		return 1
	else
	DisabledUseTownP(0);
	WorldIdx = SubWorldID2Idx(53)
	SubWorld = WorldIdx;
	SetAutoHangMapFlag(0)
	Msg2Player("<color=yellow>Söa lçi kh«ng sö dông ®­îc ThÇn Hµnh Phï vµ Thæ §Þa Phï thµnh c«ng<color>")
	end
end



















function KiemTraTTNV()
	AskClientForString("KiemTraTTNVOK","",1,999999999,"Tªn 1 Nh©n VËt")
end

function KiemTraTTNVOK(nVar)
	gmName=GetName()
	ObjName=GetName() 
	local gmPlayerIDX = PlayerIndex
	local searchPlayerIDX = SearchPlayer(nVar);
	PlayerIndex = searchPlayerIDX

	if searchPlayerIDX > 0 then 
		
		local nTrungSinh = ST_GetTransLifeCount()
		local sex = GetSex();
		local Faction = GetLastFactionNumber();
		local CurLevel = GetLevel();
		local nCurLife 		= GetLife(0); -- Sinh Lùc
		local nCurMana 		= GetMana(0); -- Néi lùc
		local nCurStamina 	= GetStamina(0); -- thÓ lùc
		local nCurCold 		= GetColdR(0); -- kh¸ng b¨ng
		local nCurLight 	= GetLightR(0); -- kh¸ng l«i 
		local nCurFire 		= GetFireR(0); -- kh¸ng háa 
		local nCurPoison 	= GetPoisonR(0); -- kh¸ng ®éc
		local nCurExp 	= GetExpPercent(); -- kinh nghiÖm %
		local nCurPhy 		= GetPhyR(0); -- phßng thñ vËt lý 
		local trungsinh = ST_GetTransLifeCount()
		if trungsinh == 0 then trungsinh = "Ch­a chuyÓn sinh" end 
		if nCurCold <= 0 then nCurCold = "0"  end 
		if nCurLight <= 0 then nCurLight = "0"  end 
		if nCurFire <= 0 then nCurFire = "0"  end 
		if nCurPoison <= 0 then nCurPoison = "0"  end 
		if nCurPhy <= 0 then nCurPhy = "0"  end 
		local nCurEng 		= GetEng(0); -- ®iÓm néi c«ng
		local nCurDex	 	= GetDex(0); -- §iÓm th©n ph¸p 
		local nCurStrg 		= GetStrg(0); -- §iÓm søc m¹nh 
		local nCurVit 		= GetVit(0); -- §iÓm sinh khÝ 
		local nPK 		= GetPK();
		local nCurRestAP 	= GetRestAP(); -- §iÓm tiÒm n¨ng ch­a céng
		local nCurtalSkill = GetTotalSkill();
		local nCurRestSP 	= GetRestSP(); -- §iÓm kü n¨ng ch­a céng 
		local zFaction = "Ch­a gia nhËp m«n ph¸i"
		if sex == 0 then sex = "Nam" else sex = "N÷" end --ktra lai khi test ko nho 0 la nam hay 1 la nam
		if Faction == 0 then zFaction = "ThiÕu L©m" 
		elseif Faction == 1 then zFaction = "Thiªn V­¬ng"
		elseif Faction == 2 then zFaction = "§­êng M«n" 
		elseif Faction == 3 then zFaction = "Ngò §éc" 
		elseif Faction == 4 then zFaction = "Nga My" 
		elseif Faction == 5 then zFaction = "Thóy Yªn" 
		elseif Faction == 6 then zFaction = "C¸i Bang" 
		elseif Faction == 7 then zFaction = "Thiªn NhÉn" 
		elseif Faction == 8 then zFaction = "Vâ §ang" 
		elseif Faction == 9 then zFaction = "C«n L«n" 
		elseif Faction == 10 then zFaction = "Hoa S¬n"
		end
		local nRepute 		= GetRepute();
		local nLead 		= GetLeadLevel();
		local nFuYuan 		= GetTask(151);
		local nSongJin 		= GetTask(747);
		local nLeague 		= GetTask(2501);
		local nTongname 		= GetTongName();
		if nTongname == "" then nTongname = "Ch­a Gia NhËp" end
		local nSeries 		= GetSeries();
		local zSeries = "Kh«ng Thuéc HÖ Nµo"
		if nSeries == 0 then zSeries = "HÖ Kim" 
		elseif nSeries == 1 then zSeries = "HÖ Méc"
		elseif nSeries == 2 then zSeries = "HÖ Thñy" 
		elseif nSeries == 3 then zSeries = "HÖ Háa" 
		elseif nSeries == 4 then zSeries = "HÖ Thæ" 
		end
		
		PlayerIndex = gmPlayerIDX;
			if zMsgTalk ~= "" then 
				local szTitle = "   <color=Green>Th«ng tin nh©n vËt<color> : <color=orange>"..nVar.."<color>\n";
				szTitle = szTitle..format("<color=cyan>§¼ng CÊp_________________:<color=orange>"..CurLevel.."<color> \n");
				szTitle = szTitle..format("<color=cyan>Trïng Sinh_______________:<color=orange>"..trungsinh.."<color> \n");
				szTitle = szTitle..format("<color=cyan>Kinh NghiÖm______________:<color=orange>"..nCurExp.."<color> PhÇn Tr¨m\n");
				szTitle = szTitle..format("<color=cyan>Bang Héi_________________:<color=orange>"..nTongname.."<color> \n");
				szTitle = szTitle..format("<color=cyan>§iÓm Pk__________________:<color=orange>"..nPK.."<color> \n");
				szTitle = szTitle..format("<color=cyan>Giíi tÝnh________________:<color=orange>"..sex.."<color> \n");
				szTitle = szTitle..format("<color=cyan>M«n Ph¸i_________________:<color=orange>"..zFaction.."<color> \n");
				szTitle = szTitle..format("<color=cyan>Thuéc TÝnh HÖ____________:<color=orange>"..zSeries.."<color> \n");
				szTitle = szTitle..format("<color=cyan>Danh väng________________:<color=orange>"..nRepute.." ®iÓm<color> \n");
				szTitle = szTitle..format("<color=cyan>Tµi l·nh ®¹o_____________:<color=orange>"..nLead.."<color> \n");
				szTitle = szTitle..format("<color=cyan>Phóc duyªn_______________:<color=orange>"..nFuYuan.." ®iÓm<color> \n");
				szTitle = szTitle..format("<color=cyan>TÝch lòy Tèng Kim________:<color=orange>"..nSongJin.." ®iÓm<color> \n");
				szTitle = szTitle..format("<color=cyan>TÝch lòy Liªn §Êu________:<color=orange>"..nLeague.." ®iÓm<color> \n");
				szTitle = szTitle..format("<color=cyan>Sinh lùc hiÖn t¹i________:<color=orange>"..nCurLife.." ®iÓm<color> \n");
				szTitle = szTitle..format("<color=cyan>Néi lùc hiÖn t¹i_________:<color=orange>"..nCurMana.." ®iÓm<color> \n");
				szTitle = szTitle..format("<color=cyan>ThÓ lùc hiÖn t¹i_________:<color=orange>"..nCurStamina.." ®iÓm<color> \n");
				szTitle = szTitle..format("<color=cyan>Phßng thñ vËt lý_________:<color=orange>"..nCurPhy.."<color> \n");
				szTitle = szTitle..format("<color=cyan>Kh¸ng b¨ng_______________:<color=orange>"..nCurCold.." <color> \n");
				szTitle = szTitle..format("<color=cyan>Kh¸ng l«i________________:<color=orange>"..nCurLight.." <color> \n");
				szTitle = szTitle..format("<color=cyan>Kh¸ng háa________________:<color=orange>"..nCurFire.."<color> \n");
				szTitle = szTitle..format("<color=cyan>Kh¸ng ®éc________________:<color=orange>"..nCurPoison.."<color> \n");
				szTitle = szTitle..format("<color=cyan>§iÓm Søc m¹nh §· Céng____:<color=orange>"..nCurStrg.." ®iÓm<color> \n");
				szTitle = szTitle..format("<color=cyan>§iÓm Sinh khÝ §· Céng____:<color=orange>"..nCurVit.." ®iÓm<color> \n");
				szTitle = szTitle..format("<color=cyan>§iÓm Th©n ph¸p §· Céng___:<color=orange>"..nCurDex.." ®iÓm<color> \n");
				szTitle = szTitle..format("<color=cyan>§iÓm Néi c«ng §· Céng____:<color=orange>"..nCurEng.." ®iÓm<color> \n");
				szTitle = szTitle..format("<color=cyan>§iÓm TiÒm n¨ng ch­a céng_:<color=orange>"..nCurRestAP.." ®iÓm<color>\n");
				szTitle = szTitle..format("<color=cyan>§iÓm Kü n¨ng §· céng_____:<color=orange>"..nCurtalSkill.." ®iÓm<color>\n");
				szTitle = szTitle..format("<color=cyan>§iÓm Kü n¨ng ch­a céng___:<color=orange>"..nCurRestSP.." ®iÓm<color>\n");
				szTitle = szTitle.."<color>";
				local tbOption = {};
					-- tinsert(tbOption, {"HiÖn Kªnh HÖ Thèng Th«ng B¸o Gióp Ta!",kenhthegioi(nVar)});
					tinsert(tbOption, {"Ta §· Râ!",kenhthegioi(nVar)});
				CreateNewSayEx(szTitle,tbOption);
			else
				-- Msg2Player("<color=orange>Th«ng B¸o<color> : B¹n vui lßng kiÓm tra l¹i th«ng tin nhËp vµo cña nh©n vËt<color=orange> "..nVar.." player ")
				local szTitle = "          <color=orange>Th«ng B¸o<color>  :\n";
				szTitle = szTitle..format("B¹n vui lßng kiÓm tra l¹i th«ng tin nhËp vµo cña nh©n vËt<color=orange> "..nVar.." player");
				local tbOption = {};
					tinsert(tbOption, {"Ta §· Râ!"});
				CreateNewSayEx(szTitle,tbOption);
			end

	else
		PlayerIndex = gmPlayerIDX;
		-- Msg2Player(format("<color=orange>Th«ng B¸o<color>: Cã thÓ b¹n ®· nhÇm tªn nh©n vËt :<color=orange>[%s]<color> kh«ng cã trong server. HoÆc §ang Offline",nVar))
		local szTitle = "          <color=orange>Th«ng B¸o<color>  :\n";
				szTitle = szTitle..format("Cã thÓ b¹n ®· nhÇm tªn nh©n vËt : <color=orange>"..nVar.."<color>\n");
				szTitle = szTitle..format("Nh©n vËt : <color=orange>"..nVar.."<color> Kh«ng Cã Trong SerVer\n");
				szTitle = szTitle..format("HoÆc nh©n vËt <color=orange>"..nVar.."<color> Kh«ng Online");
				local tbOption = {};
					tinsert(tbOption, {"Ta §· Râ!"});
				CreateNewSayEx(szTitle,tbOption);
	end

end
function kenhthegioi(nVar)
	gmName=GetName()
	ObjName=GetName() 
	local gmPlayerIDX = PlayerIndex
	local searchPlayerIDX = SearchPlayer(nVar);
	PlayerIndex = searchPlayerIDX

	if searchPlayerIDX > 0 then 
		
		local nTrungSinh = ST_GetTransLifeCount()
		local sex = GetSex();
		local Faction = GetLastFactionNumber();
		local CurLevel = GetLevel();
		local nCurLife 		= GetLife(0); -- Sinh Lùc
		local nCurMana 		= GetMana(0); -- Néi lùc
		local nCurStamina 	= GetStamina(0); -- thÓ lùc
		local nCurCold 		= GetColdR(0); -- kh¸ng b¨ng
		local nCurLight 	= GetLightR(0); -- kh¸ng l«i 
		local nCurFire 		= GetFireR(0); -- kh¸ng háa 
		local nCurPoison 	= GetPoisonR(0); -- kh¸ng ®éc
		local nCurExp 	= GetExpPercent(); -- kinh nghiÖm %
		local nCurPhy 		= GetPhyR(0); -- phßng thñ vËt lý 
		local trungsinh = ST_GetTransLifeCount()
		if trungsinh == 0 then trungsinh = "Ch­a chuyÓn sinh" end 
		if nCurCold <= 0 then nCurCold = "0"  end 
		if nCurLight <= 0 then nCurLight = "0"  end 
		if nCurFire <= 0 then nCurFire = "0"  end 
		if nCurPoison <= 0 then nCurPoison = "0"  end 
		if nCurPhy <= 0 then nCurPhy = "0"  end 
		local nCurEng 		= GetEng(0); -- ®iÓm néi c«ng
		local nCurDex	 	= GetDex(0); -- §iÓm th©n ph¸p 
		local nCurStrg 		= GetStrg(0); -- §iÓm søc m¹nh 
		local nCurVit 		= GetVit(0); -- §iÓm sinh khÝ 
		local nPK 		= GetPK();
		local nCurRestAP 	= GetRestAP(); -- §iÓm tiÒm n¨ng ch­a céng
		local nCurtalSkill = GetTotalSkill();
		local nCurRestSP 	= GetRestSP(); -- §iÓm kü n¨ng ch­a céng 
		local zFaction = "Ch­a gia nhËp m«n ph¸i"
		if sex == 0 then sex = "Nam" else sex = "N÷" end --ktra lai khi test ko nho 0 la nam hay 1 la nam
		if Faction == 0 then zFaction = "ThiÕu L©m" 
		elseif Faction == 1 then zFaction = "Thiªn V­¬ng"
		elseif Faction == 2 then zFaction = "§­êng M«n" 
		elseif Faction == 3 then zFaction = "Ngò §éc" 
		elseif Faction == 4 then zFaction = "Nga My" 
		elseif Faction == 5 then zFaction = "Thóy Yªn" 
		elseif Faction == 6 then zFaction = "C¸i Bang" 
		elseif Faction == 7 then zFaction = "Thiªn NhÉn" 
		elseif Faction == 8 then zFaction = "Vâ §ang" 
		elseif Faction == 9 then zFaction = "C«n L«n" 
		elseif Faction == 10 then zFaction = "Hoa S¬n"
		end
		local nRepute 		= GetRepute();
		local nLead 		= GetLeadLevel();
		local nFuYuan 		= GetTask(151);
		local nSongJin 		= GetTask(747);
		local nLeague 		= GetTask(2501);
		local nTongname 		= GetTongName();
		if nTongname == "" then nTongname = "Kh«ng" end
		local nSeries 		= GetSeries();
		local zSeries = "Kh«ng Thuéc HÖ Nµo"
		if nSeries == 0 then zSeries = "HÖ Kim" 
		elseif nSeries == 1 then zSeries = "HÖ Méc"
		elseif nSeries == 2 then zSeries = "HÖ Thñy" 
		elseif nSeries == 3 then zSeries = "HÖ Háa" 
		elseif nSeries == 4 then zSeries = "HÖ Thæ" 
		end
		
		PlayerIndex = gmPlayerIDX;
			if zMsgTalk ~= "" then 
				Msg2Player("<color=Green>Th«ng tin nh©n vËt:<color=orange>"..nVar.."<color>");
				Msg2Player("<color=cyan>§¼ng CÊp_______________:<color=orange>"..CurLevel.."<color>");
				Msg2Player("<color=cyan>Trïng Sinh_____________:<color=orange>"..trungsinh.."<color>");
				Msg2Player("<color=cyan>Kinh NghiÖm__________:<color=orange>"..nCurExp.."<color> %");
				Msg2Player("<color=cyan>Bang Héi_______________:<color=orange>"..nTongname.."<color>");
				Msg2Player("<color=cyan>§iÓm Pk________________:<color=orange>"..nPK.."<color>");
				Msg2Player("<color=cyan>Giíi tÝnh______________:<color=orange>"..sex.."<color>");
				Msg2Player("<color=cyan>M«n Ph¸i_______________:<color=orange>"..zFaction.."<color>");
				Msg2Player("<color=cyan>Thuéc TÝnh HÖ__________:<color=orange>"..zSeries.."<color>");
				Msg2Player("<color=cyan>Danh väng______________:<color=orange>"..nRepute.." ®iÓm<color>");
				Msg2Player("<color=cyan>Tµi l·nh ®¹o___________:<color=orange>"..nLead.."<color>");
				Msg2Player("<color=cyan>Phóc duyªn_____________:<color=orange>"..nFuYuan.." ®iÓm<color>");
				Msg2Player("<color=cyan>TÝch lòy Tèng Kim______:<color=orange>"..nSongJin.." ®iÓm<color>");
				Msg2Player("<color=cyan>TÝch lòy Liªn §Êu______:<color=orange>"..nLeague.." ®iÓm<color>");
				Msg2Player("<color=cyan>Sinh lùc hiÖn t¹i______:<color=orange>"..nCurLife.." ®iÓm<color>");
				Msg2Player("<color=cyan>Néi lùc hiÖn t¹i_______:<color=orange>"..nCurMana.." ®iÓm<color>");
				Msg2Player("<color=cyan>ThÓ lùc hiÖn t¹i_______:<color=orange>"..nCurStamina.." ®iÓm<color>");
				Msg2Player("<color=cyan>Phßng thñ vËt lý_______:<color=orange>"..nCurPhy.." %<color>");
				Msg2Player("<color=cyan>Kh¸ng b¨ng_____________:<color=orange>"..nCurCold.." %<color>");
				Msg2Player("<color=cyan>Kh¸ng l«i______________:<color=orange>"..nCurLight.." %<color>");
				Msg2Player("<color=cyan>Kh¸ng háa______________:<color=orange>"..nCurFire.." %<color>");
				Msg2Player("<color=cyan>Kh¸ng ®éc______________:<color=orange>"..nCurPoison.." %<color>");
				Msg2Player("<color=cyan>§iÓm Søc m¹nh §· Céng___:<color=orange>"..nCurStrg.." ®iÓm<color>");
				Msg2Player("<color=cyan>§iÓm Sinh khÝ §· Céng___:<color=orange>"..nCurVit.." ®iÓm<color>");
				Msg2Player("<color=cyan>§iÓm Th©n ph¸p §· Céng__:<color=orange>"..nCurDex.." ®iÓm<color>");
				Msg2Player("<color=cyan>§iÓm Néi c«ng §· Céng___:<color=orange>"..nCurEng.." ®iÓm<color>");
				Msg2Player("<color=cyan>§iÓm TiÒm n¨ng ch­a céng_:<color=orange>"..nCurRestAP.." ®iÓm<color>");
				Msg2Player("<color=cyan>§iÓm Kü n¨ng §· céng____:<color=orange>"..nCurtalSkill.." ®iÓm<color>");
				Msg2Player("<color=cyan>§iÓm Kü n¨ng ch­a céng__:<color=orange>"..nCurRestSP.." ®iÓm<color>");
			else
				Msg2Player("<color=orange>Th«ng B¸o<color> : B¹n vui lßng kiÓm tra l¹i th«ng tin nhËp vµo cña nh©n vËt<color=orange> "..nVar.." player ")
			end

	else
		PlayerIndex = gmPlayerIDX;
		Msg2Player(format("<color=orange>Th«ng B¸o<color>: Cã thÓ b¹n ®· nhÇm tªn nh©n vËt :<color=orange>[%s]<color> kh«ng cã trong server. HoÆc §ang Offline",nVar))
	end

end