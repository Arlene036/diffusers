export MODEL_DIR="stabilityai/stable-diffusion-xl-base-1.0"
export OUTPUT_DIR="/home/ubuntu/gate-your-sketch"
# wandb login # 1ea8d30af7d9fdc65677729285a0773003477654
accelerate launch train_t2i_adapter_sdxl.py \
 --pretrained_model_name_or_path=$MODEL_DIR \
 --output_dir=$OUTPUT_DIR \
 --dataset_name=qiqiquq/my-multimodal-sample \
 --sketch_adapter_path="TencentARC/t2i-adapter-canny-sdxl-1.0" \
 --depth_adapter_path="TencentARC/t2i-adapter-depth-midas-sdxl-1.0" \
 --image_column="image_file_name" \
 --sketch_image_column="sketch_file_name" \
 --depth_image_column="depth_file_name" \
 --resolution=1024 \
 --learning_rate=1e-5 \
 --max_train_steps=15000 \
 --validation_image "./conditioning_image_1.png" "./conditioning_image_2.png" \
 --validation_prompt "red circle with blue background" "cyan circle with brown floral background" \
 --validation_steps=100 \
 --train_batch_size=1 \
 --gradient_accumulation_steps=4 \
 --report_to="wandb" \
 --seed=42

 #  --mixed_precision="fp16" \