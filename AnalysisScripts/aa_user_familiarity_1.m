% Automatic analysis
% User master script
% Rhodri Cusack MRC CBU Cambridge Oct 2009
function aa_user_familiarity_1
%add SPM and aa
ses=1; %CHANGE THIS FOR SESSION1 OR SESSION2
%add SPM and aa
% addpath(genpath());
% addpath ()


%Add my personal scripts path.
locpth=  '/imaging3/asternin/scripts/';
addpath(genpath('/imaging3/asternin/scripts/'));
cd(locpth);
load(sprintf('seriesnumbers%d.mat',ses)); %loads in the series numbers for each person's scans (they differ from person to person)
%% ANALYSIS RECIPE
%Loop through songs. In session 2 song 6, P126 can't be run for higher
%level modules like extract-roi. Update this loop and participant loop
for id=1:8;
    aap=aarecipe('aap_tasklist_familiarity_1.xml'); %reinitialize aap so that add_subjects overwrites for each song
    %particpant list in each song
    pID = dir('/imaging3/familiarity/Session2/Song1/P*'); %use session 2 list of participants!
%     if ses ==2;
%         if id ==6
%             pID(24)=[]; % FOR SONG 6 ONLY IN SESSION 2
%         end
%     end
    
    %Location of raw data
    aap.directory_conventions.rawdatadir= sprintf('/imaging3/familiarity/Session%d/Song%d',ses,id);
    aap.directory_conventions.T1template = '/home/asternin/spm12/templates/T1.nii';
    if strcmp(pID(id).name,'P101')
        aap.directory_conventions.dicomfilter='*.IMA';
    else
        aap.directory_conventions.dicomfilter='*.dcm';
    end
    
    aap.acq_details.root = sprintf('/imaging3/familiarity/Session%d/Song%d',ses,id);
    aap.directory_conventions.analysisid= 'Familiarity_analysis'; %'ND
    
    %Modify Options
    aap.options.aa_minver=4.0; % will only work on aa version 4.0 or above
    % This ensures FSL is added to compute nodes
    aap.directory_conventions.fslshell='bash';
    aap.directory_conventions.fslsetup=sprintf('export FSLDIR=%s; export PATH=%s/bin:$PATH; source %s/etc/fslconf/fsl.sh; export FSLOUTPUTTYPE=dcm;', aap.directory_conventions.fsldir, aap.directory_conventions.fsldir, aap.directory_conventions.fsldir);
    
    %aap.tasksettings.aamod_roi_extract_BS.ROIfile = '/imaging3/familiarity/masks/Yeo2011_7Networks_MNI152_FreeSurferConformed1mm_LiberalMask.nii'; %add mask for roi-extract
    %aap.tasksettings.aamod_roi_extract_BS.ROIfile = '/imaging3/familiarity/masks/HO_auditory_R.nii'; %add mask for roi-extract
    
    %aap.tasksettings.aamod_GIFT.numReductionSteps = 0;
    
    %aap.tasksettings.aamod_firstlevel_scrubbingmodel_BS.TR = 1.25;
    aap.directory_conventions.rawdataafterconversionprefix = 'r';
    if ses ==1;
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
    else
        AffineStartEst=[
            -1.9,-14.9,15.5,0,0,0;
            -4.0, -13.6, 9.1,0,0,0;
            -0.5, -4.9, 16.5,0,0,0;
            1.4, -4.4, 34.3,0,0,0;
            -3.1, -3.5, 5.6,0,0,0;
           0, -2.3, 3, 0, 0, 0; %P106 reorient rf* files in realign: pitch= -0.3 song 1,2,3,4,5,6,7
            0 2.3, 5, 0,0,0;%P107 reorient rf* files in realign: pitch= -0.3 song 3,4,5,6,7
            -2.7, -1.1, 21.8,0,0,0;
            -0.1, -9.0, 17.0,0,0,0;
            -2.7, -13.9, 14.9,0,0,0;
            -3.9, -7.8, 30.0,0,0,0; %P112 reorient *rf files in realign: pitch=-0.3 song 2
            -1.9, -11.2, 47.6,0,0,0;
            -3.6, -7.5, 22.9,0,0,0;
            -4.6, -6.8, 27.4,0,0,0;
            -4.8, -2.7, 34.0,0,0,0;
            -2.7, -5.6, 11.0,0,0,0;
            -4.1, -8.3, 17.1,0,0,0;
            -5.7, -10, -2.6,0,0,0; %P119 reorient rf* files in realign: pitch= -0.3 song 6
            -4.1, -1.0, 27.7,0,0,0;
            -4.1, -1.7, 23.4,0,0,0;
            0.2, -11.3, 41.2,0,0,0;
            -4.1, 14.2, 17.2,0,0,0; %P124reorient rf* files in realign: pitch= -0.15 song 3,4,5,6,7
            0, -7, 32,0,0,0;  %P125reorient rf* files in realign: pitch= -0.3 song 3
            -2.7, -7.6, 23.8,0,0,0];
    end
    
    for p =1:size(pID,1); %list from session 2 101-126 (without 109 and 121)
        %files=dir(strcat(sprintf('/imaging/familiarity/structurals/%s',pID(p).name),'/*MR*'));
        aap.directory_conventions.protocol_structural= 'mp2rage_sag_750iso_p3_944';
        aap=aas_addsubject(aap,sprintf('%s',pID(p).name),seriesnumbers(p,id)); %TR:1.25
        
        struct_num = [23,20,18,19,21,20,21,16,17,15,14,18,14,15,14,15,16,15,16,17,15,15,15,14];% <- these are hardcoded series numbers for the structurals. Length matches pID
        aap.acq_details.subjects(p).structural =  struct_num(p);
        
        rootdir =  sprintf('/imaging3/familiarity/Session1/Song1');
        structdir = dir(sprintf('%s/Familiarity_extractDICOM/aamod_get_dicom_structural_00001/%s/structurals/*.MR.*',rootdir,pID(p).name)); %structurals in Session1 song1 only
        root = sprintf('%s/Familiarity_extractDICOM/aamod_get_dicom_structural_00001/%s/structurals/',rootdir,pID(p).name);
        structlist = strcat(root,{structdir.name});
        aap=aas_addinitialstream(aap,'dicom_structural',sprintf('%s', pID(p).name), structlist);
        aap.tasksettings.aamod_norm_noss.subject(p) = struct('name',pID(p).name,'affineStartingEstimate',AffineStartEst(p,:));
        %aap.tasksettings.aamod_norm_noss.usesegmentnotnormalise=0;
    end
    
    % Number of dummy scans at the start of each session
    aap.acq_details.numdummies=3;
    
    %other stuff
    aap=aas_localconfig(aap);
    
    %DO PROCESSING
    aa_doprocessing(aap);
end