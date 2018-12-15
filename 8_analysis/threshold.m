progress = 'Finding the Threshold'

%Finding
    hist_g = hist_g / sum(hist_g);
    hist_i = hist_i / sum(hist_i);
    
    sum_g = 0;
    sum_i = 0;
    sum_g_ant = 0;
    sum_i_ant = 0;

    for i=1 : 100
        sum_g = sum_g + hist_g(i);
    end

    for i=1 : 100
        sum_g = sum_g - hist_g(i);
        sum_i = sum_i + hist_i(i);

        if sum_i > sum_g
            sum_g_ant = sum_g + hist_g(i);
            sum_i_ant = sum_i - hist_i(i);
            break;
        end
    end

%Threshold
    %Slope finder (y = ax + b)
        a_g = ((sum_g_ant-sum_g)/((i-1)-i));
        b_g = sum_g_ant - (a_g * (i-1));

        a_i = ((sum_i_ant-sum_i)/((i-1)-i));
        b_i = sum_i_ant - (a_i * (i-1));
        
        clear i;
        clear sum_g; clear sum_g_ant;
        clear sum_i; clear sum_i_ant;
        
    %Common point (y1 = y2)
        t = (b_i - b_g) / (a_g - a_i);
        
        clear a_i; clear b_i;
        
    %Error rate
        error = ((a_g * t) + b_g) * 100
        
        clear a_g; clear b_g;
        