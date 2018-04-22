# Visualizing FreeSurfer's outputs in Brainsight.


A simple code to visualize Freesurfer cortical parcellations in Brainsight for TMS stimulation. 

### How it works: 
After processing your subject with Freesurfer, run `fs2brainsight` as follows in your terminal: 

```bash 
bash fs2brainsight.sh <subjid> 
```

Note that `SUBJECTS_DIR` should be set to your `SUBJECTS_DIR`. The outputs can be found under `subjid/mri/?h-*-in-brainsight.nii.gz`. 


