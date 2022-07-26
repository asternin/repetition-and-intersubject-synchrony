% Automatic analysis
% User master script
% Rhodri Cusack MRC CBU Cambridge Oct 2009
function aa_user_familiarity_1_OA
%add SPM and aa
% addpath(genpath());
% addpath ()

%Add my personal scripts path.
locpth=  '/imaging3/asternin/scripts/';
addpath(genpath('/imaging3/asternin/scripts/'));
cd(locpth);
load('seriesnumbers_OA.mat'); %loads in the series numbers for each person's scans (they differ from person to person)
%% ANALYSIS RECIPE
%sid=[2,3,4,5,6,7,9,10];
sid=[10];
for id=1:length(sid);
    aap=[];
    aap=aarecipe('aap_tasklist_familiarity_1_OA.xml'); %reinitialize aap so that add_subjects overwrites for each song
    %particpant list in each song
    pID = dir('/imaging3/familiarity/OlderAdults/Session1/Song2/P*'); %get list of participants!

    %Location of raw data
    aap.directory_conventions.rawdatadir= sprintf('/imaging3/familiarity/OlderAdults/Session1/Song%d',sid(id));
    aap.directory_conventions.T1template = '/home/asternin/spm12/templates/T1.nii';
    
    aap.acq_details.root = sprintf('/imaging3/familiarity/OlderAdults/Session1/Song%d',sid(id));
    aap.directory_conventions.analysisid= 'Familiarity_analysis'; %'ND
    
    %Modify Options
    aap.options.aa_minver=4.0; % will only work on aa version 4.0 or above
    % This ensures FSL is added to compute nodes
    aap.directory_conventions.fslshell='bash';
    aap.directory_conventions.fslsetup=sprintf('export FSLDIR=%s; export PATH=%s/bin:$PATH; source %s/etc/fslconf/fsl.sh; export FSLOUTPUTTYPE=dcm;', aap.directory_conventions.fsldir, aap.directory_conventions.fsldir, aap.directory_conventions.fsldir);
    
    %aap.tasksettings.aamod_roi_extract_BS.ROIfile = '/imaging3/familiarity/masks/Yeo2011_7Networks_MNI152_FreeSurferConformed1mm_LiberalMask.nii'; %add mask for roi-extract
    
    aap.tasksettings.aamod_roi_extract_BS.ROIfile = '/imaging3/familiarity/masks/HO_Cingulate.nii'; %add mask for roi-extract

    %aap.tasksettings.aamod_firstlevel_scrubbingmodel_BS.TR = 1.25;
    aap.directory_conventions.rawdataafterconversionprefix = 'r';
    
    subj=1:size(pID,1);
    if sid(id) == 3 %in song 3 skip subj P202 because of too much movement
        subj(2)=[];
    elseif sid(id) == 9; %in song 9 skip subj P202 because of too much movement
        subj(2)=[];
        subj(1)=[];
    elseif sid(id) ==10;
        subj(1)=[];
    end
    
    AffineStartEst=[0 -13 8.5;
        5.7 -8.6 47.5;
        0.6 -19 26.6;
        -5.1 -13.5 23.3;
        5.1 -12.9 25.6;
        -4.6 -6.8 -3.4;
        -0.9 -10.2 44.2;
        -0.2 -19 17;
        -4 -4.5 32.3;
        -3.4 -14.8 19.4;
        3.1 -23.8 24.1;
        -2.7 -11.6 21;
        -4.5 -17.1 28.7;
        -0.9 -21 35.6];
    
    for p=1:length(subj);        
        %files=dir(strcat(sprintf('/imaging/familiarity/structurals/%s',pID(p).name),'/*MR*'));
        aap.directory_conventions.protocol_structural= 'mp2rage_sag_750iso_p3_944';
        aap=aas_addsubject(aap,sprintf('%s',pID(subj(p)).name),seriesnumbers(subj(p),id)); %TR:1.25        
        
        struct_num = [16,14,16,15,14,16,15,14,15,15,15,16,15,14];% <- these are hardcoded series numbers for the structurals. Length matches pID 
        aap.acq_details.subjects(p).structural =  struct_num(subj(p));
        
        rootdir =  sprintf('/imaging3/familiarity/OlderAdults/Session1/Song2'); 
        structdir = dir(sprintf('%s/Familiarity_extractDICOM/aamod_get_dicom_structural_00001/%s/structurals/*.MR.*',rootdir,pID(p).name)); %structurals in Session1 song2 only
        root = sprintf('%s/Familiarity_extractDICOM/aamod_get_dicom_structural_00001/%s/structurals/',rootdir,pID(p).name);
        structlist = strcat(root,{structdir.name});
        aap=aas_addinitialstream(aap,'dicom_structural',sprintf('%s', pID(subj(p)).name), structlist);
        
        aap.tasksettings.aamod_norm_noss.subject(p) = struct('name',pID(subj(p)).name,'affineStartingEstimate',AffineStartEst(p,:));

    end
    
    % Number of dummy scans at the start of each session
    aap.acq_details.numdummies=3; %sub1= 14 all after = 4
    
    %other stuff
    aap=aas_localconfig(aap);
    
    %DO PROCESSING    
    aa_doprocessing(aap);
end