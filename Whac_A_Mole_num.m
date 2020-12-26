function Whac_A_Mole_num()
%%ready
fig = figure('KeyPressFcn',@kpfcn);
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
%
while exit_game==0
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
        t=1;
    else
        t=1/point;
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
    %
    pause(t);
end
%
%%over
text(25, 150, 'GAME OVER','FontWeight','bold','FontSize',48,'color','r');
pause(1);
game_over=imread('game_over.jpg');
image(game_over);
text(400,-50,'point:','FontWeight','bold','FontSize',16,'color','r');
text(600, -50, int2str(point),'FontWeight','bold','FontSize',16,'color','r');
%
function kpfcn(obj,event)
switch event.Key
case {'numpad1','1'}
    if position==1
        if enemy>=0.1
            point=point+1;
        else
            point=point+5;
        end
        b_and_m(x:x+49,y:y+49,:)=boom;
        sound(s, fs);
        image(b_and_m);
        pause(0.5);
    else
        exit_game=1;
    end
case {'numpad2','2'}
    if position==2
        if enemy>=0.1
            point=point+1;
        else
            point=point+5;
        end
        b_and_m(x:x+49,y:y+49,:)=boom;
        sound(s, fs);
        image(b_and_m);
        pause(0.5);
    else
        exit_game=1;
    end
case {'numpad3','3'}
    if position==3
        if enemy>=0.1
            point=point+1;
        else
            point=point+5;
        end
        b_and_m(x:x+49,y:y+49,:)=boom;
        sound(s, fs);
        image(b_and_m);
        pause(0.5);
    else
        exit_game=1;
    end
case {'numpad4','4'}
    if position==4
        if enemy>=0.1
            point=point+1;
        else
            point=point+5;
        end
        b_and_m(x:x+49,y:y+49,:)=boom;
        sound(s, fs);
        image(b_and_m);
        pause(0.5);
    else
        exit_game=1;
    end
case {'numpad5','5'}
    if position==5
        if enemy>=0.1
            point=point+1;
        else
            point=point+5;
        end
        b_and_m(x:x+49,y:y+49,:)=boom;
        sound(s, fs);
        image(b_and_m);
        pause(0.5);
    else
        exit_game=1;
    end
case {'numpad6','6'}
    if position==6
        if enemy>=0.1
            point=point+1;
        else
            point=point+5;
        end
        b_and_m(x:x+49,y:y+49,:)=boom;
        sound(s, fs);
        image(b_and_m);
        pause(0.5);
    else
        exit_game=1;
    end
case {'numpad7','7'}
    if position==7
        if enemy>=0.1
            point=point+1;
        else
            point=point+5;
        end
        b_and_m(x:x+49,y:y+49,:)=boom;
        sound(s, fs);
        image(b_and_m);
        pause(0.5);
    else
        exit_game=1;
    end
case {'numpad8','8'}
    if position==8
        if enemy>=0.1
            point=point+1;
        else
            point=point+5;
        end
        b_and_m(x:x+49,y:y+49,:)=boom;
        sound(s, fs);
        image(b_and_m);
        pause(0.5);
    else
        exit_game=1;
    end
case {'numpad9','9'}
    if position==9
        if enemy>=0.1
            point=point+1;
        else
            point=point+5;
        end
        b_and_m(x:x+49,y:y+49,:)=boom;
        sound(s, fs);
        image(b_and_m);
        pause(0.5);
    else
        exit_game=1;
    end
end
end
end
