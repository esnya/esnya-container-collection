ARG base_image=esnya/transformers:latest

FROM $base_image

ARG size=base
ARG dtype=float16
RUN --mount=type=cache,target=/root/.cache/huggingface python -c "import torch; from transformers import pipeline; pipeline('automatic-speech-recognition', model='openai/whisper-$size', torch_dtype=torch.$dtype).save_pretrained('/workspace/models/whisper-$size-$dtype')"
