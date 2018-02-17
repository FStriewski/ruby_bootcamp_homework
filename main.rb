require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

json = read_contacts
json <<   {
    "name": "Malcom X",
    "phone": "+1 310 155 8822",
    "email": "z.org@theroost.ss"
  }
output_array = []

# Assignment 1: .map , new hash, name as key, phone as value
output_array = json.map {|i| Hash[i[:name], i[:phone]] }
#puts output_array
#puts "Object type: #{output_array.class}"


# Assignment 2.1: .select , subcollection with phone contain string +1
output_array = json.select {|i| i[:phone]=~ /\A\+#{1}/  }
#puts output_array


# Assignment 2.2: .select , subcollection with email domain contain org
output_array = json.select {|i| i[:email][-3..-1]=~ /#{"org"}/  }
puts output_array
