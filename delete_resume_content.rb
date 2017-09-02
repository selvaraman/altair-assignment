require_relative 'resume'
require_relative 'constant'

class DeleteResumeContent < Resume
  include Constant
  def initialize path
    @file_obj = File.open(path)
  end

  def delete_content
    @resume = eval(@file_obj.read)
    loop do
      puts "1 to delete work experience"
      puts "2 to delete technical skills"
      puts "3 to delete qualification"
      puts "4 to delete projects"
      puts "5 to done/exit"
      print "Enter option:"
      option = gets.to_s.strip.to_i
      case option
	when 1
	  delete_work_experience
	when 2
	  delete_technical_skills
	when 3
	  delete_qualification
	when 4
	  delete_projects
	when 5
	  break
      end
    end
    return @resume
  end

  def delete_work_experience
    @resume = remove_key_from_obj(@resume, WORK_EXPERIENCE)
  end

  def delete_technical_skills
    list = @resume[TECHNICAL_SKILLS].keys
    option = select_option(list) 
    skill = list[option]
    skill_list = @resume[TECHNICAL_SKILLS][skill]
    skill_list.each_with_index {|val, i| puts "#{i} #{val}"}
    print "Enter option:"
    option = gets.to_i
    @resume[TECHNICAL_SKILLS][skill].delete(skill_list[option])
  end

  def delete_qualification
    @resume = remove_key_from_obj(@resume, QUALIFICATION)
  end

  def delete_projects
    @resume = remove_key_from_obj(@resume, PROJECTS)
  end
end
