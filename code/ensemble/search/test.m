weightsStr="0.29916028665771943,0.4952211419299066,0.013405987692832518,0.6603050144863059,0.4160424937659589,0.814558456195462,0.385584141074402,0.729953470886448";
C = load('data/train.data');
T = load('data/train.label');
weights = eval( [ '[', weightsStr, ']' ] );
#CO = WeightedMajority(C, weights);
CO = PriorWeightedMajority(C, T, weights);
accuracy = PrintAccuracy(CO, T);
csvwrite("./output.txt", -accuracy);


