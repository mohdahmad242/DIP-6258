function file_list = get_files_in_directory(dir_path)
    % Get a list of files in the specified directory
    files = dir(dir_path);
    
    % Exclude '.' and '..'
    files = files(arrayfun(@(x) x.name(1)~='.', files));
    
    % Extract file names from the structure array
    file_list = {files.name};
end