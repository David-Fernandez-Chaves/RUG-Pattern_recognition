function H = myhough(edge_map)

[x y]=size(edge_map);
DiagonalImage=sqrt(x^2+y^2);

H = zeros(2*round(DiagonalImage)+1,180+1);

for colum=1:x
    for row=1:y
       for theta=-89:1:90
           r=round((colum*cosd(theta)+row*sind(theta)+DiagonalImage))+1;
           if r < size(H,1)
               H(r,round(theta+90))=H(r,round(theta+90))+1;
           end
       end
    end    
end


end

