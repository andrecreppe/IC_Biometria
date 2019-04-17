progress = 'Making the curves'

%------- CASE 1 - ROC CURVE ----------

qtd = 100;
roc = zeros(2, qtd);

x = 0;
y = 0;

%ROC Calculation
    for i=1 : qtd
        %False Rejection Rate
        x = sum(hist_face_g(:, i:qtd));
        roc(2,i) = x;
        
        %False Acception Rate
        y = sum(hist_face_i(:, 1:i));
        roc(1,i) = y;
    end
    
    plot(roc(1,:), roc(2,:));
    title('Test 1 - Face');
    xlabel('FAR (False Acception Rate)');
    ylabel('FRR (False Rejection Rate)');
    pause;
    
    clear x; clear y; 
    clear i;

%AUC Calculation
    resp(1,2) = trapz(roc(1,:), roc(2,:));
    
%------- CASE 2 - ROC CURVE ----------

qtd = 200;
roc = zeros(2, qtd);

x = 0;
y = 0;

%ROC Calculation
    for i=1 : qtd
        %False Rejection Rate
        x = sum(hist_eyes_g(:, i:qtd));
        roc(2,i) = x;
        
        %False Acception Rate
        y = sum(hist_eyes_i(:, 1:i));
        roc(1,i) = y;
    end
    
    plot(roc(1,:), roc(2,:));
    title('Test 2 - Eyes only');
    xlabel('FAR (False Acception Rate)');
    ylabel('FRR (False Rejection Rate)');
    pause;
    clear x; clear y; 
    clear i;

%AUC Calculation
    resp(2,2) = trapz(roc(1,:), roc(2,:));

%------- CASE 3 - ROC CURVE ----------

qtd = 200;
roc = zeros(2, qtd);

x = 0;
y = 0;

%ROC Calculation
    for i=1 : qtd
        %False Rejection Rate
        x = sum(hist_hybrid_g(:, i:qtd));
        roc(2,i) = x;
        
        %False Acception Rate
        y = sum(hist_hybrid_i(:, 1:i));
        roc(1,i) = y;
    end
    
    plot(roc(1,:), roc(2,:));
    title('Test 3 - Face + Left eye');
    xlabel('FAR (False Acception Rate)');
    ylabel('FRR (False Rejection Rate)');
    pause;
    
    clear x; clear y; 
    clear i;

%AUC Calculation
    resp(3,2) = trapz(roc(1,:), roc(2,:));

%------- CASE 4 - ROC CURVE ----------

qtd = 300;
roc = zeros(2, qtd);

x = 0;
y = 0;

%ROC Calculation
    for i=1 : qtd
        %False Rejection Rate
        x = sum(hist_all_g(:, i:qtd));
        roc(2,i) = x;
        
        %False Acception Rate
        y = sum(hist_all_i(:, 1:i));
        roc(1,i) = y;
    end
    
    plot(roc(1,:), roc(2,:));
    title('Test 4 - All elements');
    xlabel('FAR (False Acception Rate)');
    ylabel('FRR (False Rejection Rate)');
    
    clear x; clear y; 
    clear i;

%AUC Calculation
    resp(4,2) = trapz(roc(1,:), roc(2,:));

%------- CLEAN UP ----------

%
    clear num_img; clear num_pessoas;
    clear qtd; clear roc;

    clear hist_face_g; clear hist_face_i;
    clear hist_eyes_g; clear hist_eyes_i;
    clear hist_hybrid_g; clear hist_hybrid_i;
    clear hist_all_g; clear hist_all_i;
%}

progress = 'Done!'