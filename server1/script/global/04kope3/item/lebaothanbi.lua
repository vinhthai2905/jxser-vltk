function test()
    Msg2Player("Haha")
end

function ConsumeItem()
    local szMsg = "B¹n nhËn ®­îc 10 <color=yellow> TiÒn ®ång <color>"
    local nCountRequiredKey = CalcEquiproomItemCount(6, 1, 1371, 1)

    if nCountRequiredKey < 1 then
        Talk(1, "", "Sö dông <color=green> LÔ Bao ThÇn BÝ <color> cÇn cã <color=yellow> Ch×a Kho¸ LÊp L¸nh <color>")

        return 1
    else
        local consumeKey = ConsumeEquiproomItem(1, 6, 1, 1371, 1)

        for i = 1, 10 do
            AddEventItem(417)
        end

        Msg2Player(szMsg)

        return 0
    end
end

function main()
    local nItemCount = CalcEquiproomItemCount(6, 1, 4402, 1)

    local isConsumableItem = ConsumeItem()

    if isConsumableItem == 1 then
        return 1
    else
        return 0
    end

end
