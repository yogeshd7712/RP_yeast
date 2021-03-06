%% Model
for i=1:7
    nb = fitNaiveBayes(training_matrix(:,i),training_matrix(:,8),'prior','uniform');
    pred_tt(:,i)=predict(nb,tt_matrix(:,i));
    pred_test(:,i)=predict(nb,test_matrix(:,i));
end
% B = TreeBagger(500,training_matrix(:,(1:6)),training_matrix(:,7),'prior','uniform');
% pred_tt=predict(B,tt_matrix(:,(1:6)));
% pred_test=predict(B,test_matrix(:,(1:6)));
% pred_tt=srt2numb(cell2mat(pred_tt));
% pred_test=str2numb(cell2mat(pred_test));
%% Converting '0' label to -1 for ROC and AUC
% if the label matix is 0 and 1 than use this to change all the zeros to -1
% for using getAUCandROC function
% for i=1:length(tt_labels)
%     if tt_labels(i)==0
%         tt_labels(i)=-1;
%     end
%     if pred_tt(i)==0
%         pred_tt(i)=-1;
%     end
% 
%     if test_label(i)==0
%         test_label(i)=-1;
%     end
%     if pred_test(i)==0
%         pred_test(i)=-1;
%     end
% end
%% Accuracy
% Visualizing the ROC curves using the average ROC generated by function
% getAUCandROC
%sequence in feature matrix = (CN,JI,KI,PAI,RAI,SI,loc)

[AUC_tt_cn, ROC_tt_cn]=getAUCandROC(tt_labels(:),pred_tt(:,1));
plot(ROC_tt_cn(:,1),ROC_tt_cn(:,2),'m')
hold on
[AUC_tt_JI, ROC_tt_JI]=getAUCandROC(tt_labels(:),pred_tt(:,2));
plot(ROC_tt_JI(:,1),ROC_tt_JI(:,2),'r')
[AUC_tt_KI, ROC_tt_KI]=getAUCandROC(tt_labels(:),pred_tt(:,3));
plot(ROC_tt_JI(:,1),ROC_tt_JI(:,2),'g')
[AUC_tt_PAI, ROC_tt_PAI]=getAUCandROC(tt_labels(:),pred_tt(:,4));
plot(ROC_tt_PAI(:,1),ROC_tt_PAI(:,2),'k')
[AUC_tt_RAI, ROC_tt_RAI]=getAUCandROC(tt_labels(:),pred_tt(:,5));
plot(ROC_tt_RAI(:,1),ROC_tt_RAI(:,2),'b')
[AUC_tt_SI, ROC_tt_SI]=getAUCandROC(tt_labels(:),pred_tt(:,6));
plot(ROC_tt_SI(:,1),ROC_tt_SI(:,2),'y')
[AUC_tt_loc, ROC_tt_loc]=getAUCandROC(tt_labels(:),pred_tt(:,7));
plot(ROC_tt_loc(:,1),ROC_tt_loc(:,2),'c')
title 'ROC curves (physicalPPIs) for Train-Test using Naive Bayes'
legend ('CN','JI','KI','PAI','RAI','SI','loc','Location','northoutside')

%------------------------------------------------------------------------
figure
[AUC_test_cn, ROC_test_cn]=getAUCandROC(tstlbl,pred_test(:,1));
plot(ROC_test_cn(:,1),ROC_test_cn(:,2),'m')
hold on
[AUC_test_JI, ROC_test_JI]=getAUCandROC(tstlbl,pred_test(:,2));
plot(ROC_test_JI(:,1),ROC_test_JI(:,2),'r')
[AUC_test_KI, ROC_test_KI]=getAUCandROC(tstlbl,pred_test(:,3));
plot(ROC_test_JI(:,1),ROC_test_JI(:,2),'g')
[AUC_test_PAI, ROC_test_PAI]=getAUCandROC(tstlbl,pred_test(:,4));
plot(ROC_test_PAI(:,1),ROC_test_PAI(:,2),'k')
[AUC_test_RAI, ROC_test_RAI]=getAUCandROC(tstlbl,pred_test(:,5));
plot(ROC_test_RAI(:,1),ROC_test_RAI(:,2),'b')
[AUC_test_SI, ROC_test_SI]=getAUCandROC(tstlbl,pred_test(:,6));
plot(ROC_test_SI(:,1),ROC_test_SI(:,2),'y')
[AUC_test_loc, ROC_test_loc]=getAUCandROC(tstlbl,pred_test(:,7));
plot(ROC_test_loc(:,1),ROC_test_loc(:,2),'c')
title 'ROC curves (physicalPPIs) for Test-Test using Naive Bayes'
legend ('CN','JI','KI','PAI','RAI','SI','loc','Location','northoutside')
