local placement_ids = redis.call('keys', 'p*')
local ret = {}
local sort_func = function(a,b) return (a[2] > b[2]) end

table.foreach(
   placement_ids,
   function(index, item)
      local val = cmsgpack.unpack(redis.call('get', item))
      if #ret < tonumber(ARGV[1]) then
         table.insert(ret, {item, loadstring(val.ecpm)()})
         if #ret == tonumber(ARGV[1]) then
            table.sort(ret, sort_func)
         end
      else
         local ecpm_new = loadstring(val.ecpm)()
         if ret[#ret][2] < ecpm_new then
            ret[#ret][1] = item
            ret[#ret][2] = ecpm_new
            table.sort(ret, sort_func)
         end
      end
   end
)
return ret
