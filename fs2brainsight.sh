# converting freesurfer's labels to brainsight; 
# Author: Ehsan Tadayon [sunny.tadayon@gmail.com / stadayon@bidmc.harvard.edu]
# Date: May 29,2017


subj=$1

for hemi in lh rh;do
mri_annotation2label --subject $subj --hemi $hemi --annotation aparc --outdir ${SUBJECTS_DIR}/${subj}/label/
done

for hemi in lh rh; do
for label in `cat labels_names.txt`;do
mri_label2vol --label ${SUBJECTS_DIR}/${subj}/label/${hemi}.${label}.label --subject $subj --hemi $hemi --identity --temp ${SUBJECTS_DIR}/${subj}/mri/T1.mgz --o ${SUBJECTS_DIR}/${subj}/mri/${hemi}.${label}.mgz --proj frac 0 1 0.01
done
done

for hemi in lh rh;do
for label in `cat labels_names.txt`;do
mri_vol2vol --mov ${SUBJECTS_DIR}/${subj}/mri/${hemi}.${label}.mgz --targ ${SUBJECTS_DIR}/${subj}/mri/rawavg.mgz --regheader --o ${SUBJECTS_DIR}/${subj}/mri/${hemi}.${label}-in-brainsight.nii.gz --no-save-reg
done
done

