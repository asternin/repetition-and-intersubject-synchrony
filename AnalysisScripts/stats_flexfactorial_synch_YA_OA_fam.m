function [matlabbatch] = stats_flexfactorial_synch_YA_OA_fam(b)
matlabbatch{1}.spm.stats.factorial_design.dir = {'/imaging3/familiarity/SynchronyStats/YA_OA_flexFact_synch_fam'};
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).name = 'subject';
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).variance = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).name = 'fam/unfam';
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).name = 'i/s/w';
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).dept = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).variance = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(4).name = 'YA/OA';
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(4).dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(4).variance = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(4).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(4).ancova = 0;
%% YA
count=1;
songs=[6,7,2,3,4,5];
cond=[1,2,3,1,2,3];

%subjects = {'P101','P102','P103','P104','P105','P106','P107','P108','P110','P111','P112','P113','P114','P115','P117','P119','P120','P123','P125'};
GroupA={'P101','P103','P105','P107','P111','P113','P115','P117','P119','P123','P125'};
GroupB={'P102','P104','P106','P108','P110','P112','P114','P120','P126'};

for s=1:length(GroupA)
        matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(count).scans = {
            sprintf('/imaging3/familiarity/Session1/Song6/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session1/Song7/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session1/Song2/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session1/Song3/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session1/Song4/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session1/Song5/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            %sprintf('/imaging3/familiarity/Session2/Song6/Familiarity_analysis_ICA_clean_GroupA/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            %sprintf('/imaging3/familiarity/Session2/Song3/Familiarity_analysis_ICA_clean_GroupA/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            %sprintf('/imaging3/familiarity/Session2/Song5/Familiarity_analysis_ICA_clean_GroupA/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session2/Song7/Familiarity_analysis_ICA_clean_GroupA/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session2/Song2/Familiarity_analysis_ICA_clean_GroupA/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session2/Song4/Familiarity_analysis_ICA_clean_GroupA/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            };
        matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(count).conds = [
            1,1,1; 1,1,1; 1,2,1; 1,2,1; 1,3,1; 1,3,1;
            %2,1,1; 2,2,1; 2,3,1; 
            3,4,1; 3,5,1; 3,6,1];
        %matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(count).conds = [s p];    
        count=count+1;
end

for s=1:length(GroupB)
        matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(count).scans = {
            sprintf('/imaging3/familiarity/Session1/Song6/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session1/Song7/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session1/Song2/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session1/Song3/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session1/Song4/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session1/Song5/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            %sprintf('/imaging3/familiarity/Session2/Song7/Familiarity_analysis_ICA_clean_GroupB/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            %sprintf('/imaging3/familiarity/Session2/Song2/Familiarity_analysis_ICA_clean_GroupB/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            %sprintf('/imaging3/familiarity/Session2/Song4/Familiarity_analysis_ICA_clean_GroupB/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session2/Song6/Familiarity_analysis_ICA_clean_GroupB/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session2/Song3/Familiarity_analysis_ICA_clean_GroupB/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session2/Song5/Familiarity_analysis_ICA_clean_GroupB/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            };
        matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(count).conds = [
            1,1,1; 1,1,1; 1,2,1; 1,2,1; 1,3,1; 1,3,1;
            %2,1,1; 2,2,1; 2,3,1; 
            3,4,1; 3,5,1; 3,6,1];        
        
        %matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(count).conds = [s p];    
        count=count+1;
end


%% OA
count=count;
subjects={'P203','P205','P206','P207','P208','P209','P210','P211','P212','P213','P214','P215'};
for s=1:length(subjects)
    matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(count).scans = {
        sprintf('/imaging3/familiarity/OlderAdults/Session1/Song6/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',subjects{s})
        sprintf('/imaging3/familiarity/OlderAdults/Session1/Song7/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',subjects{s})
        sprintf('/imaging3/familiarity/OlderAdults/Session1/Song2/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',subjects{s})
        sprintf('/imaging3/familiarity/OlderAdults/Session1/Song3/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',subjects{s})
        sprintf('/imaging3/familiarity/OlderAdults/Session1/Song4/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',subjects{s})
        sprintf('/imaging3/familiarity/OlderAdults/Session1/Song5/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',subjects{s})
        sprintf('/imaging3/familiarity/OlderAdults/Session1/Song10/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',subjects{s})
        sprintf('/imaging3/familiarity/OlderAdults/Session1/Song9/Familiarity_analysisICA_clean/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',subjects{s})

        };
    matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(count).conds = [
        1,1,2;1,1,2; 
        1,2,2;1,2,2;
        1,3,2;1,3,2;
        3,5,2;3,6,2;];
    %matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(count).conds = [1,1;1,1;1,2;1,2;1,3;1,3];
    count=count+1;
end
%%
matlabbatch{1}.spm.stats.factorial_design.des.fblock.maininters{1}.fmain.fnum = 1;
%matlabbatch{1}.spm.stats.factorial_design.des.fblock.maininters{2}.inter.fnums = [3
%                                                                                 4];
matlabbatch{1}.spm.stats.factorial_design.des.fblock.maininters{2}.inter.fnums = [3
                                                                                  4];
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
