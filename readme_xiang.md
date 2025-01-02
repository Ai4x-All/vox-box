# usage

```shell

# 启动(提前下载CosyVoice-300M) 模型

vox-box start --huggingface-repo-id Systran/faster-whisper-small --data-dir /d/faster-whisper-small --host 0.0.0.0 --port 18100 --model /d/CosyVoice-300M/

(base) danny@devserver:~/documents/sources$ tree /d/CosyVoice-300M/
/d/CosyVoice-300M/
├── asset
│   └── dingding.png
├── campplus.onnx
├── configuration.json
├── cosyvoice.yaml
├── flow.decoder.estimator.fp32.onnx
├── flow.encoder.fp32.zip
├── flow.pt
├── hift.pt
├── llm.llm.fp16.zip
├── llm.pt
├── llm.text_encoder.fp16.zip
├── README.md
├── speech_tokenizer_v1.onnx
└── spk2info.pt

(base) danny@devserver:~/documents/sources$ tree /d/faster-whisper-small
/d/faster-whisper-small
└── cache
    └── huggingface
        └── models--Systran--faster-whisper-small
            ├── blobs
            │   ├── 16511f6106ead2fbc3a1480957a217c2661a5a98
            │   ├── 3e305921506d8872816023e4c273e75d2419fb89b24da97b4fe7bce14170d671
            │   ├── 7818adb6de9fa3064d3ff81226fdd675be1f6344
            │   ├── c7d9f3332a950355d5a77d85000f05e6f45435ea
            │   ├── c9074644d9d1205686f16d411564729461324b75
            │   └── e5047537059bd8f182d9ca64c470201585015187
            ├── refs
            │   └── main
            └── snapshots
                └── 536b0662742c02347bc0e980a01041f333bce120
                    ├── config.json -> ../../blobs/e5047537059bd8f182d9ca64c470201585015187
                    ├── model.bin -> ../../blobs/3e305921506d8872816023e4c273e75d2419fb89b24da97b4fe7bce14170d671
                    ├── README.md -> ../../blobs/16511f6106ead2fbc3a1480957a217c2661a5a98
                    ├── tokenizer.json -> ../../blobs/7818adb6de9fa3064d3ff81226fdd675be1f6344
                    └── vocabulary.txt -> ../../blobs/c9074644d9d1205686f16d411564729461324b75

8 directories, 12 files
(base) danny@devserver:~/documents/sources$

# 验证 tts
curl http://localhost:18100/v1/audio/speech -H "Content-Type: application/json" -d '{
    "model": "default",
    "input": "曾经有一段真挚的爱情摆在我的面前,我却没有珍惜,直到失去的时候,我才后悔莫及.",
    "voice": "Chinese Female",
    "response_format": "mp3",
    "speed": 1.0
  }' > dahuaxiyou.mp3

curl http://localhost:18100/v1/audio/speech -H "Content-Type: application/json" -d '{
    "model": "default",
    "input": "在这样的情况下,我们如何应对世界的混乱呢?怎么样让自己的内心不被打乱找到人生的意义感呢?",
    "voice": "Chinese Female",
    "response_format": "mp3",
    "speed": 1.0
  }' > digitalhuman-female.mp3

# 验证stt


```