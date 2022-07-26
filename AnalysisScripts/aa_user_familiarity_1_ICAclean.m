% Automatic analysis
% User master script
% Rhodri Cusack MRC CBU Cambridge Oct 2009
function aa_user_familiarity_1_ICAclean
%add SPM and aa
ses=1; %CHANGE THIS FOR SESSION1 OR SESSION2
%add SPM and aa
% addpath(genpath());
% addpath ()


%Add my personal scripts path.
aa_path= '/imaging3/asternin/automaticanalysis'; %location of aa
spmpath=  '/home/asternin/Documents/MATLAB/spm12'; %location of spm12
addpath(genpath(aa_path));
addpath(spmpath);
locpth=  '/imaging3/asternin/scripts/';
addpath(genpath('/imaging3/asternin/scripts/'));
cd(locpth);
load(sprintf('seriesnumbers%d.mat',ses)); %loads in the series numbers for each person's scans (they differ from person to person)
%% ANALYSIS RECIPE
%Loop through songs. In session 2 song 6, P126 can't be run for higher
%level modules like extract-roi. Update this loop and participant loop
for id=1:8; % songs
    aap=aarecipe('aap_tasklist_familiarity_1_ICAclean.xml'); %reinitialize aap so that add_subjects overwrites for each song
    
    %particpant list in each song
    %      pID ={'P101','P102','P103','P104','P105', ...
    %     'P106','P107','P108','P110','P111','P112','P113', ...
    %     'P114','P115','P117','P119','P120','P123','P125'};
    
    % 24 participants
    pID ={'P101','P102','P103','P104','P105', ...
        'P106','P107','P108','P110','P111','P112','P113', ...
        'P114','P115','P116','P117','P118','P119','P120','P122','P123','P124','P125','P126'};

%     % 20 participants
%     pID ={'P101','P102','P103','P104','P105', ...
%         'P106','P107','P108','P110','P111','P112','P113', ...
%         'P114','P115','P117','P119','P120','P123','P125','P126'};
    %%
    %Location of raw data
    aap.directory_conventions.rawdatadir= sprintf('/imaging3/familiarity/Session%d/Song%d',ses,id);
    aap.directory_conventions.T1template = '/home/asternin/spm12/templates/T1.nii';
    
    aap.acq_details.root = sprintf('/imaging3/familiarity/Session%d/Song%d',ses,id);
    aap.directory_conventions.analysisid= 'Familiarity_analysis_ICA_clean_ALL'; %'ND
    
    %Modify Options
    aap.options.aa_minver=4.0; % will only work on aa version 4.0 or above
    % This ensures FSL is added to compute nodes
    aap.directory_conventions.fslshell='bash';
    aap.directory_conventions.fslsetup=sprintf('export FSLDIR=%s; export PATH=%s/bin:$PATH; source %s/etc/fslconf/fsl.sh; export FSLOUTPUTTYPE=dcm;', aap.directory_conventions.fsldir, aap.directory_conventions.fsldir, aap.directory_conventions.fsldir);
    
    %aap.tasksettings.aamod_roi_extract_BS.ROIfile = '/imaging3/familiarity/masks/Yeo2011_7Networks_MNI152_FreeSurferConformed1mm_LiberalMask.nii'; %add mask for roi-extract
    aap.tasksettings.aamod_roi_extract_BS.ROIfile = '/imaging3/familiarity/SynchronyStats/YA_OA_flexFact_synch_novel_wo102/clusters/precentral.nii'; %add mask for roi-extract
    
    %aap.tasksettings.aamod_firstlevel_scrubbingmodel_BS.TR = 1.25;
    aap.directory_conventions.rawdataafterconversionprefix = 'r';
    
    AffineStartEst=[
        -0.6, -8.8, 16;
        -1.8, -10.1, 25;
        -0.6, -3.1, 8.8;
        2.4, 0.5, 32.0;
        0, -6.0, 3.5;
        -2.7, -1.1, 21.6;
        -1.2, -5.3, 23.4;
        -2.9, -3.9, 16.3;
        0.2, -5.0, 11.8;
        0.2, -1.5, 16.7;
        -3.4, 2.8, 26.3;
        -2.7, -4.6, 30.5;
        -4.0, -3.4, 28.1;
        -1.0, -5.8, 17.2;
        -1.4, -8.9, 19.4;
        -3.4, -9.6, 7.2;
        0.2, -5.6, 8.4;
        -1.9, 5.6, 16.3;
        -0.3, -3.0, 26.1;
        -4.1, 6.2, 16.3;
        3.8, -3.4, 60.9;
        -3.4, 0.9, 33.5;
        0.8, -11.0, 30.9;
        -1.9, -6.9, 29.2];
    
    subj=1:length(pID);
    
    for p=1:length(subj);
        aap=aas_addsubject(aap,sprintf('%s',pID{p}),seriesnumbers(p,id)); %TR:1.25
        
        if strcmp(pID{p},'P101')
            aap.directory_conventions.dicomfilter='*.IMA';
        else
            aap.directory_conventions.dicomfilter='*.dcm';
        end
        
        
        rootdir =  sprintf('/imaging3/familiarity/Session%d/Song%d/Familiarity_analysis/data_ALL_scrubbed_ICAcleaned',ses,id);
        subfiles=dir(sprintf('%s/*S*', rootdir));
        filenames=dir(sprintf('%s/%s/1/*R*',rootdir, subfiles(p).name));
        filepath=sprintf('%s/%s/1/',rootdir,subfiles(p).name);
        filelist=strcat(filepath,{filenames.name});
        aap=aas_addinitialstream(aap,'epi',sprintf('%s', pID{p}), filelist);
        
    end
    
    % Number of dummy scans at the start of each session
    aap.acq_details.numdummies=3;
    
    %other stuff
    aap=aas_localconfig(aap);
    
    %DO PROCESSING
    aa_doprocessing(aap);
end