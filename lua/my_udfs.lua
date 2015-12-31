function read_bin(r, name)
   info('this is info message')
   return r[name]
end

function set_bin_with_expire(r, bin_name, val, expired_at)
   r["EXP_AT_" .. bin_name] = expired_at
   r[bin_name] = val
   aerospike:update(r)
   return 0
end

function get_bin_with_expire(r, bin_name, now)
   if r[bin_name] and r["EXP_AT_" .. bin_name] then
      if now < r["EXP_AT_" .. bin_name] then
         return r[bin_name]
      else
         r[bin_name] = nil
         r["EXP_AT_" .. bin_name] = nil
         aerospike:update(r)
         return nil
      end
   else
      return r[bin_name]
   end
end
