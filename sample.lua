package.cpath = package.cpath .. ";ai.deploy.box/build/lua/libAiDBLua.so"
package.path = package.path .. ";./?.lua"

local json = require "json"
local base64 = require'base64'
local aidb = require "aidb" 


function read_image(path)
    
	local fileIn, err = io.open(path, "rb")
	local content = fileIn:read("*all")
	local length = fileIn:seek("end")
	fileIn:close()
	return content
end

function visual(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
      	 if type(k) == 'string' and (k == 'tddfa' or k == 'anime' or string.find(k, "parsing")) then goto save_image end
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. visual(v) .. ','
         ::save_image::do
         if k == 'tddfa' or k == 'anime' or string.find(k, "parsing") then 
         	local dst_file = io.open(k..".jpg", "wb")
         	dst_file:write(base64.decode(v))
			dst_file:close()
		  end
         end
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

local init_table = {}
init_table["flow_uuid"] = "i'm uuid"
-- init_table["backend"] = {"mnn", "mnn"}
-- init_table["model"] = {"scrfd_500m_kps", "3ddfa_mb05_bfm_dense"}
init_table["backend"] = {"mnn"}
init_table["model"] = {"ppocr_det","ppocr_cls","ppocr_ret"}
-- init_table["model"] = {"animeganv2_face_paint_v2"}
-- init_table["model"] = {"scrfd_500m_kps", "bisenet"}
init_table["zoo"] = "./config"


local param = json.encode(init_table) 
print(param)

local ins = aidb.AiDBCreate()

print(ins)

local ret = aidb.AiDBRegister(ins, param)

print(ret)

if (ret ~= 0) then 
	print("Register failed! param:"..param)
end

local image_path = "./test.jpg"

imageBase64 = base64.encode(read_image(image_path))

ret = aidb.AiDBForward(ins, init_table["flow_uuid"], imageBase64)

print(visual(ret))

ret = aidb.AiDBFree(ins)




