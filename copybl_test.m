S_pts = dir();
S_pts(1:2) = [];
currdir = pwd();
for i = 1:length(S_pts)
    ptname = S_pts(i).name;
    ptdir = strcat(currdir,'\',ptname);
    cd(ptdir)
    subname = '²¡Àú';
    outputdir = 'E:\codes\Extract files from directory\put all together\';
    S_files = dir();
    S_files = S_files (3:end);
    blidx = []; % initialize the indx of files we need
    for j = 1:length(S_files)
        if regexp (S_files(j).name,subname) > 0
        blidx = [blidx,j]; % record position of files with 'subname' in filename 
        end
    end
    % copy all the files with "subname"
    for j = blidx(1:end)
        inname = S_files(j).name;
        outname = strcat(ptname,'_',inname);
        out = [outputdir,outname];
        in = strcat(ptdir,'\',inname);
        copyfile(in,out);
    end
    cd ..
end