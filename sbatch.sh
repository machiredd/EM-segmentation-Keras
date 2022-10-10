#!/bin/sh

#SBATCH --job-name=a_7
#SBATCH --output=a_101a_7_no_init_1.out
#SBATCH --partition=gpu
#SBATCH --gres gpu:p100:1
#SBATCH --time=2-00:00:00
#SBATCH --mem=10G

module use /home/exacloud/software/modules
module load cudnn/7.6-10.1
module load cuda/10.1.243

# Activating the conda environment for the project
eval "$(conda shell.bash hook)"
conda activate em3

# Calling the main program
python3 main.py \
           --dataset 101a \
           --exp_name 101a_7_no_init\
           --mode Train \
           --num_of_outputs 1 \
           --train_image_dir /home/groups/graylab_share/OMERO.rdsStore/machired/EM3/nuclei_data/101a/7/images/1 \
           --train_mask_dir_1 /home/groups/graylab_share/OMERO.rdsStore/machired/EM3/nuclei_data/101a/7/nuclei/1 \
           --val_image_dir /home/groups/graylab_share/OMERO.rdsStore/machired/EM3/nuclei_data/101a/7/images/1 \
           --val_mask_dir_1 /home/groups/graylab_share/OMERO.rdsStore/machired/EM3/nuclei_data/101a/7/nuclei/1 \
           --test_images_path /home/groups/graylab_share/OMERO.rdsStore/EM/EM_Data/Confidential-RestrictedAccess/Data/16113-101/SL2/Helios/ROI\ 2/Segmentations/Labels/Crops/TopHalfCrop \
           --image_size 2000 6095 \
           --crop_size 2048 \
           --net_input_data_size 512 \
           --batch_size 1 \
           --num_crops_per_image 5 \
           --steps_per_epoch 100 \
           --num_of_epochs 200 \
           --num_of_val_steps 50 \
           --start_filter_num 64 \
           --learning_rate 10e-4 \
           --use_border True \
           --crop_select True \
           --initialize No \
           --gt_direc /home/groups/graylab_share/OMERO.rdsStore/machired/EM3/nuclei_gt/nuclei-labels_rename \
           --output_file_name 101a_7_no_init \
           --fol_name direct_50 \
           --model_weights /home/groups/graylab_share/OMERO.rdsStore/machired/EM3/fine_tune_3/101a_1_no_init/models/atob-0050.h5

