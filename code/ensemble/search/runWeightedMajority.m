% weightsStr= '1.5,2.3,4.0,9.1'
C = load('data/train.data');
T = load('data/train.label');
weights = eval( [ '[', weightsStr, ']' ] );
CO = WeightedMajority(C, weights);
accuracy = PrintAccuracy(CO, T);
csvwrite("./output.txt", -accuracy);


