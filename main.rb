require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

json = read_contacts
output_array = []

# Assignment 1: .map , name as key, phone as value
#|contact| Hash.new{|hash, key| hash[contact[:name]] = contact[:value]}

#Hash.new{|hash,key| hash[i[:name]]="w"}
    output_array = json.map {|i|
      puts i[:name].to_sym
      puts i[:phone]
    }

output_array
