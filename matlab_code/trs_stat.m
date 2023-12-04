function tsr_stat_ = trs_stat(data_stat)
    keys = fieldnames(data_stat);
    for k = 1:length(keys)
        key = keys{k};
        metrics = data_stat.(key);
        metrics.d1.ms_unique = metrics.d1.ms_unique / metrics.count;
        metrics.d1.unique_u = metrics.d1.unique_u / metrics.count;
        metrics.d1.summer = metrics.d1.summer / metrics.count;
        metrics.d1.csv = metrics.d1.csv / metrics.count;

        metrics.d2.ms_unique = metrics.d2.ms_unique / metrics.count;
        metrics.d2.unique_u = metrics.d2.unique_u / metrics.count;
        metrics.d2.summer = metrics.d2.summer / metrics.count;
        metrics.d2.csv = metrics.d2.csv / metrics.count;
      disp(key);
      disp(metrics.d1);
      disp(metrics.d2);
    end
end