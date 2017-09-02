class ReadResume
  def initialize path
    @file_obj = File.open(path)
  end

  def read(obj=nil, level=0)
    obj = eval(@file_obj.read) unless obj
    underline = title_level
    obj.each do |key, value|
      if value.kind_of?(Hash)
	puts "#{print_space(level)}#{key}"
	puts "#{print_space(level)}#{underline[level] * key.to_s.length}"
	read(value, level + 1)
      elsif value.kind_of?(Array)
	print "#{print_space(level)}#{key}:"
	value.each {|val| print "#{val},"}
	puts ""
      else
	puts "#{print_space(level)}#{key}:#{value}"
      end 
    end
  end

  def title_level
    {
      0 => "*",
      1 => "-",
      2 => "."
    }
  end
  def print_space(level=0)
    " " * (level * 5)
  end
end
