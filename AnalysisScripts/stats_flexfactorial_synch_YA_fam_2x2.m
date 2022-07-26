function [matlabbatch] = stats_flexfactorial_synch_YA_fam_2x2(b)
matlabbatch{1}.spm.stats.factorial_design.dir = {'/imaging3/familiarity/SynchronyStats/YA_flexFact_synch_fam_2x2'};
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).name = 'subject';
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).variance = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(1).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).name = 'Ses1/Ses2';
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).dept = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).variance = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(2).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).name = 'a/i/s/w';
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).dept = 1;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).variance = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).gmsca = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(3).ancova = 0;
matlabbatch{1}.spm.stats.factorial_design.des.fblock.fac(4).name = '1TBL/1UL/2L/2UL';
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
            %ses 1 To be learned'
            sprintf('/imaging3/familiarity/Session1/Song8/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session1/Song7/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session1/Song2/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session1/Song4/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            %ses 1 NOT to be learned
            sprintf('/imaging3/familiarity/Session1/Song1/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session1/Song6/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session1/Song3/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session1/Song5/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            %ses 2 'learned'
            sprintf('/imaging3/familiarity/Session2/Song8/Familiarity_analysis_ICA_clean_GroupA/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session2/Song7/Familiarity_analysis_ICA_clean_GroupA/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session2/Song2/Familiarity_analysis_ICA_clean_GroupA/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session2/Song4/Familiarity_analysis_ICA_clean_GroupA/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            %ses2 not learned - 'once'
            sprintf('/imaging3/familiarity/Session2/Song1/Familiarity_analysis_ICA_clean_GroupA/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session2/Song6/Familiarity_analysis_ICA_clean_GroupA/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session2/Song3/Familiarity_analysis_ICA_clean_GroupA/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            sprintf('/imaging3/familiarity/Session2/Song5/Familiarity_analysis_ICA_clean_GroupA/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupA{s})
            };
        matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(count).conds = [
            1,1,1; 1,2,1; 1,3,1; 1,4,1; 1,1,2; 1,2,2; 1,3,2; 1,4,2;
            2,1,3; 2,2,3; 2,3,3; 2,4,3; 2,1,4; 2,2,4; 2,3,4; 2,4,4];
        %matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(count).conds = [s p];    
        count=count+1;
end

for s=1:length(GroupB)
        matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(count).scans = {
            %ses 1 To be learned'
            sprintf('/imaging3/familiarity/Session1/Song1/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session1/Song6/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session1/Song3/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session1/Song5/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            %ses 1 NOT to be learned
            sprintf('/imaging3/familiarity/Session1/Song8/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session1/Song7/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session1/Song2/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session1/Song4/Familiarity_analysis_ICA_clean_ALL/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            %ses 2 'learned'
            sprintf('/imaging3/familiarity/Session2/Song1/Familiarity_analysis_ICA_clean_GroupB/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session2/Song6/Familiarity_analysis_ICA_clean_GroupB/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session2/Song3/Familiarity_analysis_ICA_clean_GroupB/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session2/Song5/Familiarity_analysis_ICA_clean_GroupB/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            %ses2 not learned - 'once'
            sprintf('/imaging3/familiarity/Session2/Song8/Familiarity_analysis_ICA_clean_GroupB/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session2/Song7/Familiarity_analysis_ICA_clean_GroupB/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session2/Song2/Familiarity_analysis_ICA_clean_GroupB/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            sprintf('/imaging3/familiarity/Session2/Song4/Familiarity_analysis_ICA_clean_GroupB/aamod_moviecorr_meantimecourse_00001/%s/moviecorr_meantimecourse.nii,1',GroupB{s})
            };
        matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(count).conds = [
            1,1,1; 1,2,1; 1,3,1; 1,4,1; 1,1,2; 1,2,2; 1,3,2; 1,4,2;
            2,1,3; 2,2,3; 2,3,3; 2,4,3; 2,1,4; 2,2,4; 2,3,4; 2,4,4];
        
        %matlabbatch{1}.spm.stats.factorial_design.des.fblock.fsuball.fsubject(count).conds = [s p];    
        count=count+1;
end
%%
matlabbatch{1}.spm.stats.factorial_design.des.fblock.maininters{1}.fmain.fnum = 1;
%matlabbatch{1}.spm.stats.factorial_design.des.fblock.maininters{2}.fmain.fnum = 3;
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
