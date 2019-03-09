progress = 'Generating ROC Curve'

roc = zeros(2, 200);
%roc(1,x) // roc(2,y)

x = 0;
y = 0;

%ROC Calculation
    for i=1 : 200
        %False Rejection Rate
        x = sum(hist_g(:, i:200));
        roc(2,i) = x;
        
        %False Acception Rate
        y = sum(hist_i(:, 1:i));
        roc(1,i) = y;
    end
    
    plot(roc(1,:), roc(2,:));
    
    clear x; clear y; 
    clear i;

%AUC Calculation
