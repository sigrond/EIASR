% Load pretrained network
net = resnet50();

% Visualize the first section of the network.
figure
plot(net)
title('First section of ResNet-50')
set(gca,'YLim',[150 170]);

% Inspect the first layer
net.Layers(1)

% Inspect the last layer
net.Layers(end)

% Number of class names for ImageNet classification task
numel(net.Layers(end).ClassNames)