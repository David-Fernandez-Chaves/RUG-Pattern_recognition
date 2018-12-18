function H = myhough(edge_map)
figure;
imshow(edge_map);
[rows, columns] = find(edge_map); %foreground in an edge map corresponds to edges
calculations = zeros(size(rows,1),180); %ro's
for theta = -89:90
    calculations(:,theta+90) = round((columns.*cosd(theta)+rows.*sind(theta))); %calculate all ro's from a point
end
pmax = max(calculations,[],'all') %max ro 
H = zeros(pmax*2,180); %accumulator array
for degree = 1:180
    for values = 1:size(rows,1)
        H(calculations(values,degree)+pmax,degree) = H(calculations(values,degree)+pmax,degree) +1; % H(ro,zeta) = H(ro,zeta) +1
    end
end
% [x y]=size(edge_map);
% DiagonalImage=sqrt(x^2+y^2);
% H = zeros(2*round(DiagonalImage)+1,180+1);
% 
% for colum= columns
%     for row=rows
%        for theta=-89:1:91
%            r=round((colum*cosd(theta)+row*sind(theta)+DiagonalImage))+1;
%            if r < size(H,1)
%                H(r,round(theta+90))=H(r,round(theta+90))+1;
%            end
%        end
%     end    
% end


end

