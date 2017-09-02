class Resume
  def convert_symbol_key_to_string(obj)
    Hash[obj.map{|k,v| v.is_a?(Hash) ? [k.to_s, convert_symbol_key_to_string(v)] : [k.to_s, v] }]
  end

  def update_file(resume)
    resume = convert_symbol_key_to_string(resume)
    resume = resume.to_s.gsub('=>', ':')
    open('selvam-resume.json', 'w') { |f|
       f.puts resume
    }
  end

  def remove_key_from_obj(obj, key)
    list = obj[key].keys
    option = select_option(list)
    obj[key].delete(list[option])
    return obj
  end

  def select_option(option_list)
    option_list.each_with_index {|val, i| puts "#{i} #{val}"}
    print "Enter option:"
    option = gets.to_i
    return option
  end
end
