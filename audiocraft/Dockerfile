#
# 1. Install nvidia-container-toolkit for system & restart docker
# 2. $ docker buildx build -t audiocraft:1.3.0 .
# 3. $ docker run --gpus all --platform linux/amd64 -it --rm --network=host audiocraft:1.3.0 /bin/bash
#

ARG BASE_IMAGE
FROM python:3.10

WORKDIR /opt
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y git bash curl gcc gfortran libopenblas-dev ninja-build libsndfile1 libsndfile1-dev ffmpeg

RUN python -m pip install 'aiofiles==23.2.1' \
 'annotated-types==0.7.0' \
 'antlr4-python3-runtime==4.9.3' \
 'anyio==3.7.1' \
 'audioread==3.0.1' \
 'av==11.0.0' \
 'blis==0.7.11' \
 'catalogue==2.0.10' \
 'certifi==2024.8.30' \
 'cffi==1.17.1' \
 'charset-normalizer==3.4.0' \
 'click==8.1.7' \
 'cloudpathlib==0.20.0' \
 'cloudpickle==3.1.0' \
 'colorlog==6.8.2' \
 'confection==0.1.5' \
 'cymem==2.0.8' \
 'decorator==4.4.2' \
 'demucs==4.0.1' \
 'docopt==0.6.2' \
 'dora_search==0.1.12' \
 'einops==0.8.0' \
 'encodec==0.1.1' \
 'exceptiongroup==1.2.2' \
 'fastapi==0.115.2' \
 'ffmpy==0.4.0' \
 'filelock==3.16.1' \
 'flashy==0.0.2' \
 'fsspec==2024.6.1' \
 'h11==0.14.0' \
 'httpcore==1.0.6' \
 'httpx==0.27.2' \
 'huggingface-hub==0.26.0' \
 'hydra-colorlog==1.2.0' \
 'hydra-core==1.3.2' \
 'idna==3.10' \
 'Jinja2==3.1.4' \
 'joblib==1.4.2' \
 'julius==0.2.7' \
 'lameenc==1.7.0' \
 'langcodes==3.4.1' \
 'language_data==1.2.0' \
 'lazy_loader==0.4' \
 'librosa==0.10.2.post1' \
 'lightning-utilities==0.11.8' \
 'llvmlite==0.43.0' \
 'marisa-trie==1.2.1' \
 'markdown-it-py==3.0.0' \
 'MarkupSafe==2.1.5' \
 'mdurl==0.1.2' \
 'mpmath==1.3.0' \
 'msgpack==1.1.0' \
 'murmurhash==1.0.10' \
 'networkx==3.4.1' \
 'num2words==0.5.13' \
 'numba==0.60.0' \
 'numpy==1.26.4' \
 'nvidia-cublas-cu12==12.1.3.1' \
 'nvidia-cuda-cupti-cu12==12.1.105' \
 'nvidia-cuda-nvrtc-cu12==12.1.105' \
 'nvidia-cuda-runtime-cu12==12.1.105' \
 'nvidia-cudnn-cu12==8.9.2.26' \
 'nvidia-cufft-cu12==11.0.2.54' \
 'nvidia-curand-cu12==10.3.2.106' \
 'nvidia-cusolver-cu12==11.4.5.107' \
 'nvidia-cusparse-cu12==12.1.0.106' \
 'nvidia-nccl-cu12==2.18.1' \
 'nvidia-nvjitlink-cu12==12.6.77' \
 'nvidia-nvtx-cu12==12.1.105' \
 'omegaconf==2.3.0' \
 'openunmix==1.3.0' \
 'orjson==3.10.9' \
 'packaging==24.1' \
 'pandas==2.2.2' \
 'pillow==10.4.0' \
 'platformdirs==4.3.6' \
 'pooch==1.8.2' \
 'preshed==3.0.9' \
 'protobuf==3.20.3' \
 'pycparser==2.22' \
 'pydantic==2.9.2' \
 'pydantic_core==2.23.4' \
 'pydub==0.25.1' \
 'Pygments==2.18.0' \
 'python-dateutil==2.9.0.post0' \
 'python-multipart==0.0.12' \
 'pytz==2024.2' \
 'PyYAML==6.0.2' \
 'regex==2024.9.11' \
 'requests==2.32.3' \
 'retrying==1.3.4' \
 'rich==13.9.2' \
 'ruff==0.7.0' \
 'safetensors==0.4.5' \
 'scikit-learn==1.5.2' \
 'scipy==1.10.1' \
 'semantic-version==2.10.0' \
 'sentencepiece==0.2.0' \
 'shellingham==1.5.4' \
 'six==1.16.0' \
 'smart-open==7.0.5' \
 'sniffio==1.3.1' \
 'soundfile==0.12.1' \
 'soxr==0.5.0.post1' \
 'spacy==3.7.5' \
 'spacy-legacy==3.0.12' \
 'spacy-loggers==1.0.5' \
 'srsly==2.4.8' \
 'starlette==0.40.0' \
 'submitit==1.5.2' \
 'sympy==1.13.3' \
 'thinc==8.2.5' \
 'threadpoolctl==3.5.0' \
 'tokenizers==0.19.1' \
 'tomlkit==0.12.0' \
 'torch==2.1.0' \
 'torchaudio==2.1.0' \
 'torchdata==0.7.0' \
 'torchmetrics==1.5.0' \
 'torchtext==0.16.0' \
 'torchvision==0.16.0' \
 'tqdm==4.66.5' \
 'transformers==4.44.2' \
 'treetable==0.2.5' \
 'triton==2.1.0' \
 'typer==0.12.5' \
 'typing_extensions==4.12.2' \
 'tzdata==2024.2' \
 'urllib3==2.2.3' \
 'uvicorn==0.32.0' \
 'wasabi==1.1.3' \
 'weasel==0.4.1' \
 'websockets==12.0' \
 'wrapt==1.16.0' \
 'xformers==0.0.22.post7'

RUN python -m pip install 'gradio==3.43.1' 'gradio_client==0.5.0'

RUN python -m pip install setuptools wheel

# Clone the repository:
RUN git clone https://github.com/facebookresearch/audiocraft/ && \
    cd audiocraft && \
    python -m pip install -e .

RUN echo 'import torch;\nprint(f"PyTorch version:              {torch.__version__}");\nprint(f"CUDA available:               {torch.cuda.is_available()}");\nprint(f"Torch distributed available:  {torch.distributed.is_available()}");\nprint(f"cuDNN version:                {torch.backends.cudnn.version()}");\nprint(torch.__config__.show());' > ./info.py

WORKDIR /opt/audiocraft/

CMD python ../info.py && echo "starting AudioCraft MusicGen gradio server" && python demos/musicgen_app.py --listen 0.0.0.0
