%Assignment6
Spam_Customer = 0.005;
NonSpam_Customer = 0.0001;

Spam_Watches = 0.0003;
NonSpam_Watches = 0.000004;

Spam_Fun = 0.00015;
NonSpam_Fun = 0.0007;

Spam_Vacation = 0.00025;
NonSpam_Vacation = 0.00014;

Spam = 0.9;
NonSpam = 0.1;

%Part 1
a=NonSpam_Customer*NonSpam_Watches*NonSpam;
b=Spam_Customer*Spam_Watches*Spam;
c=b/a;


%Part 2
a=NonSpam_Fun*NonSpam_Vacation*NonSpam;
b=Spam_Fun*Spam_Vacation*Spam;
c=b/a;