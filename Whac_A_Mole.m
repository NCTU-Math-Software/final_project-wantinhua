%打維尼的遊戲，用鍵盤的1~9或滑鼠左鍵打
%打對的話維尼會爆炸
%打錯就結束
withnum=imread('back_with_num.png');
back=imread('back.png');
mole=imread('mole.png');
boom=imread('boom.png');
point=0;
exit_game=0;
image(withnum);
pause(1)
clear withnum
while exit_game==0
    b_and_m=back;
    hit=0;
    position=randi(9,1);
    switch position
        case{7}
            x=31;y=26;
        case{8}
            x=31;y=136;
        case{9}
            x=31;y=246;
        case{4}
            x=131;y=26;
        case{5}
            x=131;y=136;
        case{6}
            x=131;y=246;
        case{1}
            x=231;y=26;
        case{2}
            x=231;y=136;
        case{3}
            x=231;y=246;
    end
    %
    b_and_m(x+30:x+49,y:y+49,:)=mole(1:20,:,:);
    image(b_and_m);
    pause(0.3);
    b_and_m(x:x+49,y:y+49,:)=mole;
    image(b_and_m);
    text(-10,-10,'point:','FontWeight','bold','FontSize',16);
    text(50, -10, int2str(point),'FontWeight','bold','FontSize',16);
    [X,Y,BUTTON] = ginput(1);
    if BUTTON==1
        if X>=y && X<y+50
            if Y>=x && Y<x+50
                hit=1;
            end
        end
    else
        clear X Y
    end
    if BUTTON-48==position || hit==1
        point=point+1;
        b_and_m(x:x+49,y:y+49,:)=boom;
        image(b_and_m);
        pause(0.5);
    else
        exit_game=1;
    end
end
game_over=imread('game_over.jpg');
image(game_over);
text(50, 500, 'GAME OVER','FontWeight','bold','FontSize',48,'color','c');
text(400,900,'point:','FontWeight','bold','FontSize',16,'color','c');
text(600, 900, int2str(point),'FontWeight','bold','FontSize',16,'color','c');
