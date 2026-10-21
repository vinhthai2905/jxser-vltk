
IncludeLib("SETTING")
IncludeLib("ITEM");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\zid_jx\\log\\log.lua")




tb_Mareial = 
{
	100000,
		{
			{G=6,D=1,P=4357,L=0,nrate=0.044		,szname="§¹t Ma §é Giang (cÊp 25)"},				
			{G=6,D=1,P=4358,L=0,nrate=0.044		,szname="Hoµnh T¶o Thiªn Qu©n (cÊp 25)"},				
			{G=6,D=1,P=4359,L=0,nrate=0.044		,szname="V« T­íng Tr¶m (cÊp 25)"},				
			{G=6,D=1,P=4360,L=0,nrate=0.044		,szname="Ph¸ Thiªn Tr¶m (cÊp 25)"},				
			{G=6,D=1,P=4361,L=0,nrate=0.044		,szname="Truy Phong QuyÕt (cÊp 25)"},				
			{G=6,D=1,P=4362,L=0,nrate=0.044		,szname="Truy Tinh Trôc NguyÖt (cÊp 25)"},				
			{G=6,D=1,P=4363,L=0,nrate=0.053		,szname="NhiÕp Hån NguyÖt ¶nh (cÊp 25)"},				
			{G=6,D=1,P=4364,L=0,nrate=0.033		,szname="B¹o Vò Lª Hoa (cÊp 25)"},				
			{G=6,D=1,P=4365,L=0,nrate=0.054		,szname="Cöu Cung Phi Tinh (cÊp 25)"},				
			{G=6,D=1,P=4366,L=0,nrate=0.033		,szname="¢m Phong Thùc Cèt (cÊp 25)"},				
			{G=6,D=1,P=4367,L=0,nrate=0.053		,szname="HuyÒn ¢m Tr¶m (cÊp 25)"},				
			{G=6,D=1,P=4368,L=0,nrate=0.033		,szname="Phong S­¬ng To¸i ¶nh (cÊp 25)"},				
			{G=6,D=1,P=4369,L=0,nrate=0.054		,szname="Tam Nga TÒ TuyÕt (cÊp 25)"},				
			{G=6,D=1,P=4370,L=0,nrate=0.053		,szname="B¨ng Tung V« ¶nh (cÊp 25)"},				
			{G=6,D=1,P=4371,L=0,nrate=0.054		,szname="B¨ng T©m Tiªn Tö (cÊp 25)"},				
			{G=6,D=1,P=4372,L=0,nrate=0.034		,szname="Phi Long T¹i Thiªn (cÊp 25)"},				
			{G=6,D=1,P=4373,L=0,nrate=0.053		,szname="Thiªn H¹ V« CÈu (cÊp 25)"},				
			{G=6,D=1,P=4374,L=0,nrate=0.034		,szname="V©n Long KÝch (cÊp 25)"},				
			{G=6,D=1,P=4375,L=0,nrate=0.033		,szname="Thiªn Ngo¹i L­u Tinh (cÊp 25)"},				
			{G=6,D=1,P=4376,L=0,nrate=0.033		,szname="Thiªn §Þa V« Cùc (cÊp 25)"},				
			{G=6,D=1,P=4377,L=0,nrate=0.053		,szname="Nh©n KiÕm Hîp NhÊt (cÊp 25)"},				
			{G=6,D=1,P=4378,L=0,nrate=0.033		,szname="Ng¹o TuyÕt Tiªu Phong (cÊp 25)"},				
			{G=6,D=1,P=4379,L=0,nrate=0.043		,szname="L«i ®éng Cöu Thiªn (cÊp 25)"},				
		}
}

function main()
	local a = CountFreeRoomByWH(2,3)
		if a <= 0 then
			Say("Vui lßng ®Ó trèng Ýt nhÊt 2x3 « hµnh trang míi cã thÓ sö dông vËt phÈm nµy", 1, "V©ng Ta SÏ S¾p XÕp L¹i/OnCancel")
			return 1
		end
	Say("VËt PhÈm Sau Khi Sö Dông NgÉu nhiªn nhËn ®­îc 1 s¸ch kü n¨ng 90 cã ®¼ng cÊp 25\n Ng­¬i Ch¾c Ch¾n Sö Dông Chø ?", 2, "Ch¾c råi/xacnhan", "Ta nhÇm/OnCancel")
	return 1;
end

function xacnhan( nItemIndex, nPlayerIndex )
	local a = CountFreeRoomByWH(2,3)
		if a <= 0 then
		Say("Vui lßng ®Ó trèng Ýt nhÊt 2x3 « hµnh trang míi cã thÓ sö dông vËt phÈm nµy", 1, "V©ng Ta SÏ S¾p XÕp L¹i/OnCancel")
		return 1
		end
	if CalcEquiproomItemCount( 6, 1, 4390, 0 ) < 1 then
	return Say("Ng­¬i Kh«ng Cã LÔ Bao S¸ch Kü N¨ng 90 CÊp 25 trong hµnh trang", 1, "Ta nhÇm/OnCancel")
	end
	local nrate = random(1,tb_Mareial[1]);
		local nsum = 0
		for nkey,nitem in tb_Mareial[2] do
			nsum = nsum + (nitem["nrate"] * tb_Mareial[1])
			if (nsum > nrate) then
				local g = nitem["G"];
				local d = nitem["D"];
				local p = nitem["P"];
				local l = nitem["L"];
				local nidx = AddItem(g,d,p,l,0,0)
				local szitemname = nitem["szname"]

				Msg2Player(format("B¹n NhËn §­îc 1 <color=yellow>%s<color>",szitemname))
				SaveLogs("lebaokynang25", format("[%s] | Nh©n VËt : %s | Tµi Kho¶n :(%s) | NhËn §­îc ("..szitemname..") Tõ LÔ Bao S¸ch Kü N¨ng 90 CÊp 25 !",date("%H:%M:%S - %d/%m/%Y"),GetName(),GetAccount()));
				ConsumeEquiproomItem(1,6,1,4390,-1)
				return 0
			end
		end
		return 0;
end