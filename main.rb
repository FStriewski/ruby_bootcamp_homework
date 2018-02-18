require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

json = read_contacts


# .map , new hash, name as key, phone as value
def assignment_1 (json)
  json.map {|i| Hash[i[:name], i[:phone]] }
end


# .select, subcollection with phone containing string "+1"
def assignment_2_1 (json)
  json.select {|i| i[:phone]=~ /\A\+#{1}/  }
end


# .select, subcollection with email domain containing "org"
def assignment_2_2 (json)
  json.select {|i| i[:email][-3..-1]=~ /#{"org"}/  }
end


# .reduce, subcollection with count on condition 2.1
def assignment_3_1 (json)
  json.reduce(0) {|sum,i|
    if i[:phone]=~ /\A\+#{1}/
      sum +=1
    end
    sum
  }
end


# .reduce, subcollection with count on condition 2.1
def assignment_3_2 (json)
  output_array = json.reduce(0) {|sum,i|
    if i[:email][-3..-1]=~ /#{"org"}/
      sum +=1
    end
    sum
  }
end


loop {
  puts "\n>> Which assignment: 1, 2_1, 2_2, 3_1, 3_2 ? (End with 'q')"
  puts

  selection = gets.chomp

  break if selection.downcase == "q"
  puts assignment_1(json) if selection == "1"
  puts assignment_2_1(json) if selection == "2_1"
  puts assignment_2_2(json) if selection == "2_2"
  puts assignment_3_1(json) if selection == "3_1"
  puts assignment_3_2(json) if selection == "3_2"
}
