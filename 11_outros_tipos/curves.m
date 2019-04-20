progress = 'Making the curves'

%------- CASE 4 - ROC CURVE ----------

qtd = 200;
roc = zeros(2, qtd);

x = 0;
y = 0;

%ROC Calculation
    for i=1 : qtd
        %False Rejection Rate
        x = sum(hist_circular_g(:, i:qtd));
        roc(2,i) = x;
        
        %False Acception Rate
        y = sum(hist_circular_i(:, 1:i));
        roc(1,i) = y;
    end
    
    plot(roc(1,:), roc(2,:));
    
    titulo = strcat('Circular LBP - Radius=', int2str(raio));
    title(titulo);
    xlabel('FAR (False Acception Rate)');
    ylabel('FRR (False Rejection Rate)');
    
    clear x; clear y; 
    clear i;

%AUC Calculation
    auc = trapz(roc(1,:), roc(2,:));

%------- CLEAN UP ----------

%
    clear num_img; clear num_pessoas;
    clear qtd; clear roc;

    clear raio;
    clear hist_circular_g; clear hist_circular_g;
%}

progress = 'Done!'