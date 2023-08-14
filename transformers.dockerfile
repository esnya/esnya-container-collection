FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

ARG transformers_version

ADD ./transformers.requirements.txt ./requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip pip install "transformers$transformers_version" -r ./requirements.txt
