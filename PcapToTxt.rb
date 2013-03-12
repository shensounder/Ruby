#!/usr/bin/ruby

# Takes in an directory path argument and a boolean, converts all pcap
# files into txt files with tcpdump. The txt files should
# be under whatever directory this script is called from.
# Second argument should be either y or n. If it is y, files with the
# same name will be overwritten, otherwise only new files will be
# created. Old file will be safe

path = ARGV[0]
overwrite = ARGV[1] == "y"

if(path[path.length-1] != "/") then path = path + "/" end

d = Dir.new(path)

d.each do |file|
    if file.include?("pcap")
	if (!File.exists?(file[0 .. (file.length - 5)] + "txt")) or overwrite
	    `tcpdump -Ar #{d.path + file} > #{file[0 .. (file.length - 5)] + "txt"}`
	end
    end
end

