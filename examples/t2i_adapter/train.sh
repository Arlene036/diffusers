export MODEL_DIR="stabilityai/stable-diffusion-xl-base-1.0"
export OUTPUT_DIR="/home/ubuntu/gate-your-sketch"
# wandb login # 1ea8d30af7d9fdc65677729285a0773003477654
accelerate launch train_t2i_adapter_sdxl.py \
 --pretrained_model_name_or_path=$MODEL_DIR \
 --output_dir=$OUTPUT_DIR \
 --dataset_name="hengyiqun/10623-project-coco17" \
 --sketch_adapter_path="TencentARC/t2i-adapter-canny-sdxl-1.0" \
 --depth_adapter_path="TencentARC/t2i-adapter-depth-midas-sdxl-1.0" \
 --image_column="image" \
 --sketch_image_column="sketch" \
 --depth_image_column="depth" \
 --resolution=512 \
 --mixed_precision="fp16" \
 --learning_rate=1e-5 \
 --max_train_steps=2000 \
 --validation_image "./conditioning_image_1.png" "./conditioning_image_2.png" \
 --validation_prompt "red circle with blue background" "cyan circle with brown floral background" \
 --validation_steps=100000 \
 --train_batch_size=1 \
 --gradient_accumulation_steps=4 \
 --report_to="wandb" \
 --seed=42 \
 --checkpointing_steps=100 \
#  --resume_from_checkpoint=latest

 #  --mixed_precision="fp16" \