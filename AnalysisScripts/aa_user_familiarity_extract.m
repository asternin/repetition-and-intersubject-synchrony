% Automatic analysis
% User master script
% Rhodri Cusack MRC CBU Cambridge Oct 2009
function aa_user_familiarity_extract
%add SPM and aa

%add SPM and aa
% addpath(genpath('/imaging/bobbystojanoski/scripts/GLMdenoise-1.2'));
% addpath ('/cn_developer/camneuro/release-devel/automaticanalysis/aa_modules/')
% cd /cn_developer/camneuro/release-devel/automaticanalysis/aa_modules/

%Add my personal scripts path. This runs my files before those in cusack directory
locpth=  '/imaging2/asternin/scripts/';
addpath(genpath('/imaging2/asternin/scripts/'));
cd(locpth);
load('seriesnumbers1.mat');
%ANALYSIS RECIPE
aap=aarecipe('aap_tasklist_familiarity_extract.xml');

count =1;
%for id=1:length(pID);
for id=1; %structurals are in song 1 only
    %partiicpant list in each song
    pID = dir('/imaging2/familiarity/Session1/Song1/P*');
    %Location of raw data
    aap.directory_conventions.rawdatadir= sprintf('/imaging2/familiarity/Session1/Song%d',id);
    aap.directory_conventions.T1template = '/home/asternin/spm12/templates/T1.nii';
    if strcmp(pID(id).name,'P101')
        aap.directory_conventions.dicomfilter='*.IMA';
    else
        aap.directory_conventions.dicomfilter='*.dcm';
    end
    
    aap.acq_details.root = sprintf('/imaging2/familiarity/Session1/Song%d',id);
    aap.directory_conventions.analysisid= 'Familiarity_extractDICOM'; %'ND
    
    %Modify Options
    aap.options.aa_minver=4.0; % will only work on aa version 4.0 or above
    % This ensures FSL is added to compute nodes
    aap.directory_conventions.fslshell='bash';
    aap.directory_conventions.fslsetup=sprintf('export FSLDIR=%s; export PATH=%s/bin:$PATH; source %s/etc/fslconf/fsl.sh; export FSLOUTPUTTYPE=dcm;', aap.directory_conventions.fsldir, aap.directory_conventions.fsldir, aap.directory_conventions.fsldir);
    %     aap.tasksettings.aamod_roi_extract_BS.ROIfile = '/imaging/owenlab/klyons/fMRI/CBS_DevCog/BioBankData/Biobank_rois/Yeo2011_7Networks_MNI152_FreeSurferConformed1mm.nii'
    
    
%     aap.tasksettings.aamod_firstlevel_scrubbingmodel_BS.TR = 1.25;
    aap.directory_conventions.rawdataafterconversionprefix = 'r';
    
    for p = 1:24;%1:size(pID,1); % Num of participants 101-126 (without 109 and 121)
        %files=dir(strcat(sprintf('/imaging/familiarity/structurals/%s',pID(p).name),'/*MR*'));
        aap.directory_conventions.protocol_structural= 'mp2rage_sag_750iso_p3_944';
        %aap.acq_details.subjects(p).structural = [23];
        %aap.acq_details.subjects(p).structural = sprintf('/imaging/familiarity/structurals/%s',pID(p).name);
        aap=aas_addsubject(aap,sprintf('%s',pID(p).name),seriesnumbers(p,id)); %TR:1.25 
       
        struct_num = [23,20,18,19,21,20,21,16,17,15,14,18,14,15,14,15,16,15,16,17,15,15,15,14];% <- these are hardcoded change to so they correspond to song number 
        aap.acq_details.subjects(p).structural =  struct_num(p);
        
    end
    % aap=aas_addsubject(aap,subpth,[16 17 18 19 25 26 27 28]); %TR:1.25
    % aap=aas_addsubject(aap, subpth,scans,[16 17 18 19 25 26 27 28]); %TR:1.25
    % aap=aas_addsubject(aap,'P101/data/for_aa',[16 17 18 19 25 26 27 28]);
    % aap=aas_addsubject(aap,'P102/data/for_aa',[15 16 17 23 24 25 26 27]);
    % aap=aas_addsubject(aap,'P103/data/for_aa',[24 25 26 27 28 29 30 31]);
    % aap.acq_details.subjects(id).seriesnumbers={seriesnumbers(id,:)}';
    
    %Runs
%     runNum=8;
%     for run=1:runNum
%         aap=aas_addsession(aap,sprintf('Song%d',run));
%     end
    
    
    % Number of dummy scans at the start of each session
    aap.acq_details.numdummies=3; %sub1= 14 all after = 4
    % aap.directory_conventions.subject_directory_format=3;
    
    %other stuff
    aap=aas_localconfig(aap);
    
    %DO PROCESSING
    % aap.options.wheretoprocess = 'condor';
    count=count+1;
    
    
%     if  id >= 2
%         rootdir =  '/imaging/Bobby/foravitral/Song1';
%         structdir = dir(sprintf('%s/Familiarity_analysis/aamod_get_dicom_structural_00001/%s/structurals/2017*',rootdir,pID(p).name));
%         root = sprintf('%s/Familiarity_analysis/aamod_get_dicom_structural_00001/%s/structurals/',rootdir,pID(p).name)
%         structlist = strcat(root,{structdir.name});
%         aap=aas_addinitialstream(aap,'dicom_structural',sprintf('%s', pID(p).name), structlist);
%     else; end

    aa_doprocessing(aap);
end



% aas_garbagecollection(aap, 1);
% aa_report(aap)