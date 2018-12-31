%Assignment1
%close all
%Setting and Load Datas
nu=0.01;
A = importdata('data_lvq_A(1).mat');
B = importdata('data_lvq_B(1).mat');
datas = [A;B];

%Show the datas
figure
hold on
scatter(A(:,1),A(:,2),'r','filled')
scatter(B(:,1),B(:,2),'b','filled')
xlabel('Feature 1')
ylabel('Feature 2')


% nWA = 1;
% nWB = 2;
p=1;
for nWA=1:2      %Multiple Tests
    for nWB=1:2
        subplot(2,2,p)
        hold on
        title(['Prototypes of A: ',num2str(nWA),', Prototypes of B: ',num2str(nWB)])

        %% Prototypes initialization
        w = zeros(nWA+nWB,size(datas,2));
        w(1:nWA,:) = A(randperm(size(A,1),nWA),:); %prototypes of class A
        w(nWA+1:end,:) = B(randperm(size(B,1),nWB),:); %prototypes of class B
        %% Ploting Prototypes Initials
%         colors = rand(size(w,1),3);
%         for n=1:size(w,1)
%            plot(w(n,1),w(n,2),'--gs',...
%             'LineWidth',2,...
%             'MarkerSize',8,...
%             'MarkerEdgeColor',colors(n,:),...
%             'MarkerFaceColor',colors(n,:))      
%         end

        %Until the training error be approximately constant
        TrainingError=[1,0];
        while abs(TrainingError(size(TrainingError,1),1)-TrainingError(size(TrainingError,1),2))>0.000000001
            for n=1:size(datas,1)
                dif=(w-datas(n,:)); %Get the difference
                distance = sum(dif.^2,2); %squared euclidean norm
                [~,i] = min(distance); %Find the minimum distance
                if xor(i<=nWA,n<=size(A,1)) %Check if the prototype and the data are of equal classes
                    w(i,:)=w(i,:)+nu*(dif(i,:)); %Different classes
                else
                    w(i,:)=w(i,:)-nu*(dif(i,:)); %Same class
                end  
            end
            
            %% Ploting Prototypes Progress
%             for n=1:size(w,1)
%                plot(w(n,1),w(n,2),'--gs',...
%                 'LineWidth',2,...
%                 'MarkerSize',8,...
%                 'MarkerEdgeColor',colors(n,:),...
%                 'MarkerFaceColor',colors(n,:))      
%             end

            %% Geting Training Error
            misclassified=0;
            for n=1:size(datas,1)
                dif=(w-datas(n,:)); %Get the difference
                distance = sum(dif.^2,2); %squared euclidean norm
                [~,i] = min(distance); %Find the minimum distance
                if xor(i<=nWA,n<=size(A,1)) %Check if the prototype and the data are of equal classes
                    misclassified=misclassified+1;%Different classes
                end
                %Ploting data with class
                plot(datas(n,1),datas(n,2),'--gs',...
                'LineWidth',2,...
                'MarkerSize',8,...
                'MarkerEdgeColor',colors(i,:),...
                'MarkerFaceColor',colors(i,:)) 
            end
            TrainingError=[TrainingError;[misclassified/size(datas,1),TrainingError(size(TrainingError,1),1)]];
        end
        
        %% Ploting Prototypes
            for n=1:size(w,1)
               plot(w(n,1),w(n,2),'--gs',...
                'LineWidth',2,...
                'MarkerSize',12,...
                'MarkerFaceColor',colors(n,:))      
            end
        
        
        
        %% Ploting Training Error       

%         figure
%         hold on
%         TrainingError(1,:) = [];
%         plot(TrainingError(:,1))
%         axis([1 size(TrainingError,1) 0 1])
%         xlabel('Epochs')
%         ylabel('Training Error')
        p=p+1;
    end
end
