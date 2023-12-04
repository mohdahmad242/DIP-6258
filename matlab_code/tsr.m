dir_path = './dataset/u1';
file_list = get_files_in_directory(dir_path);
all_files = {};

trs_res = struct();
% trs_res.img = 0;

for i = 1:length(file_list)
    subdir_path = fullfile(dir_path, file_list{i});
     
        files_in_subdir = get_files_in_directory(subdir_path);
    
        img_name = split(subdir_path,"/");
        f_name = split(img_name{end}, "_");
        ff_name_ = f_name{1};
        ff_name = strrep(ff_name_,'-','_');

    trs_res.(ff_name).d1.ms_unique = 0;
    trs_res.(ff_name).d1.unique_u = 0;
    trs_res.(ff_name).d1.summer = 0;
    trs_res.(ff_name).d1.csv = 0;

    trs_res.(ff_name).d2.ms_unique = 0;
    trs_res.(ff_name).d2.unique_u = 0;
    trs_res.(ff_name).d2.summer = 0;
    trs_res.(ff_name).d2.csv = 0;
    trs_res.(ff_name).count = 0;
end
disp(trs_res);
for i = 1:length(file_list)
        subdir_path = fullfile(dir_path, file_list{i});
     
        files_in_subdir = get_files_in_directory(subdir_path);
    
        img_name = split(subdir_path,"/");
        f_name = split(img_name{end}, "_");
        ff_name_ = f_name{1};
        ff_name = strrep(ff_name_,'-','_');
        
        img = im2uint8(imread(fullfile(subdir_path, "original.png")));
        d1 = im2uint8(imread(fullfile(subdir_path, "d1.png")));
        d2 = im2uint8(imread(fullfile(subdir_path, "d2.png")));

        try
            % try
             
                trs_res.(ff_name).d1.ms_unique = trs_res.(ff_name).d1.ms_unique + mslMSUNIQUE(img,d1);
                trs_res.(ff_name).d1.unique_u = trs_res.(ff_name).d1.unique_u + mslUNIQUE(img,d1);
                trs_res.(ff_name).d1.summer = trs_res.(ff_name).d1.summer + summer(img,d1);
                trs_res.(ff_name).d1.csv = trs_res.(ff_name).d1.csv + csv(img,d1);
        
                trs_res.(ff_name).d2.ms_unique = trs_res.(ff_name).d2.ms_unique + mslMSUNIQUE(img,d1);
                trs_res.(ff_name).d2.unique_u = trs_res.(ff_name).d2.unique_u + mslUNIQUE(img,d2);
                trs_res.(ff_name).d2.summer = trs_res.(ff_name).d2.summer + summer(img,d2);
                trs_res.(ff_name).d2.csv = trs_res.(ff_name).d2.csv + csv(img,d2);
                trs_res.(ff_name).count = trs_res.(ff_name).count + 1;
            % catch
            %     disp(rs_res.(ff_name).d1.ms_unique);
            %     trs_res.(ff_name).d1.ms_unique = 0 + mslMSUNIQUE(img,d1);
            %     trs_res.(ff_name).d1.unique_u = 0 + mslUNIQUE(img,d1);
            %     trs_res.(ff_name).d1.summer = 0 + summer(img,d1);
            %     trs_res.(ff_name).d1.csv = 0+ csv(img,d1);
            % 
            %     trs_res.(ff_name).d2.ms_unique = 0+ mslMSUNIQUE(img,d1);
            %     trs_res.(ff_name).d2.unique_u = 0 + mslUNIQUE(img,d2);
            %     trs_res.(ff_name).d2.summer = 0 + summer(img,d2);
            %     trs_res.(ff_name).d2.csv = 0 + csv(img,d2);
            %     trs_res.(ff_name).count = 0 + 1;
            % end
        catch
            disp("error")
        end

 
        
end
disp(trs_res)
