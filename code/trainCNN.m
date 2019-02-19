function unetd2 = trainCNN(t1Train_r, gtTrain_r)

% segnet
% lgraph_segnetd2 = segnetLayers([240 240], 4, 2); % encoderdepth=2
% lgraph_segnetd3 = segnetLayers([240 240], 4, 3); % encoderdepth=3
lgraph_unetd2 = unetLayers([240 240], 4, 'EncoderDepth', 2);
% lgraph_unetd3 = unetLayers([240 240], 4, 'EncoderDepth', 3);
% lgraph_fcn8s = fcnLayers([240 240], 4,'type', '8s');

% plot network arch
% figure; plot(lgraph_segnetd2);
% figure; plot(lgraph_segnetd3);
% figure; plot(lgraph_unetd2);
% figure; plot(lgraph_unetd3);
% figure; plot(lgraph_fcn8s);

% gt
pximds = pixelLabelImageDatastore(t1Train_r, gtTrain_r);
% pximdsfcn = pixelLabelImageDatastore(t1Train_rgb, gtTrain_r);

% options_segnetd2 = trainingOptions('sgdm', ...
%     'Momentum',0.9, ...
%     'InitialLearnRate',8e-4, ...
%     'L2Regularization',0.0005, ...
%     'MaxEpochs',150, ...
%     'MiniBatchSize',6, ...
%     'Shuffle','every-epoch', ...
%     'CheckpointPath', tempdir, ...
%     'VerboseFrequency',2, ...
%     'Plots','training-progress');

% options_segnetd3 = trainingOptions('sgdm', ...
%     'Momentum',0.9, ...
%     'InitialLearnRate',8e-4, ...
%     'L2Regularization',0.0005, ...
%     'MaxEpochs',50, ...
%     'MiniBatchSize',6, ...
%     'Shuffle','every-epoch', ...
%     'CheckpointPath', tempdir, ...
%     'VerboseFrequency',2, ...
%     'Plots','training-progress');

options_unetd2 = trainingOptions('sgdm', ...
    'Momentum',0.9, ...
    'InitialLearnRate',8e-4, ...
    'L2Regularization',0.0005, ...
    'MaxEpochs',150, ...
    'MiniBatchSize',6, ...
    'Shuffle','every-epoch', ...
    'CheckpointPath', tempdir, ...
    'VerboseFrequency',2, ...
    'Plots','training-progress');

% options_unetd3 = trainingOptions('sgdm', ...
%     'Momentum',0.9, ...
%     'InitialLearnRate',8e-4, ...
%     'L2Regularization',0.0005, ...
%     'MaxEpochs',50, ...
%     'MiniBatchSize',6, ...
%     'Shuffle','every-epoch', ...
%     'CheckpointPath', tempdir, ...
%     'VerboseFrequency',2, ...
%     'Plots','training-progress');

options_fcn8s = trainingOptions('sgdm', ...
    'Momentum',0.9, ...
    'InitialLearnRate',8e-4, ...
    'L2Regularization',0.0005, ...
    'MaxEpochs',150, ...
    'MiniBatchSize',6, ...
    'Shuffle','every-epoch', ...
    'CheckpointPath', tempdir, ...
    'VerboseFrequency',2, ...
    'Plots','training-progress');

%%
% start training
% modelPath = 'C:\Users\shake\Desktop\MRBrainSeg\trained model\comparsionExp';
% load(fullfile(modelPath, 'model_segnetd2_100.mat'), 'segnetd2');
% load(fullfile(modelPath, 'model_segnetd3_100.mat'), 'segnetd3');
% load(fullfile(modelPath, 'model_unetd2_100.mat'), 'unetd2');
% load(fullfile(modelPath, 'model_unetd3_100.mat'), 'unetd3');


% [segnetd2, segnetd2_info] = trainNetwork(pximds, lgraph_segnetd2, options_segnetd2);
% [segnetd3, segnetd3_info] = trainNetwork(pximds, layerGraph(segnetd3), options_segnetd3);
[unetd2, unetd2_info] = trainNetwork(pximds, lgraph_unetd2, options_unetd2);
% [unetd3, unetd3_info] = trainNetwork(pximds, layerGraph(unetd3), options_unetd3);
% [fcn8s, fcn8s_info] = trainNetwork(pximdsfcn, lgraph_fcn8s, options_fcn8s);




end