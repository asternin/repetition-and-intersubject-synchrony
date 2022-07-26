% Automatic analysis
% User master script
% Rhodri Cusack MRC CBU Cambridge Oct 2009
function aa_user_familiarity_1_ICAclean_SongSpecificGroups
%add SPM and aa
%ses=1; %CHANGE THIS FOR SESSION1 OR SESSION2
%add SPM and aa
% addpath(genpath());
% addpath ()

%Add my personal scripts path.
locpth=  '/imaging3/asternin/scripts/';
addpath(genpath('/imaging3/asternin/scripts/'));
cd(locpth);
%% ANALYSIS RECIPE
%Loop through songs. In session 2 song 6, P126 can't be run for higher
%level modules like extract-roi. Update this loop and participant loop
half=2;

for ses=1; %only run in session 1
    load(sprintf('seriesnumbers%d.mat',ses)); %loads in the series numbers for each person's scans (they differ from person to person)
    for id=1:8; % songs
        aap=aarecipe('aap_tasklist_familiarity_1_ICAclean.xml'); %reinitialize aap so that add_subjects overwrites for each song
        if half ==1
            if id==1;
                pID={'P101','P104','P107','P108','P115','P119','P120'};
            end
            if id==2
                pID={'P101','P104','P105','P106','P112','P115','P117','P123'};
            end
            if id==3
                pID={'P101','P102','P107','P108','P110','P112','P113','P119','P120','P123','P126'};
            end
            if id==4
                pID={'P101','P103','P105','P106','P107','P110','P111','P114','P117','P125'};
            end
            if id==5
                pID={'P103','P104','P106','P111','P114','P115','P117','P125'};
            end
            if id==6
                pID={'P102','P103','P105','P106','P112','P113','P114','P117','P123','P126'};
            end
            if id==7
                pID={'P102','P104','P105','P108','P110','P111','P112','P113','P115','P119','P120','P123','P125','P126'};
            end
            if id==8
                pID={'P102','P103','P107','P108','P110','P111','P113','P114','P119','P120','P125','P126'};
            end
        end
        if half==2
            if id==1;
                pID={'P102','P103','P105','P106','P110','P111','P112','P113','P114','P117','P123','P125','P126'};
            end
            if id==2
                pID={'P102','P103','P107','P108','P110','P111','P113','P114','P119','P120','P125','P126'};
            end
            if id==3
                pID={'P103','P104','P105','P106','P111','P114','P115','P117','P125'};
            end
            if id==4
                pID={'P102','P104','P108','P112','P113','P115','P119','P120','P123','P126'};
            end
            if id==5
                pID={'P101','P102','P105','P107','P108','P110','P112','P113','P119','P120','P123','P126'};
            end
            if id==6
                pID={'P101','P104','P107','P108','P110','P111','P115','P119','P120','P125'};
            end
            if id==7
                pID={'P101','P103','P106','P107','P114','P117'};
            end
            if id==8
                pID={'P101','P104','P105','P106','P112','P115','P117','P123'};
            end
        end
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
    aap.tasksettings.aamod_roi_extract_BS.ROIfile = '/imaging3/familiarity/SynchronyStats/YA_flexFact_synch_fam_2x2/clusters/6clusters.nii'; %add mask for roi-extract
        
        %aap.tasksettings.aamod_firstlevel_scrubbingmodel_BS.TR = 1.25;
        aap.directory_conventions.rawdataafterconversionprefix = 'r';
        
        subj=1:length(pID);
        
        for p=1:length(subj);
            aap=aas_addsubject(aap,sprintf('%s',pID{p}),seriesnumbers(p,id)); %TR:1.25
            
            if strcmp(pID{p},'P101')
                aap.directory_conventions.dicomfilter='*.IMA';
            else
                aap.directory_conventions.dicomfilter='*.dcm';
            end
            
            
            rootdir =  sprintf('/imaging3/familiarity/Session%d/Song%d/Familiarity_analysis/data_ALL_scrubbed_ICAcleaned',ses,id);
            if ses==2;
              rootdir =  sprintf('/imaging3/familiarity/Session%d/Song%d/Familiarity_analysis/data_scrubbed_ICA_cleaned',ses,id);
            end
   
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
end