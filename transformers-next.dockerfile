FROM alpine/git as git
WORKDIR /usr/local/src/
RUN git clone --branch main https://github.com/huggingface/transformers.git

FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime
COPY --from=git /usr/local/src/transformers/ /usr/local/src/transformers/
ADD ./transformers.requirements.txt ./requirements.txt
RUN --mount=type=cache,target=/root/.cache/pip pip install /usr/local/src/transformers/ -r ./requirements.txt
