function test()
%來源:https://yuchungchuang.wordpress.com/2018/06/03/matlab-%E4%BA%92%E5%8B%95%E5%BC%8F%E7%A8%8B%E5%BC%8F%E8%A8%AD%E8%A8%88-interactive-programming/
%%ready
withnum=imread('back_with_num.png');
back=imread('back.png');
mole=imread('mole.png');
boom=imread('boom.png');
virus=imread('virus.png');
[s, fs]=audioread('score.wav');
point=0;
exit_game=0;
image(withnum);
text(25, 150, 'READY','FontWeight','bold','FontSize',48,'color','r');
pause(0.5);
text(225, 150, 'GO','FontWeight','bold','FontSize',48,'color','r');
pause(0.5);
image(withnum);
pause(1);
clear withnum
global hit
%
while exit_game==0
    hit=0;
    b_and_m=back;
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
    if point==0
        t=10;
    elseif point<10
        t=5;
    elseif point<20
        t=2;
    elseif point<30
        t=0.5;
    else
        t=0.1;
    end
    enemy=rand(1);
    if enemy>=0.1
        b_and_m(x+30:x+49,y:y+49,:)=mole(1:20,:,:);
        image(b_and_m);
        pause(0.3);
        b_and_m(x:x+49,y:y+49,:)=mole;
        image(b_and_m);
        pause(0.1);
    else
        b_and_m(x+30:x+49,y:y+49,:)=virus(1:20,:,:);
        image(b_and_m);
        pause(0.3);
        b_and_m(x:x+49,y:y+49,:)=virus;
        image(b_and_m);
        pause(0.1);
    end
    text(-10,-10,'point:','FontWeight','bold','FontSize',16);
    text(50, -10, int2str(point),'FontWeight','bold','FontSize',16);
    t0=clock;
    et=0;
    hold on
    while et<t
        et = etime(clock, t0);
        figure('KeyPressFcn',@callback);
    end
    hold off
    if hit==position
        if enemy>=0.1
            point=point+1;
        else
            point=point+5;
        end
        b_and_m(x:x+49,y:y+49,:)=boom;
        sound(s, fs);
        image(b_and_m);
        pause(0.5);
    elseif hit~=0
        break
    end
end

%%over
text(25, 150, 'GAME OVER','FontWeight','bold','FontSize',48,'color','r');
pause(1);
game_over=imread('game_over.jpg');
image(game_over);
text(400,-50,'point:','FontWeight','bold','FontSize',16,'color','r');
text(600, -50, int2str(point),'FontWeight','bold','FontSize',16,'color','r');
%
function callback(~,event)
    global hit
    key = event.Key;  %由控制事件event中取得按下的按鍵Key
    switch key        %針對不同的按鍵做不同的動作
    case 'numpad1'
    hit=1; 
    case 'numpad2'
    hit=2;
    case 'numpad3'
    hit=3;
    case 'numpad4'
    hit=4;
    case 'numpad5'
    hit=5; 
    case 'numpad6'
    hit=6;
    case 'numpad7'
    hit=7;
    case 'numpad8'
    hit=8;
    case 'numpad9'
    hit=9;
    end
end
end
