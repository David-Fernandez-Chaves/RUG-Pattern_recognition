%Assigment 2

%Initialize S and D: 1000 normalized HD
S = zeros(1,1000);
D = zeros(1,1000);

%To S
for i = 1:size(S,2)
    %load a random person set
    dataset = load(sprintf('person%02d.mat',randi(20)));    
    a=[dataset.iriscode(randi(size(dataset.iriscode,1)),:);dataset.iriscode(randi(size(dataset.iriscode,1)),:)];
    S(i)=pdist(a,'hamming');    
end

%To D
for i = 1:size(D,2)
    %load a random person set
    n1 = randi(20);
    n2 = randi(20);
    while n2 == n1
        n2 = randi(20);
    end        
    dataset1 = load(sprintf('person%02d.mat',n1)); 
    dataset2 = load(sprintf('person%02d.mat',n2)); 
    a=[dataset1.iriscode(randi(size(dataset1.iriscode,1)),:);dataset2.iriscode(randi(size(dataset2.iriscode,1)),:)];
    D(i)=pdist(a,'hamming');    
end

