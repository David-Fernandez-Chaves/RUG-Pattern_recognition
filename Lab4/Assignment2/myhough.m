function H = myhough(edge_map)
% figure;
% imshow(edge_map);
    [rows, columns] = find(edge_map); %foreground in an edge map corresponds to edges
% calculations = zeros(size(rows,1),180); %ro's
% for theta = -89:90
%     calculations(:,theta+90) = round((columns.*cosd(theta)+rows.*sind(theta))); %calculate all ro's from a point
% end
% pmax = max(calculations,[],'all') %max ro 
% H = zeros(pmax*2,180); %accumulator array
% for degree = 1:180
%     for values = 1:size(rows,1)
%         H(calculations(values,degree)+pmax,degree) = H(calculations(values,degree)+pmax,degree) +1; % H(ro,zeta) = H(ro,zeta) +1
%     end
% end



    [x y]=size(edge_map);
    DiagonalImage=sqrt(x^2+y^2);
    H = zeros(2*round(DiagonalImage),180);
    for p=1:size(rows,1)
           for theta=-90:1:89
               r=round((columns(p)*cosd(theta)+rows(p)*sind(theta)+DiagonalImage))+1;
               if r < size(H,1)
                   H(r,round(theta+91))=H(r,round(theta+91))+1;
               end
           end
    end

end

