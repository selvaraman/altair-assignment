require_relative 'resume'
require_relative 'constant'

class UpdateResume < Resume
  include Constant
  def initialize path
    @file_obj = File.open(path)
  end
  
  def add_content
    @resume = eval(@file_obj.read)
    loop do
      puts "1 To add work experience"
      puts "2 To add technical skills"
      puts "3 To add qualification"
      puts "4 To add projects"
      puts "5 To done/exit"
      print "Enter option:"
      option = gets.to_i
      case option
	when 1
	  add_work_experience
	when 2
	  add_technical_skills
	when 3
	  add_qualification
	when 4
	  add_projects
	when 5
	  break 
      end
    end
    return @resume
  end

  def add_work_experience
    print "\nCompany Name:"
    company_name = gets.strip
    print "Role:"
    role = gets.strip
    print "Duration:"
    duration = gets.strip
    print "Location:"
    location = gets.strip
    experience = {company_name => {role: role, duration: duration, location: location}}
    @resume[WORK_EXPERIENCE].merge!(experience)
  end

  def add_technical_skills
    loop do
      puts "1 Languages"
      puts "2 Databases"
      puts "3 Frameworks"
      puts "4 Tools"
      puts "5 done/exit"
      print "Enter option:"
      option = gets.to_i
      case option
	when 1
	  print "Enter languages separated by comma:"
	  key = :languages
	when 2
	  print "Enter databases separated by comma:"
	  key = :databases
	when 3
	  print "Enter frameworks separated by comma:"
	  key = :frameworks
	when 4
	  print "Enter Tools separated by comma:"
	  key = :tools
	when 5
	  break
      end
      data = gets.strip.split(',') unless option == 5
      data.each { |val| @resume[TECHNICAL_SKILLS][key] << val  }
    end
  end

  def add_qualification
    print "Enter degree:"
    degree = gets.strip
    print "College:"
    college = gets.strip
    print "Location:"
    location = gets.strip
    print "Percentage:"
    percentage = gets.strip
    qualification = {degree => {college: college, location: location, percentage: percentage}}
    @resume[QUALIFICATION].merge!(qualification)
  end

  def add_projects
    print "Title:"
    title = gets.strip
    print "Environments separated by comma:"
    environments = gets.strip.split(',')
    print "Team Size:"
    team_size = gets.strip
    print "Project Description:"
    description = gets.strip
    projects = {title => {environments: environments, team_size: team_size, project_description: description}}
    @resume[PROJECTS].merge!(projects)
  end
end
