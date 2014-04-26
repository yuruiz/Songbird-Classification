C = load('data/train.data');
T = load('data/train.label');
weights = eval( [ '[', weightsStr, ']' ] );
#CO = WeightedMajority(C, weights);
CO = PriorWeightedMajority(C, T, weights);
accuracy = PrintAccuracy(CO, T);
csvwrite("./output.txt", -accuracy);


