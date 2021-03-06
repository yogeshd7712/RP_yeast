load functionalPPIs/functionalPPIs.mat
[cn,SI,JI,PAI,RAI,KI]=feature_extraction(ppinteraction,prunique);
[loc]=localization_feat(localization);
for k=1:10
    [training_matrix,tt_matrix,test_matrix,tt_labels,tstlbl,tt_ori,tstlbl_ori]=matrix_generate(ppinteraction,loc,cn, SI, JI, PAI, RAI, KI,ppinteraction);
%     for i=1:7
%         nb = fitNaiveBayes(training_matrix(:,i),training_matrix(:,8),'prior','uniform','distribution','kernel');
%         pred_tt(:,i)=predict(nb,tt_matrix(:,i));
%         pred_test(:,i)=predict(nb,test_matrix(:,i));
%     end
%     nb = fitNaiveBayes(training_matrix(:,(1:7)),training_matrix(:,8),'prior','uniform','distribution','kernel');
%     pred_tt=predict(nb,tt_matrix(:,(1:7)));
%     pred_test=predict(nb,test_matrix(:,(1:7)));
      
%       for i=1:7
%           B = TreeBagger(300,training_matrix(:,i),training_matrix(:,8),'method','classification','prior','uniform');
%           label_train(:,i) = predict(B,tt_matrix(:,i));
%           label_test(:,i) = predict(B,test_matrix(:,i));
%           
%       end
%       for i=1:7
%         [pred_tt(:,i),pred_test(:,i)]=convert(label_train(:,i),label_test(:,i));
%       end
      B = TreeBagger(300,training_matrix(:,(1:7)),training_matrix(:,8));
      label_train = predict(B,tt_matrix);
      label_test = predict(B,test_matrix);
      [pred_tt,pred_test]=convert(label_train,label_test);
     
%     for i=1:7
%         [AUC_tt(i,k),ROCtt{k,i}]=getAUCandROC(tt_labels(:),pred_tt(:,i));
%         
%         
%     end
%     
%     
%    
%     for i=1:7
%         [AUC_test(i,k),ROCtest{k,i}]=getAUCandROC(tstlbl,pred_test(:,i));
%         
%    end
    
    %Use all predictors
    [AUC_tt(k),ROCtt{1,k}]=getAUCandROC(tt_labels(:),pred_tt(:,1));
    [AUC_test(k),ROCtest{1,k}]=getAUCandROC(tstlbl,pred_test(:,1));
    disp(k)
end
