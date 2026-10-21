Include("\\RelaySetting\\Task\\call_big_boss_head.lua")

function TaskShedule()
	TaskName( "BOSS Dai HOANG KIM XUAT HIEN" );
	TaskInterval( 1440 );
	TaskTime( 12, 00 );
	TaskCountLimit( 0 );
	OutputMsg( "                      Boss Dai Hoang Kim " );
	OutputMsg( "                          xuat hien vao 12h hang ngay" );
	OutputMsg( "" );
	
end

function TaskContent()
	local soluongboss = 5;
	MAKE_NEW_BIG_BOSS(soluongboss)
	OutputMsg( " ========================================================================================" );
	OutputMsg( "                               Boss Dai Hoang Kim " );
	OutputMsg( "                          xuat hien vao 12h00 hang ngay" );
	OutputMsg( " ========================================================================================" );
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
