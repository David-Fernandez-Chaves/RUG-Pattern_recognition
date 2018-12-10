function class = KNN(Point,K,data,class_labels)
 
    rank=zeros(K,2);
    
    for sample=1:size(data,1)
        d=norm(data(sample,:)-Point);
        if sample <= K
            rank(K,:) = [d,class_labels(sample)];
            rank=sortrows(rank,1,'descend');
        elseif rank(1,1)>d
           rank(1,:)=[d,class_labels(sample)];
           rank=sortrows(rank,1,'descend');
        end
    end
    

    best = [0 0];
    class = unique(rank(:,2));
    for i=1:size(class,1)
        q=sum(rank(:,2)==class(i));
        if best(1)<q
           best = [q class(i)];
        end        
    end
    
    class = best(2);
end

