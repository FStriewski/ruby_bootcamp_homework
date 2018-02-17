require 'json'

def read_contacts
  contacts_json = File.read("contacts.json")
  return JSON.parse(contacts_json, { symbolize_names: true })
end

json = read_contacts
output_array = []

puts json

# Assignment 1: .map , name as key, phone as value

def array_transformer
    #
end
