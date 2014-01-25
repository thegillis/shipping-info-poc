#
# This is free and unencumbered software released into the public domain.
# 
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
# 
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
# 
# For more information, please refer to <http://unlicense.org/>
#

# This was written as a learning tool that will some day turn into the ability
# to auto detect tracking numbers and the carries associated with them. The
# various regular expressions were pulled from various locations on the
# internet and modified when they didn't work with shipping numbers that I have
# received in the past. Your mileage may vary.

raise "Usage: shipping-info-poc.rb [tracking_number]" unless ARGV.count == 1

ups_regex = /\b(1Z ?[0-9A-Z]{3} ?[0-9A-Z]{3} ?[0-9A-Z]{2} ?[0-9A-Z]{4} ?[0-9A-Z]{3} ?[0-9A-Z]|[\dT]\d\d\d ?\d\d\d\d ?\d\d\d)\b/i
fedex_regex = /\b((96\d\d\d\d\d ?\d\d\d\d|96\d\d) ?\d\d\d\d ?d\d\d\d( ?\d\d\d)?)\b/i
usps_regex = /\b(9\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d|9\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d)\b/i

tracking_number = ARGV[0].to_s.strip
puts "Testing Tracking Number: #{tracking_number}"

puts "UPS?:"
if ups_regex.match tracking_number
  puts "YES"
else
  puts "NO"
end

puts "FedEx?:"
if fedex_regex.match tracking_number
  puts "YES"
else
  puts "NO"
end

puts "USPS?:"
if usps_regex.match tracking_number
  puts "YES"
else
  puts "NO"
end

