## aidb-Lua-demo

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/drive/1QuiJAutYAdn0MIOhGIk9JPPUwiVuWCFB?usp=drive_link)

[AiDB](https://github.com/TalkUHulk/ai.deploy.box) binding to Lua Demo.

## Tested Environment

* Lua 5.3/5.4
* MacOS/Colab


## Usage

* Clone AiDB
```asm
git clone https://github.com/TalkUHulk/ai.deploy.box
```

* Compile AiDB library(custom backend)

```asm
cd ai.deploy.box
mkdir build && cd build
cmake -DBUILD_LUA=ON -DC_API=ON -DENGINE_ORT=ON -DENGINE_MNN=ON -DENGINE_NCNN=ON  -DENGINE_TNN=OFF -DENGINE_OPV=OFF -DENGINE_PPLite=OFF -DENGINE_NCNN_WASM=OFF -DBUILD_SAMPLE=OFF ../
make -j8
```
generate **libAiDBLua.so** in ai.deploy.box/build/lua/

* prepare files demo need.

download [models](https://github.com/TalkUHulk/ai.deploy.box/releases/download/1.0.0/models-lite.zip) and unzip in aidb_lua_demo rename models, and put ai.deploy.box/extra、ai.deploy.box/config in aidb_lua_demo/extra、 aidb_lua_demo/config

* modify sample

replace package.cpath and image_path with your custom path, and init 'init_table' you wanted.

* Run

```asm
lua sample.lua
```


___

### Reference

https://github.com/rxi/json.lua
https://github.com/iskolbin/lbase64