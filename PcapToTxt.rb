#!/usr/bin/ruby

# Takes in an directory path argument, converts all pcap
# files into txt files with tshark. The txt files should
# be under whatever directory this script is called from.

path = ARGV[0]

if(path[path.length-1] != "/") then path = path + "/" end

d = Dir.new(path)

d.each do |file|
    if file.include?("pcap")
	`tshark -Vr #{d.path + file} > #{file[0 .. (file.length - 5)] + "txt"}`
    end
end

