require_relative 'read_resume'
require_relative 'add_resume_content'
require_relative 'delete_resume_content'

include Constant
loop do
  puts "1 Read"
  puts "2 Add Content"
  puts "3 Delete Content"
  puts "4 exit"
  print "Enter your option:"
  option = gets.to_i
  case option
    when 1
      resume = ReadResume.new(RESUME_PATH)
      resume.read
    when 2
      resume = UpdateResume.new(RESUME_PATH)
      updated_content = resume.add_content
      resume.update_file(updated_content)
    when 3
      resume = DeleteResumeContent.new(RESUME_PATH)
      updated_content = resume.delete_content
      resume.update_file(updated_content)
    when 4
      break;
  end 
end
puts "EXIT"
