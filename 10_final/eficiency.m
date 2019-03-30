progress = 'Generating results'

%------- SETUP ----------

resp = zeros(4,2);

%------- CASE 1 - ERROR RATE ----------

hist_g = hist_face_g / sum(hist_face_g);
hist_i = hist_face_i / sum(hist_face_i);

sum_g = 0;      sum_i = 0;
sum_g_ant = 0;  sum_i_ant = 0;

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
    error = ((a_g * t) + b_g) * 100;

    resp(1,1) = error;
    clear a_g; clear b_g;
    clear t; clear error;
        
%------- CASE 2 - ERROR RATE ----------

hist_g = hist_eyes_g / sum(hist_eyes_g);
hist_i = hist_eyes_i / sum(hist_eyes_i);

sum_g = 0;      sum_i = 0;
sum_g_ant = 0;  sum_i_ant = 0;

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
    error = ((a_g * t) + b_g) * 100;

    resp(2,1) = error;
    clear a_g; clear b_g;
    clear t; clear error;
        
%------- CASE 3 - ERROR RATE ----------

hist_g = hist_hybrid_g / sum(hist_hybrid_g);
hist_i = hist_hybrid_i / sum(hist_hybrid_i);

sum_g = 0;      sum_i = 0;
sum_g_ant = 0;  sum_i_ant = 0;

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
    error = ((a_g * t) + b_g) * 100;

    resp(3,1) = error;
    clear a_g; clear b_g;
    clear t; clear error;
        
%------- CASE 4 - ERROR RATE ----------

hist_g = hist_all_g / sum(hist_all_g);
hist_i = hist_all_i / sum(hist_all_i);

sum_g = 0;      sum_i = 0;
sum_g_ant = 0;  sum_i_ant = 0;

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
    error = ((a_g * t) + b_g) * 100;

    resp(4,1) = error;
    clear a_g; clear b_g;
    clear t; clear error;

%------- CLEANING UP ----------

clear hist_g; clear hist_i;
