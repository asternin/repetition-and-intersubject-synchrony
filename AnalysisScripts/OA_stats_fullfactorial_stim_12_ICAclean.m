function [matlabbatch] = OA_stats_fullfactorial_stim_12_ICAclean(b)
matlabbatch{1}.spm.stats.factorial_design.dir = {'/imaging3/familiarity/SynchronyStats/OlderAdults/OA_stim_12_ICAclean'};
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).name = 'stim';
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).levels = 8;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).dept = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).variance = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fd.fact(1).ancova = 0;

%% song 2
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).levels = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(1).scans = {
    %'/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P201/moviecorr_meantimecourse.nii,1'
    %'/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P202/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P203/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P205/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P206/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P207/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P208/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P209/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P210/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P211/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P212/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P213/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P214/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P215/moviecorr_meantimecourse.nii,1'
    };
%% song 3
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).levels = 2;
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(2).scans = {
    %'/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P201/moviecorr_meantimecourse.nii,1'
    %'/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P202/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P203/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P205/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P206/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P207/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P208/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P209/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P210/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P211/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P212/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P213/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P214/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P215/moviecorr_meantimecourse.nii,1'

                                                                   };
%% song 4
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(3).levels = 3;
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(3).scans = {
    %'/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P201/moviecorr_meantimecourse.nii,1'
    %'/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P202/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P203/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P205/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P206/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P207/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P208/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P209/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P210/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P211/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P212/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P213/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P214/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P215/moviecorr_meantimecourse.nii,1'
                                                                   };
%% song 5
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(4).levels = 4;
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(4).scans = {
    %'/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P201/moviecorr_meantimecourse.nii,1'
    %'/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P202/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P203/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P205/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P206/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P207/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P208/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P209/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P210/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P211/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P212/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P213/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P214/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P215/moviecorr_meantimecourse.nii,1'
                                                                   };
%% song 6
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(5).levels = 5;
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(5).scans = {
    %'/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P201/moviecorr_meantimecourse.nii,1'
    %'/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P202/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P203/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P205/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P206/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P207/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P208/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P209/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P210/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P211/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P212/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P213/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P214/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P215/moviecorr_meantimecourse.nii,1'                                                                 
                                                                   };
%% song 7
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(6).levels = 6;
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(6).scans = {
    %'/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P201/moviecorr_meantimecourse.nii,1'
    %'/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P202/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P203/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P205/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P206/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P207/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P208/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P209/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P210/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P211/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P212/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P213/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P214/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P215/moviecorr_meantimecourse.nii,1'
};
%% song 9
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(7).levels = 7;
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(7).scans = {
    %'/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P201/moviecorr_meantimecourse.nii,1'
    %'/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P202/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P203/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P205/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P206/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P207/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P208/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P209/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P210/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P211/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P212/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P213/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P214/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P215/moviecorr_meantimecourse.nii,1'
                                                                   };
%% song 10
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(8).levels = 8;
matlabbatch{1}.spm.stats.factorial_design.des.fd.icell(8).scans = {
    %'/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P201/moviecorr_meantimecourse.nii,1'
    %'/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P202/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P203/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P205/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P206/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P207/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P208/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P209/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P210/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P211/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P212/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P213/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P214/moviecorr_meantimecourse.nii,1'
    '/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/P215/moviecorr_meantimecourse.nii,1'
                                                              };
%%
matlabbatch{1}.spm.stats.factorial_design.des.fd.contrasts = 1;
matlabbatch{1}.spm.stats.factorial_design.cov = struct('c', {}, 'cname', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.multi_cov = struct('files', {}, 'iCFI', {}, 'iCC', {});
matlabbatch{1}.spm.stats.factorial_design.masking.tm.tm_none = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.im = 1;
matlabbatch{1}.spm.stats.factorial_design.masking.em = {''};
matlabbatch{1}.spm.stats.factorial_design.globalc.g_omit = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.gmsca.gmsca_no = 1;
matlabbatch{1}.spm.stats.factorial_design.globalm.glonorm = 1;
matlabbatch{2}.spm.stats.fmri_est.spmmat(1) = cfg_dep('Factorial design specification: SPM.mat File', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','spmmat'));
matlabbatch{2}.spm.stats.fmri_est.write_residuals = 0;
matlabbatch{2}.spm.stats.fmri_est.method.Classical = 1;
%% needed to run 
spm('defaults','fmri');
spm_jobman('initcfg');
spm_jobman('run',matlabbatch); %switch to 'interactive' to catch errors
end