% clear all;
% img1 = imread('./test/original.png');
% img2 = imread('./test/sp_SIDD.png');

%%
% Call mslMSUNIQUE which returns the perceived quality. Value nearer to 1
% represents a better quality image


% ms_unique = mslMSUNIQUE(img1,img2)
% unique_u = mslUNIQUE(img1,img2)
% summer_ = summer(img1,img2)

% csv_ = csv(img1, img2)



dir_path = './dataset/all_set12_img';
file_list = get_files_in_directory(dir_path);
all_files = {};

res.img_name = [];
res.values = [];
% final_stat.gaus_d1 = [];
% final_stat.gaus_d2 = [];
% 
% final_stat.pois_d1 = [];
% final_stat.pois_d2 = [];
% 
% final_stat.sp_d1 = [];
% final_stat.sp_d2 = [];
% 
% final_stat.spk_d1 = [];
% final_stat.spk_d2 = [];


for i = 1:length(file_list)
        % disp(length(file_list));
        subdir_path = fullfile(dir_path, file_list{i});
        % disp(subdir_path);
        % Get a list of all files in the current subdirectory
        files_in_subdir = get_files_in_directory(subdir_path);

        img_name = split(subdir_path,"/");

        img1 = imread(fullfile(subdir_path, "original.png"));
        img1 = im2double(img1);

        gaus_d1 = imread(fullfile(subdir_path, "gaus_d1.png"));
        gaus_d1 = im2double(gaus_d1);
        pois_d1 = imread(fullfile(subdir_path, "pois_d1.png"));
        pois_d1 = im2double(pois_d1);
        sp_d1 = imread(fullfile(subdir_path, "sp_d1.png"));
        sp_d1 = im2double(sp_d1);
        skp_d1 = imread(fullfile(subdir_path, "spk_d1.png"));
        skp_d1 = im2double(skp_d1);

        gaus_d2 = imread(fullfile(subdir_path, "gaus_d2.png"));
        gaus_d2 = im2double(gaus_d2);
        pois_d2 = imread(fullfile(subdir_path, "pois_d2.png"));
        pois_d2 = im2double(pois_d2);
        sp_d2 = imread(fullfile(subdir_path, "sp_d2.png"));
        sp_d2 = im2double(sp_d2);
        skp_d2 = imread(fullfile(subdir_path, "spk_d2.png"));
        skp_d2 = im2double(skp_d2);

       
        
        % Gaussian 
        iqa_.gaus.d1.ms_unique = mslMSUNIQUE(img1,gaus_d1);
        iqa_.gaus.d1.unique_u = mslUNIQUE(img1,gaus_d1);
        iqa_.gaus.d1.summer = summer(img1,gaus_d1);
        iqa_.gaus.d1.csv = csv(img1,gaus_d1);
        
        iqa_.gaus.d2.ms_unique = mslMSUNIQUE(img1,gaus_d2);
        iqa_.gaus.d2.unique_u = mslUNIQUE(img1,gaus_d2);
        iqa_.gaus.d2.summer = summer(img1,gaus_d2);
        iqa_.gaus.d2.csv = csv(img1,gaus_d2);

        % Poisson
        iqa_.pois.d1.ms_unique = mslMSUNIQUE(img1,pois_d1);
        iqa_.pois.d1.unique_u = mslUNIQUE(img1,pois_d1);
        iqa_.pois.d1.summer = summer(img1,pois_d1);
        iqa_.pois.d1.csv = csv(img1,pois_d1);

        iqa_.pois.d2.ms_unique = mslMSUNIQUE(img1,pois_d2);
        iqa_.pois.d2.unique_u = mslUNIQUE(img1,pois_d2);
        iqa_.pois.d2.summer = summer(img1,pois_d2);
        iqa_.pois.d2.csv = csv(img1,pois_d2);

        % s&p
        iqa_.sp.d1.ms_unique = mslMSUNIQUE(img1,sp_d1);
        iqa_.sp.d1.unique_u = mslUNIQUE(img1,sp_d1);
        iqa_.sp.d1.summer = summer(img1,sp_d1);
        iqa_.sp.d1.csv = csv(img1,sp_d1);

        iqa_.sp.d2.ms_unique = mslMSUNIQUE(img1,sp_d2);
        iqa_.sp.d2.unique_u = mslUNIQUE(img1,sp_d2);
        iqa_.sp.d2.summer = summer(img1,sp_d2);
        iqa_.sp.d2.csv = csv(img1,sp_d2);
        
        % Speckle
        iqa_.spk.d1.ms_unique = mslMSUNIQUE(img1,skp_d1);
        iqa_.spk.d1.unique_u = mslUNIQUE(img1,skp_d1);
        iqa_.spk.d1.summer = summer(img1,skp_d1);
        iqa_.spk.d1.csv = csv(img1,gaus_d1);

        iqa_.spk.d2.ms_unique = mslMSUNIQUE(img1,skp_d2);
        iqa_.spk.d2.unique_u = mslUNIQUE(img1,skp_d2);
        iqa_.spk.d2.summer = summer(img1,skp_d2);
        iqa_.spk.d2.csv = csv(img1,skp_d2);
       

        res.img_name = [res.img_name, img_name{3}];

        res.values = [res.values, iqa_];

        % disp(ak);
        % Create full file paths and add them to the list
        % full_file_paths = fullfile(subdir_path, files_in_subdir);
        % all_files = [all_files, full_file_paths];
    end


% ms_unique = mslMSUNIQUE(img1,img2)
% disp(res);
disp(final_stat(res));


