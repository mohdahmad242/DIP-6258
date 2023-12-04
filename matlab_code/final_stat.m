function stat = final_stat(data_stat)
    stat = struct();
    noise_list = {'gaus', 'pois', 'sp', 'spk'};
    denoise_list = {'d1', 'd2'};
    iqa_list = {'ms_unique', 'unique_u', 'summer', 'csv'};
    
    for i = 1:length(data_stat.values)
        for noise = noise_list
            for de = denoise_list
                for iqa = iqa_list
                    try
                        key = sprintf('%s_%s_%s', noise{1}, de{1}, iqa{1});
                        stat.(key) = stat.(key) + data_stat.values{i}.(noise{1}).(de{1}).(iqa{1}) / length(data_stat.values);
                    catch
                        key = sprintf('%s_%s_%s', noise{1}, de{1}, iqa{1});
                        stat.(key) = 0 + data_stat.values(i).(noise{1}).(de{1}).(iqa{1}) / length(data_stat.values);
                    end
                end
            end
        end
    end
end