def display_menu
  puts "Select the process you want to perform:"
  puts "1: Enter rating points and comments"
  puts "2: Check previous results"
  puts "3: Quit"
end

def input_rating_and_comment
  puts "Please enter a rating from 1 to 5"
  point = gets.to_i
  
  while point <= 0 || point > 5
    puts "Please enter a number from 1 to 5"
    point = gets.to_i
  end
  
  puts "Please enter your comment"
  comment = gets.chomp
  
  post = "Points: #{point} Comment: #{comment}"
  File.open("data.txt", "a") do |file|
    file.puts(post)
  end
  
  puts "Rating and comment saved!"
end

def show_previous_results
  puts "Previous results:"
  
  if File.exist?("data.txt")
    File.open("data.txt", "r") do |file|
      if file.size == 0
        puts "No ratings yet"
      else
        file.each_line do |line|
          puts line
        end
      end
    end
  else
    puts "No ratings yet"
  end
end

def exit_program
  puts "Exiting program"
end

# Main program
while true
  display_menu
  num = gets.to_i

  case num
  when 1
    input_rating_and_comment
  when 2
    show_previous_results
  when 3
    exit_program
    break
  else
    puts "Please enter a number from 1 to 3"
  end
  
  puts "\n" # Add empty line for better readability
end
  