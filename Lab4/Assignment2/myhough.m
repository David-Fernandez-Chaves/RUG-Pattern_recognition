function H = myhough(edge_map)
figure;
imshow(edge_map);
[row, column] = find(edge_map); %foreground in an edge map corresponds to edges
calculations = zeros(size(row,1),180);
for theta = -89:90
    calculations(:,theta+90) = round((column.*cosd(theta)+row.*sind(theta)));
end
pmax = max(calculations,[],'all'); %max ro
H = zeros(pmax*2,180);
for degree = 1:180
    H(calculations(:,degree)+pmax,degree) = H(calculations(:,degree)+pmax,degree) +1;
end
% [x y]=size(edge_map);
% DiagonalImage=sqrt(x^2+y^2);
% 
% H = zeros(2*round(DiagonalImage)+1,180+1);
% 
% for colum=1:x
%     for row=1:y
%        for theta=-89:1:91
%            r=round((colum*cosd(theta)+row*sind(theta)+DiagonalImage))+1;
%            if r < size(H,1)
%                H(r,round(theta+90))=H(r,round(theta+90))+1;
%            end
%        end
%     end    
% end


end

