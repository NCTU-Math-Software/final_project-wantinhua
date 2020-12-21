function test()
%來源:https://yuchungchuang.wordpress.com/2018/06/03/matlab-%E4%BA%92%E5%8B%95%E5%BC%8F%E7%A8%8B%E5%BC%8F%E8%A8%AD%E8%A8%88-interactive-programming/
L = 10;                                            %坐標軸邊長
axis([0 L 0 L])                                    %設定坐標軸
hold on                                            %固定坐標軸
pos = [L L]/2;                                     %主體初始位置
obj = scatter(gca,pos(1),pos(2),500,'r','filled'); %畫出主體
set(gcf,'KeyPressFcn',@callback)
function callback(~,event)
key = event.Key;  %由控制事件event中取得按下的按鍵Key
switch key        %針對不同的按鍵做不同的動作
case 'uparrow'
pos = pos + [0 1]; %上移
case 'downarrow'
pos = pos + [0 -1]; %下移
case 'leftarrow'
pos = pos + [-1 0]; %左移
case 'rightarrow'
pos = pos + [1 0]; %右移
end
set(obj,'xdata',pos(1),'ydata',pos(2)) %更新主體位置
end
end